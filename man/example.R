#use
#devtools::install_github("zhaoqingsonga/soybreeding2024",force=TRUE)
library(soybreeding2024)

com1<-get_combination(ma=c("沧豆4号","邯豆16","冀豆32","冀豆33"),
                      pa=c("中联豆6888","中联豆6024","中联豆6033"),
                      memo="高油")

com2<-get_combination(c("冀豆2","冀豆17"),
                      c("中联豆6001","中联豆6024","中联豆6033"),
                      "转基因")
com3<-get_combination(c("冀豆2","冀豆17"),
                      c("中联豆6001","中联豆6024","中联豆6033"),
                      "转基因")


mycombi<-combi_bind(com1,com2,com3,prefix="ZJ24")
mycombi



library(openxlsx)
wb<-createWorkbook()
addWorksheet(wb,"combination")
writeData(wb,"combination",mycombi)
openXL(wb)



