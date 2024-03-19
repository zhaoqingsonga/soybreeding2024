#use
#devtools::install_github("zhaoqingsonga/soybreeding2024",force=TRUE)
library(soybreeding2024)

mydata<-get_combination_list(
  list(
    list(ma=c("冀豆1","冀豆2"),pa=c("中联豆6001","中联豆6024","中联豆6033"),memo="中联豆6001蛋白含量23%"),#第一组
    list(ma=c("冀豆3","冀豆4"),pa=c("中联豆6001","中联豆6024","中联豆6033"), memo="高油"),#第二组
    list(ma=c("冀豆5","冀豆6"),pa=c("中联豆6001","中联豆6024","中联豆6033"), memo="高异黄酮"),  #第三组
    list(ma=c("冀豆2","冀豆19"),pa=c("中联豆6001","中联豆6024","中联豆6033"), memo="高产")  #第四组， 以此类推
    ),
  prefix="ZJ24",#前缀
  startN = 1,
  only=TRUE#是否去除重复的组合
)
mydata
library(openxlsx)
wb<-createWorkbook()
addWorksheet(wb,"combination")
writeData(wb,"combination",mydata)
openXL(wb)
