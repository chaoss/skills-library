# Skills and Workflows

The [CHAOSS Agent Skills Library](https://github.com/chaoss/skills-library) is a collection of reusable AI skills designed for CHAOSS community workflows.
Skills provide AI coding agents with specialized context, procedural instructions, and reference materials to assist with common tasks across the CHAOSS Project.


## Overview

Agent Skills follow the open [Agent Skills specification](https://agentskills.io/specification).
Skills in this library are self-contained packages that community members can load into their own local AI agent environments, such as Claude Code, OpenClaw, or pi-coding-agent.

This project operates on an *agentic-first* development model:

- AI coding agents assist contributors with routine, multi-step, or mechanical tasks.
- Human contributors set intent, guide execution, review all generated outputs, and retain final accountability.
- All skills in the library are licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).


## Available Skills

The library is new and no skills have been merged yet.
Watch this space as the first CHAOSS-specific skills land.

Skill ideas under discussion live on the [issue tracker](https://github.com/chaoss/skills-library/issues).


## Contributing Skills

The CHAOSS community welcomes contributions to the skills library.
Contributors can add new skills, improve existing instructions, or update reference materials.

To author or review a skill, consult the technical guides:

- [Creating Agent Skills](creating-skills.md):
  Covers skill directory anatomy, YAML frontmatter, audience and category tagging, and the canonical `<domain>-<subject>[-<qualifier>]-<verb>` naming schema.
- [Reviewing Agent Skills](reviewing-skills.md):
  Details the automated Skillsaw CI checks, human evaluation criteria (grounding, hallucination mitigation, safety), empirical agent testing, and merge workflow.

To propose a new skill:

1. Search the [skills library issue tracker](https://github.com/chaoss/skills-library/issues) to verify that the workflow is not already being developed.
2. Open an issue describing the proposed skill, its intended user audience, and the workflow steps it will automate.
3. Once discussed with maintainers, submit a pull request against the `chaoss/skills-library` repository.

All contributions require [DCO sign-off](https://chaoss.community/kb/dco-setup/).


## Maintainers

The CHAOSS Agent Skills Library is curated by community maintainers who steward the repository.
Maintainers focus on reviewing community pull requests, verifying safety guardrails, maintaining instruction quality, and ensuring compliance with CHAOSS licensing and contribution policies, rather than solely generating new content.

The current maintainers of the CHAOSS Agent Skills Library, in alphabetical order:

- Coraline Ada Ehmke ([@coralineada](https://github.com/coralineada))
- Emma Irwin ([@emmairwin](https://github.com/emmairwin))
- Justin Wheeler ([@justwheel](https://github.com/justwheel))


## Communication

- **Slack**:
  Join the CHAOSS Slack workspace for synchronous discussion and questions about skills.
- **Issue Tracker**:
  File bug reports, request skill improvements, and propose new workflows on the [chaoss/skills-library issue tracker](https://github.com/chaoss/skills-library/issues).
