# Code for course on "R for Data Science" postconference PSSOH 2018 course used for the course for master students
# at the University of Belgrade - School of Electrical Engineering in 2020 and forked from PSSOH github profile.

# version:
# platform       x86_64-w64-mingw32          
# arch           x86_64                      
# os             mingw32                     
# system         x86_64, mingw32             
# status                                     
# major          3                           
# minor          4.3                         
# year           2017                        
# month          11                          
# day            30                          
# svn rev        73796                       
# language       R                           
# version.string R version 3.4.3 (2017-11-30)


# introductory code -------------------------------------------------------
print("Cao svima!")
64894 - 103722 # R as calculator

# let's install some packages
#install.packages("readODS")
#install.packages("ggplot2")
#install.packages("dplyr")
library(readODS)
library(ggplot2)
library(dplyr)

# how to use help
?library

# let's code
x <- 5
x # implicit print
print(x) # explicit print

x <- 1:10
x
print(x)
# Additional assignment: What is in x if you repeat x <- 5 at this line?

# create arrays
c(0.5, 1.2, 0.8, 0.9)
x <- c(0.5, 1.2, 0.8, 0.9)
x
sum(x)
0.5 + 1.2 + 0.8 + 0.9

# missing values
merenja <- c(1, 0.9, NA, 0.95, 1.01)
is.na(merenja)
merenja2 <- c(NaN, 0.9, NA, 0.95, 1.01)
is.na(merenja2)
is.nan(merenja2)


# data frame
ispitanici <- data.frame(godine = c(28, 27, 29, 30), pol = 
                           factor(c('M', 'M', 'F', 'M')))
print(ispitanici)


# subsetting data
niz <- c("a", "s", "o", "c", "i", "j", "a", "c", "i", "j", "a")
niz
niz[1]
niz[2]
niz[5]
niz[50]
niz[4:7]
niz[c(1, 4, 7)]
logIndeks <- niz > "a"
niz[logIndeks]
niz[niz > "c"]

ispitanici$godine
ispitanici$pol


# set working directory in order to read files
# setwd("C:/Users/Sample User/Desktop/")
# read your data
dat <- read.csv("sleepstudy.csv")
dim(dat)

head(dat)
tail(dat)

unique(dat$Days)
unique(dat$Subject)

length(unique(dat$Days))
length(unique(dat$Subject))


# apply dplyr -------------------------------------------------------------
tail(select(dat, Days:Subject))
tail(select(dat, -(Days:Subject)))
tail(select(dat, Reaction, Subject))

?filter
?subset

datf <- filter(dat, Reaction > 350)
head(datf)

datf1 <- filter(dat, Reaction > 350 & Reaction < 400)
head(datf1)

datNew <- arrange(dat, Days)
head(dat, 4L) # L stands for integer
head(datNew, 4)
tail(datNew, 4)

datNew1 <- arrange(dat, desc(Days))
tail(datNew1, 3)


datNew2 <- rename(dat, Num = X)
head(dat, 4)
head(datNew2, 4)


View(dat)


# read the second sheet and show simple plots ------------------------------
dat1 <- read_ods("textbooksETFeng.ods", sheet = 2, col_names = TRUE, col_types = NULL,
                 na = "", skip = 0, formula_as_formula = FALSE, range = NULL) 
head(dat1)

# bar graphs
ggplot(dat1, aes(year)) +
  geom_bar()

ggplot(dat1, aes(year)) +
  geom_bar() +
  ggtitle("Number of textbooks per year") +
  coord_flip() 

ggplot(dat1, aes(year)) +
  geom_bar() +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top") +
  scale_y_discrete(name = "count", 
                   limits = c("1", "2", "3", "4", "5",
                              "6", "7", "8", "9", "10")) +
  scale_x_discrete(name ="year", 
                   limits = c(2010, 2011, 2012, 2013,
                              2014, 2015, 2016, 2017,
                              2018))

ggsave("OERgrowth.tiff", units = "in",
       width = 6, height = 4, dpi = 400)

help.search("geom_", package = "ggplot2")

ggplot(dat1, aes(year, fill = `application of free software`)) +
  geom_bar(width = 0.9) +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top")  +
  scale_y_discrete(name = "count", 
                   limits = c("1", "2", "3", "4", "5",
                              "6", "7", "8", "9", "10")) +
  scale_x_discrete(name = "year", 
                   limits = c(2010, 2011, 2012, 2013,
                              2014, 2015, 2016, 2017,
                              2018))

ggplot(dat1, aes(year, fill = `application of free software`)) +
  geom_bar(width = 0.9) +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top")  +
  scale_y_discrete(name = "count", 
                   limits = c("1", "2", "3", "4", "5",
                              "6", "7", "8", "9", "10")) +
  scale_x_discrete(name = "year", 
                   limits = c(2010, 2011, 2012, 2013,
                              2014, 2015, 2016, 2017,
                              2018)) +
  scale_fill_brewer(palette = "Accent")


ggplot(dat1, aes(year, fill = licence)) +
  geom_bar(width = 0.9) +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top") +
  scale_y_discrete(name ="count", 
                   limits=c("1", "2", "3", "4", "5",
                            "6", "7", "8", "9", "10")) +
  scale_x_discrete(name ="year", 
                   limits=c(2010, 2011, 2012, 2013,
                            2014, 2015, 2016, 2017,
                            2018)) +
  scale_fill_brewer(palette = "BrBG")


ggsave("licence.tiff", units = "in", width = 6, height = 4, 
       dpi = 400)
