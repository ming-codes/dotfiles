# remote-browser.md

Remote control existing browser session using the `agent-browser` CLI follow the following steps.

1. Load the `agent-browser` skill
2. Terminate all existing `agent-browser`:

```bash
agent-browser close
```

3. Connect and confirm connection with the following command:

```bash
agent-browser --auto-connect snapshot
```

All subsequent `agent-browser` commands MUST include `--auto-connect` as parameter
