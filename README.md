# Resume Tailoring Workspace Template

This repository is a lightweight template for tailoring a resume and cover
letter with an LLM while preserving factual accuracy and the source document's
formatting.

## Workflow

1. Keep the original resume and cover-letter templates read-only.
2. Copy working documents to a temporary directory before editing.
3. Use the target job description to select relevant, documented experience and
   projects.
4. Rewrite only the requested bullet text using the XYZ method: describe the
   action, the result, and the evidence or measurable impact.
5. Never invent skills, technologies, metrics, responsibilities, or project
   details.
6. Preserve the resume's layout and keep the final resume to one page.
7. Export the edited document to PDF with `scripts/export_pdf.sh` and verify the
   output before delivery.
8. After successfully delivering a resume and/or cover letter, update the local
   `job-applications.md` log using the application tracking rules below.

## Application tracking

Create your local log from the empty template once:

```sh
cp -n job-applications.template.md job-applications.md
```

When using an LLM to tailor documents, include these rules in its workspace
instructions (for example, your local `AGENTS.md`):

- After a resume or cover-letter PDF has been successfully generated, verified,
  and delivered, log the company, role, and date in `job-applications.md` before
  the final response. Do not log failed conversions, QA-only exports, or generic
  templates.
- Use the supplied job description for company and role; never guess missing
  details. Keep different roles, teams, and application cycles separate.
- Use `YYYY-MM-DD` for the first successful generation date in your local
  timezone, unless you provide an actual application date. Document generation
  does not confirm submission.
- Check for an existing company/role/application-cycle entry first. Resume and
  cover-letter pairs share one row even when generated on different days.
  Revisions do not create duplicate rows or replace the original date; a
  supplied actual application date may replace a provisional generation date.
- Keep rows sorted by date, then company and role.
- To backfill previous documents, inspect both `archive/` and `output/`, combine
  pairs and revisions, and use the earliest PDF creation date for each target.
  Mark these dates as provisional, not confirmed submission dates. List files
  with unknown companies, roles, or dates separately for review instead of
  inventing values.

Only the empty `job-applications.template.md` is published. Your populated
`job-applications.md` is ignored by Git and stays local.

## Local-only materials

Personal resumes, cover letters, project records, skills records, job
descriptions, generated PDFs, and temporary working documents should remain
local. This repository intentionally does not contain those materials.

## Expected local inputs

When using this template locally, keep the following files outside the tracked
publishable set:

- `template resume.docx` — the current resume template
- `template cover letter.docx` — the current cover-letter template
- `project-bank.md` — documented project facts and approved bullets
- `skills-bank.md` — documented skills and technologies
- `job-applications.md` — personal application log

## PDF export

`scripts/export_pdf.sh` converts a DOCX to PDF using a fresh isolated
LibreOffice profile. Usage:

```sh
scripts/export_pdf.sh /path/to/working-resume.docx [output-directory]
```

The helper defaults to the repository's `output/` directory when no output
directory is provided.
