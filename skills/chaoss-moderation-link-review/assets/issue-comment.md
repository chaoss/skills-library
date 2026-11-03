# Issue Comment Templates

Two comment bodies close an `Add link` issue.
Use the first when the link was added to the catalog.
Use the second when the link is already present.

Render the comment with every placeholder filled, show it to the maintainer, and post it only after they approve that exact text.

## Added link

```text
Thanks, @{{AUTHOR}}! Added to the {{SECTION_NAME}} section of the catalog in commit `{{COMMIT_SHA}}`:

{{ENTRY_LINE}}

Closing as completed.

<sub>_LLM-gen-AI was used to draft this content, reviewed by @{{MAINTAINER_HANDLE}}._</sub>
```

## Duplicate link

```text
Thanks, @{{AUTHOR}}! This link is already listed in the {{SECTION_NAME}} section of the catalog:

{{EXISTING_ENTRY}}

Closing as a duplicate.

<sub>_LLM-gen-AI was used to draft this content, reviewed by @{{MAINTAINER_HANDLE}}._</sub>
```

## Output rules

- `{{ENTRY_LINE}}` is the complete catalog line, including its leading `* `.
  Do not add a second bullet.
- `{{SECTION_NAME}}` is the heading text without Markdown markers, for example `Current Project AI Policies`.
- `{{COMMIT_SHA}}` is the short hash from `git log -1 --format=%h -- moderation/README.md`.
- Keep the attribution line as the final line of the comment.
  Replace `{{MAINTAINER_HANDLE}}` with the handle of the person posting.
- Close an added link with `--reason completed` and a duplicate with `--reason "not planned"`.

## Placeholder reference

| Placeholder | Description | Source |
|---|---|---|
| `{{AUTHOR}}` | GitHub handle of the issue submitter | Issue metadata from Stage 1 |
| `{{SECTION_NAME}}` | Catalog heading that received the entry | Stage 3 |
| `{{COMMIT_SHA}}` | Short hash of the commit that added the link | Stage 7 |
| `{{ENTRY_LINE}}` | Complete catalog line, including the leading `* ` | Stage 4 |
| `{{EXISTING_ENTRY}}` | Existing catalog line when the link is already present | Stage 2 duplicate check |
| `{{MAINTAINER_HANDLE}}` | GitHub handle of the maintainer posting the comment | Maintainer confirmation |
