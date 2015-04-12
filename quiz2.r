require(sqldf)
acs = read.csv('ss06pid.csv')
# sqldf("select * from acs where AGEP < 50 and pwgtp1")
# sqldf("select pwgtp1 from acs where AGEP < 50")
# sqldf("select pwgtp1 from acs")
# sqldf("select * from acs where AGEP < 50") 

require(XML)
URL <- 'http://biostat.jhsph.edu/~jleek/contact.html'
# doc <- htmlTreeParse('http://biostat.jhsph.edu/~jleek/contact.html', useInternalNodes=T)
con = url(URL)
html = readLines(con)
close(con)
sapply(html[c(10, 20, 30, 100)], nchar)

###
data = read.fwf('wksst8110.for', skip=4, widths=c(12, 7,4, 9,4, 9,4, 9,4))
sum(data$V4)
