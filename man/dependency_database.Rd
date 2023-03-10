\name{dependency_database}
\alias{dependency_database}
\title{
Database of package dependency heaviness of all R packages
}
\description{
Database of package dependency heaviness of all R packages
}
\usage{
dependency_database(version = pkgndep_opt$heaviness_db_version)
}
\arguments{

  \item{version}{Version of the heaviness database. See \code{\link{pkgndep_opt}}$heaviness_db_version.}

}
\examples{
if(interactive()) {
    dependency_database()
}
}
