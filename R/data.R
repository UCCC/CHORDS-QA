#' @title ccsMDxI10
#'
#' @description This table contains the CCS Medical Diagnosis for ICD 10 from 5/29/2020.
#' Modified from CCSR for ICD-10-CM Diagnoses, v2020.3 - https://www.hcup-us.ahrq.gov/toolssoftware/ccsr/ccs_refined.jsp
#'
#' @format a \code{data.frame} with 17 variables
#' \describe{
#'   \item{X.ICD.10.CM.CODE.}{(chr) }
#'   \item{X.ICD.10.CM.CODE.DESCRIPTION.}{(chr) }
#'   \item{X.Default.CCSR.CATEGORY}{(chr) }
#'   \item{X.CCSR.CATEGORY.1.}{(chr) }
#'   \item{X.CCSR.CATEGORY.1.DESCRIPTION.}{(chr))}
#'   \item{X.CCSR.CATEGORY.2.}{(chr) }
#'   \item{X.CCSR.CATEGORY.2.DESCRIPTION.}{(num) }
#'   \item{X.CCSR.CATEGORY.3.}{(chr) }
#'   \item{X.CCSR.CATEGORY.3.DESCRIPTION.}{(chr) }
#'   \item{X.CCSR.CATEGORY.4.}{(chr) }
#'   \item{X.CCSR.CATEGORY.4.DESCRIPTION.}{(chr) }
#'   \item{X.CCSR.CATEGORY.5.}{(chr) }
#'   \item{X.CCSR.CATEGORY.5.DESCRIPTION.}{(chr) }
#'   \item{dxCdTp}{(chr) CHORDS version of diagnosis code }
#'   \item{dxDesc}{(chr) CHORDS version of diagnosis description }
#'   \item{dxCatDesc}{(chr) CHORDS version of categroy description }
#'}
#' @rdname datasets
#' @source ccsMDxI10.Rda
"ccsMDxI10"
#' @title ccsMDxI9
#'
#' @description This table contains the CCS Medical Diagnosis for ICD 9 from 19jun17.
#'
#' @format a \code{data.frame} with 10 variables
#' \describe{
#'   \item{dxCode}{(chr) Diagnosis code}
#'   \item{ccsm1}{(num) Indicates diagnosis was present at time of admission.}
#'   \item{ccsm1Name}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{ccsm2}{(num) Indicates diagnosis was present at time of admission.}
#'   \item{ccsm2Name}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{ccsm2}{(num) Indicates diagnosis was present at time of admission.}
#'   \item{ccsm2Name}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{ccsm2}{(num) Indicates diagnosis was present at time of admission.}
#'   \item{ccsm2Name}{(chr) Indicates diagnosis was present at time of admission.}
#'   \item{dxCdTp}{(chr) Indicates diagnosis was present at time of admission.}
#'}
#' @rdname datasets
#' @source ccsMDxI9.Rda
"ccsMDxI9"
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
#'   \item{V1}{(int) Provider category (from CHORDS_VDW_V3.1_DataModelManual)}
#'   \item{V2}{(chr) Provider type description.}
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
