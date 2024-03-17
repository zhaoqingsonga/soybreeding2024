# Hello, world!
#   http://r-pkgs.had.co.nz/
combination <- function(ma=c("冀豆12","冀豆17"),
                        pa=c("中联豆6001","中联豆6024","中联豆6033")
                        ) {
  all_combinations <- expand.grid(ma, pa)
  all_combinations <-paste(all_combinations$Var1,all_combinations$Var2,sep="/")
  return( all_combinations)
}
library(stringr)
#
find_combination<-function(name_f="冀豆12",com=c("冀豆12/nf58","冀豆17/中联豆6001","五星1/冀豆12","皖豆35/中联豆6001")){
  re<-com[str_detect(com,name_f)]
  if(length(re>0)){return(re)} else{return(NA)}
}

add_combination<-function(pre=c("jd17/001"),ma=c("sdf"),pa=c("dff")){
  return(c(pre,combination(ma,pa)))
}

ID_prefix<-function(){
  onlyID<-format(Sys.time(), "%Y%m%d%H%M%S")
  return(onlyID)
}
#
ID_suffix<-function(n1=1,n2=99999){
  id1<-paste("0000",1:9,sep="")
  id2<-paste("000",10:99,sep="")
  id3<-paste("00",100:999,sep="")
  id4<-paste("0",1000:9999,sep="")
  id5<-10000:99999
  alln<-c(id1,id2,id3,id4,id5)
  if(is.numeric(n1)&is.numeric(n2)&n2>=n1&n1>=1&n2<=99999)
  {re_v<-alln[n1:n2]
    return(re_v)}else{
    return(NA)
  }
}

ID_suffix3<-function(n1=1,n2=999){
  id1<-paste("00",1:9,sep="")
  id2<-paste("0",10:99,sep="")
  id3<-100:999
  alln<-c(id1,id2,id3)
  if(is.numeric(n1)&is.numeric(n2)&n2>=n1&n1>=1&n2<=999)
  {re_v<-alln[n1:n2]
  return(re_v)}else{
    return(NA)
  }
}


#paste(ID_prefix(),ID_suffix(1,9),sep="")
#获得电脑nodename
get_computer_nodename<-function(){
  return(Sys.info()["nodename"])
}

#获得prefix_linename
get_prefix_linename<-function(prefix="ZJ",n1=1,n2=10){
  re_v<-paste(prefix,ID_suffix3(n1,n2),sep="")
  return(re_v)
}








