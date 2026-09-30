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

## PDF export

`scripts/export_pdf.sh` converts a DOCX to PDF using a fresh isolated
LibreOffice profile. Usage:

```sh
scripts/export_pdf.sh /path/to/working-resume.docx [output-directory]
```

The helper defaults to the repository's `output/` directory when no output
directory is provided.
