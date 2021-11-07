
# == title
# Load all package dependency statistics
#
# == details
# It loads the package dependency analysis for all CRAN/Biocondutor packages done on 2021-10-28.
#
# == value
# A data frame of various columns.
#
# == example
# df = load_pkg_stat_snapshot()
# head(df)
load_pkg_stat_snapshot = function() {
	if(is.null(env$pkg_stat_snapshot)) {
		if(identical(topenv(), .GlobalEnv)) {
			df = readRDS("~/project/development/pkgndep/inst/extdata/pkg_stat_snapshot.rds")
		} else {
			df = readRDS(system.file("extdata", "pkg_stat_snapshot.rds", package = "pkgndep"))
		}
		env$pkg_stat_snapshot = df
	}
	invisible(env$pkg_stat_snapshot)
}


# == title
# Load all package dependency data
#
# == details
# It loads the package dependency analysis for all CRAN/Biocondutor packages done on 2021-10-28.
#
# == value
# A list of ``pkgndep`` objects where each element corresponds to the analysis on one package.
#
# == example
# lt = load_all_pkg_dep()
# length(lt)
# head(names(lt))
# lt[["ggplot2"]]
load_all_pkg_dep = function() {
	if(is.null(env$all_pkg_dep)) {
		if(identical(topenv(), .GlobalEnv)) {
			env$all_pkg_dep = readRDS("~/project/development/pkgndep/inst/extdata/all_pkgs.rds")
		} else {
			env$all_pkg_dep = readRDS(system.file("extdata", "all_pkgs.rds", package = "pkgndep"))
		}
		env$all_pkg_dep = hash::hash(names(env$all_pkg_dep), env$all_pkg_dep)
	}
	invisible(invisible(env$all_pkg_dep))
}



# == title
# Load package database
#
# == param
# -lib Local library path. If the value is ``NA``, only remote package database is used.
# -snapshot Internally used. If it is ``TRUE``, the package database generated on 2021-10-28 is used.
# -verbose Whetehr to print messages.
#
# == details
# It loads the package database from CRAN/Bioconductor and locally installed packages.
#
# The database object internaly is cached for repeated use of other functions in this package.
#
# == value
# A ``pkg_db`` class object.
#
# == example
# pkg_db = load_pkg_db(lib = NA)
# pkg_db
load_pkg_db = function(lib = NULL, snapshot = FALSE, verbose = TRUE) {
	if(snapshot) {
		if(is.null(env$pkg_db_snapshot)) {
			if(identical(topenv(), .GlobalEnv)) {
				env$pkg_db_snapshot = readRDS("~/project/development/pkgndep/inst/extdata/pkg_db_snapshot.rds")
			} else {
				env$pkg_db_snapshot = readRDS(system.file("extdata", "pkg_db_snapshot.rds", package = "pkgndep"))
			}
		}
		invisible(env$pkg_db_snapshot)
	} else {
		if(is.null(env$pkg_db)) {
			env$pkg_db = prepare_db(lib = lib, verbose = verbose)
		}
		invisible(env$pkg_db)
	}
}