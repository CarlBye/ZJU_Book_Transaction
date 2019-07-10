# ZJU_Book_Transaction
二手书交易网站

 

## 部署方案

**部署环境**

操作系统：Linux系统

JDK：1.8.0以上

数据库：mysql8.0.16以上

Web服务器：Tomcat9.0以上

**部署操作**

1. 将bookMarket\out\artifacts\bookMarket下的war包移到tomcat路径下的webapps目录下，tomcat会自动解压war包
2. 建立“book_market”数据库并执行sql文件
3. 通过浏览器使用“ip：port/war包名称”的方式访问