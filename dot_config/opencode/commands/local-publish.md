# local-publish.md

Perform local publish using `verdaccio` registry.

<memory>
CURRENT_VERSION=!`npm pkg get version | tr -d '"'`
NEXT_VERSION=!`echo "$(npm pkg get version | tr -d '"' | sed 's/-.*$//')-SNAPSHOT-$(date +%Y%m%d%H%M%S)"`
</memory>

1. Run lint, test, and build before publish. Use pty to run these in parallel
2. Update the version to $NEXT_VERSION
3. Ensure `verdaccio` is running by checking port `4873`. If not, launch it by using `npx verdaccio`.
4. Publish the package on local `verdaccio` using `--registry=http://localhost:4873/` and `--tag local`

```bash
npm publish --registry=http://localhost:4873/ --tag local
```

5. Verify version $NEXT_VERSION is published successfully
6. Restore version in `package.json` and `package-lock.json` to its pre-snapshot state of CURRENT_VERSION: `npm version $CURRENT_VERSION --no-git-tag-version --allow-same-version`
7. Scan ~/Workspace for projects that consumes the package. Ask user to select which ones install new the version on these projects.
8. Stop `verdaccio` after install success
