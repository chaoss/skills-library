# Reviewing Agent Skills

Reviewing contributions to the [CHAOSS Agent Skills Library](https://github.com/chaoss/skills-library) requires a different mindset than traditional code review.
Code review evaluates deterministic source code compiled against concrete interfaces and unit test suites.
Skill review evaluates structured instructions, procedural boundaries, and prompt constraints that guide probabilistic AI models executing in diverse agent environments.

This guide helps reviewers evaluate incoming pull requests to ensure community skills are grounded, safe, reproducible, and effective for CHAOSS contributors.


## Overview

The library follows an *agentic-first* development model:

- AI coding agents draft instructions, output templates, and reference materials.
- Human contributors establish intent, guide workflow design, test behaviors, and review all proposed changes.
- Human reviewers verify safety, validate technical accuracy against CHAOSS reality, and ensure high quality before merging.

Automated linting runs on every pull request, but automated checks cannot replace human judgment.
Linters verify syntactic rules; human reviewers ensure that an agent will behave reliably when interacting with real CHAOSS systems.


## Automated CI Checks (Skillsaw)

Pull requests to the `chaoss/skills-library` repository automatically run the [Skillsaw](https://github.com/stbenjam/skillsaw) linter in GitHub Actions.
Skillsaw validates structural and mechanical rules, so reviewers do not need to spend time commenting on issues that CI already enforces:

- **Manifest Syntax and Naming**:
  Enforces that the skill directory name matches the `name` field in `SKILL.md` frontmatter and adheres to the canonical `<domain>-<subject>[-<qualifier>]-<verb>` naming schema.
- **Embedded Secrets**:
  Scans instructions, references, and assets for accidental API keys, private tokens, or credential strings.
- **Token Budgets and Structure**:
  Warns when instruction files exceed recommended token limits or lack structured cognitive headings.
- **Negative-Only Prohibitions**:
  Flags negative instructions that tell an agent what not to do without providing a positive alternative action.
- **Broken Internal Links**:
  Verifies that relative links between markdown files resolve within the repository.

If the Skillsaw check fails, the pull request cannot be merged.
Authors must resolve all CI errors and warnings before human reviewers proceed with substantive evaluation.


## Human Judgment Criteria

Human review focuses on the semantic, behavioral, and safety qualities of a skill that automated linters cannot detect.
Reviewers should evaluate pull requests against the following five core criteria:

### Grounded Accuracy

An agent is only as reliable as the facts embedded in its instructions.
Reviewers must verify that technical details reflect current CHAOSS reality:

- **Real CLI Commands and Flags**:
  Verify that documented commands, flags, subcommands, and arguments exist and perform the intended operation.
- **Current Repository Paths and Service Names**:
  Ensure that repository names, API endpoints, and service paths are accurate (for example, the correct `chaoss` GitHub repository or chaoss.community URL).
- **Authentic Data Formats**:
  Check that expected API payloads, data schemas, and exit codes match real system behavior (for example, CollectOSS API responses) rather than hypothetical structures.

### Hallucination Mitigation

Language models have a natural tendency to fabricate details when instructions are ambiguous or data is missing.
Effective skills prevent hallucinations through strict boundary constraints:

- **Grounded Data Sources**:
  Instructions should explicitly direct the agent to source information from verifiable tools (such as GitHub API queries, git logs, CollectOSS queries, or local files) rather than relying on model pre-training.
- **Handling Missing Data**:
  Verify that the skill instructs the agent on what to do when information cannot be found or an API call fails.
  The skill should explicitly forbid guessing or inventing placeholders when data is absent.
- **Deterministic Output Formatting**:
  The skill should prescribe exact formatting structures (such as markdown tables or specific field lists) so the agent does not vary its response unpredictably across runs.
  Skills should provide a concrete, verbatim example of the expected output (either directly in `SKILL.md` or via an asset template) to serve as a clear few-shot demonstration for the model.

### Safety and Command Constraints

Skills execute inside contributor agent environments with shell and network access.
Reviewers must guard against destructive, risky, or unauthorized operations:

- **No Destructive or Unconstrained Commands**:
  Reject instructions that prompt agents to run dangerous commands, such as bare `rm -rf`, piped web scripts (`curl | bash`), or broad system alterations.
- **Safe Execution Boundaries for Mutating Actions**:
  Skills that modify external system state (such as creating issues, posting comments, editing chaoss.community content, or pushing branches) must incorporate clear safety boundaries.
  In interactive workflows, skills should guide the agent to present proposed changes and seek user confirmation before executing.
  For autonomous or background workflows, skills should support dry-run modes or scoped permissions to prevent unintended destructive actions.
- **Untrusted Network Access**:
  Verify that skills do not fetch from arbitrary, unauthenticated third-party endpoints or exfiltrate local data to remote servers.

### Template and Semantic Consistency

Skills that produce formatted output often rely on templates in `assets/` and background documentation in `references/`:

- **Placeholder Alignment**:
  Verify that `{{DOUBLE_BRACES}}` placeholder tokens in templates match the variables and extraction steps defined in `SKILL.md`.
- **Output Medium Formatting**:
  Ensure that output formats fit their intended destination.
  For example, templates targeting GitHub comments or issues use standard Markdown, while content destined for the chaoss.community WordPress pipeline must follow that repo's content conventions.
- **Completeness of Reference Data**:
  If the skill relies on a table or reference document in `references/`, ensure the file is complete and does not contain unfilled template markers.

### Licensing and Policy Compliance

The CHAOSS Agent Skills Library operates under open community standards:

- **License Compliance**:
  Every skill must be licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
  Any external materials copied into `references/` or `assets/` must be compatible with this licensing.
- **DCO Sign-off**:
  Every commit must carry Developer Certificate of Origin sign-off; see the [CHAOSS DCO setup guide](https://chaoss.community/kb/dco-setup/).
- **AI Assistance Disclosure**:
  Contributions created with AI assistance should add an `Assisted-by:` or `Generated-by:` commit trailer where appropriate.
  Because agent behavior can vary across models, authors are strongly encouraged to disclose the specific models and versions used during development and testing in the pull request description.


## Reviewing Modifications to Existing Skills

When reviewing updates to an existing skill, do not review only the git diff.
Because agent skills operate as sequential, context-dependent workflows, modifying a single step can alter the prompt context and break downstream stages.

Reviewers should:

1. Read the complete `SKILL.md` file from beginning to end to understand the full workflow context.
2. Verify that updated instructions maintain backward compatibility with existing templates and references.
3. Check whether step numbering, prerequisite declarations, or input variable names were affected by the change.


## Empirical Testing with AI Agents

Until the project implements automated behavioral evaluation suites, empirical testing by human reviewers remains the standard for validating skill behavior.

Reviewers should test proposed skills locally before approving:

1. **Load the Skill into an Agent**:
   Copy the skill directory into your local agent skills path (for example, in Claude Code, OpenClaw, or pi-coding-agent).
2. **Run Representative Scenarios**:
   Execute the skill against real or representative test inputs matching the declared use case.
3. **Evaluate Sample Outputs**:
   Compare the agent's actual output against the sample output provided in the pull request description.
   If the author did not provide sample output, request a demonstration run before merging.
4. **Test Edge Cases**:
   Test what happens when input data is incomplete, an unexpected error code is returned, or a network request fails.
   Verify that the agent stops cleanly rather than hallucinating a continuation.


## Merge Criteria and Workflow

To maintain library stability and community standards, pull requests must satisfy the following merge criteria:

- **Passing CI**:
  All Skillsaw checks must pass with zero errors and zero warnings.
- **Peer Approval**:
  At least one approving review from a repository maintainer is required before merge.
- **Author Merge**:
  Once approved by a maintainer, the pull request author is responsible for merging their own contribution.
  If the author does not have permission to merge, a maintainer will help merge the contribution.
- **Documented Verification**:
  The pull request description must include sample output demonstrating at least one successful test run, or an explanation of why manual testing was not feasible.
