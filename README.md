# CHAOSS Agent Skills Library

[![skillsaw grade](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/chaoss/skills-library/main/.skillsaw-badge.json)](https://skillsaw.org/)

A library of reusable AI skills for CHAOSS community workflows.

Skills follow the [Agent Skills](https://agentskills.io/specification) open format: each skill is a directory containing a `SKILL.md` file with YAML frontmatter and instructions, plus optional `references/` and `assets/` subdirectories.

## Skills

| Skill | Description |
|-------|-------------|
| [`chaoss-moderation-link-review`](skills/chaoss-moderation-link-review/SKILL.md) | Review "Add link" issues in `chaoss/wg-ai-alignment` and add approved links to the moderation catalog with the correct section, entry format, and placement |

Propose a new skill with the [New Skill Proposal template](https://github.com/chaoss/skills-library/issues/new?template=new-skill.yml).

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

## Credits

The moderation link review skill vendors the [Gitmoji](https://github.com/carloscuesta/gitmoji) specification as `skills/chaoss-moderation-link-review/references/gitmojis.json`, retrieved from `https://gitmoji.dev/api/gitmojis`.
Gitmoji is Copyright (c) 2016-2022 Carlos Cuesta and distributed under the MIT License.
The full license text is bundled alongside the data in `skills/chaoss-moderation-link-review/references/gitmojis-LICENSE.txt`.

## License

[CC BY 4.0](LICENSE.txt) - Justin Wheeler, CHAOSS, and community contributors.
