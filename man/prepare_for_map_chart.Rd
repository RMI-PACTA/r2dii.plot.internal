% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_processing.R
\name{prepare_for_map_chart}
\alias{prepare_for_map_chart}
\title{Prepares results data per asset type for map plot}
\usage{
prepare_for_map_chart(
  data_map_asset_type,
  asset_type,
  technology_filter,
  year_filter,
  value_divisor = 1,
  allocation_method = NULL
)
}
\arguments{
\item{data_map_asset_type}{Dataframe in the shape of
"Equity/Bonds_results_map.rda" dataset from PACTA analysis output in
"40_Results" folder (dataframe).}

\item{asset_type}{Asset type of the data used to specify default allocation
method (character string).}

\item{technology_filter}{Technology to be used for filtering (character
string).}

\item{year_filter}{Year to be used for filtering (integer).}

\item{value_divisor}{Number by which to divide the values to be plotted
(integer).}

\item{allocation_method}{Allocation method used to calculate the production
values. If none is specified "portfolio_weight" is used for Bonds and
"ownership_weight" is used for Equity.}
}
\value{
Dataframe with columns (only important columns are listed): long,
lat, group, value, unit, abbreviation_divisor.
}
\description{
Prepares results data per asset type for map plot
}
\examples{
# TODO
}
