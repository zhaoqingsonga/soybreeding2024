#use
#devtools::install_github("zhaoqingsonga/soybreeding2024",force=TRUE)
library(soybreeding2024)
library(openxlsx)
get_combination_list(
  list(
    list(ma=c("冀豆1","冀豆2"),
         pa=c("中联豆6001","中联豆6024","中联豆6033")),#第一组
    list(ma=c("冀豆3","冀豆4"),
         pa=c("中联豆6001","中联豆6024","中联豆6033")),#第二组
    list(ma=c("冀豆5","冀豆6"),
         pa=c("中联豆6001","中联豆6024","中联豆6033")),#第三组
    list(ma=c("冀豆2","冀豆1"),
         pa=c("中联豆6001","中联豆6024","中联豆6033"))),#第四组， 以此类推
  prefix="ZJ24",#前缀
  startN = 1,
  only=FALSE#是否去除重复的组合
)
#
write.xlsx(com24_1,"E:\\FangCloudSync\\★大豆试验设计及总结\\2024年试验设计及总结\\24杂交组合1.xlsx")


