# Contributing -- CHAOSS Agent Skills Library

Contributions are welcome, whether you are adding a new skill, refining an existing one, or improving the library documentation.

This project uses an **agentic-first** workflow: AI coding agents assist with drafting, while humans set intent, review, and own every change that ships.

## Before you start

1. **Read [AGENTS.md](AGENTS.md)** -- project context, architecture, and conventions.
2. **Read the [Skills overview](docs/skills.md)** -- what the library is and how it is governed.
3. **Read the [Creating Agent Skills guide](docs/creating-skills.md)** -- authoritative standards for directory structure, frontmatter metadata, and naming schemas.
4. **Read the [Reviewing Agent Skills guide](docs/reviewing-skills.md)** -- what reviewers check before a contribution merges.

## Developer Certificate of Origin

The CHAOSS project uses a [Developer Certificate of Origin](https://chaoss.community/kb/dco-setup/) process for all contributions.
Every commit must include DCO sign-off (`git commit --signoff`, or `-s`).

## What you can contribute

### Add a new skill

1. Optionally, propose your skill using the [New Skill Proposal template](https://github.com/chaoss/skills-library/issues/new?template=new-skill.yml) on the issue tracker to discuss the workflow with maintainers.
2. Create a new directory under `skills/` following the canonical `<domain>-<subject>[-<qualifier>]-<verb>` naming schema.
3. Add a `SKILL.md` with YAML frontmatter (`name`, `description`, `license`, `metadata.author`, `metadata.tags`) and instructions.
4. Optionally add `references/` and `assets/` subdirectories for supporting files.
5. Add your skill to the `README.md` table, the `## Available Skills` section in `docs/skills.md`, and the `## Available skills` section in `AGENTS.md`.
6. Submit a pull request against `https://github.com/chaoss/skills-library`.

The proposal issue is a place to discuss an idea for a skill before building it, not a required gate.
If you already have a skill written and ready for review, skip the issue and open a pull request directly.

A new skill is not complete until it appears in all three listings.
The merged `chaoss-moderation-link-review` skill is the worked example: it is listed in the `README.md` table, in `docs/skills.md`, and in the available-skills section of `AGENTS.md`.

The `name` field in frontmatter must match the directory name exactly.
See the [Agent Skills specification](https://agentskills.io/specification) and the [Creating Agent Skills guide](docs/creating-skills.md) for the full format.

### Improve an existing skill

Each skill is self-contained in its own directory.
To improve a skill's instructions, reference data, or templates:

1. Read the skill's `SKILL.md` to understand its current design.
2. Make your changes inside the skill directory.
3. Submit a pull request describing what you changed and why.
4. If the change alters the skill's scope, prerequisites, or safety boundaries, update the matching entry in `AGENTS.md` and the description in `README.md` and `docs/skills.md`.

For substantial changes to a skill's core instructions, open an issue first to discuss the motivation and approach.
For small fixes (typos, clarifications, outdated reference data), a direct pull request is fine.

## Attribution

Disclose AI assistance on every AI-assisted commit with a trailer, and sign off every commit with DCO:

| Situation | Trailer |
|-----------|---------|
| You directed the work and edited meaningfully | `Assisted-by: <tool name>` |
| Large generated chunk, minimal human edit | `Generated-by: <tool name>` |
| Unsure | `Assisted-by: <tool name>` |

## Validation

Run the linter locally before opening a pull request:

```bash
make lint       # strict validation via uvx skillsaw
make lint-fix   # apply automatic fixes
```

The same checks run automatically in GitHub Actions on every pull request.

## Code review

See the [Reviewing Agent Skills guide](docs/reviewing-skills.md) for what reviewers check.
Maintainers and reviewers focus on:

- **Accuracy**: Are the skill's instructions correct and grounded?
- **Scope**: Does the skill stay focused on its declared task?
- **Hallucination risk**: Could any change cause an agent to fabricate information?
- **Template consistency**: Do placeholders match what the skill instructions expect?
- **Naming schema**: Does the directory name adhere to `<domain>-<subject>[-<qualifier>]-<verb>`?

## Conventions

- **Markdown**: One sentence per line (ventilated prose).
- **Plain ASCII**: Straight quotes, simple hyphens; no curly quotes, em dashes, or unicode arrows.
- **Template placeholders**: `{{DOUBLE_BRACES}}` syntax.
- **Skill naming**: Follow the canonical `<domain>-<subject>[-<qualifier>]-<verb>` schema (e.g. `chaoss-metrics-release-review`) detailed in [Creating Agent Skills](docs/creating-skills.md).
- **License**: All contributions are made under CC BY 4.0.
