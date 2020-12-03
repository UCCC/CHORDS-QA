#' Run code to generate priority tables.
#' @param priority A character vector.  This is the priority table for which you want to generate the report. Options are "P1", "P2", or "P3".
#' @param dbserver A string vector.  The name of the database server name. This is selected via an html window.
#' @param dbname A string vector.  The name of the database.  This is selected via an html window.
#' @param dbuser A string vector. The username that is used to connect to the database. Should be an empty string for windows authentication
#' @param dbpassword A string vector.  The password used to connect to the database.  Should be an empty string for windows authentication
#' @param outputdir A string vector.  The directory for the output document.  If none is specified, default is \code{C:/Users/<username>/Documents}
#' @param batchmode A boolean value.  Parameter to help determine if the code is being run via batch mode or requires the UI for input parameters
#' @param dbport A string value.  Optional parameter to specify the server port to use.
#' @param dbencrypt A string value.  Parameter to establish if the encryption configurations should be added to the connection string.
#' @param ... Extra arguments.
#' @return Creates a word document generated from an .Rmd file. The file is located in \code{C:/Users/<username>/Documents} folder (the My Documents folder for the user who generated the report) and the name of the file is the value of the priority argument (e.g., P1.docx)
#' @examples
#' \dontrun{
#' run_report("P1")
#' }
#' @import dplyr
#' @import tidyr
#' @import ggplot2
#' @import rmarkdown
#' @import RODBC
#' @importFrom R.utils withTimeout
#' @importFrom utils read.csv2
#' @import knitr
#' @import shiny
#' @import flextable
#' @import officer
#' @rdname run_report
#' @export

run_report <- function(priority, dbserver = NULL, dbname = NULL, dbuser = NULL, dbpassword = NULL, outputdir = NULL, batchmode = FALSE, dbport = NULL, dbencrypt = NULL, ...) {
  time_id <- format(Sys.time(), "%Y%m%d_%H%M")
  if(is.null(dbuser)){
    dbuser <- ""
  }
  if(is.null(dbpassword)){
    dbpassword <- ""
  }
  if(is.null(dbport)){
    dbport <- ""
  }
  if(is.null(dbencrypt)){
    dbencrypt = ""
  }
  if (is.null(outputdir) || outputdir == ''){
    assign("outputdir", value = paste0("C:/Users/", Sys.info()["login"], "/Documents"), envir = .GlobalEnv)
    outputdir <- get("outputdir", envir = .GlobalEnv)
  }
  else{
    assign("outputdir", value = outputdir, envir = .GlobalEnv)
  }
  if (priority == "P1"){
    if (!is.null(batchmode) && batchmode == TRUE){
      rmarkdown::render(input = system.file("rmd/P1.Rmd", package = "chordsTables"),
                        params = list(
                          DBServerName = dbserver,
                          DBName = dbname,
                          DBUser = dbuser,
                          DBPassword = dbpassword,
                          DBPort = dbport,
                          DBEncrypt = dbencrypt
                        ),
                        output_dir = outputdir, output_file = paste0(priority,"_",time_id,".docx", sep=""))
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
                          DBPort = dbport,
                          DBEncrypt = dbencrypt
                        ),
                        output_dir = outputdir, output_file = paste(priority,"_",time_id,".docx", sep=""))
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
                          DBPort = dbport,
                          DBEncrypt = dbencrypt
                        ),
                        output_dir = outputdir, output_file = paste0(priority,"_",time_id,".docx", sep=""))
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

#' Get Connection String Functions
#' @name run_report
#' @param params R Shiny params object
#' @examples
#' \dontrun{
#' getConnectionString(params)
#' }
#' @rdname run_report
#' @export

getConnectionString <- function(params){
  if (notNAorNullorEmpty(params$DBUser)) {
    connectionString <- paste('driver={SQL Server};server=',params$DBServerName,ifelse(notNAorNullorEmpty(params$DBPort), paste(",",params$DBPort, sep=""), ""),';database=',params$DBName, ";Connection Timeout=2000", sep="")

  }else{
    connectionString <- paste('driver={SQL Server};uid=',params$DBUser,';pwd=',params$DBPassword,';server=',params$DBServerName, ifelse(notNAorNullorEmpty(params$DBPort), paste(",",params$DBPort, sep=""), ""),';database=',params$DBName, ";Connection Timeout=2000",sep="")
  }

  if (params$DBEncrypt == "TRUE" ||params$DBEncrypt == TRUE){
    connectionString <- paste(connectionString, ";Encrypt=True;TrustServerCertificate=False;")
  }
  return(connectionString)
}

#' Runs a query with RODBC sqlQuery.  Takes a connections string and exectues a query
#'
#' @param Connection_String A string vector. A pre-formated connection string to a database
#' @param query_text A string vector.  A pre-formated query to execute
#' @examples
#' \dontrun{
#' run_db_query(Connection_String, query_text)
#' }
#' @import RODBC
#' @importFrom R.utils withTimeout
#' @rdname run_report
#' @export

run_db_query <- function(Connection_String, query_text, ...) {
  tryCatch(
    {
      #ifelse(exists("as.is"),as.is <- as.is, as.is <- FALSE)
      db_conn <- get_new_connection(Connection_String)
      result <- R.utils::withTimeout(sqlQuery(channel = db_conn, query = query_text, ...), timeout = 2100)
      return(result)
    },
    error = function(cond){
      stop(cond)
      return(NA)
    },
    finally = {
      close_conection(db_conn)
    }
  )
}

#' opens a new connection to a database with a supplied connection string.
#'
#' @param Connection_String A string vector. A pre-formated connection string to a database
#' @examples
#' \dontrun{
#' get_new_connection(Connection_String)
#' }
#' @import RODBC
#' @rdname run_report
#' @export

get_new_connection <- function(Connection_String){
  tryCatch(
    {
      db_conn <- RODBC::odbcDriverConnect(connection = Connection_String, believeNRows = FALSE, rows_at_time = 1)
      return(db_conn)
    },
    error = function(cond){
      stop(cond)
      return(NA)
    }
  )
}

#' Closes an open RODBC database connection
#'
#' @param db_conn Closes a RODBC Open Connection
#' @examples
#' \dontrun{
#' close_conection(db_conn)
#' }
#' @import RODBC
#' @rdname run_report
#' @export

close_conection <- function(db_conn){
  try({
    RODBC::odbcClose(db_conn)
  })
}

#' Sets the table names to be used in QA quereis.  Replaces any table names with those
#' in CHORDS_TableNames VDW table or tablereplace.csv from the working directory.
#'
#' @param ConnectionString A preformated connection string
#' @examples
#' \dontrun{
#' runTableReplacements(ConnectionString)
#' }
#' @import RODBC
#' @rdname run_report
#' @export

runTableReplacements <- function(ConnectionString) {

  dfChordsTbls <- run_db_query(ConnectionString, "
                               IF EXISTS
                               (
                               SELECT
                               *
                               FROM  SYSOBJECTS
                               WHERE XTYPE = 'U' AND
                               NAME = 'CHORDS_TableNames'
                               )
                               BEGIN
                               SELECT
                               [ORG_NAME],
                               [NEW_NAME]
                               FROM[CHORDS_TABLENAMES];
                               END; ")
  if (!is.null(dfChordsTbls) & !(length(dfChordsTbls)==0) & exists("outputdir")){
    tableReplaceFile <-  paste0(get("outputdir", envir = .GlobalEnv), "\\tablereplace.csv")
    if (file.exists(tableReplaceFile)){
      print("updating for QA using tablereplace.csv")
      dfChordsTbls <- read.csv2(tableReplaceFile, header = TRUE, sep = ",", stringsAsFactors=FALSE)
    }
  }
  if (!is.null(dfChordsTbls) & !(length(dfChordsTbls)==0)) {
    assign("demographics", value = ifelse("demographics" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("demographics"), tolower(dfChordsTbls$ORG_NAME))], "demographics"), envir = .GlobalEnv)
    assign("encounters", value = ifelse("encounters" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("encounters"), tolower(dfChordsTbls$ORG_NAME))], "encounters"), envir = .GlobalEnv)
    assign("census_location", value = ifelse("census_location" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("census_location"), tolower(dfChordsTbls$ORG_NAME))], "census_location"), envir = .GlobalEnv)
    assign("diagnoses", value = ifelse("diagnoses" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("diagnoses"), tolower(dfChordsTbls$ORG_NAME))], "diagnoses"), envir = .GlobalEnv)
    assign("vital_signs", value = ifelse("vital_signs" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("vital_signs"), tolower(dfChordsTbls$ORG_NAME))], "vital_signs"), envir = .GlobalEnv)
    assign("lab_results", value = ifelse("lab_results" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("lab_results"), tolower(dfChordsTbls$ORG_NAME))], "lab_results"), envir = .GlobalEnv)
    assign("procedures", value = ifelse("procedures" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("procedures"), tolower(dfChordsTbls$ORG_NAME))], "procedures"), envir = .GlobalEnv)
    assign("benefit", value = ifelse("benefit" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("benefit"), tolower(dfChordsTbls$ORG_NAME))], "benefit"), envir = .GlobalEnv)
    assign("linkage", value = ifelse("linkage" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("linkage"), tolower(dfChordsTbls$ORG_NAME))], "linkage"), envir = .GlobalEnv)
    assign("social_history", value = ifelse("social_history" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("social_history"), tolower(dfChordsTbls$ORG_NAME))], "social_history"), envir = .GlobalEnv)
    assign("provider_specialty", value = ifelse("provider_specialty" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("provider_specialty"), tolower(dfChordsTbls$ORG_NAME))], "provider_specialty"), envir = .GlobalEnv)
    assign("pro_surveys", value = ifelse("pro_surveys" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("pro_surveys"), tolower(dfChordsTbls$ORG_NAME))], "pro_surveys"), envir = .GlobalEnv)
    assign("pro_questions", value = ifelse("pro_questions" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("pro_questions"), tolower(dfChordsTbls$ORG_NAME))], "pro_questions"), envir = .GlobalEnv)
    assign("pro_responses", value = ifelse("pro_responses" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("pro_responses"), tolower(dfChordsTbls$ORG_NAME))], "pro_responses"), envir = .GlobalEnv)
    assign("death", value = ifelse("death" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("death"), tolower(dfChordsTbls$ORG_NAME))], "death"), envir = .GlobalEnv)
    assign("pharmacy", value = ifelse("pharmacy" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("pharmacy"), tolower(dfChordsTbls$ORG_NAME))], "pharmacy"), envir = .GlobalEnv)
    assign("prescribing", value = ifelse("prescribing" %in% tolower(dfChordsTbls$ORG_NAME),  dfChordsTbls$NEW_NAME[match(tolower("prescribing"), tolower(dfChordsTbls$ORG_NAME))], "prescribing"), envir = .GlobalEnv)

  } else {
    # Names of database tables
    assign("demographics", value = "demographics", envir = .GlobalEnv)
    assign("encounters", value = "encounters", envir = .GlobalEnv)
    assign("census_location", value = "census_location", envir = .GlobalEnv)
    assign("diagnoses", value = "diagnoses", envir = .GlobalEnv)
    assign("vital_signs", value = "vital_signs", envir = .GlobalEnv)
    assign("lab_results", value = "lab_results", envir = .GlobalEnv)
    assign("procedures", value = "procedures", envir = .GlobalEnv)
    assign("benefit", value = "benefit", envir = .GlobalEnv)
    assign("linkage", value = "linkage", envir = .GlobalEnv)
    assign("social_history", value = "social_history", envir = .GlobalEnv)
    assign("provider_specialty", value = "provider_specialty", envir = .GlobalEnv)
    assign("pro_surveys", value = "pro_surveys", envir = .GlobalEnv)
    assign("pro_questions", value = "pro_questions", envir = .GlobalEnv)
    assign("pro_responses", value = "pro_responses", envir = .GlobalEnv)
    assign("death", value = "death", envir = .GlobalEnv)
    assign("pharmacy", value = "pharmacy", envir = .GlobalEnv)
    assign("prescribing", value = "prescribing", envir = .GlobalEnv)
  }

}

#' Returns a vector with the column numbers of character variables in the data frame
#'
#' @param df A dataframe
#' @examples
#' \dontrun{
#' charVars(df)
#' }
#' @rdname run_report
#' @export

charVars <- function(df) grep('^ch',sapply(df,class))

#' trims all character variables in a dataframe, sets blank to NA
#'
#' @param df A dataframe
#' @examples
#' \dontrun{
#' charVars(df)
#' }
#' @rdname run_report
#' @export

trimChrVars <- function(df){
  for(i in charVars(df)){
    df[,i] <- gsub('\\s+$','',df[,i])
    df[,i] <- ifelse(nchar(df[,i])==0,NA,df[,i])
  }
  df
}

#' age category calculator
#'
#' @param age An integer value
#' @examples
#' \dontrun{
#' ageCatCalc(age)
#' }
#' @export
#' @rdname run_report

ageCatCalc <- function(age){
  ageCat <- factor(
    ifelse(is.na(age)==TRUE, 0,
           ifelse(age<0              , 1,
                  ifelse(age>=0 & age<2, 2,
                         ifelse(age>=2 & age<5, 3,
                                ifelse(age>=5 & age<10, 4,
                                       ifelse (age>=10 & age<15, 5,
                                               ifelse(age>=15 & age<19, 6,
                                                      ifelse(age>=19 & age<22, 7,
                                                             ifelse(age>=22 & age<45, 8,
                                                                    ifelse(age>=45 & age<65, 9,
                                                                           ifelse(age>=65 & age<75, 10,
                                                                                  ifelse(age>=75 & age<90, 11,
                                                                                         ifelse(age>=90 , 12, 13)))))) ))))))),
    levels=0:13,
    labels=c('Missing','Negative','0-1','2-4','5-9','10-14','15-18','19-21','22-44','45-64','65-74','75-89','90+','Other')
  )

  return(ageCat)
}

#' Variable Not NA or Null or Empty
#'
#' @param variable A variable
#' @examples
#' \dontrun{
#' notNAorNullorEmpty(variable)
#' }
#' @export
#' @rdname run_report
notNAorNullorEmpty <- function(variable){
  if (!is.null(variable) && !is.na(variable) && length(variable) > 0 && variable != ""){
    return (T)
  }
  else{
    return (F)
  }
}
