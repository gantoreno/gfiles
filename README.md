<p align="center">
  <img src=".github/icon.png" width="150" alt="Gfiles icon" />
</p>

# Gfiles

[![Issues](https://img.shields.io/github/issues/gantoreno/gfiles)](https://github.com/gantoreno/gfiles/issues)
[![Forks](https://img.shields.io/github/forks/gantoreno/gfiles)](https://github.com/gantoreno/gfiles/network/members)
[![Stars](https://img.shields.io/github/stars/gantoreno/gfiles)](https://github.com/gantoreno/gfiles/stargazers)
[![License](https://img.shields.io/github/license/gantoreno/gfiles)](LICENSE.md)

My personal macOS dotfiles for a small, terminal-first development environment. The repository is intentionally focused on the configuration I actively use, with Git as the source of truth and [GNU Stow](https://www.gnu.org/software/stow/) managing symlinks into my home directory.

> [!NOTE]
>
> This is a personal setup, not a universal installer. It assumes macOS and Homebrew-style paths. The examples use a clone at `~/Developer/gantoreno/gfiles`, but the repository can live elsewhere. Review the files before using them on another machine.

## Setup

- **Terminal:** [Ghostty](https://ghostty.org/) with Tokyo Night
- **Shell:** [Zsh](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/) and the Robby Russell theme
- **Multiplexer:** [tmux](https://github.com/tmux/tmux) with [TPM](https://github.com/tmux-plugins/tpm), tmux-sensible, and [tmux-powerkit](https://github.com/gantoreno/tmux-powerkit)
- **Editor:** [Neovim](https://neovim.io/) with [LazyVim](https://www.lazyvim.org/), Tokyo Night, tmux navigation, and Sidekick
- **AI tooling:** [OpenCode](https://opencode.ai/) backed by a local [Ollama](https://ollama.com/) model

The shell configuration initializes `fnm`, `direnv`, and `zoxide`, and includes paths for the language and package tooling installed on my machine.

## Tracked configuration

| Source | Home location | Purpose |
| --- | --- | --- |
| `zsh/.zshenv` | `~/.zshenv` | Early shell environment and Cargo setup |
| `zsh/.zshrc` | `~/.zshrc` | Interactive shell, PATH, plugins, and aliases |
| `zsh/.oh-my-zsh` | `~/.oh-my-zsh` | Pinned Oh My Zsh submodule |
| `tmux/.tmux.conf` | `~/.tmux.conf` | tmux behavior, navigation, and theme |
| `ghostty/.config/ghostty` | `~/.config/ghostty` | Terminal appearance and window defaults |
| `nvim/.config/nvim` | `~/.config/nvim` | LazyVim configuration and plugin lockfile |
| `opencode/.config/opencode` | `~/.config/opencode` | OpenCode provider, model, and MCP configuration |

## Installation

Install Stow and clone the repository with its submodule:

```sh
brew install stow

git clone --recurse-submodules https://github.com/gantoreno/gfiles.git \
  "$HOME/Developer/gantoreno/gfiles"
```

From the repository root, preview the links, then apply them:

```sh
cd "$HOME/Developer/gantoreno/gfiles"
mkdir -p "$HOME/.config"

stow -nv -t "$HOME" zsh tmux nvim ghostty opencode
stow -v -t "$HOME" zsh tmux nvim ghostty opencode
```

Stow reports conflicts with existing files. Back those files up outside the target paths before applying the links. If upgrading from the previous layout, remove only the seven old symlinks listed in the table above after verifying they point into this repository; Stow will recreate them at the new package paths. Do not remove real files or directories containing your configuration.

Each top-level package mirrors its destination within your home directory. Choose only the packages you need, for example `stow -t "$HOME" nvim tmux`. Keeping `~/.config` as a real directory lets other applications store their configuration alongside these packages.

To refresh links after changing a package's layout, or remove a package's links while keeping its files in Git:

```sh
stow -R -t "$HOME" nvim
stow -D -t "$HOME" nvim
```

Run Stow from the repository root and keep the checkout in place while its links are in use. Stow manages links only; install the applications and shell tools separately. The Oh My Zsh submodule still requires `git submodule update --init --recursive` after cloning without `--recurse-submodules`.

Install the tmux plugins from inside tmux with `prefix + I`. LazyVim installs its plugins when Neovim starts.

The OpenCode configuration contains a machine-specific Pencil MCP executable path. Update or disable that entry before using the configuration elsewhere.

## License

Licensed under the [GNU GPLv3](LICENSE.md).
