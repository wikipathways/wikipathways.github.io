# adapt this loop to make systematic changes to all mds of a type


# all author md files
author.mds <- list.files("../_authors",".md")
for(a in author.mds){
  ffp = file.path("../_authors",a)
  # read
  con = file(ffp, "r")
  md = yaml::read_yaml(con)
  close.connection(con)
  # update options
  username = unlist(md["username"])
  field = "redirect_from"
  ## A. Update an existing field
  # newval = "NEW VALUE HERE"
  # oldval = unname(unlist(md[field]))
  # if(!is.null(oldval))
  #   if (oldval==newval)
  #     next
  # cat(sprintf("`%s` field updated in %s\n", field, ffp))
  # md[field] = newval
  ## B. Insert new field
  md[field] = list(list(paste0("/index.php/User:",username),
                   paste0("/index.php/Special:Contributions/",username)))
  #write
  con = file(ffp, "w")
  write("---", con)
  yaml::write_yaml(md,con)
  write("---", con)
  close.connection(con)
}
