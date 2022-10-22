#!/usr/bin/env sh

cd ~/.local/share/vscode-js-debug
rm -rf dist out
npm ci --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
