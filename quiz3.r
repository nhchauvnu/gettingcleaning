pump = read.table('ss06hid.csv', sep=',', header=T)
agricultureLogical = (pump$ACR == 3) & (pump$AGS == 6)
which(agricultureLogical)[1:3]

jp = readJPEG('jeff.jpg', native=TRUE)
quantile(jp, .3)
quantile(jp, .8)

require(tidyr)
require(dplyr)
gdp = read.csv('GDP.csv', skip=5,header=FALSE)[1:190,]
ed = read.csv('EDSTATS_Country.csv')
# names(ed)[3] = "income"
gdp$V2 = extract_numeric(as.character(gdp$V2))
gdp$V5 = extract_numeric(as.character(gdp$V5))
mm = merge(x=gdp, y=ed, by.x='V1', by.y='CountryCode', all=F)
mm1 = arrange(mm, desc(V2))
print("Match: ")
print(length(mm[,1]))
print(paste("Country:", mm1$Short.Name[13]))

# Average GDP
print(mean(mm1$V2[mm1$Income.Group=="High income: OECD"]))
print(mean(mm1$V2[mm1$Income.Group=="High income: nonOECD"]))

mm2 = arrange(mm, desc(V5))
lower = mm1$V1[mm1$Income.Group=="Lower middle income"]
highest38 = mm2$V1[1:38]
print(length(intersect(lower, highest38)))
