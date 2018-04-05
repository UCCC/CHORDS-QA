#' Run code to generate priority tables.
#'
#' @param priority A character vector.  This is the priority table for which you want to generate the report. Options are "P1", "P2", or "P3".
#' @param dbserver A string vector.  The name of the database server name. This is selected via an html window and contains the following options \code{cc-s-d05.ucdenver.pvt}, \code{vwphbisql06}, \code{ihrsql1.ihr.or.kp.org}, \code{PRDVDWSQL01}, \code{SQL01}, and \code{BI01}
#' @param dbname A string vector.  The name of the database.  This is selected via an html window and contains the following options \code{VDW_3_1_DH}, \code{VDW.dbo}, \code{VDW}, \code{CHORDS_VDW_CC_3.1}, \code{CHORDS_VDW_CT_3.1}, \code{CHORDS_VDW_HP_3.1}, \code{CHORDS_VDW_MC_3.1}, \code{CHORDS_VDW_SC_3.1}, \code{CHORDS_VDW_SS_3.1}, \code{CHORDSlive.dbo} and \code{vwedwtstsql04}
#' @return Creates a word document generated from an .Rmd file. The file is located in \code{C:/Users/<username>/Documents} folder (the My Documents folder for the user who generated the report) and the name of the file is the value of the priority argument (e.g., P1.docx)
#' @examples
#' \dontrun{
#' run_report("P1")
#' }
#' @import tidyverse
#' @import rmarkdown
#' @import RODBC
#' @import odbc
#' @import knitr
#' @import DBI
#' @import shiny
#' @import httr
#' @export

run_report <- function(priority, dbserver, dbname) {
  if (priority == "P1"){
    rmarkdown::render(input = system.file("rmd/P1.Rmd", package = "chordsTables"), params = "ask", output_dir = paste0("C:/Users/", Sys.info()["login"], "/Documents"))
  }
  else if (priority == "P2"){
    rmarkdown::render(input = system.file("rmd/P2.Rmd", package = "chordsTables"), params = "ask", output_dir = paste0("C:/Users/", Sys.info()["login"], "/Documents"))
  }
  else if (priority == "P3"){
    rmarkdown::render(input = system.file("rmd/P3.Rmd", package = "chordsTables"), params = "ask", output_dir = paste0("C:/Users/", Sys.info()["login"], "/Documents"))
  }
  else if (!(priority %in% c("P1", "P2", "P3"))){
    warning(paste("Priority table ",
                  priority,
                  "is not a vaild argument.  Acceptable arguments are P1, P2, or P3.  Be sure to include parentheses around your argument."))
  }

}
