# CHAOSS Agent Skills Library

[![skillsaw grade](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/chaoss/skills-library/main/.skillsaw-badge.json)](https://skillsaw.org/)

A library of reusable AI skills for CHAOSS community workflows.

Skills follow the [Agent Skills](https://agentskills.io/specification) open format: each skill is a directory containing a `SKILL.md` file with YAML frontmatter and instructions, plus optional `references/` and `assets/` subdirectories.

## Skills

The library is new and no skills have been merged yet.
Propose the first one with the [New Skill Proposal template](https://github.com/chaoss/skills-library/issues/new?template=new-skill.yml).

## Repository layout

```
skills/
└── <skill-name>/
    ├── SKILL.md          # Required: YAML frontmatter and instructions
    ├── references/       # Optional: on-demand reference documentation
    └── assets/           # Optional: templates and static files
```

## Documentation

- [Skills overview](docs/skills.md): what the library is and how it is governed.
- [Creating Agent Skills](docs/creating-skills.md): directory anatomy, frontmatter, and the naming schema.
- [Reviewing Agent Skills](docs/reviewing-skills.md): automated checks and human review criteria.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to add or improve a skill.
All contributions require [DCO sign-off](https://chaoss.community/kb/dco-setup/).

## Maintainers

- Justin Wheeler ([@justwheel](https://github.com/justwheel))
- Emma Irwin ([@emmairwin](https://github.com/emmairwin))
- Coraline Ada Ehmke ([@coralineada](https://github.com/coralineada))

## License

[CC BY 4.0](LICENSE.txt) - Justin Wheeler, CHAOSS, and community contributors.
