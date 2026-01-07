# showModal(
#   modalDialog(
#     title = "WARNING: Duplicate Files",
#     easyClose = FALSE, 
#     p(glue::glue("You cannot upload multiple files with the same name. Ignoring the following duplicates: {toString(dups)}")),
#     footer = modalButton("Dismiss")
#   )
# )

tableMetadataUI <- function(id, tables) {
  layout_columns(
    card(
      card_header("Upload data tables"),
      fileInput(NS(id, "upload"),
                NULL,
                buttonLabel = "Add your .csv files",
                multiple = TRUE,
                accept = (".csv"), 
                width = "100%")
    ),
    card(
      card_header("Fill in table metadata"),
      helpText("Double-click inside the table to add table names and descriptions. Use ctrl+enter to save your edits."),
      DT::DTOutput(NS(id, "file_table"))
    ),
    col_widths = c(-2, 8, -2), fill = FALSE
  )
}