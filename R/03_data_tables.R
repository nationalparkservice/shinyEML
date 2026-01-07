tableUploadUI <- function(id) {
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

tableUploadServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    table_metadata <- reactive({
      req(input$upload)
      
      # wrangle table metadata from file upload
      new_files <- input$upload %>%
        dplyr::select(file_name = name,
                      size,
                      file_loc = datapath) %>%
        dplyr::mutate(size_mb = round(size/1024),
                      table_name = NA,
                      description = NA) %>%
        dplyr::select(file_name, table_name, description, size_mb, file_loc)
    })
    return(table_metadata)
  })
}



