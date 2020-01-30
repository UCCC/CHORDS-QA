#' Run code to generate priority tables.
#'
#' @param priority A character vector.  This is the priority table for which you want to generate the report. Options are "P1", "P2", or "P3".
#' @param dbserver A string vector.  The name of the database server name. This is selected via an html window.
#' @param dbname A string vector.  The name of the database.  This is selected via an html window.
#' @param dbuser A string vector. The username that is used to connect to the database. Should be an empty string for windows authentication
#' @param dbpassword A string vector.  The password used to connect to the database.  Should be an empty string for windows authentication
#' @param outputdir A string vector.  The directory for the output document.  If none is specified, default is \code{C:/Users/<username>/Documents}
#' @param batchmode A boolean value.  Parameter to help determine if the code is being run via batch mode or requires the UI for input parameters
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

run_report <- function(priority, dbserver = NULL, dbname = NULL, dbuser = NULL, dbpassword = NULL, outputdir = NULL, batchmode = FALSE, dbport = NULL) {
  if(is.null(dbuser)){
    dbuser = ""
  }
  if(is.null(dbpassword)){
    dbpassword = ""
  }
  if(is.null(dbport)){
    dbport = ""
  }

  if (is.null(outputdir) || outputdir == ''){
	  outputdir <- paste0("C:/Users/", Sys.info()["login"], "/Documents")
  }
  if (priority == "P1"){
	  if (!is.null(batchmode) && batchmode == TRUE){
		  rmarkdown::render(input = system.file("rmd/P1.Rmd", package = "chordsTables"),
		                    params = list(
		                        DBServerName = dbserver,
		                      DBName = dbname,
		                      DBUser = dbuser,
		                      DBPassword = dbpassword,
		                      DBPort = dbport
		                      ),
		                    output_dir = outputdir)
	  } else{
		  rmarkdown::render(input = system.file("rmd/P1.Rmd", package = "chordsTables"), params = "ask", output_dir = outputdir)
	  }
  }
  else if (priority == "P2"){
	  if (!is.null(batchmode) && batchmode == TRUE){
		  rmarkdown::render(input = system.file("rmd/P2.Rmd", package = "chordsTables"),
		                    params = list(
		                      DBServerName = dbserver,
		                      DBName = dbname,
		                      DBUser = dbuser,
		                      DBPassword = dbpassword,
		                      DBPort = dbport
		                    ),
		                    output_dir = outputdir)
	  } else {
		  rmarkdown::render(input = system.file("rmd/P2.Rmd", package = "chordsTables"), params = "ask", output_dir = outputdir)
	  }
  }
  else if (priority == "P3"){
    if (!is.null(batchmode) && batchmode == TRUE){
		  rmarkdown::render(input = system.file("rmd/P3.Rmd", package = "chordsTables"),
		                    params = list(
		                      DBServerName = dbserver,
		                      DBName = dbname,
		                      DBUser = dbuser,
		                      DBPassword = dbpassword,
		                      DBPort = dbport
		                    ),
		                    output_dir = outputdir)
	  } else {
		  rmarkdown::render(input = system.file("rmd/P3.Rmd", package = "chordsTables"), params = "ask", output_dir = outputdir)
	  }
  }
  else if (!(priority %in% c("P1", "P2", "P3"))){
    warning(paste("Priority table ",
                  priority,
                  "is not a vaild argument.  Acceptable arguments are P1, P2, or P3.  Be sure to include parentheses around your argument."))
  }

}
