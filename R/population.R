get_population<-function(mydata=my_comb){
  my_pop<-subset(mydata,mydata$next_stage==101)
  name<-paste(mydata$name,"F",(mydata$f+1),sep="")
  QTID<-get_prefix_linename(prefix="QT24",n1=1,n2=length(name))
  user<-get_computer_nodename()
  id<-get_ID(1,length(name))
  re_v<-data.frame(
    id=id,
    user=rep(user,length(name)),
    qtid=QTID,
    name=name
  )
  re_v$mapa=mydata$mapa
  re_v$stage<-101
  re_v$next_stage<-101
  re_v$f<-mydata$f+1
  re_v$sele<-2
  re_v$process<-paste(mydata$process,"/",id,sep="")
  return(re_v)
}
