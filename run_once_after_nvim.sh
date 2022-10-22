#!/usr/bin/env sh

nvim --headless "+call firenvim#install(0) | q"
nvim --headless "+TSUpdate | q"
