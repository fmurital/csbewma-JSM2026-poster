# JSM 2026 Poster Resources

## csbewma: An R Package for Cumulative Standardized Binomial EWMA Control Charts with Exact Variance and Post Hoc Diagnostics

Faruk Muritala 
- Kennesaw State University
- [Resume](https://github.com/fmurital/csbewma-JSM2026-poster/blob/main/Faruk%20Muritala.pdf)

### Poster

- [Download JSM 2026 Poster (PDF)](https://github.com/fmurital/csbewma-JSM2026-poster/blob/main/JSM%202026%20Poster%20Presentation.pdf)

### CRAN Package

https://cran.r-project.org/package=csbewma

### Methodology Paper

https://arxiv.org/abs/2601.09968

### Source Code

[https://github.com/fmurital/csbewma](https://github.com/fmurital/csbewma-JSM2026-poster/blob/main/run_csbewma_example.R)

### Overview

The csbewma package implements the Cumulative Standardized Binomial EWMA (CSB-EWMA) methodology for monitoring Multiple Stream Processes (MSPs). Its main features include:

- Exact variance control limits
- Optimal parameter selection
- Visualization tools
- Post-hoc identification using `identify_OOC()`
- Multiple-testing corrections (Bonferroni, Holm, and BH)

### Run the Demo

A ready-to-run example is included in this repository so you can try the method quickly.

Files:

- [run_csbewma_example.R](run_csbewma_example.R) — the R script
- [run_csbewma_example.sh](run_csbewma_example.sh) — a launcher script for Linux/macOS

#### Option 1: Run with the launcher

From the repository root, run:

```bash
bash run_csbewma_example.sh
```

This will install the package if needed and run the demo.

#### Option 2: Run the R script directly

If R is already installed, run:

```bash
Rscript run_csbewma_example.R
```

#### Prerequisites

- R installed on your machine
- Internet access to install the package from CRAN if it is not already installed

The demo will generate synthetic binary data, run the CSB-EWMA chart, and save a plot as [csbewma_plot.pdf](csbewma_plot.pdf).
