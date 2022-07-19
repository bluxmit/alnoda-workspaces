#!/usr/bin/env r
#
# A second example to install one or more packages, now with option parsing
#
# Copyright (C) 2011 - 2014  Dirk Eddelbuettel
# Copyright (C) 2014 - 2017  Carl Boettiger and Dirk Eddelbuettel
# Copyright (C) 2018         Carl Boettiger, Dirk Eddelbuettel, and Brandon Bertelsen
#
# Released under GPL (>= 2)

## load docopt package from CRAN
library(docopt)

## configuration for docopt
doc <- "Usage: install2.r [-l LIBLOC] [-h] [-x] [-s] [-d DEPS] [-n NCPUS] [-r REPOS...] [-m METHOD] [--error] [--skipmissing] [--] [PACKAGES ...]

-l --libloc LIBLOC  location in which to install [default: /usr/local/lib/R/site-library]
-d --deps DEPS      install suggested dependencies as well [default: NA]
-n --ncpus NCPUS    number of processes to use for parallel install [default: getOption]
-r --repos REPOS    repositor(y|ies) to use, or NULL for file [default: getOption]
-e --error          throw error and halt instead of a warning [default: FALSE]
--skipmissing       use with the --error option, skip the packages missing error [default: FALSE]
-s --skipinstalled  skip installing already installed packages [default: FALSE]
-m --method METHOD  method to be used for downloading files [default: auto]
-h --help           show this help text
-x --usage          show help and short example usage"
opt <- docopt(doc)			# docopt parsing

if (opt$usage) {
    cat(doc, "\n\n")
    cat("where PACKAGES... can be one or more CRAN package names, or local (binary or source)
package files (where extensions .tar.gz, .tgz and .zip are recognised). Optional
arguments understood by R CMD INSTALL can be passed interspersed in the PACKAGES, though
this requires use of '--'.

Examples:
  install2.r -l /tmp/lib Rcpp BH                    # install into given library
  install2.r -- --with-keep.source drat             # keep the source
  install2.r -- --data-compress=bzip2 stringdist    # prefer bz2 compression
  install2.r \".\"                                  # install package in current directory
  install2.r -n 6 ggplot2                           # parallel install: (6 processes)

install2.r is part of littler which brings 'r' to the command-line.
See http://dirk.eddelbuettel.com/code/littler.html for more information.\n")
    q("no")
}

if (opt$deps == "TRUE" || opt$deps == "FALSE") {
    opt$deps <- as.logical(opt$deps)
} else if (opt$deps == "NA") {
    opt$deps <- NA
}

## docopt results are characters, so if we meant NULL we have to set NULL
if (length(opt$repos) == 1 && "NULL" %in% opt$repos) {
    opt$repos <- NULL
}

if ("getOption" %in% opt$repos) {
    ## as littler can now read ~/.littler.r and/or /etc/littler.r we can preset elsewhere
    opt$repos <- c(opt$repos[which(opt$repos != "getOption")], getOption("repos"))
}

if (opt$ncpus == "getOption") {
    opt$ncpus <- getOption("Ncpus", 1L)
} else if (opt$ncpus == "-1") {
    ## parallel comes with R 2.14+
    opt$ncpus <- max(1L, parallel::detectCores())
}

## ensure installation is stripped
Sys.setenv("_R_SHLIB_STRIP_"="true")

install_packages2 <- function(pkgs, ..., error = FALSE, skipmissing = FALSE, skipinstalled = FALSE) {
    e <- NULL
    capture <- function(e) {
        if (error) {
            catch <-
                grepl("download of package .* failed", e$message) ||
                (grepl("(dependenc|package).*(is|are) not available", e$message) && !skipmissing) ||
                grepl("installation of package.*had non-zero exit status", e$message) ||
                grepl("installation of one or more packages failed", e$message)
            if (catch) {
                e <<- e
            }
        }
    }
    if (skipinstalled) {
        pkgs <- setdiff(pkgs, installed.packages()[,1])
    }
    if (length(pkgs) > 0) {
        withCallingHandlers(install.packages(pkgs, ...), warning = capture)
        if (!is.null(e)) {
            stop(e$message, call. = FALSE)
        }
    }
}

## helper function to for existing files with matching extension
isMatchingFile <- function(f) (file.exists(f) && grepl("(\\.tar\\.gz|\\.tgz|\\.zip)$", f)) || (f == ".")

## helper function which switches to local (ie NULL) repo if matching file is presented
installArg <- function(f, lib, rep, dep, iopts, error, skipmissing, skipinstalled, ncpus, method) {
    install_packages2(pkgs=f,
                      lib=lib,
                      repos=if (isMatchingFile(f)) NULL else rep,
                      dependencies=dep,
                      INSTALL_opts=iopts,
                      Ncpus = ncpus,
                      method = method,
                      error = error,
                      skipmissing = skipmissing,
                      skipinstalled = skipinstalled)
}

## strip out arguments to be passed to R CMD INSTALL
isArg <- grepl('^--',opt$PACKAGES)
installOpts <- opt$PACKAGES[isArg]
opt$PACKAGES <- opt$PACKAGES[!isArg]

if (length(opt$PACKAGES)==0 && file.exists("DESCRIPTION") && file.exists("NAMESPACE")) {
    ## we are in a source directory, so build it
    message("* installing *source* package found in current working directory ...")
    opt$PACKAGES <- "."
}

## helper function to for existing files with matching extension
isMatchingFile <-
    function(f) (file.exists(f) &&
                 grepl("(\\.tar\\.gz|\\.tgz|\\.zip)$", f)) || (f == ".")

## check arguments for local files -- if none, then we can pass vector on
isLocal <- sapply(opt$PACKAGES, isMatchingFile)

## for any local sources loop explicitly as before, otherwise for remote
## packages pass vector to install_packages2 which does the rest (and
## possibly in parallel using up to ncpus)
if (any(isLocal)) {
    sapply(opt$PACKAGES, installArg, opt$libloc, opt$repos, opt$deps,
           installOpts, opt$error, opt$skipmissing, opt$skipinstalled, opt$ncpus, opt$method)
} else {
    install_packages2(pkgs = opt$PACKAGES,
                      lib = opt$libloc,
                      repos = opt$repos,
                      dependencies = opt$deps,
                      INSTALL_opts = installOpts,
                      Ncpus = opt$ncpus,
                      method = opt$method,
                      error = opt$error,
                      skipmissing = opt$skipmissing,
                      skipinstalled = opt$skipinstalled)
}

## clean up any temp file containing CRAN directory information
sapply(list.files(path=tempdir(), pattern="^(repos|libloc).*\\.rds$", full.names=TRUE), unlink)
