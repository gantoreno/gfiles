#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
git -C "$repo_dir" submodule update --init --recursive

tpm_dir="$HOME/.tmux/plugins/tpm"
if [[ ! -e "$tpm_dir" && ! -L "$tpm_dir" ]]; then
  git clone https://github.com/tmux-plugins/tpm.git "$tpm_dir"
elif [[ ! -f "$tpm_dir/tpm" ]]; then
  printf 'Expected TPM at %s; leaving the existing path untouched.\n' "$tpm_dir" >&2
  exit 1
fi

printf 'Setup complete. Open a new Zsh shell; install tmux plugins with prefix + I.\n'
