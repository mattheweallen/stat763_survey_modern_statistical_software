library(tidyverse)
?'"'
str_c(c("x", "y", "z"), collapse = ", ")
str_c(c("x", "y", "z"), sep = ", ")

x <- c("a","b","c","d")
y <- c("e","f","g","h")
str_c(x,y,collapse = ", ")
str_c(x,y,sep = ", ")

x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 1) <- str_to_lower(str_sub(x, 1, 1))
x


z <- c("1","2",NA)
paste(x,z)
str_c(x,z)

l <- "hexzyo"

str_sub(l,str_length(l)/2 + 1,str_length(l)/2 + 1)

thanks_path <- file.path(R.home("doc"), "THANKS")
thanks <- str_c(readLines(thanks_path), collapse = "\n")
thanks <- word(thanks, 1, 3, fixed("\n\n"))
cat(str_wrap(thanks), "\n")
cat(str_wrap(thanks, width = 40), "\n")
cat(str_wrap(thanks, width = 60, indent = 2), "\n")
cat(str_wrap(thanks, width = 60, exdent = 2), "\n")
cat(str_wrap(thanks, width = 0, exdent = 2), "\n")


str_trim("  String with trailing and leading white space\t")
str_trim("\n\nString with trailing and leading white space\n\n")

str_squish("  String with trailing,  middle, and leading white space\t")
str_squish("\n\nString with excess,  trailing and leading white   space\n\n")

x[1]


test <- c("a", "b", "c")
test[length(test)]

and_strings <- function(strings) {
  if(length(strings) == 0) {
    return(NA)
  } else if(length(strings) == 1) {
    return(strings[1])
  } else if(length(strings) == 2) {
    return(str_c(strings,collapse = " and "))
  } else {
    return(str_c(str_c(strings[1:length(strings) - 1], collapse = ", "), strings[length(strings)], sep= ", and "))
  }
}
and_strings((test))


str_c("Letter: ", letters)
str_c("Letter", letters, sep = ": ")
str_c(letters, " is for", "...")
str_c(letters[-26], " comes before ", letters[-1])

str_c(letters, collapse = "")
str_c(letters, collapse = ", ")

# Missing inputs give missing outputs
str_c(c("a", NA, "b"), "-d")
# Use str_replace_NA to display literal NAs:
str_c(str_replace_na(c("a", NA, "b")), "-d")


letters


str_c(letters, letters, sep=",")


str_c(letters, letters, collapse=",")
str_c(letters, collapse=",")

