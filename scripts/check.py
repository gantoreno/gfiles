"""Check dotfile installation in an isolated home, without installing tools."""

import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import tomllib


repo = Path(__file__).resolve().parent.parent
mise = shutil.which("mise")
if mise is None:
    raise SystemExit("Install mise before running this check.")

config = tomllib.loads((repo / "mise.toml").read_text())
tools = tomllib.loads((repo / "mise/config.toml").read_text())["tools"]

with tempfile.TemporaryDirectory(prefix="gfiles-check-") as temp:
    root = Path(temp)
    home = root / "home"
    home.mkdir()
    env = {
        "PATH": os.environ["PATH"],
        "HOME": str(home),
        "MISE_CONFIG_DIR": str(home / ".config/mise"),
        "MISE_DATA_DIR": str(root / "data"),
        "MISE_CACHE_DIR": str(root / "cache"),
        "MISE_STATE_DIR": str(root / "state"),
        "MISE_TRUSTED_CONFIG_PATHS": f"{repo}:{home}",
        "MISE_YES": "1",
    }

    def run(*args, cwd=repo, success=True):
        result = subprocess.run(
            [mise, *args], cwd=cwd, env=env, capture_output=True, text=True
        )
        if success and result.returncode:
            raise AssertionError(result.stderr)
        return result

    sentinel = home / ".config/unrelated-app/config"
    sentinel.parent.mkdir(parents=True)
    sentinel.write_text("keep me\n")

    # Conflicting real files must survive; installation should report an error.
    conflict = home / ".zshrc"
    conflict.write_text("existing config\n")
    assert run("dotfiles", "apply", success=False).returncode != 0
    assert conflict.read_text() == "existing config\n"
    conflict.unlink()

    # Existing relative links (including those created by Stow) remain usable.
    conflict.symlink_to(os.path.relpath(repo / "zsh/.zshrc", home))
    for _ in range(2):
        run("dotfiles", "apply")
        for target, source in config["dotfiles"].items():
            link = home / target.removeprefix("~/")
            assert link.is_symlink(), target
            assert link.resolve() == (repo / source).resolve(), target
        assert sentinel.read_text() == "keep me\n"

    # Personal tools must also load outside the dotfiles checkout.
    current = json.loads(run("ls", "--current", "--json", cwd=home).stdout)
    assert set(tools).issubset(current), current

    # A fresh machine must be able to start Zsh before optional tools exist.
    shell = shutil.which("zsh")
    assert shell is not None, "Install Zsh before running this check."
    shell_env = dict(env, PATH="/usr/bin:/bin", TERM="xterm-256color",
                     DISABLE_AUTO_UPDATE="true")
    startup = subprocess.run(
        [shell, "-ic", '(( ! $+functions[_direnv_hook] )) && [[ "$PYTHON" == python3 ]]'],
        cwd=home, env=shell_env, capture_output=True, text=True,
    )
    assert startup.returncode == 0, startup.stderr

    run("dotfiles", "unapply", "--yes")
    for target in config["dotfiles"]:
        assert not os.path.lexists(home / target.removeprefix("~/")), target
    assert sentinel.read_text() == "keep me\n"

print("Passed: conflict protection, existing links, repeat apply, global tools, shell startup, and unapply.")
