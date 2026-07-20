#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if ! command -v Rscript >/dev/null 2>&1; then
  echo "Rscript was not found. Please install R first." >&2
  exit 1
fi

Rscript -e '
if (!requireNamespace("csbewma", quietly = TRUE)) {
  dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE, showWarnings = FALSE)
  .libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))
  install.packages("csbewma", repos = "https://cloud.r-project.org")
}
'

Rscript run_csbewma_example.R
