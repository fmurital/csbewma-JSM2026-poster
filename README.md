# JSM 2026 Poster Resources

## csbewma: An R Package for Cumulative Standardized Binomial EWMA Control Charts with Exact Variance and Post Hoc Diagnostics

Faruk Muritala [Resume](https://github.com/fmurital/csbewma-JSM2026-poster/blob/main/Faruk%20Muritala.pdf)
Kennesaw State University

### Poster

- [Download JSM 2026 Poster (PDF)](https://github.com/fmurital/csbewma-JSM2026-poster/blob/main/JSM%202026%20Poster%20Presentation.pdf)

### CRAN Package

https://cran.r-project.org/package=csbewma

### Methodology Paper

https://arxiv.org/abs/2601.09968

### Source Code

https://github.com/fmurital/csbewma

### Overview

The csbewma package implements the Cumulative Standardized Binomial EWMA (CSB-EWMA) methodology for monitoring Multiple Stream Processes (MSPs). Features include:

### Run the Demo

A ready-to-run R example is included in this repository:

- [run_csbewma_example.R](run_csbewma_example.R) — the R script
- [run_csbewma_example.sh](run_csbewma_example.sh) — one-click launcher for Linux/macOS

To run the demo from the repository root:

```bash
bash run_csbewma_example.sh
```

If you prefer to run the R script directly:

```bash
Rscript run_csbewma_example.R
```

- Exact variance control limits
- Optimal parameter selection
- Visualization tools
- Post-hoc identification using `identify_OOC()`
- Multiple-testing corrections (Bonferroni, Holm, and BH)
