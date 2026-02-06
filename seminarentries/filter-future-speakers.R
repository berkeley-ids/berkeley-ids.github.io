# Code from claude.ai, need to fix it to actually work.
# Within _quarto.yml would add
# project:
#   type: website
# pre-render: filter-future-speakers.R  

# Get all speaker .qmd files
speaker_files <- list.files("seminarentries/Current", pattern = "\\.qmd$", full.names = TRUE,recursive=TRUE)


# Get today's date
today <- Sys.Date()

# Check each file
for (file in speaker_files) {
  # Read the file
  lines <- readLines(file, warn = FALSE)
  
  # Extract date from YAML (simple approach)
  date_line <- grep("^date:", lines, value = TRUE)
  
  if (length(date_line) > 0) {
    # Extract the date value
    date_str <- sub("^date:\\s*", "", date_line)
    # remove quotes
    date_str <- gsub("'","",date_str)
    talk_date <- as.Date(date_str)
    
    # If date is in the past, move to archive or delete
    if (talk_date < today) {
      basefolder<-sub("/index.qmd","",file)
      strippedbasefolder<-sub("seminarentries/Current/","",basefolder)
      newpath<-file.path("seminarentries/Past",strippedbasefolder)
      print(sprintf("Moving %s to %s folder",basefolder,newpath))
      
      # # Option A: Move to archive folder
      # archive_dir <- "seminarentries/Past"
      # if (!dir.exists(archive_dir)) dir.create(archive_dir, recursive = TRUE)
      # file.rename(file, file.path(archive_dir, basename(file)))
      if (dir.exists(newpath)) {
        print(sprintf("Error: folder %s for this speaker already exists",newpath))
      }
      else{
        # Copy the entire folder
        if (!dir.exists(newpath)) dir.create(newpath, recursive = TRUE)
        files_to_copy <- list.files(basefolder, full.names = TRUE)
        file.copy(files_to_copy, newpath, recursive = TRUE)
        # Then delete the original
        unlink(basefolder, recursive = TRUE)
      }
      
      
      
    }
  }
}