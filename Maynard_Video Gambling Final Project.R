# IS470 Business Intelligence and Big Data 
# Final Project - Video Gambling
library(plyr)
library(dplyr)
library(ggplot2)

# import each year of video gambling data (2012 - 2019)
VGRevenueReport_2012 <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2012.csv", header = FALSE)
VGRevenueReport_2013 <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2013.csv", header = FALSE)
VGRevenueReport_2014 <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2014.csv", header = FALSE)
VGRevenueReport_2015 <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2015.csv", header = FALSE)
VGRevenueReport_2016 <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2016.csv", header = FALSE)
VGRevenueReport_2017 <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2017.csv", header = FALSE)
VGRevenueReport_2018 <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2018.csv", header = FALSE)
VGRevenueReport_2019 <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2019.csv", header = FALSE)

# delete top 3 rows of each dataframe (top 3 rows contain data that is not relevant to the task)
VGRevenueReport_2012 <- VGRevenueReport_2012[-c(1,2,3),]
VGRevenueReport_2013 <- VGRevenueReport_2013[-c(1,2,3),]
VGRevenueReport_2014 <- VGRevenueReport_2014[-c(1,2,3),]
VGRevenueReport_2015 <- VGRevenueReport_2015[-c(1,2,3),]
VGRevenueReport_2016 <- VGRevenueReport_2016[-c(1,2,3),]
VGRevenueReport_2017 <- VGRevenueReport_2017[-c(1,2,3),]
VGRevenueReport_2018 <- VGRevenueReport_2018[-c(1,2,3),]
VGRevenueReport_2019 <- VGRevenueReport_2019[-c(1,2,3),]

# name each column
VGRevenueReport_2012 <- sapply(VGRevenueReport_2012, as.character)
colnames(VGRevenueReport_2012) <- VGRevenueReport_2012[1,]
VGRevenueReport_2012 <- VGRevenueReport_2012[-c(1),]
VGRevenueReport_2013 <- sapply(VGRevenueReport_2013, as.character)
colnames(VGRevenueReport_2013) <- VGRevenueReport_2013[1,]
VGRevenueReport_2013 <- VGRevenueReport_2013[-c(1),]
VGRevenueReport_2014 <- sapply(VGRevenueReport_2014, as.character)
colnames(VGRevenueReport_2014) <- VGRevenueReport_2014[1,]
VGRevenueReport_2014 <- VGRevenueReport_2014[-c(1),]
VGRevenueReport_2015 <- sapply(VGRevenueReport_2015, as.character)
colnames(VGRevenueReport_2015) <- VGRevenueReport_2015[1,]
VGRevenueReport_2015 <- VGRevenueReport_2015[-c(1),]
VGRevenueReport_2016 <- sapply(VGRevenueReport_2016, as.character)
colnames(VGRevenueReport_2016) <- VGRevenueReport_2016[1,]
VGRevenueReport_2016 <- VGRevenueReport_2016[-c(1),]
VGRevenueReport_2017 <- sapply(VGRevenueReport_2017, as.character)
colnames(VGRevenueReport_2017) <- VGRevenueReport_2017[1,]
VGRevenueReport_2017 <- VGRevenueReport_2017[-c(1),]
VGRevenueReport_2018 <- sapply(VGRevenueReport_2018, as.character)
colnames(VGRevenueReport_2018) <- VGRevenueReport_2018[1,]
VGRevenueReport_2018 <- VGRevenueReport_2018[-c(1),]
VGRevenueReport_2019 <- sapply(VGRevenueReport_2019, as.character)
colnames(VGRevenueReport_2019) <- VGRevenueReport_2019[1,]
VGRevenueReport_2019 <- VGRevenueReport_2019[-c(1),]

# add Year column to each dataframe
Year = c(2012)
VGRevenueReport_2012 <- cbind(Year, VGRevenueReport_2012)
Year = c(2013)
VGRevenueReport_2013 <- cbind(Year, VGRevenueReport_2013)
Year = c(2014)
VGRevenueReport_2014 <- cbind(Year, VGRevenueReport_2014)
Year = c(2015)
VGRevenueReport_2015 <- cbind(Year, VGRevenueReport_2015)
Year = c(2016)
VGRevenueReport_2016 <- cbind(Year, VGRevenueReport_2016)
Year = c(2017)
VGRevenueReport_2017 <- cbind(Year, VGRevenueReport_2017)
Year = c(2018)
VGRevenueReport_2018 <- cbind(Year, VGRevenueReport_2018)
Year = c(2019)
VGRevenueReport_2019 <- cbind(Year, VGRevenueReport_2019)

# view each revenue report
View(VGRevenueReport_2012)
View(VGRevenueReport_2013)
View(VGRevenueReport_2014)
View(VGRevenueReport_2015)
View(VGRevenueReport_2016)
View(VGRevenueReport_2017)
View(VGRevenueReport_2018)
View(VGRevenueReport_2019)

# merge the dataframe for each year into one dataframe
RevenueReport <- merge(VGRevenueReport_2012, VGRevenueReport_2013, all=TRUE)
RevenueReport <- merge(RevenueReport, VGRevenueReport_2014, all=TRUE)
RevenueReport <- merge(RevenueReport, VGRevenueReport_2015, all=TRUE)
RevenueReport <- merge(RevenueReport, VGRevenueReport_2016, all=TRUE)
RevenueReport <- merge(RevenueReport, VGRevenueReport_2017, all=TRUE)
RevenueReport <- merge(RevenueReport, VGRevenueReport_2018, all=TRUE)
RevenueReport <- merge(RevenueReport, VGRevenueReport_2019, all=TRUE)
RevenueReport <- RevenueReport[-c(494,495),]                # delete last 2 rows (they were blank/contained unnecessary data)

# rename column names so there are no spaces in the names
colnames(RevenueReport)[4] <- "License_Number"
colnames(RevenueReport)[5] <- "VGT_Count"
colnames(RevenueReport)[6] <- "Amount_Played"
colnames(RevenueReport)[7] <- "Amount_Won"
colnames(RevenueReport)[8] <- "Net_Wager"
colnames(RevenueReport)[9] <- "Funds_In"
colnames(RevenueReport)[10] <- "Funds_Out"
colnames(RevenueReport)[11] <- "Net_Terminal_Income"
colnames(RevenueReport)[12] <- "NTI_Tax"
colnames(RevenueReport)[13] <- "State_Share"
colnames(RevenueReport)[14] <- "Municipality_Share"
RevenueReport <- RevenueReport[, -15]     # remove null column

# convert data types in RevenueReport
RevenueReport$License_Number <- as.numeric(as.character(RevenueReport$License_Number))
RevenueReport$VGT_Count <- as.numeric(as.character(RevenueReport$VGT_Count))
RevenueReport$Amount_Played <- as.numeric(as.character(RevenueReport$Amount_Played))
RevenueReport$Amount_Won <- as.numeric(as.character(RevenueReport$Amount_Won))
RevenueReport$Net_Wager <- as.numeric(as.character(RevenueReport$Net_Wager))
RevenueReport$Funds_In <- as.numeric(as.character(RevenueReport$Funds_In))
RevenueReport$Funds_Out <- as.numeric(as.character(RevenueReport$Funds_Out))
RevenueReport$Net_Terminal_Income <- as.numeric(as.character(RevenueReport$Net_Terminal_Income))
RevenueReport$NTI_Tax <- as.numeric(as.character(RevenueReport$NTI_Tax))
RevenueReport$State_Share <- as.numeric(as.character(RevenueReport$State_Share))
RevenueReport$Municipality_Share <- as.numeric(as.character(RevenueReport$Municipality_Share))
View(RevenueReport)

# write to .csv file so that I could share data with Jay
write.csv(RevenueReport, file = 'RevenueReport_Decatur.csv')




#--------------- Licensed Applicants Dataset Manipulation and Cleaning ---------------

# load data frame with licensed applicants
LicensedApplicants <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/LicensedApplicants.csv", header = FALSE)

# delete first row of LicensedApplicants dataframe
LicensedApplicants <- LicensedApplicants[-c(1),]

# name each column
LicensedApplicants <- sapply(LicensedApplicants, as.character)
colnames(LicensedApplicants) <- LicensedApplicants[1,]
LicensedApplicants <- LicensedApplicants[-c(1),]

# only want rows where city is Decatur
LicensedApplicants <- as.data.frame(LicensedApplicants)
LicensedApplicants <- LicensedApplicants[grep("Decatur", LicensedApplicants$City), ]
View(LicensedApplicants)

# LicensedApplicants datafile with addresses only and license numbers only. Write to a csv file
# so that it can be used to get Longitude and Latitudes for each address with GeoCodio.
LicensedApplicants_Address <- LicensedApplicants[c(3:8)]
write.csv(LicensedApplicants_Address, file = 'LicensedApplicants_Address.csv')
View(LicensedApplicants_Address)

# import Licensed Applicants data with Longitude and Latitude.
LicensedApplicants_LongLat <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/LicensedApplicants_LongLat.csv", header = TRUE)
names(LicensedApplicants_LongLat) <- c("License Number", "Address", "City", "State", "Zip", "County", "Latitude", "Longitude")
View(LicensedApplicants_LongLat)




#--------------- Heat Map Visualization ($ spent at each location) ---------------

# merge VGRevenueReport_2019 dataset and LicensedApplicants_LongLat dataset on License Number
RevenueReport_2019 <- merge(VGRevenueReport_2019, LicensedApplicants_LongLat, by=c("License Number"))

# rename column names so there are no spaces in the names
colnames(RevenueReport_2019)[1] <- "License_Number"
colnames(RevenueReport_2019)[5] <- "VGT_Count"
colnames(RevenueReport_2019)[6] <- "Amount_Played"
colnames(RevenueReport_2019)[7] <- "Amount_Won"
colnames(RevenueReport_2019)[8] <- "Net_Wager"
colnames(RevenueReport_2019)[9] <- "Funds_In"
colnames(RevenueReport_2019)[10] <- "Funds_Out"
colnames(RevenueReport_2019)[11] <- "Net_Terminal_Income"
colnames(RevenueReport_2019)[12] <- "NTI_Tax"
colnames(RevenueReport_2019)[13] <- "State_Share"
colnames(RevenueReport_2019)[14] <- "Municipality_Share"
RevenueReport_2019 <- RevenueReport_2019[, -15]     # remove null column
View(RevenueReport_2019)

# convert data types in RevenueReport
RevenueReport_2019$License_Number <- as.numeric(as.character(RevenueReport_2019$License_Number))
RevenueReport_2019$Amount_Played <- as.numeric(as.character(RevenueReport_2019$Amount_Played))

# Create new dataset for establishments where Amount_Played < 3 million dollars
RevenueReport_2019_Under3Mil <- RevenueReport_2019[RevenueReport_2019$Amount_Played <= 3000000, ]
RevenueReport_2019_Under3Mil$Rank <- NA
RevenueReport_2019_Under3Mil$Rank <- rank(RevenueReport_2019_Under3Mil$Amount_Played)
View(RevenueReport_2019_Under3Mil)

# Create new dataset for establishments where Amount_Played is between 3 and 6 million dollars
RevenueReport_2019_3to6Mil <- RevenueReport_2019[RevenueReport_2019$Amount_Played >= 3000000 & RevenueReport_2019$Amount_Played <= 6000000, ]
RevenueReport_2019_3to6Mil$Rank <- NA
RevenueReport_2019_3to6Mil$Rank <- rank(RevenueReport_2019_3to6Mil$Amount_Played)
View(RevenueReport_2019_3to6Mil)

# Create new dataset for establishments where Amount_Played is 6+ million dollars
RevenueReport_2019_Over6Mil <- RevenueReport_2019[RevenueReport_2019$Amount_Played >= 6000000, ]
RevenueReport_2019_Over6Mil$Rank <- NA
RevenueReport_2019_Over6Mil$Rank <- rank(RevenueReport_2019_Over6Mil$Amount_Played)
View(RevenueReport_2019_Over6Mil)

# import tidyverse and ggmap packages
library(tidyverse)
library(ggmap)
register_google(key = "AIzaSyCk5aFK-MURmiZKVapdbabOqfE-ce3LBuE")

Decatur_Map <- get_googlemap(center = c(-88.95, 39.85), zoom = 12)
ggmap(Decatur_Map)

ggmap(Decatur_Map) +
  geom_point(data = RevenueReport_2019_Under3Mil,
             aes(x = Longitude, y = Latitude, size = Rank, color = "Under_3_Million"), 
             alpha = 0.5) +
  geom_point(data = RevenueReport_2019_3to6Mil,
             aes(x = Longitude, y = Latitude, size = Rank, color = "Between_3_and_6_Million"),
             alpha = 0.5) +
  geom_point(data = RevenueReport_2019_Over6Mil,
             aes(x = Longitude, y = Latitude, size = Rank, color = "Over_6_Million"),
             alpha = 0.5) +
  scale_color_manual(values = c(Under_3_Million = "yellow", Between_3_and_6_Million = "orange", Over_6_Million = "red")) +
  scale_size_continuous(range = c(1, 9)) +
  labs(title = "Amount Played from Jan 2019 to Nov 2019 (millions of dollars)",
       color = NULL) +
  guides(color = guide_legend(override.aes = list(size = 6)))




#--------------- Heat Map of Median Income Per Capita for Decatur ---------------
library(tidycensus)
census_api_key("a44001370d81620992d5a3464006622b33b49995", install = TRUE)
income <- c(income = "B19301A_001E")

# get median incomes for all census tracts in Macon County. Data comes from the ACS 5-
# year survey from 2012-2017
decatur <- get_acs(geography="tract", year=2017, 
                   variables=income, county = "Macon", 
                   state="IL", geometry=T)
decatur$estimate <- as.numeric(as.character(decatur$estimate))
decatur <- decatur[-c(20,21,24,26:29,33),]    #remove census tracts that are not in Decatur
# View(decatur)

library(tidyr)
# create heat map of income per capita for Decatur
decatur %>% 
  mutate(median_income=round(estimate,2)) %>% 
  ggplot(aes(fill=median_income)) + 
  geom_sf(color="white") +
  theme_void() +
  theme(panel.grid.major = element_line(colour = 'transparent')) +
  scale_fill_distiller(palette="Blues", direction=1, name="Median Income Per Capita") +
  labs(title="Median Income Per Capita in Decatur, IL", 
       caption="Source: US Census/ACS5 2017")



 
#--------------- Change in Amount Played & Pop Estimate from 2012-2018 Visualization ---------------
# don't have population estimate for 2019 so could not go to 2019

# import .csv file of Illinois population estimates for each city (2010-2018)
IL_pop <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/IL_pop_est.csv", header = TRUE)

# dataframe of only population estimates for Decatur, IL
IL_pop <- as.data.frame(IL_pop)
Decatur_pop <- IL_pop[grep("Decatur", IL_pop$NAME), ]
View(Decatur_pop)

# delete rows of unwanted data - previous code returned some data including the word Decatur that we do not need or want
Decatur_pop = Decatur_pop[-c(1,3:11),]

#transpose Decatur_pop dataframe
library(data.table)
Decatur_pop2 <- transpose(Decatur_pop)
colnames(Decatur_pop2) <- rownames(Decatur_pop)
rownames(Decatur_pop2) <- colnames(Decatur_pop)
Decatur_pop <- Decatur_pop2

#delete unwanted rows
Decatur_pop = Decatur_pop[-c(1:14),]
Decatur_pop <- as.data.frame(Decatur_pop)
colnames(Decatur_pop)[1] <- "Pop_Estimate"

# add column for year and add years
Year = c(2012, 2013, 2014, 2015, 2016, 2017, 2018)
Decatur_pop <- cbind(Year, Decatur_pop)

# create new dataframe that includes the year, the total Amount Played for each year, 
# and the population estimate for each year
AmtPlayed_Pop_df <- RevenueReport %>% 
  select(Year,Amount_Played) %>%
  group_by(Year) %>%
  summarise(sumAmtPlayed = sum(Amount_Played,na.rm = T))
AmtPlayed_Pop_df<- merge(AmtPlayed_Pop_df, Decatur_pop, by=c("Year"))
AmtPlayed_Pop_df <- transform(AmtPlayed_Pop_df, sumAmtPlayed = sumAmtPlayed / 1000000) # get sumAmtPlayed to be in Millions of Dollars
AmtPlayed_Pop_df$Pop_Estimate <- as.numeric(as.character(AmtPlayed_Pop_df$Pop_Estimate))

# create line charts for Amount Played for each year and Population estimate for each Year
options(scipen = 999)
my_theme <- theme(axis.title.x = element_text(size = 17),
                  axis.text.x = element_text(size = 14),
                  axis.title.y = element_text(size = 17),
                  axis.text.y = element_text(size = 14),
                  title = element_text(size = 22, face = "bold"))

Yr_Vs_SumAmtPlayed_df <- ggplot(data=AmtPlayed_Pop_df, aes(x=Year, y=sumAmtPlayed, group=1)) + 
  geom_point(colour = "blue", size = 2) + 
  geom_line(colour = "blue", size = 1.25) +
  scale_y_continuous() + 
  labs(title = "Money Spent on Gambling",x = "Year",y = "Money Spent (in Millions of Dollars)") +
  my_theme

Yr_Vs_PopEstimate_df <- ggplot(data=AmtPlayed_Pop_df, aes(x=Year, y=Pop_Estimate, group=1)) + 
  geom_point(colour = "red", size = 2) + 
  geom_line(colour = "red", size = 1.25) +
  scale_y_continuous(limits = c(71000,76000)) +
  labs(title = "Population Estimates for Decatur", x = "Year",y = "Population Estimate") +
  my_theme

show(Yr_Vs_SumAmtPlayed_df)
show(Yr_Vs_PopEstimate_df)




#---------- Interesting tidbits/quick facts/calculations used in report and presentation -------

# dataframe that includes total $'s lost by the citizens of Decatur for each year
AmtLost_byYear_df <- RevenueReport %>% 
  select(Year,Net_Terminal_Income) %>%
  group_by(Year) %>%
  summarise(sumNetIncome = sum(Net_Terminal_Income,na.rm = T))
AmtLost_byYear_df <- merge(AmtLost_byYear_df, Decatur_pop, by=c("Year")) # add population estimate to previous datafram
AmtLost_2018_df <- AmtLost_byYear_df[-c(1:6,8),] # get dataframe down to only 2018
# edit data types
AmtLost_2018_df$Pop_Estimate <- as.numeric(as.character(AmtLost_2018_df$Pop_Estimate))
AmtLost_2018_df$sumNetIncome <- as.numeric(as.character(AmtLost_2018_df$sumNetIncome))
AmtLost_2018_df <- transform(AmtLost_2018_df, LossPerCapita = sumNetIncome / Pop_Estimate)
View(AmtLost_2018_df)

# amount citizens have lost since 2012
Amt_Lost_Total <- RevenueReport %>%
  select(Net_Terminal_Income) %>%
  summarise(sumNetWager = sum(Net_Terminal_Income,na.rm = T))
View(Amt_Lost_Total)

# amount Decatur has made since 2012
Amt_Made_Total <- RevenueReport %>%
  select(Municipality_Share) %>%
  summarise(sumMunShare = sum(Municipality_Share,na.rm = T))
View(Amt_Made_Total)




#--------- Municipalities with the Most Video Gaming Terminals  ----------

# import video gaming data for Jan 2019 to Nov 2019 for the whole state
VGRevenueReport_2019_State <- read.csv("C:/Users/benma/OneDrive/Documents/Millikin Fall 2019/Business Intelligence and Big Data/Video Gambling Final Project/VGRevenueReport_2019_State.csv", header = FALSE)

# delete top 3 rows of each dataframe (top 3 rows contain data that is not relevant to the task)
VGRevenueReport_2019_State <- VGRevenueReport_2019_State[-c(1,2,3),]

# name each column
VGRevenueReport_2019_State <- sapply(VGRevenueReport_2019_State, as.character)
colnames(VGRevenueReport_2019_State) <- VGRevenueReport_2019_State[1,]
VGRevenueReport_2019_State <- VGRevenueReport_2019_State[-c(1),]

# rename column names so there are no spaces in the names
colnames(VGRevenueReport_2019_State)[3] <- "VGT_Count"
VGRevenueReport_2019_State <- as.data.frame(VGRevenueReport_2019_State)

# convert data type for VGT_Count column
VGRevenueReport_2019_State$VGT_Count <- as.numeric(as.character(VGRevenueReport_2019_State$VGT_Count))

# create a dataframe with a count of VGT in each municipality
most_VGT <- VGRevenueReport_2019_State %>% 
  select(Municipality,VGT_Count) %>%
  group_by(Municipality) %>%
  summarise(VGT_Count= sum(VGT_Count,na.rm = T))
View(most_VGT)

# create bar chart and take only the top 5 cities from the dataset
ggplot(subset(most_VGT, Municipality %in% c("Springfield", "Rockford", "Decatur", "Joliet", "Lake County")),
              aes(x=Municipality, y=VGT_Count)) +
  geom_bar(stat="identity", fill="goldenrod2")+
  geom_text(aes(label = VGT_Count),vjust = 1.6, color = "black",size=3.5)+
  labs(title = "Municipalities with the Most Video Gaming Terminals",x = "Municipality",y = "Number of Video Gaming Terminals")+
  my_theme




#--------------- Amount Citizens Have Lost vs Amount Decatur ---------------

# create new dataframe that includes the year, the total Amount Lost (net terminal income), 
# and municipality share
AmtLost_Municipality_df <- RevenueReport %>% 
  select(Year, Net_Wager, Municipality_Share) %>%
  group_by(Year) %>%
  summarise(AmtLost = sum(Net_Wager,na.rm = T), sum_mShare = sum(Municipality_Share,na.rm = T))
colnames(AmtLost_Municipality_df)[2] <- "Money Lost by Citizens while Gambling"
colnames(AmtLost_Municipality_df)[3] <- "Decatur Revenue"

# use melt function to reshape data
library(reshape2)
AmtLost_Municipality_df <- melt(AmtLost_Municipality_df, id.vars = "Year")

# make grouped bar chart - this one has no  labels on the actual bars and was used in the report
ggplot(AmtLost_Municipality_df, aes(x = Year,y = value, fill = variable)) + 
  geom_bar(position = 'dodge', stat="identity") +
  labs(title = "Money Citizens Have Lost Vs Decatur Revenue",x = "Year",y = "Money ($)")+
  my_theme +
  guides(fill=guide_legend(title="Legend", label = TRUE))

# make grouped bar chart - this one has labels on the actual bars (very messy so was not used)
# ggplot(AmtLost_Municipality_df, aes(x = Year,y = value, fill = variable)) + 
#   geom_bar(position = 'dodge', stat="identity") +
#   geom_text(aes(label = value),vjust = 1.6, color = "black",size=3.5) +
#   labs(title = "Money Citizens Have Lost Vs Decatur Revenue",x = "Year",y = "Money ($)")+
#   my_theme +
#   guides(fill=guide_legend(title="Legend", label = TRUE))
  
  