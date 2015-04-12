pump = read.table('ss06hid.csv', sep=',', header=T)
# VAL contains values of houses. A value of 24 indicates
# houses cost more than $1,000,000
t = table(pump$VAL)
print(paste("Number of house worth more than $1,000,000:", t['24']))

###
require(xlsx)
dat = read.xlsx(file='DATA.gov_NGAP.xlsx',sheetIndex=1, startRow=18, endRow=23)[,7:15]
sum(dat$Zip*dat$Ext,na.rm=T)

###
require(XML)
doc <- xmlTreeParse('restaurants.xml', useInternal=T)
rootnode = xmlRoot(doc)
print(table(xpathSApply(rootnode,'//zipcode',xmlValue))['21231'])
###
require(data.table)
DT = fread('ss06pid.csv', header=T, sep=',')
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})

