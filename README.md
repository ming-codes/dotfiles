```
ssh-keygen -t ed25519 -C "ming.codes@gmail.com" -f ~/.ssh/ming-codes_id_ed25519
ssh-add --apple-use-keychain ~/.ssh/ming-codes_id_ed25519
xcode-select --install
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ming-codes
```

```
git config core.sshCommand "ssh -F ~/.ssh/ming-codes_config"
```

TODO

coc require npx which depends on asdf
