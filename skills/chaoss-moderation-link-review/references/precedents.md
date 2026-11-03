# Resolution Precedents

Link issues in `chaoss/wg-ai-alignment` have been resolved two ways: a maintainer commits directly to `main`, or a contributor opens a pull request that a maintainer merges.
Both paths are accepted.
This file records what each path looked like in practice so a reviewer can match an existing pattern instead of inventing one.

## Closed-issue case studies

| Issue | Resolution | Result |
|---|---|---|
| #114 Add link: Leptos AI policy | Pull request #117, merged 2026-10-08, branch `add-leptos-ai-policy`, body `Closes #114` | `* [Leptos AI Policy](https://github.com/leptos-rs/leptos/blob/main/AI_POLICY.md)` in `Current Project AI Policies` |
| #121 Add link: ratatui-hypertile AI Policy | Direct commit `7a34e9e`, subject `moderation: Add Ratatui-hypertile AI Policy` with the memo gitmoji prefix | One added line at the end of `Current Project AI Policies` |
| #107, #109, #111 Asahi, IzzyOnDroid, Void Linux | Pull request #113, merged 2026-10-01, three `Closes #N:` lines in the body | Three added lines in `Current Project AI Policies` |
| #81, #78, #75, #73, #72, #71 | Pull request #83, merged 2026-07-30, body `closes #81` through `closes #72` | Bulk policy additions, plus an Agda discussion link the author had locally |
| #56, #57, #59 KeePassXC, Gitea, KDE GSoC | Pull request #60, merged 2026-04-21, body `fixes #56` through `fixes #59` | Three policy additions plus a recategorization of the Linux Kernel and OpenJDK entries |
| #29, #38, #47, #48 | Pull request #49, merged 2026-04-04 | Created the `Meta-Lists` section, renamed `Project AI Policies` to `Current Project AI Policies`, and reorganized sections by publish date |
| #20, #69, #108 | Direct commit `2bc3a29`, subject `moderation: Curate agent and policy refs (#20, #69, #108)` with the memo gitmoji prefix | Added the Wine and jqwik references and the `Project-specific agent instructions` material |

Two conclusions follow from the table:

- A single-link issue resolves to one added line, either through a small pull request or a direct commit.
- Multi-issue pull requests work when each URL is verified and each issue gets its own closing reference in the body.

## Commit message conventions

The subject follows `<gitmoji> <component>: <summary>`.
For one link, the established subject is `<gitmoji> moderation: Add <Name>`, as in commit `7a34e9e`, whose subject is `moderation: Add Ratatui-hypertile AI Policy` with the memo emoji prefix.

The body explains why the link belongs, then closes the issue.
Both `Fixes #N` and `Closes #N.` appear in history; use one style per commit and keep it consistent across a multi-issue change.

Write the message to the 50/72 rule: the subject stays within 50 characters, and every body line stays within 72 characters.
Fill each body line greedily up to the limit and break at word boundaries.
Start the subject with the emoji character itself, such as `📝` for a catalog change, because git does not expand a `:memo:` shortcode.
Backtick file names, paths, commands, flags, and identifiers, and keep each backticked span on one line.

A correctly formatted message looks like this:

```text
📝 moderation: Add AlpineBSD AI Policy

Add the AlpineBSD AI policy to the Current Project AI Policies section
of `moderation/README.md` from issue #131.

Fixes #131
```

Every commit carries Developer Certificate of Origin sign-off through `git commit --signoff`.
When an AI agent drafted the change, append an `Assisted-by: <model> <version> (<context window>)` trailer with the values supplied by the maintainer.

## Discussion-linked policies

Some policies have no single canonical URL:

- Agda: the policy discussion lives in a pull request, recorded as `* Agda ([discussion](https://github.com/agda/agda/pull/8456))`.
- Haiku OS: the policy discussion lives in a code review, recorded as `* Haiku OS ([discussion](https://review.haiku-os.org/c/haiku/+/11180))`.
- QGIS: the policy is a proposal document, recorded as `* QGIS ([discusion/proposal](https://github.com/qgis/QGIS-Enhancement-Proposals/blob/master/qep-408-ai-tool-policy.md))`.

The QGIS entry preserves an upstream typo in the link label.
Do not correct labels or URLs that come from the catalog's history; report them to the maintainer as a separate cleanup.

Use the discussion form when the submission links a pull request, issue, mailing list thread, or review that contains the policy.
Use the standard form when one page states the policy.

## Failure modes visible in history

### Recategorization inside a link change

Pull request #60 added three policies and moved two existing entries between sections.
The change was committed as `1d82e6a`, reverted as `b685607`, and re-applied as `14b4fdb` on the same day before the merge.
The additions were fine; the moves created review churn.

Keep a link review to added lines.
Propose recategorization as a separate change with its own justification.

### Heading depth drift

An August month heading was once committed at `H3` instead of `H4`, which made it a peer of the year heading and detached the entry from its year.
Pull request #120 fixed it by nesting the heading under `### 2026`.
Check the depth of every heading created during placement.

### Out-of-order month blocks

Dated entries can be added to an existing month, a new month in the same year, or a new year.
Insert each one so the year keeps the direction it already uses, and never reorder the months that are already present.

### Bulk additions without verification

Bulk pull requests such as #83 are acceptable, but the body listed every issue it closed and the entries were checked one by one.
Verify each URL before adding it, even when one pull request resolves six issues.

## Direct commit or pull request

Choose a direct commit when the maintainer has write access, the change is one added line, and the issue already contains the link and its context.

Choose a pull request when the contributor lacks write access, when several issues are resolved together, or when the maintainer wants a second reviewer.
In both paths, the catalog entry text is identical.
