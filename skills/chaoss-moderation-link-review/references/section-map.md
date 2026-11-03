# Section Map

`moderation/README.md` is the "Awesome LLM Policy" catalog.
The `Add a link` issue form in `.github/ISSUE_TEMPLATE/add-link.yml` offers eight section options, while the catalog has more destinations than the form exposes.
This file maps each option to a heading, defines the entry format for that heading, and records the placement rules that keep the file stable across contributions.

## Form option to heading

| Form option | Catalog heading | Level and parent |
|---|---|---|
| `Project AI Policy` | `### Current Project AI Policies` | `H3`, under `## Related` |
| `Organization/Company Policy` | `### Organization/Company Policies` | `H3`, under `## Related` |
| `Foundation AI Policy` | `### Foundation AI Policies` | `H3`, under `## Related` |
| `Blog Post` | `## Blog Posts & News` | `H2` |
| `News` | `## Blog Posts & News` | `H2` |
| `Tool` | `## Tools` | `H2` |
| `Spam example` | `## Spam examples` | `H2` |
| `Other` | See `Other destinations` below | varies |

Two naming mismatches are intentional:

- The form separates `Blog Post` and `News`; the catalog merges both into `## Blog Posts & News`.
- The form says `Organization/Company Policy`; the heading is plural, `### Organization/Company Policies`.

## Current catalog shape

```text
## Awesome LLM Policy
## Related
### Current Project AI Policies
### Organization/Company Policies
### Foundation AI Policies
## Discussions
### <year>
#### <month>
### GitHub Maintainers Community Forum
## Codes of Conduct
## Blog Posts & News
### <year>
#### <month>
## Meta-Lists
### <year>
#### <month>
#### Ongoing
## Tools
## Other Resources
### Project-specific agent instructions
## Responsible AI Contribution examples
### <year>
#### <month>
## Spam examples
## Credits
```

Entries are single lines beginning with `* `.
Nested entries under a parent entry use two leading spaces before the `* `.

## Entry formats

### Current Project AI Policies

Standard policy entry:

```markdown
* [Leptos AI Policy](https://github.com/leptos-rs/leptos/blob/main/AI_POLICY.md)
```

Policy that exists only as a discussion, pull request, or commit thread:

```markdown
* Agda ([discussion](https://github.com/agda/agda/pull/8456))
```

Policy plus a secondary discussion or announcement link:

```markdown
* [Servo](https://book.servo.org/contributing/getting-started.html#ai-contributions) ([discussion](https://github.com/servo/servo/discussions/36379))
* [Godot AI policy](https://contributing.godotengine.org/en/latest/pull_requests/pull_request_guidelines.html#ai-assisted-contributions) ([announcement](https://godotengine.org/article/contribution-policy-2026/))
```

Two discussion links on one policy:

```markdown
* Kubernetes ([discussion 1](https://github.com/kubernetes/steering/issues/291), [discussion 2](https://github.com/kubernetes/community/issues/8558))
```

Named policy with a redirect link:

```markdown
* [Castle Game Engine](https://castle-engine.io/) - [Rules for contributing and using AI](https://castle-engine.io/ai)
```

Entry with a short advisory note:

```markdown
* Wine: [Clean Room Guidelines](https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines) advise against using LLM tools to generate code because training material may violate the guidelines or output may be LGPL-incompatible; the [Developer FAQ](https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ#can-i-contribute-code-generated-by-a-large-language-model-llm-tool) says Wine cannot assume it may distribute generated code under its license.
```

Choose the discussion form when the policy is spread across several files or has not landed as a single document.
Choose the standard form when one URL is the policy.

### Organization/Company Policies

```markdown
* [Flathub Generative AI policy](https://docs.flathub.org/docs/for-app-authors/requirements#generative-ai-policy)
```

### Foundation AI Policies

```markdown
* [Linux Foundation](https://www.linuxfoundation.org/legal/generative-ai)
  * [Linux Kernel](https://lore.kernel.org/ksummit/20251114183528.1239900-1-dave.hansen@linux.intel.com/)
  * [Linux AI Coding Assistants documentation](https://github.com/torvalds/linux/blob/master/Documentation/process/coding-assistants.rst)
```

A policy that belongs to a foundation member project nests two spaces under the foundation entry, as the Linux Kernel entries do under the Linux Foundation.

### Blog Posts & News

```markdown
### 2026
#### August
* [Debian Votes Responsible AI Use](https://www.phoronix.com/news/Debian-Votes-Responsible-AI-Use)
```

The catalog also contains legacy bare-URL entries such as `* https://mitsloanedtech.mit.edu/ai/teach/ai-detectors-dont-work/`.
Write new entries as titled links.
Leave existing bare URLs unchanged.

### Tools

```markdown
* [aittributor](https://github.com/block/aittributor) - AI attribution tooling.
* [usagescale](https://usagescale.org/) - a scale for describing AI usage in contributions.
```

A tool entry carries a one-sentence description after ` - ` and ends with a period.
When the issue body contains a drafted description, use that wording if it is accurate, and trim marketing language.

### Spam examples

```markdown
* [pallets/click](https://github.com/pallets/click/pull/3187#issuecomment-3796826158)
* [Ocaml](https://github.com/ocaml/ocaml/pull/14369): using AI tools with a niche programming language, resulting in nearly directly lifting someone elses code, including headers and attribution
```

A spam entry names the affected project and links the exhibit.
Add a colon and a factual sentence when the exhibit needs context.

### Discussions

```markdown
### 2025
#### November
* CHAOSS Augur ([discussion](https://github.com/chaoss/augur/issues/3371))
```

Discussion entries always use the `* Project ([discussion](https://github.com/chaoss/augur/issues/3371))` form and live under a year and month block.

Private GitHub Maintainers Community Forum links go under `### GitHub Maintainers Community Forum` instead of a year block.

### Codes of Conduct

```markdown
* https://docs.ansible.com/ansible/latest/community/code_of_conduct.html
```

The section currently holds one bare URL.
Add a titled link when the issue supplies a title, and leave the existing line unchanged.

### Meta-Lists

```markdown
### 2026
#### March
* [Is AI killing open source software? - Reading list (Stormy Peters)](https://www.linkedin.com/pulse/ai-killing-open-source-software-reading-list-stormy-peters-mebfc)

#### Ongoing
* [Another curated list of OS AI contribution policies](https://github.com/melissawm/open-source-ai-contribution-policies)
```

Dated lists follow the year and month blocks.
Lists without a publication date go under `#### Ongoing`.

### Other Resources

```markdown
* [Model Openness Framework Classes](https://arxiv.org/html/2403.13784v6#S4)
```

Use this section for research papers, standards, and reference material that fits no other heading.

### Project-specific agent instructions

```markdown
* [AGENTS.md](https://agents.md/) is an open format for guiding coding agents.
```

Agent instruction files are examples, not policies.
Keep the existing introductory sentence in place and add a bullet that states what the link demonstrates.

### Responsible AI Contribution examples

```markdown
### 2025
#### September
* [Joshua Rogers' Curl contributions](https://mastodon.social/@bagder/115241241075258997)
```

Positive examples go here, under a year and month block.

## Other destinations

The form's `Other` option carries free text in the `### If "Other", please describe` field.
Match that text and the linked content against this table:

| Free text or content | Destination |
|---|---|
| discussion, forum thread, mailing list thread | `## Discussions` with a year and month block |
| code of conduct, CoC | `## Codes of Conduct` |
| curated list, reading list, survey, list of lists | `## Meta-Lists` with a year and month block, or `#### Ongoing` |
| agent instructions, `AGENTS.md`, `CLAUDE.md`, `copilot-instructions` | `### Project-specific agent instructions` |
| good example, responsible contribution practice | `## Responsible AI Contribution examples` with a year and month block |
| research paper, standard, specification, reference material | `## Other Resources` |

If the free text names a policy, use the policy section that matches the publisher instead of this table.
If nothing matches, place the link in `## Other Resources` and tell the maintainer that a new heading would need a separate change.

## Placement rules

### List sections

Append the entry after the last bullet of the section, before the next heading.
Do not insert alphabetically, by trailing slash, or by URL length.

### Dated sections

Entries live under `### YEAR` and `#### Month`, where `Month` is the full English month name.

Year blocks sort newest first, so a new year heading goes above the previous year.

Month blocks keep the direction already present in their year:

- The 2026 block sorts ascending: January, March, May, August.
- The 2025 block sorts descending: December, September, July, February.
- The 2024 block holds a single month.

Derive the direction from the two nearest month headings in the target year instead of assuming a year number.
When a year block has fewer than two months, append the new month at the end of that block.

### Blank lines and heading depth

- A year heading is immediately followed by its first month heading with no blank line between them.
- Month blocks are separated from each other by one blank line.
- A heading is immediately followed by its first entry with no blank line between them.
- Month headings are `H4` (`####`).
  A month heading at `H3` becomes a peer of the year and misplaces every entry under it.
- Section headings are separated from the previous section by one blank line.

## Formatting rules

- One entry per line, with no trailing whitespace.
- Use `* ` for bullets in every catalog section.
- Keep the submitter's title unless it is empty or duplicates the domain name.
- Preserve the URL exactly as submitted, including anchors and query strings.
- Write plain ASCII with straight apostrophes and no em dashes.
- End a descriptive sentence with a period and keep it to one sentence.
- Keep every existing entry byte-identical.
- Keep the file limited to the catalog structure listed under `Current catalog shape`.
