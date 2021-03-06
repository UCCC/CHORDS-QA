#' @title ICD10CM
#'
#' @description This table contains the CCS Medical Diagnosis for ICD9 from https://www.cms.gov/medicare/icd-10/2021-icd-10-cm
#'
#' @format a \code{data.frame} with 3 variables
#' \describe{
#'   \item{dxCode}{(chr) CHORDS version of code to combine ICD version with code }
#'   \item{Code}{(chr) }
#'   \item{Description}{(chr) }
#'}
#' @rdname datasets
#' @source ICD10CM.rda
"ICD10CM"
#' @title ICD9CM
#'
#' @description This table contains the CCS Medical Diagnosis for ICD9 from https://www.cms.gov/Medicare/Coding/ICD9ProviderDiagnosticCodes/codes
#'
#' @format a \code{data.frame} with 3 variables
#' \describe{
#'   \item{dxCode}{(chr) CHORDS version of code to combine ICD version with code }
#'   \item{Code}{(chr) }
#'   \item{Description}{(chr) }
#'}
#' @rdname datasets
#' @source ICD9CM.rda
"ICD9CM"
#'   \item{X.CCSR.CATEGORY.3.DESCRIPTION.}{(chr) Indicates diagnosis was present at time of admission.}#' @title ccsSDxI9
#'
#' @description This table contains the CCS Medical Diagnosis for ICD 9 from 19jun17.
#'
#' @format a \code{data.frame} with 7 variables
#' \describe{
#'   \item{dxCode}{(chr) Diagnosis code}
#'   \item{ccs}{(num) Indicates diagnosis was present at time of admission.}
#'   \item{ccsCat}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{dxDesc}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{optCat}{(int) Indicates diagnosis was present at time of admission.}
#'   \item{optDesc}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{dxCdTp}{(chr) Indicates diagnosis was present at time of admission.}
#'}
#' @rdname datasets
#' @source ccsSDxI9.Rda
"ccsSDxI9"
#' @title isoLang
#'
#' @description This table contains the CCS Medical Diagnosis for ICD 9 from 19jun17.
#'
#' @format a \code{data.frame} with 5 variables
#' \describe{
#'   \item{code3B}{(chr) Diagnosis code}
#'   \item{code3T}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{cod2}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{InEnglish}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{InFrench}{(chr) Indicates diagnosis was present at time of admission.}
#'}
#' @rdname datasets
#' @source isoLang.Rda
"isoLang"
#' @title prov_type
#'
#' @description This table contains the categories and complete title for provider types from the \code{PROVIDER_SPECIALTY} table.
#'
#' @format a \code{data.frame} with 2 variables
#' \describe{
#'   \item{Provider_Type}{(int) Provider category (from CHORDS_VDW_V3.4_DataModelManual)}
#'   \item{Description}{(chr) Provider type description.}
#'}
#' @rdname datasets
#' @source prov_type.rda
"prov_type"
#' @title Provider Specialties
#'
#' @description This table contains the categories and complete title for provider specialties from the \code{PROVIDER_SPECIALTY} table.
#'
#' @format a \code{data.frame} with 2 variables
#' \describe{
#'   \item{SPECIALTY}{(int) Provider specialty category (from CHORDS_VDW_V3.1_DataModelManual)}
#'   \item{Description}{(chr) Provider specialty description.}
#'}
#' @rdname datasets
#' @source specialties.rda
"specialties"
#' @title stateCnty
#'
#' @description This table contains the CCS Medical Diagnosis for ICD 9 from 19jun17.
#'
#' @format a \code{data.frame} with 7 variables
#' \describe{
#'   \item{state}{(chr) Diagnosis code}
#'   \item{stateFP}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{countyFP}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{countyName}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{ClassFP}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{stateCnty}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{stCntyNm}{(chr) Indicates diagnosis was present at time of admission.}
#'}
#' @rdname datasets
#' @source stateCnty.Rda
"stateCnty"
#' @title valSets
#'
#' @description This table contains the CCS Medical Diagnosis for ICD 9 from 19jun17.
#'
#' @format a \code{data.frame} with 4 variables
#' \describe{
#'   \item{tableName}{(chr) Diagnosis code}
#'   \item{columnName}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{code}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{decode}{(chr) Indicates diagnosis was present at time of admission.}
#'}
#' @rdname datasets
#' @source valSets.Rda
"valSets"
NULL
