#' Taxon Names
#'
#' @export
#' @param no_leaves (boolean) filter by names having no descendants
#' @param term (string) filter by name
#' @param exact (boolean) filter by exact match on name
#' @param nomenclature_group (string) filter by nomenclature group
#' @param parent_id (integer) filter by parent id
#' @param type (string) filter by taxon name type (e.g., Protonym, Combination, Hybrid)
#' @param valid (boolean) filter by taxon names that are valid
#' @template args
#' @return list
#' @examples
#' \dontrun{
#' tw_taxon_names(name="Lycorma delicatula", valid=TRUE)
#' }
tw_taxon_names_autocomplete <- function(parent_id = NULL,
                                        no_leaves = NULL,
                                        term = NULL,
                                        exact = NULL,
                                        nomenclature_group = NULL,
                                        type = NULL,
                                        valid = NULL,
                                        csv = FALSE, token = NULL, project_token = NULL,
                                        page = 0, per = 50, ...) {
  
  assert(page, c("numeric", "integer"))
  assert(per, c("numeric", "integer"))

  args <- cc(list( 
    term = term, 
    exact = exact, 
    nomenclature_group = nomenclature_group, 
    parent_id = parent_id, 
    type = type, 
    type_metadata = type_metadata, 
    valid = valid, 
    token = token, project_token = project_token, page = page, per = per))

  res <- tw_GET(api_base_url(), "/taxon_names/autocomplete", query = args, csv = csv, ...)
  return(res)
}


#' Taxon Names
#'
#' @rdname tw_taxon_names_autocomplete
#' @export
tw_tn_a <- tw_taxon_names_autocomplete