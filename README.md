<p align="center">
  <img src=".github/icon.png" width="150" alt="Gfiles icon" />
</p>

# Gfiles

[![Issues](https://img.shields.io/github/issues/gantoreno/gfiles)](https://github.com/gantoreno/gfiles/issues)
[![Forks](https://img.shields.io/github/forks/gantoreno/gfiles)](https://github.com/gantoreno/gfiles/network/members)
[![Stars](https://img.shields.io/github/stars/gantoreno/gfiles)](https://github.com/gantoreno/gfiles/stargazers)
[![License](https://img.shields.io/github/license/gantoreno/gfiles)](LICENSE.md)

My personal macOS and Linux dotfiles for a small, terminal-first development environment. The repository is intentionally focused on the configuration I actively use, with Git as the source of truth and [mise](https://mise.jdx.dev/) installing tools and linking configuration into my home directory.

> [!NOTE]
>
> This is a personal setup, not a universal installer. The bootstrap targets Apple Silicon macOS and glibc-based Linux on x86_64 or arm64. The examples use a clone at `~/Developer/gantoreno/gfiles`, but the repository can live elsewhere. Review the files before using them on another machine.

## Setup

- **Terminal:** [Ghostty](https://ghostty.org/) with Tokyo Night
- **Shell:** [Zsh](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/) and the Robby Russell theme
- **Multiplexer:** [tmux](https://github.com/tmux/tmux) with [TPM](https://github.com/tmux-plugins/tpm), tmux-sensible, and [tmux-powerkit](https://github.com/gantoreno/tmux-powerkit)
- **Editor:** [Neovim](https://neovim.io/) with [LazyVim](https://www.lazyvim.org/), Tokyo Night, tmux navigation, and Sidekick
- **AI tooling:** Codex CLI, Claude Code, and [OpenCode](https://opencode.ai/) backed by a local [Ollama](https://ollama.com/) model

The shell activates mise and zoxide. On the host named `forge`, it also runs Fastfetch at startup and uses the Starship prompt; other hosts keep the Robby Russell theme. Mise selects the Node, Python, Go, Java, Bun, and pnpm versions; fnm, SDKMAN activation, and direnv hooks are no longer needed.

## Tracked configuration

The repository mirrors the home directory: each path below is the same here and under `~`.

| Path | Purpose |
| --- | --- |
| `.zshenv` | Mise shims for non-interactive shells |
| `.zshrc` | Interactive shell, PATH, plugins, and aliases |
| `.tmux.conf` | tmux behavior, navigation, and theme |
| `.config/ghostty` | Terminal appearance and window defaults |
| `.config/nvim` | LazyVim configuration and plugin lockfile |
| `.config/opencode` | OpenCode provider, model, and MCP configuration |
| `.config/mise/config.toml` | Personal tool versions and mise settings |
| `.config/herdr/config.toml` | herdr theme, UI, and notification settings |
| `.claude/settings.json` | Claude Code permissions, plugins, hooks, and preferences |
| `.claude/hooks` | Claude Code hook scripts, including the herdr session hook |

## Installation

Install **mise 2026.10.17 or newer** and Git first; it bundles updated root certificates. On macOS, `brew install mise git` is sufficient. On Linux, follow the [mise installation instructions](https://mise.jdx.dev/installing-mise.html) and install Git and the native build prerequisites for your distribution. The standard mise installer puts the executable in `~/.local/bin`; add that directory to `PATH` before continuing.

```sh
git clone https://github.com/gantoreno/gfiles.git \
  "$HOME/Developer/gantoreno/gfiles"
cd "$HOME/Developer/gantoreno/gfiles"

mise trust mise.toml
mise trust .config/mise/config.toml
mise bootstrap --dry-run
mise bootstrap
```

Bootstrap installs the declared native packages, clones Oh My Zsh and TPM, creates the dotfile links, installs the development tools, and then runs two hooks: TPM installs the tmux plugins, and herdr installs the [herdr-auto-title](https://github.com/kryptamine/herdr-auto-title) plugin if it is not registered. Open a new Zsh shell afterward. To make Zsh your login shell on a new Linux machine, use your distribution's `chsh` instructions after installation.

`mise.toml` declares native packages, cloned repositories, dotfile destinations, and setup hooks. `.config/mise/config.toml` declares personal tool defaults and is linked into `~/.config/mise/config.toml`, making them available from any directory. Project-specific mise configurations can override those defaults.

The native `brew:` package installer is built into mise and supports both target platforms; a separate Homebrew CLI is not required on Linux. Existing Homebrew packages count as installed. Bootstrap installs missing packages without upgrading existing ones. Prefix creation on Linux may require sudo. Native packages follow their package source's available versions.

## Tools and updates

The declared tools cover the terminal environment in this repository: language runtimes, pnpm, Yarn (classic), uv, lazygit, zoxide, ripgrep, fd, fzf, GitHub CLI, herdr, Vercel CLI, 1Password CLI, aws-mfa, Codex CLI, Claude Code, OpenCode, and Oh My Pi, plus Git, GCC, Zsh, Starship, Fastfetch, tmux, Neovim, and Ollama as native packages. Neovim is installed by `mise bootstrap` through `brew:neovim`, and its configuration is linked to `~/.config/nvim`. Existing Neovim installations, including Homebrew HEAD builds, are preserved. OpenCode uses the same `@opencode/cli` npm distribution as the original setup. aws-mfa is installed with the pipx backend, which uses the declared uv. This is a curated tool list, not a snapshot of every application installed on the Mac.

The `brew:gcc` package uses versioned executables on both macOS and Linux, such as `gcc-16` and `g++-16`. It does not provide an unversioned `gcc` command. Check with `gcc-16 --version` (adjust the suffix for the installed major version), and select it for builds with `CC=gcc-16 CXX=g++-16`. On macOS, `/usr/bin/gcc` is Apple Clang.

If the versioned command is also missing, open a new Zsh shell and run `mise bootstrap packages status` from this repository to check whether `brew:gcc` was installed. Run `mise bootstrap` to install missing packages; `mise install` only installs the development tools.

From the repository root:

```sh
mise install                      # Install missing development tools
mise bootstrap packages status    # Inspect native package state
mise bootstrap repos update       # Pull Oh My Zsh and TPM
mise outdated                     # See available development-tool updates
mise upgrade                      # Install them; old versions are pruned later
herdr plugin update --yes         # Rebuild herdr plugins from their latest commits
mise run check                    # Check shell syntax
```

Development tools track `latest`, except Node (`lts`), Java (the `jetbrains-jcef-21` runtime), and Yarn (`1`, classic). Mise resolves these to the newest installed match, so a machine stays on its current versions until `mise upgrade` runs; a fresh machine gets the newest releases available at install time, so two machines can differ. To add a tool, run `mise use --path .config/mise/config.toml TOOL@latest`, then review the config diff. Add system packages to `[bootstrap.packages]` in `mise.toml`.

## Dotfiles

Mise creates explicit file and directory symlinks from the `[dotfiles]` table in `mise.toml`; only listed paths are linked. Whole-directory links mean files an application creates in `~/.config/nvim`, `~/.config/ghostty`, or `~/.config/opencode` land in this repository.

```sh
mise bootstrap dotfiles apply --dry-run
mise bootstrap dotfiles apply
mise bootstrap dotfiles status
```

Existing real files or directories at a target cause a conflict. Back them up outside the target path before applying; the normal setup does not force replacements. Existing links pointing elsewhere are replaced. To remove a link while preserving its source, use `mise bootstrap dotfiles unapply '~/.config/nvim'` from the repository root. Keep the checkout in place while its links are in use.

## Machine-specific setup

- Install Ghostty, VS Code, and other desktop applications separately for each OS. The shell uses Neovim as its editor when `code` is unavailable.
- Bootstrap installs tmux plugins; inside tmux, `prefix + I` does the same and `prefix + U` updates them. LazyVim installs its plugins when Neovim starts.
- Ollama's service and models are separate from its CLI installation. The configured `qwen3:1.7b-8k` model must exist on the target machine.
- The OpenCode configuration contains a machine-specific Pencil MCP executable path. Update or disable that entry on another machine.
- Claude Code writes `~/.claude/settings.json` itself when you toggle plugins, change permissions, or choose "always allow", so those changes appear as diffs in this repository. Only that file and `hooks/` are linked; sessions, history, credentials, and `settings.local.json` stay machine-local. Running Claude Code inside this repository also loads `.claude/settings.json` as project settings; `.claude/settings.local.json` is ignored here.
- `.claude/hooks/herdr-agent-state.sh` is managed by herdr and is overwritten when the integration is reinstalled. It exits without doing anything outside a herdr pane.
- Herdr writes `~/.config/herdr/config.toml` itself when you finish onboarding or change options in Settings, so those changes appear as diffs in this repository. Its theme follows the terminal's light/dark appearance (`auto_switch`); choosing a theme manually in Settings turns that off. Only that file is linked; sockets, logs, sessions, and plugins stay machine-local.
- Herdr has no declarative plugin list, so a bootstrap hook registers herdr-auto-title with `herdr plugin install`, which builds it with mise's Go. Herdr starts plugins only when its server starts; if a server was already running, run `herdr plugin action invoke herdr.auto-title.restart`, and run it again after `herdr plugin update`. The plugin's optional settings go in `~/.config/herdr-auto-title/config.env`, which is not tracked here because the defaults are used.
- Existing fnm, SDKMAN, and direnv installations are left on disk, but the shell no longer activates them. Language packages installed globally under old runtimes may need reinstalling for mise's runtimes.

## License

Licensed under the [GNU GPLv3](LICENSE.md).
