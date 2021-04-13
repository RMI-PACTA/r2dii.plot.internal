#' @import ggplot2
#' @importFrom dplyr select mutate ungroup summarise group_by filter arrange
#' @importFrom dplyr distinct desc if_else right_join lead left_join case_when
#' @importFrom dplyr pull
#' @importFrom stats na.omit
#' @importFrom maps iso.alpha
#' @importFrom ggpubr ggarrange annotate_figure text_grob get_legend
#' @importFrom grDevices colorRampPalette
#' @importFrom tidyr replace_na
NULL

utils::globalVariables("where")
