pump = read.table('ss06hid.csv', sep=',', header=T)
strsplit(names(pump), "wgtp")[[123]]

require(tidyr)
require(dplyr)
gdp = read.csv('GDP.csv', skip=5,header=FALSE)[1:190,]
ed = read.csv('EDSTATS_Country.csv')
gdp$V5 = extract_numeric(as.character(gdp$V5))
mean(gdp$V5)

grep("^United", gdp$V4)

mm = merge(x=gdp, y=ed, by.x='V1', by.y='CountryCode', all=F)
notes = mm$Special.Notes
length(notes[grep("end: June", notes)])

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
library(lubridate)
length(which(year(sampleTimes)=='2012'))
length(which(year(sampleTimes)=='2012' & weekdays(sampleTimes)== 'Monday'))
