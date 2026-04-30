---
agent: plan
---

# sanity-check.md

<pr>$ARGUMENTS</pr>

## Clean up dependencies

Delete `node_modules`

Install packages through preferred package manager, infer through lockfile present in the project.

## Tests

The following 4-5 tasks can be performed in parallel across subagents.

- Run lint
- Run test
- Run build
- Run dev server. Perform basic smoke test with `agent-browser`. Make sure to click on a few buttons to make sure everything is interactive.

### Completion

If pr is provided, add a 5rd task to check for completion against review comments in the pr.
