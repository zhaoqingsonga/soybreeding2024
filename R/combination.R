# Hello, world!
#   http://r-pkgs.had.co.nz/
combination <- function(ma=c("冀豆12","冀豆17"),
                        pa=c("中联豆6001","中联豆6024","中联豆6033")
                        ) {
  all_combinations <- expand.grid(ma, pa)
  all_combinations <-paste(all_combinations$Var1,all_combinations$Var2,sep="/")
  return( all_combinations)
}

