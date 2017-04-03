section = function(title) {
  if (!knitr:::is_latex_output()) {
    return(paste("class: center, middle\n",
                 "#", title, "\n\n"))
  } else {
    return(paste("#", title, "\n\n"))
  }
}
