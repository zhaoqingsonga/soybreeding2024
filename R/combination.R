#   http://r-pkgs.had.co.nz/
combination <- function(ma = c("冀豆12", "冀豆17"),
                        pa = c("中联豆6001", "中联豆6024", "中联豆6033"),
                        memo = NA) {
  all_combinations <- expand.grid(ma, pa)
  names(all_combinations) <- c("ma", "pa")
  all_combinations$mapa <-
    paste(all_combinations$ma, all_combinations$pa, sep = "/")
  all_combinations$memo = memo
  return(all_combinations)
}


ID_prefix <- function() {
  onlyID <- format(Sys.time(), "%Y%m%d%H%M%S")
  return(onlyID)
}
#
ID_suffix5 <- function(n1 = 1, n2 = 99999) {
  id1 <- paste("0000", 1:9, sep = "")
  id2 <- paste("000", 10:99, sep = "")
  id3 <- paste("00", 100:999, sep = "")
  id4 <- paste("0", 1000:9999, sep = "")
  id5 <- 10000:99999
  alln <- c(id1, id2, id3, id4, id5)
  if (is.numeric(n1) & is.numeric(n2) & n2 >= n1 & n1 >= 1 &
      n2 <= 99999)
  {
    re_v <- alln[n1:n2]
    return(re_v)
  } else{
    return(NA)
  }
}
#
ID_suffix4 <- function(n1 = 1, n2 = 9999) {
  id1 <- paste("000", 1:9, sep = "")
  id2 <- paste("00", 10:99, sep = "")
  id3 <- paste("0", 100:999, sep = "")
  id4 <- 1000:9999
  alln <- c(id1, id2, id3, id4)
  if (is.numeric(n1) & is.numeric(n2) & n2 >= n1 & n1 >= 1 & n2 <= 9999)
  {
    re_v <- alln[n1:n2]
    return(re_v)
  } else{
    return(NA)
  }
}

get_ID <- function(n1 = 1, n2 = 6) {
  my_id_prefix <- ID_prefix()
  my_id_sufix <- ID_suffix5(n1, n2)
  re_v <- paste(my_id_prefix, my_id_sufix, sep = "")
  return(re_v)
}

ID_suffix3 <- function(n1 = 1, n2 = 999) {
  id1 <- paste("00", 1:9, sep = "")
  id2 <- paste("0", 10:99, sep = "")
  id3 <- 100:999
  alln <- c(id1, id2, id3)
  if (is.numeric(n1) & is.numeric(n2) & n2 >= n1 & n1 >= 1 & n2 <= 999)
  {
    re_v <- alln[n1:n2]
    return(re_v)
  } else{
    return(NA)
  }
}




#paste(ID_prefix(),ID_suffix(1,9),sep="")
#获得电脑nodename
get_computer_nodename <- function() {
  return(Sys.info()["nodename"])
}

#获得prefix_linename
get_prefix_linename <- function(prefix = "ZJ",
                                n1 = 1,
                                n2 = 6,
                                digits = 3) {
  if (digits == 3) {
    re_v <- paste(prefix, ID_suffix3(n1, n2), sep = "")
  }
  else if (digits == 4) {
    re_v <- paste(prefix, ID_suffix4(n1, n2), sep = "")
  }
  else{
    re_v <- paste(prefix, ID_suffix3(n1, n2), sep = "")
  }
  return(re_v)
}
#添加名称


# get_combination_list<-function(
    #     mylist=list(
#     com1=list(ma=c("冀豆12","冀豆17"),
#               pa=c("中联豆6001","中联豆6024","中联豆6033"),
#               memo="high protein"),
#     com2=list(ma=c("冀豆15","冀豆20"),
#               pa=c("中联豆6001","中联豆6024","中联豆6033")
#               )
#     ),
#     prefix="ZJ",
#     startN=1,
#     only=FALSE
# ){
#   mapa<-data.frame()
#   for(i in 1:length(mylist)){
#    if(length(mylist[[i]]$memo)==0) {
#      mapa<-rbind(mapa,combination(mylist[[i]]$ma,mylist[[i]]$pa))
#      }
#     else{
#       mapa<-rbind(mapa,combination(mylist[[i]]$ma,mylist[[i]]$pa,mylist[[i]]$memo))
#         }
#     }
#
#   if(only){mapa<-mapa[!duplicated(mapa$mapa),]}
#   my_len<-length(mapa$mapa)
#   user<-get_computer_nodename()
#   name<-get_prefix_linename(prefix=prefix,n1=startN,n2=my_len+startN-1)
#   id<-get_ID(1,my_len)
#   f<-rep(0,my_len)
#   re_v<-data.frame(
#     id=id,
#     user=rep(user,my_len),
#     name=name,
#     f=f
#   )
#   re_v<-cbind(re_v,mapa)
#   re_v$stage<-"杂交"
#   re_v$next_stage<-"群体"
#   re_v$process<-id
#   re_v$path<-re_v$name
#   return(re_v)
# }

get_combination <- function(ma = c("JD12", "JD17"),
                            pa = c("ZJD6001", "ZJD6024"),
                            memo = NA,
                            prefix = "ZJ",
                            startN = 1)
{
  mapa <- combination(ma, pa)
  mapa$memo = memo
  my_len <- length(mapa$mapa)
  user <- get_computer_nodename()
  stageid <-
    get_prefix_linename(prefix = prefix,
                        n1 = startN,
                        n2 = my_len + startN - 1)
  name <- paste(stageid, "F0", sep = "")

  id <- get_ID(1, my_len)
  f <- rep(0, my_len)
  re_v <- data.frame(
    id = id,
    user = rep(user, my_len),
    stageid = stageid,
    name = name,
    f = f
  )
  re_v <- cbind(re_v, mapa)
  re_v$stage <- "杂交"
  re_v$next_stage <- "群体"
  re_v$process <- id
  re_v$path <- re_v$stageid
  return(re_v)
}
##
combi_bind <- function(...,
                       prefix = "ZJ",
                       only = TRUE,
                       order = FALSE) {
  # 在函数内部，你可以通过...来访问不定参数
  arg <- list(...)
  rev <- do.call(rbind, arg)
  if (only)
    rev <- rev[!duplicated(rev$mapa), ]
  if (order) {
    rev <- rev[order(rev$mapa), ]
  }
  rev$name <- get_prefix_linename(prefix, n2 = nrow(rev))
  return(rev)
}

# my_combi <- get_combination(prefix = "ZJ24")
#
