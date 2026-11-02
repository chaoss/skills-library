# Creating Agent Skills

The [CHAOSS Agent Skills Library](https://github.com/chaoss/skills-library) is a shared collection of reusable AI skills designed to assist with CHAOSS community workflows.
Skills provide AI agents with specialized context, procedural steps, and reference materials for specific community tasks.

This guide provides the technical standards and conventions for authoring new Agent Skills for the CHAOSS Agent Skills Library.


## Overview

The library follows the open [Agent Skills specification](https://agentskills.io/specification).
Skills in this library are tools for community members to run in their own local AI agent environments, such as Claude Code, OpenClaw, or pi-coding-agent.

This project follows an *agentic-first* development model:

- AI coding agents can draft instructions, templates, and reference materials.
- Human contributors establish intent, review outputs, test workflows, and retain accountability for all merged changes.
- All skills in the library are licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).


## Skill Anatomy and Directory Structure

Every skill is maintained as a self-contained directory under `skills/` in the `chaoss/skills-library` repository.
A skill directory consists of a mandatory `SKILL.md` file and optional supporting subdirectories:

```
skills/
└── <skill-name>/
    ├── SKILL.md          # Required: YAML frontmatter and instructions
    ├── references/       # Optional: on-demand reference documentation
    └── assets/           # Optional: templates and static files
```

The directory name and the `name` field in the `SKILL.md` frontmatter must match exactly.
All files required by a skill must reside inside its own directory.
Skills must not reference or depend on files inside other skill directories.


## Frontmatter and Metadata Tags

Every `SKILL.md` file begins with YAML frontmatter bounded by `---` delimiters:

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

The frontmatter fields are defined as follows:

**`name`**:
The canonical identifier for the skill.
Must match the directory slug and adhere to the naming schema below.

**`description`**:
One or two sentences explaining what the skill accomplishes and when an agent should invoke it.
Agents use this description to determine whether the skill is relevant to a user request.

**`license`**:
Must be set to `CC BY 4.0` or another license approved by the maintainers for the specific contribution.

**`metadata.author`**:
The GitHub username of the skill author.

**`metadata.tags`**:
A comma-separated string of classification tags that indicate the target audience and workstream.
`metadata` is strictly a map of string keys to string values, so tags must never be written as a YAML list.
Audience and category distinctions belong in `metadata.tags` rather than embedded into the skill name.
Common audience tags include `contributor`, `maintainer`, and `researcher`.
Common workstream tags include `metrics`, `triage`, `meetings`, `data`, and `community`.


## Skill Naming Schema

Skill names serve as command-line identifiers when contributors interact with their AI agents (for example, `/chaoss-contribution-triage`).
A consistent naming schema ensures predictability across a growing library.

### The Disambiguation Principle

Contributors routinely install skills from multiple upstream sources into a shared local directory.
Even if a `chaoss-` prefix appears redundant within the CHAOSS repository, it prevents collisions and clarifies origin once skills are blended into a user's local environment.

### Canonical Pattern

All skills in the library must follow this naming pattern:

```text
<domain>-<subject>[-<qualifier>]-<verb>
```

### Naming Rules

1. **Character Set**:
   Use lowercase ASCII letters, numbers, and hyphens only.
   Do not use underscores, spaces, or camelCase.
2. **Word Count**:
   Use at most four hyphen-separated words.
   Aim for three words whenever practical.
3. **Intent Verb**:
   The final element must be an **infinitive verb** expressing the action taken by the skill (for example, `triage`, `search`, `record`, `summarize`).
   Do not use gerunds ending in `-ing` (use `search`, not `searching`).
4. **Qualifiers**:
   An optional qualifier may be inserted between the subject and the verb when necessary to distinguish between related actions on the same subject.


## Domain Prefix Guidelines

Select the domain prefix based on the integration scope and dependencies of the skill:

### CHAOSS Infrastructure and Governance (`chaoss-*`)

Use the `chaoss-` prefix for skills that interact with CHAOSS-specific services, data, or governance.
This includes workflows that query or modify:

- Repositories and working groups in the `chaoss` GitHub organization.
- Content destined for the `chaoss.community` WordPress site.
- The CHAOSS metrics model and metrics release process.
- CHAOSScon and other CHAOSS event coordination.
- The 8Knot or CollectOSS community data platforms.

Examples: `chaoss-metrics-release-review`, `chaoss-contribution-triage`.

### Project and Upstream Tooling (e.g. `collectoss-*`)

Use a tool-specific prefix when the skill operates primarily on an upstream tool or service that integrates into CHAOSS workflows.
If the workflow targets a specific external service that has its own identity, use that project's name as the prefix.

Example: `collectoss-repo-health-summarize`.

### Generic Workflow Names

Unprefixed, generic names (such as `meeting-*`) are permitted only for general productivity tasks that carry no CHAOSS-specific dependencies or assumptions.
If a skill targets generic meeting logs but formats output specifically for CHAOSS channels (such as chaoss.community content or CHAOSS GitHub repositories), it should use the `chaoss-` prefix.


## Reference Examples

The following table illustrates how proposed skill names align with the naming schema:

| Name | Status | Rationale |
|------|--------|-----------|
| `chaoss-metrics-release-review` | Conforming | Follows `<domain>-<subject>-<qualifier>-<verb>` (`chaoss` + `metrics` + `release` + `review`). |
| `chaoss-contribution-triage` | Conforming | Follows `<domain>-<subject>-<verb>` (`chaoss` + `contribution` + `triage`). |
| `collectoss-repo-health-summarize` | Conforming | Tool-specific prefix with `<subject>-<qualifier>-<verb>` (`collectoss` + `repo` + `health` + `summarize`). |
| `meeting-notes` | Non-conforming | Noun-led and lacks an infinitive verb; a CHAOSS-formatted variant would be `chaoss-meeting-notes-record`. |


## Author Workflow and Best Practices

Follow this workflow when developing and contributing a new Agent Skill:

1. **Check Existing Skills**:
   Review the [skills directory](https://github.com/chaoss/skills-library/tree/main/skills) to ensure the functionality does not duplicate an existing skill.
2. **Open an Issue**:
   For new skills, [open an issue](https://github.com/chaoss/skills-library/issues) to discuss the proposed workflow with the community.
3. **Create the Skill Directory**:
   Create `skills/<skill-name>/` matching the canonical naming pattern.
4. **Draft Instructions**:
   Write clear, sequential, and deterministic instructions in `SKILL.md`.
   Specify exact CLI commands, expected arguments, output structures, and error handling steps.
5. **Provide Templates and References**:
   Place reusable output templates in `assets/` and background documentation in `references/`.
6. **Test Locally**:
   Load the skill into your local AI coding agent and test it against real-world scenarios to verify that the agent follows the instructions without hallucinating.
7. **Run the Linter**:
   Run `make lint` locally and resolve every error and warning before submitting.
8. **Security and Privacy**:
   Never commit API keys, personal access tokens, or private credentials.
   Use environment variable placeholders (such as `$LLM_TOKEN_GITHUB_PAT`) in command examples.
9. **Submit a Pull Request**:
   Submit your contribution to the [chaoss/skills-library](https://github.com/chaoss/skills-library) repository on GitHub.
