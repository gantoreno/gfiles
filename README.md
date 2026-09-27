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

The shell activates mise and zoxide. Mise selects the Node, Python, Go, Java, Bun, and pnpm versions; fnm, SDKMAN activation, and direnv hooks are no longer needed.

## Tracked configuration

| Source | Home location | Purpose |
| --- | --- | --- |
| `zsh/.zshenv` | `~/.zshenv` | Mise shims for non-interactive shells |
| `zsh/.zshrc` | `~/.zshrc` | Interactive shell, PATH, plugins, and aliases |
| `zsh/.oh-my-zsh` | `~/.oh-my-zsh` | Pinned Oh My Zsh submodule |
| `tmux/.tmux.conf` | `~/.tmux.conf` | tmux behavior, navigation, and theme |
| `ghostty/.config/ghostty` | `~/.config/ghostty` | Terminal appearance and window defaults |
| `nvim/.config/nvim` | `~/.config/nvim` | LazyVim configuration and plugin lockfile |
| `opencode/.config/opencode` | `~/.config/opencode` | OpenCode provider, model, and MCP configuration |
| `mise/config.toml` | `~/.config/mise/config.toml` | Personal tool versions and mise settings |

## Installation

Install **mise 2026.9.5 or newer** and Git first. On macOS, `brew install mise git` is sufficient. On Linux, follow the [mise installation instructions](https://mise.jdx.dev/installing-mise.html) and install Git and the native build prerequisites for your distribution. The standard mise installer puts the executable in `~/.local/bin`; add that directory to `PATH` before continuing.

```sh
git clone --recurse-submodules https://github.com/gantoreno/gfiles.git \
  "$HOME/Developer/gantoreno/gfiles"
cd "$HOME/Developer/gantoreno/gfiles"

mise trust mise.toml
mise trust mise/config.toml
mise bootstrap --dry-run
mise bootstrap
```

Bootstrap installs the declared native packages and development tools, creates the dotfile links, initializes the pinned Oh My Zsh submodule, and clones TPM if missing. Open a new Zsh shell afterward. To make Zsh your login shell on a new Linux machine, use your distribution's `chsh` instructions after installation.

`mise.toml` declares native packages, dotfile destinations, and setup tasks. `mise/config.toml` declares pinned personal tool versions and is linked into `~/.config/mise/config.toml`, making those defaults available from any directory. Project-specific mise configurations can override those defaults.

The native `brew:` package installer is built into mise and supports both target platforms; a separate Homebrew CLI is not required on Linux. Existing Homebrew packages count as installed. Bootstrap installs missing packages without upgrading existing ones. Prefix creation on Linux may require sudo. Native packages follow their package source's available versions; they are not pinned like the development tools.

## Tools and updates

The declared tools cover the terminal environment in this repository: language runtimes, pnpm, lazygit, zoxide, ripgrep, fd, fzf, GitHub CLI, Codex CLI, Claude Code, and OpenCode, plus Git, Zsh, tmux, Neovim, bc, and Ollama as native packages. Neovim is installed by `mise bootstrap` through `brew:neovim`, and its configuration is linked to `~/.config/nvim`. Existing Neovim installations, including Homebrew HEAD builds, are preserved. OpenCode uses the same `@opencode/cli` npm distribution as the original setup. This is a curated tool list, not a snapshot of every application installed on the Mac.

From the repository root:

```sh
mise install                      # Install missing pinned development tools
mise bootstrap packages status    # Inspect native package state
mise outdated                     # See available development-tool updates
mise run check                    # Syntax and isolated dotfile migration checks
```

To add a tool or deliberately change a version, run `mise use --path mise/config.toml --pin TOOL@VERSION`, then review the config diff. Add system packages to `[bootstrap.packages]` in `mise.toml`. Tools are pinned explicitly; package dependencies and native package versions are not fully locked.

## Dotfiles

Mise creates explicit file and directory symlinks; Stow is no longer used. Existing links pointing to these sources already satisfy the mapping. The application folders retain their layout so this migration does not move your configuration again.

```sh
mise dotfiles apply --dry-run
mise dotfiles apply
mise dotfiles status
```

Existing real files or directories at a target cause a conflict. Back them up outside the target path before applying; the normal setup does not force replacements. To remove a link while preserving its source, use `mise dotfiles unapply '~/.config/nvim'` from the repository root. Keep the checkout in place while its links are in use.

## Machine-specific setup

- Install Ghostty, VS Code, and other desktop applications separately for each OS. The shell uses Neovim as its editor when `code` is unavailable.
- Install tmux plugins from inside tmux with `prefix + I`. LazyVim installs its plugins when Neovim starts.
- Ollama's service and models are separate from its CLI installation. The configured `qwen3:1.7b-8k` model must exist on the target machine.
- The OpenCode configuration contains a machine-specific Pencil MCP executable path. Update or disable that entry on another machine.
- Existing fnm, SDKMAN, and direnv installations are left on disk, but the shell no longer activates them. Language packages installed globally under old runtimes may need reinstalling for mise's runtimes.

## License

Licensed under the [GNU GPLv3](LICENSE.md).
