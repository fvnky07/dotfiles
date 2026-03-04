# fvnky's dotfiles

- this is setup with [chezmoi](https://www.chezmoi.io/)

## init dotfiles (without applying)

```
export GITHUB_USERNAME=fvnky07
sh -c "$(curl -fsLS get.chezmoi.io)" -- init $GITHUB_USERNAME
```

# Apply only specific files

```
chezmoi apply ~/.config/nvim
chezmoi apply ~/.config/zellij
chezmoi apply ~/.config/btop

```
