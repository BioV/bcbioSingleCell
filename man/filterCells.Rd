% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/filterCells-methods.R
\docType{methods}
\name{filterCells}
\alias{filterCells}
\alias{filterCells,SingleCellExperiment-method}
\title{Filter Cells}
\usage{
filterCells(object, ...)

\S4method{filterCells}{SingleCellExperiment}(object, nCells = Inf,
  minUMIs = 0L, maxUMIs = Inf, minGenes = 0L, maxGenes = Inf,
  minNovelty = 0L, maxMitoRatio = 1L, minCellsPerGene = 1L)
}
\arguments{
\item{object}{Object.}

\item{...}{Additional arguments.}

\item{nCells}{\code{scalar integer}. Expected number of cells per sample.}

\item{minUMIs}{\code{scalar integer}. Minimum number of UMI disambiguated counts
per cell.}

\item{maxUMIs}{\code{scalar integer}. Maximum number of UMI disambiguated counts
per cell.}

\item{minGenes}{\code{scalar integer}. Minimum number of genes detected.}

\item{maxGenes}{\code{scalar integer}. Maximum number of genes detected.}

\item{minNovelty}{\code{scalar integer} (\code{0}-\code{1}). Minimum novelty score (log10
genes per UMI).}

\item{maxMitoRatio}{\code{scalar integer} (\code{0}-\code{1}). Maximum relative
mitochondrial abundance.}

\item{minCellsPerGene}{\code{scalar integer}. Include genes with non-zero
expression in at least this many cells.}
}
\value{
\code{bcbioSingleCell}, with filtering information slotted into
\code{\link[=metadata]{metadata()}} as \code{filterCells} and \code{filterParams}.
}
\description{
Apply gene detection, novelty score, and mitochondrial abundance cutoffs to
cellular barcodes. By default we recommend applying the same filtering cutoff
to all samples. The filtering parameters now support per-sample cutoffs,
defined using a named \code{numeric} vector. When matching per sample, be sure to
use the \code{\link[=sampleNames]{sampleNames()}} return values (i.e. the \code{sampleName} column in
\code{\link[=sampleData]{sampleData()}}).
}
\examples{
object <- indrops_small
show(object)

x <- filterCells(object)
show(x)
metadata(x)$filterParams

# Per sample cutoffs
sampleNames(object)
x <- filterCells(
    object = object,
    minUMIs = c(rep_1 = 100)
)
show(x)
metadata(x)$filterParams
}
\seealso{
Other Quality Control Functions: \code{\link{barcodeRanksPerSample}},
  \code{\link{metrics}}, \code{\link{plotCellCounts}},
  \code{\link{plotGenesPerCell}},
  \code{\link{plotMitoRatio}},
  \code{\link{plotMitoVsCoding}},
  \code{\link{plotNovelty}}, \code{\link{plotQC}},
  \code{\link{plotReadsPerCell}},
  \code{\link{plotUMIsPerCell}},
  \code{\link{plotZerosVsDepth}}
}
\author{
Michael Steinbaugh
}
\concept{Quality Control Functions}
