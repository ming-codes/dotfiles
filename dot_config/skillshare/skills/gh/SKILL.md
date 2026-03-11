---
name: gh
description: MUST load BEFORE constructing any gh commands when a URL contains `github` as part of hostname. Load this skill first to read hostname formatting rules, then construct commands. Enterprise GitHub requires full hostname in --repo argument.
---

# gh

ALWAYS use the `gh` cli tool to access GitHub content.

**CRITICAL**: Load this skill BEFORE constructing gh commands. The --repo argument format depends on information in this skill.

## Critical Rule: Repository Argument Format

When using `--repo` with `gh` commands, you MUST include the full hostname from the GitHub URL.

**CORRECT**: `--repo github.pie.apple.com/ETE/rjs-chat-view`  
**INCORRECT**: `--repo ETE/rjs-chat-view`

The `--repo` argument format is: `HOSTNAME/ORG_NAME/PROJECT_NAME`

## URL Format Reference

GitHub URLs follow this pattern:
```
https://${HOSTNAME}/${ORG_NAME}/${PROJECT_NAME}/${TYPE}/${ID}
```

### Examples

| GitHub URL | Correct `--repo` argument |
|------------|---------------------------|
| `https://github.pie.apple.com/ETE/rjs-chat-view/pull/257` | `github.pie.apple.com/ETE/rjs-chat-view` |
| `https://github.com/i18next/i18next/discussions/2134` | `github.com/i18next/i18next` |

### Sample Commands

```bash
# Pull request on enterprise GitHub
gh pr view 257 --repo github.pie.apple.com/ETE/rjs-chat-view

# Issue on public GitHub  
gh issue view 123 --repo github.com/owner/repo

# Pull request diff on enterprise GitHub
gh pr diff 257 --repo github.pie.apple.com/ETE/rjs-chat-view
```
