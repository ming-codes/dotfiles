# local-publish.md

Perform local publish using `verdaccio` registry.

<memory>
CURRENT_VERSION=!`npm pkg get version`
</memory>

1. Ensure `verdaccio` is running by checking port `4873`. If not, launch it by using `npx verdaccio`.
2. Run lint, test, and build before publish.
3. Update version with `npm version prerelease --preid="$(date +%Y%m%d%H%M%S)" --no-git-tag-version`.
4. Publish the package on local `verdaccio` using `--registry=http://localhost:4873/` and `--tag local`
5. Restore version in `package.json` and `package-lock.json` to its pre-snapshot state of CURRENT_VERSION: `npm version $CURRENT_VERSION --no-git-tag-version --allow-same-version`
