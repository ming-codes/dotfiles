---
description: Review code for best practices and issues
agent: plan
---

# review.md

Review target is "$ARGUMENTS".

Perform code review on review target.

If review target is empty, assume it is the current feature branch.

You may be given reference to from many sources. If the reference is of same project
as current working directory, checkout the branch as a worktree.

## Task

Spawn parallel subagents to review the code from different angles. The following sections
describes what each subagent is targeting. Ask me question on which of these should be included for the run.

Compile final report and write to the Obsidian `code-reviews/` folder. Don't forget to move any screenshots there as well.

Details of the final report format in Final Report section.

### Structural Changes

Files that got moved needs to be noted in report. Put emphasis on files that got deleted and even more emphasis on files that are moved.

### Interface Changes

Interfaces that are exposed (exported) should be noted in report.

### UI/Feature Changes

Feature changes needs to captured as screenshots.

1. Start the dev server in a background PTY: `npm run dev`. Wait for "ready" output before proceeding.

2. Use `agent-browser` to capture screenshots of the key UI changes. For each feature changed:
   - Navigate to the relevant example page on `http://localhost:3000`
   - Interact with the UI to demonstrate the change (click buttons, send messages, etc.)
   - Take `--screenshot-format png` screenshots saved to `/tmp/pr-<number>-screenshots/`
   - Set viewport with `agent-browser set viewport 1280 900 2` for 2x retina quality

3. Annotate the screenshots using `magick`:
   - Draw colored rectangles or circles (`-stroke '#6155f5' -strokewidth 6`) around changed elements
   - Add text labels with `-font '/System/Library/Fonts/Helvetica.ttc' -pointsize 48`
   - Create before/after composites using `+append` (vertical) or `magick ... +append` (horizontal) for flow sequences
   - Save annotated images to `/tmp/pr-<number>-screenshots/annotated-*.png`
   - Note: screenshots taken at 2x scale have double the CSS pixel coordinates in image space

4. Write a structured change report covering:
   - PR metadata (title, author, branch, status, URL)
   - One section per logical change with: description, relevant code snippet, and the annotated screenshot
   - A files-changed table grouped by area (Core, Docs, Examples, Tests)
   - A breaking changes table with migration guidance
   - Save to `/tmp/pr-<number>-screenshots/REPORT.md`

5. Present the report as a markdown file in the closest `.opencode` directory. Ensure screenshots are attached
   using proper syntax: ![annotation](/path/to/file)

### Detailed Code Changes

Break these down into 2 or more subagents. For code references, ALWAYS include the line number. If applicable,
include the web link to the PR of the line number as well. The following specifies the format.

```
https://${HOSTNAME}/${ORG_NAME}/${PROJECT_NAME}/pull/${PR_NUMBER}/files#diff-${HASH}R${LINE_NUMBER}
https://${HOSTNAME}/${ORG_NAME}/${PROJECT_NAME}/pull/${PR_NUMBER}/files#diff-${HASH}R${START_LINE_NUMBER}-${END_LINE_NUMBER}
```

- Accessibility practices
- Rule violations on defined agent rules
- Security vulnerabilities and potential exploits
- Performance bottlenecks and optimization opportunities
- Code maintainability and readability issues
- Best practices and design patterns
- Error handling and edge cases
- Test coverage gaps
- Documentation completeness

## Final Report

The final report should start with a table summerizing the number of issues found aggregated by severity. Include in
the table with estimated time to fix them.

The final report should include sections for each of the reviewed area.

## Obsidian Quick Reference

```bash
obsidian files   # list files
obsidian folders # list folders
```
