#!/bin/zsh

set -u

if (( $# < 1 || $# > 2 )); then
  print -u2 "usage: $0 INPUT.docx [OUTPUT_DIR]"
  exit 2
fi

input_docx="$1"
script_dir="${0:A:h}"
output_dir="${2:-$script_dir/../output}"

if [[ ! -f "$input_docx" ]]; then
  print -u2 "Input DOCX not found: $input_docx"
  exit 2
fi

mkdir -p "$output_dir"
profile_dir="$(mktemp -d /tmp/libreoffice-resume-profile.XXXXXX)"
trap 'rm -rf "$profile_dir"' EXIT

soffice_bin="/opt/homebrew/bin/soffice"
if [[ ! -x "$soffice_bin" ]]; then
  soffice_bin="/Applications/LibreOffice.app/Contents/MacOS/soffice"
fi

if [[ ! -x "$soffice_bin" ]]; then
  message="LibreOffice was not found on this Mac."
  print -u2 "$message"
  exit 127
fi

file_url="file://$profile_dir"
"$soffice_bin" --headless --norestore --nodefault --nofirststartwizard \
  "-env:UserInstallation=$file_url" \
  --convert-to pdf --outdir "$output_dir" "$input_docx"
exit_code=$?

if (( exit_code != 0 )); then
  message="LibreOffice PDF export failed (exit $exit_code).\n\nInput: $input_docx\nOutput: $output_dir"
  print -u2 "$message"
  exit $exit_code
fi

print "PDF export completed: $output_dir"
