library(r2dii.plot.internal)

results_folder <- "/Users/monikafurdyna/Dropbox (2° Investing)/PortCheck_v2/10_Projects"
investor_run <- "/austria_p2020_investor_0912"
data_total_portfolio <- readRDS(paste0(results_folder, investor_run, "/30_Processed_Inputs", investor_run, "_total_portfolio.rda"))

data_security_type <- prepare_for_metareport_security_type_chart(data_total_portfolio)

bars_labels_specs <- data.frame(
  "investor_name" = c("pensionfund", "Meta Investor", "insurance", "bank", "assetmanager"),
  "label" = c("Pension Funds", "Meta Investor", "Insurance", "Banks", "Asset Managers")
)

bars_asset_type_specs <- data.frame(
  "asset_type" = c("Equity", "Bonds", "Others"),
  "label" = c("Equity", "Bonds", "Others"),
  "r2dii_colour_name" = c("dark_blue", "moss_green", "grey")
)

p <- plot_metareport_security_types(data_security_type)
p

p2 <- plot_metareport_security_types(data_security_type, bars_asset_type_specs, bars_labels_specs)
p2

data_overview <- readRDS(paste0(results_folder, investor_run, "/30_Processed_Inputs", investor_run, "_overview_portfolio.rda"))

data_climate_relevant <- prepare_for_pacta_sectors_chart(data_overview)

bars_labels_climate_rel <- data.frame(
  "investor_name" = c("pensionfund","insurance", "bank", "assetmanager"),
  "label" = c("Pension Funds", "Insurance", "Banks", "Asset Managers")
)

plot <- plot_metareport_pacta_sectors(data = data_climate_relevant, bars_labels_specs = bars_labels_climate_rel,
                                          plot_title = "Percentage of Asset type Portfolios invested in PACTA sectors")
plot

data_sectors_mix <- prepare_for_metareport_pacta_sectors_mix_chart(data_overview = data_overview)

bars_labels_specs <- data.frame(
  "investor_name" = c("Meta Investor", "pensionfund","insurance", "bank", "assetmanager"),
  "label" = c("All Investors", "Pension Funds","Insurance", "Banks", "Asset Managers")
)

p <- plot_metareport_pacta_sectors_mix(data_sectors_mix, bars_labels_specs = bars_labels_specs)
p

data_equity <- readRDS(paste0(results_folder, investor_run, "/40_Results/Equity_results_portfolio.rda"))

investor_labels <- data.frame(
  "investor_name" = c("assetmanager","bank","insurance","pensionfund"),
  "label" = c("Asset Managers","Banks","Insurance","Pension funds")
)

data_distr_br_port <- prepare_for_metareport_distribution_chart(data_equity,
                                                      sectors_filter = "Power",
                                                      technologies_filter = c("CoalCap","OilCap","GasCap"),
                                                      year_filter = 2020,
                                                      value_to_plot =
                                                        "plan_carsten")

p_br <- plot_metareport_distribution(data_distr_br_port, plot_title = "Percentage of a portfolio invested in brown technologies in the Power sector - Listed Equity",
                                  x_title = "Participants",
                                  y_title = "",
                                  investor_labels = investor_labels)
p_br

data_distr_gr_prod <- prepare_for_metareport_distribution_chart(data_equity,
                                                      sectors_filter = "Power",
                                                      technologies_filter = c("RenewablesCap", "HydroCap"),
                                                      year_filter = 2020,
                                                      value_to_plot =
                                                        "plan_tech_share")

p_gr <- plot_metareport_distribution(data_distr_gr_prod, plot_title = "Percentage share of a low carbon power production - Listed Equity",
                                  x_title = "Participants",
                                  y_title = "",
                                  investor_labels = investor_labels)
p_gr

data_bubble <- prepare_for_metareport_bubble_chart(data_equity,
                                                asset_type = "Equity",
                                                start_year = 2020,
                                                technologies_filter = c("RenewablesCap"),
                                                scenario_filter = "WEO2019_SDS",
                                                scenario_geography_filter = "GlobalAggregate")

p <- plot_metareport_bubble(data_bubble,
                            plot_title = "Listed Equity",
                            x_title = "Current share of renewable energy capacity",
                            y_title = "Planned build-out as % of build-out required by SDS",
                            investor_labels = investor_labels,
                            colour_investors = TRUE
                            )
p

peergroup_run<-"/austria_p2020_peergroup_0912"

library(dplyr)

data_map_eq <- readRDS(paste0(results_folder, peergroup_run, "/40_Results/Meta Investor/Equity_results_map.rda"))

data_map_eq_chart <- prepare_for_map_chart(data_map_eq,
                                  asset_type = "Equity",
                                  technology_filter = "Oil",
                                  year_filter = 2020,
                                  value_divisor = 10^6)

legend_unit <- data_map_eq_chart %>%
  filter(!is.na(unit)) %>%
  pull(unit) %>%
  unique()

legend_divisor <- data_map_eq_chart %>%
  filter(!is.na(abbreviation_divisor)) %>%
  pull(abbreviation_divisor) %>%
  unique()

legend_title <- paste(legend_divisor, legend_unit, sep = " ")

p <- plot_metareport_map(data_map_eq_chart,
                         plot_title = "Geographical distribution of physical assets - Oil Production, Equity",
                         legend_title = legend_title,
                         sector = "Oil&Gas")
p
