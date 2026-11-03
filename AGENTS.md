# AGENTS.md -- Project context for AI assistants

## Project objective

Build and maintain the **CHAOSS Agent Skills Library**: a collection of reusable AI skills for CHAOSS community workflows.

Skills are self-contained, version-controlled directories that give AI agents specialized knowledge and workflows for specific tasks.
The library is hosted publicly on GitHub at `chaoss/skills-library` and is open to community contributions.

- **Authoritative documentation**: The library guides live in this repository as Markdown: [docs/skills.md](docs/skills.md) (overview), [docs/creating-skills.md](docs/creating-skills.md) (authoring), and [docs/reviewing-skills.md](docs/reviewing-skills.md) (review).
- **Success looks like**: A growing library of high-quality, reliable skills that CHAOSS contributors can load into any skills-compatible AI agent to automate or assist with community workflows.
- **Non-goals**: This library does not provide a hosted service, API, or bot. Skills are tools for humans to use with their own AI agents.

## How we work (agentic first)

- **Instruction standard**: All AI coding agents must use and maintain `AGENTS.md`. Do not create or maintain `CLAUDE.md` in this repository.
- **Human role**: Intent, skill design decisions, output quality review, and final editing before merge.
- **Agent role**: Implementation drafts for skill instructions, reference files, templates, and documentation, always reviewed by a human before commit or push.
- **Contributions**: Open to community contributions following the workflow in `CONTRIBUTING.md`.
Propose new skills on the repo issue tracker: https://github.com/chaoss/skills-library/issues.
- **Forge protocol**: This repository lives on GitHub. Mutating API actions (issues, comments, PRs, reviews) follow the consent and disclosure protocol defined in the workspace-level `AGENTS.md` at `/home/jwheel/git/chaoss/AGENTS.md`.

## Architecture and Skill Anatomy

The library follows the open [Agent Skills specification](https://agentskills.io/specification).
Each skill is a self-contained directory under `skills/` containing a required `SKILL.md` file plus optional supporting subdirectories:

```text
skills/
└── <skill-name>/
    ├── SKILL.md          # Required: YAML frontmatter + instructions
    ├── references/       # Optional: reference documentation loaded on demand
    └── assets/           # Optional: templates and static resources
```

The directory slug and the `name` field in `SKILL.md` frontmatter must match exactly.
All files needed by a skill must reside in its directory.
Skills must not reference or depend on files inside other skill directories.

## Available skills

### `chaoss-moderation-link-review`

Reviews `Add link:` issues in `chaoss/wg-ai-alignment` and adds the approved link to `moderation/README.md`, the "Awesome LLM Policy" catalog.
The skill runs one staged workflow: gather the submission, validate the URL, check for duplicates, map the request to a catalog section, format and place the entry, propose the exact change to the maintainer, then prepare the commit and close the issue.

- **Scope**: `moderation/README.md` only.
  Working group metrics, meeting notes, and issue-template changes belong to other workflows.
- **References**: `references/section-map.md` maps each form option to a catalog heading and defines the entry format.
  `references/precedents.md` records past resolutions and commit conventions.
  `references/gitmojis.json` and `references/gitmojis-LICENSE.txt` are the vendored gitmoji data and its MIT license.
- **Assets**: `assets/issue-comment.md` holds the closing comments, and `assets/commit-message.txt` holds the commit message template.
- **Safety posture**: draft local edits only after the maintainer approves the exact entry line, and print commit, push, comment, close, and pull request commands for the maintainer to run.

## Repository layout

| Path | Purpose |
|------|---------|
| `skills/` | Skills directory -- one subdirectory per skill |
| `skills/<skill-name>/SKILL.md` | Skill entry point: metadata + instructions |
| `skills/chaoss-moderation-link-review/` | Moderation link review skill; see [Available skills](#available-skills) |
| `docs/skills.md` | Library overview and governance |
| `docs/creating-skills.md` | Authoring guide: anatomy, frontmatter, naming schema |
| `docs/reviewing-skills.md` | Review guide: CI checks and human criteria |
| `AGENTS.md` | This file -- project context for AI assistants |
| `CONTRIBUTING.md` | How to contribute |
| `README.md` | Primary project README |
| `LICENSE.txt` | CC BY 4.0 |
| `.skillsaw.yaml` | Skillsaw linter configuration |
| `Makefile` | `make lint` / `make lint-fix` / `make badge` via `uvx skillsaw` |

## Skill Naming Schema

Skill names serve as command-line identifiers when contributors interact with their AI agents (for example, `/chaoss-metrics-release-review`).
All skills in the library must follow the canonical naming pattern:

```text
<domain>-<subject>[-<qualifier>]-<verb>
```

### Naming rules

1. **Character set**: Use lowercase ASCII letters, numbers, and hyphens only. No underscores, spaces, or camelCase.
2. **Word count**: At most 4 hyphen-separated words. Aim for 3 or fewer whenever practical.
3. **Intent verb**: The final element must be an **infinitive verb** stating the action (e.g. `triage`, `search`, `record`, `summarize`). Never use gerunds ending in `-ing` (use `search`, not `searching`).
4. **Qualifiers**: An optional qualifier may be inserted between subject and verb when needed to distinguish related actions on the same subject.

### Domain prefix guidelines

- **`chaoss-*` (CHAOSS infrastructure, data, and governance)**: Required when the skill integrates directly with CHAOSS services or data. This includes the `chaoss` GitHub organization and its working group repositories, the `chaoss.community` WordPress content pipeline, the metrics release process, CHAOSScon coordination, and the 8Knot, Augur, or CollectOSS data platforms. Examples: `chaoss-metrics-release-review`, `chaoss-contribution-triage`.
- **Project / tool prefix (e.g. `augur-*`)**: Used when the skill operates primarily on an upstream tool or service that integrates into CHAOSS workflows. If the workflow targets a specific external service with its own identity, use that project's name as the prefix. Example: `augur-repo-health-summarize`.
- **Generic / unprefixed (e.g. `meeting-*`)**: Permitted only for general contributor productivity tasks without CHAOSS-specific dependencies. If the skill formats output specifically for CHAOSS channels (such as chaoss.community content or CHAOSS GitHub repositories), use the `chaoss-` prefix instead.

## Frontmatter and Metadata Tags

Every `SKILL.md` begins with YAML frontmatter:

```yaml
---
name: chaoss-contribution-triage
description: Triage contribution activity for a CHAOSS repository - staged workflow for reviewing issues and pull requests.
license: CC BY 4.0
metadata:
  author: justwheel
  tags: "contributor, triage, github"
---
```

- **Audience and category tags**: Target audience (e.g. `contributor`, `maintainer`, `researcher`) and workstreams (e.g. `metrics`, `triage`, `meetings`, `data`, `community`) belong in `metadata.tags` as a comma-separated string per the [Agent Skills metadata specification](https://agentskills.io/specification#metadata-field).
`metadata` is strictly `map[string]string`, so tags must never be written as a YAML list.
Keep the skill directory slug clean and focused on action rather than embedding audience names into the slug.
- **Author**: Use the GitHub username of the skill author in `metadata.author`.
- **License**: Must be `CC BY 4.0` or another license approved by the maintainers for the specific contribution.

## Repository Maintainers

The CHAOSS Agent Skills Library is curated by community maintainers who steward the repository:

- Justin Wheeler (@justwheel)
- Emma Irwin (@emmairwin)
- Coraline Ada Ehmke (@coralineada)

Maintainers emphasize stewardship, code review, safety guardrails, instruction quality, and policy compliance, rather than solely generating new content.

## Reviewing Skills

Reviewing Agent Skills evaluates structured instructions, procedural boundaries, and prompt constraints that guide probabilistic AI models.
While the automated Skillsaw CI linter validates syntax, naming schemas, token limits, and embedded secrets, human reviewers focus on five core judgment criteria:

1. **Grounded Accuracy**: Verify that CLI commands, flags, API endpoints, repository paths, and service names are real and match current CHAOSS behavior.
2. **Hallucination Mitigation**: Ensure the skill constrains the agent to verified data sources and provides concrete output formatting examples in `SKILL.md` or templates.
3. **Safe Execution Boundaries**: Ensure commands are safe and non-destructive, and verify that actions mutating external systems have confirmation boundaries or dry-run options.
4. **Template Consistency**: Confirm placeholder tokens (`{{DOUBLE_BRACES}}`) in `assets/` and `references/` match the variables in `SKILL.md`.
5. **Licensing and Policy Compliance**: Ensure CC BY 4.0 compatibility, DCO sign-off, and AI assistance disclosure.

When reviewing changes to an existing skill, read the entire `SKILL.md` rather than just the unified diff to avoid breaking sequential workflow stages.
Reviewers should test skills locally using sample inputs in an AI coding agent before approving.

For the complete guide, see [docs/reviewing-skills.md](docs/reviewing-skills.md).

## Conventions

- **License**: CC BY 4.0. All contributions are made under this licensing framework.
- **DCO**: All commits require Developer Certificate of Origin sign-off (`--signoff`); see the [CHAOSS DCO setup guide](https://chaoss.community/kb/dco-setup/).
- **Prose format**: One sentence per line (ventilated prose) in git-tracked Markdown files.
- **Plain ASCII**: Use plain ASCII only (straight quotes, simple hyphens). Avoid ambiguous Unicode characters like curly quotes, em dashes, or unicode arrows.
- **Secrets**: Never commit API keys, personal access tokens, or private credentials. Use environment variable placeholders (such as `$LLM_TOKEN_GITHUB_PAT`) in command examples.
- **Template placeholders**: Use `{{DOUBLE_BRACES}}` syntax in template files.

## Validation

Run the Skillsaw linter locally before opening a pull request:

```bash
make lint       # validate manifests and refresh the badge (strict mode)
make lint-fix   # apply automatic fixes
```

Both targets run through `uvx skillsaw`, so a local `uv` installation is required.
The same checks run in GitHub Actions on every pull request via `.github/workflows/lint.yml`.

## Common tasks

- "Add a new skill -- I want to add a skill for [workflow]. Create a new directory under `skills/` with a `SKILL.md` following the Agent Skills format, then list it in `README.md`, `docs/skills.md`, and the Available skills section above."
- "Review an Add link issue -- read `skills/chaoss-moderation-link-review/SKILL.md` and run its workflow against issue #[number] in `chaoss/wg-ai-alignment`."
- "Improve an existing skill -- I want to improve how the [skill-name] skill handles [specific aspect]. Read `skills/<skill-name>/SKILL.md` and suggest changes."
- "Update a skill's reference data -- [something] has changed. Update the relevant file in `skills/<skill-name>/references/`."

## Key links

- Agent Skills specification: https://agentskills.io/specification
- Skillsaw linter: https://github.com/stbenjam/skillsaw
- Library overview: [docs/skills.md](docs/skills.md)
- Authoring guide: [docs/creating-skills.md](docs/creating-skills.md)
- Review guide: [docs/reviewing-skills.md](docs/reviewing-skills.md)
- Issue tracker: https://github.com/chaoss/skills-library/issues
- CHAOSS community: https://chaoss.community
- CHAOSS DCO setup: https://chaoss.community/kb/dco-setup/
