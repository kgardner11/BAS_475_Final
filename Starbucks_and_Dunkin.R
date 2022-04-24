library(shiny)
library(shinyWidgets)
library(shinythemes)
library(shinydashboard)
library(DT)
library(plotly)
library(dygraphs)
library(tidyverse)
library(fpp3)
file_path1 <- "multiTimeline (10).csv"
s_trends <- read.csv(file_path1, skip = 2)
names(s_trends) <- c("Month", "Starbucks")
s_trends$Month <- yearmonth(s_trends$Month)
s_trends <- tsibble(s_trends)
file_path2 <- "multiTimeline (11).csv"
d_trends <- read.csv(file_path2, skip = 2)
names(d_trends) <- c("Month", "Dunkin")
d_trends$Month <- yearmonth(d_trends$Month)
d_trends <- tsibble(d_trends)

SB.Americano <- c("Caffè Americano")
SB_Americano <- as.data.frame(SB.Americano)
SB_Americano$Calories <- c(15)
SB_Americano$TotalFat_g <-c(0)
SB_Americano$SatFat_g <- c(0)
SB_Americano$TransFat_g <- c(0)
SB_Americano$Cholesterol_mg <- c(0)
SB_Americano$Sodium_mg <- c(10)
SB_Americano$TotalCarbs_g <- c(2)
SB_Americano$DietaryFiber_g <- c(0)
SB_Americano$Sugars_g <- c(0)
SB_Americano$Protein_g <- c(1)
SB_Americano$Caffeine_mg <- c(225)

SB.HotCoffee <- c("Verdana Blend","Caffé Misto","Dark Roast","Pike Place","Decaf Pike Place")
SB_Hot_Coffee <- as.data.frame(SB.HotCoffee)
SB_Hot_Coffee$Calories <- c(5,110,5,5,5)
SB_Hot_Coffee$TotalFat_g <- c(0,4,0,0,0)
SB_Hot_Coffee$SatFat_g <- c(0,2,0,0,0)
SB_Hot_Coffee$TransFat_g <- c(0,0,0,0,0)
SB_Hot_Coffee$Cholesterol_mg <- c(0,15,0,0,0)
SB_Hot_Coffee$Sodium_mg <- c(10,100,10,10,10)
SB_Hot_Coffee$TotalCarbs_g <- c(0,10,0,0,0)
SB_Hot_Coffee$DietaryFiber_g <- c(0,0,0,0,0)
SB_Hot_Coffee$Sugars_g <- c(0,10,0,0,0)
SB_Hot_Coffee$Protein_g <- c(1,7,1,1,1)
SB_Hot_Coffee$Caffeine_mg <- c(360,150,260,310,25)

SB.EspressoShots <- c("Espresso","Espresso Con Panna")
SB_Espresso_Shots <- as.data.frame(SB.EspressoShots)
SB_Espresso_Shots$Calories <- c(10,35)
SB_Espresso_Shots$TotalFat_g <-c(0,2.5)
SB_Espresso_Shots$SatFat_g <- c(0,0)
SB_Espresso_Shots$TransFat_g <- c(0,0)
SB_Espresso_Shots$Cholesterol_mg <- c(0,10)
SB_Espresso_Shots$Sodium_mg <- c(0,0)
SB_Espresso_Shots$TotalCarbs_g <- c(2,2)
SB_Espresso_Shots$DietaryFiber_g <- c(0,0)
SB_Espresso_Shots$Sugars_g <- c(0,0)
SB_Espresso_Shots$Protein_g <- c(1,1)
SB_Espresso_Shots$Caffeine_mg <- c(150,150)

SB.FlatWhite <- c("Flat White","Honey Almondmilk Flat White")
SB_Flat_White <- as.data.frame(SB.FlatWhite)
SB_Flat_White$Calories <- c(170,120)
SB_Flat_White$TotalFat_g <-c(9,4)
SB_Flat_White$SatFat_g <- c(5,0)
SB_Flat_White$TransFat_g <- c(0,0)
SB_Flat_White$Cholesterol_mg <- c(25,0)
SB_Flat_White$Sodium_mg <- c(115,100)
SB_Flat_White$TotalCarbs_g <- c(14,22)
SB_Flat_White$DietaryFiber_g <- c(0,1)
SB_Flat_White$Sugars_g <- c(13,18)
SB_Flat_White$Protein_g <- c(9,2)
SB_Flat_White$Caffeine_mg <- c(130,150)

SB.Latte <- c("Caffè Latte","Cinnamon Dolce Latte","Reserve Latte","Reserve Hazelnut Bianco Latte","Blonde Vanilla Latte")
SB_Latte <- as.data.frame(SB.Latte)
SB_Latte$Calories <- c(190,340,230,380,250)
SB_Latte$TotalFat_g <- c(7,14,12,18,6)
SB_Latte$SatFat_g <- c(4.5,9,7,8,3.5)
SB_Latte$TransFat_g <- c(0,0.5,0,0,0)
SB_Latte$Cholesterol_mg <- c(30,50,35,35,25)
SB_Latte$Sodium_mg <- c(170,160,160,160,150)
SB_Latte$TotalCarbs_g <- c(19,43,19,40,37)
SB_Latte$DietaryFiber_g <- c(0,0,0,1,0)
SB_Latte$Sugars_g <- c(18,40,18,36,35)
SB_Latte$Protein_g <- c(13,12,12,13,12)
SB_Latte$Caffeine_mg <- c(150,150,135,135,170)

SB.Macchiato <- c("Caramel Macchiato","Espresso Macchiato")
SB_Macchiato <- as.data.frame(SB.Macchiato)
SB_Macchiato$Calories <- c(20,15)
SB_Macchiato$TotalFat_g <-c(7,0)
SB_Macchiato$SatFat_g <- c(4.5,0)
SB_Macchiato$TransFat_g <- c(0,0)
SB_Macchiato$Cholesterol_mg <- c(25,0)
SB_Macchiato$Sodium_mg <- c(150,0)
SB_Macchiato$TotalCarbs_g <- c(35,2)
SB_Macchiato$DietaryFiber_g <- c(0,0)
SB_Macchiato$Sugars_g <- c(33,0)
SB_Macchiato$Protein_g <- c(10,1)
SB_Macchiato$Caffeine_mg <- c(150,150)

SB.Mocha <- c("Caffè Mocha","Dark Chocolate Mocha","White Chocolate Mocha")
SB_Mocha <- as.data.frame(SB.Mocha)
SB_Mocha$Calories <- c(370,320,430)
SB_Mocha$TotalFat_g <-c(15,14,18)
SB_Mocha$SatFat_g <- c(10,8,12)
SB_Mocha$TransFat_g <- c(0,0,0.5)
SB_Mocha$Cholesterol_mg <- c(45,35,50)
SB_Mocha$Sodium_mg <- c(150,150,250)
SB_Mocha$TotalCarbs_g <- c(43,38,54)
SB_Mocha$DietaryFiber_g <- c(4,2,0)
SB_Mocha$Sugars_g <- c(35,33,53)
SB_Mocha$Protein_g <- c(14,13,15)
SB_Mocha$Caffeine_mg <- c(175,135,150)

DD.Americano <- c("Americano")
DD_Americano <- as.data.frame(DD.Americano)
DD_Americano$Calories <- c(10)
DD_Americano$TotalFat_g <-c(0)
DD_Americano$SatFat_g <- c(0)
DD_Americano$TransFat_g <- c(0)
DD_Americano$Cholesterol_mg <- c(0)
DD_Americano$Sodium_mg <- c(25)
DD_Americano$TotalCarbs_g <- c(2)
DD_Americano$DietaryFiber_g <- c(0)
DD_Americano$Sugars_g <- c(0)
DD_Americano$Protein_g <- c(0)
DD_Americano$Caffeine_mg <- c(284)

DD.HotCoffee <- c("Caramel Swirl","French Vanilla","Hot Coffee","Mocha Swirl")
DD_Hot_Coffee <- as.data.frame(DD.HotCoffee)
DD_Hot_Coffee$Calories <- c(170,170,5,160)
DD_Hot_Coffee$TotalFat_g <- c(0,0,0,0.5)
DD_Hot_Coffee$SatFat_g <- c(0,0,0,0)
DD_Hot_Coffee$TransFat_g <- c(0,0,0,0)
DD_Hot_Coffee$Cholesterol_mg <- c(5,5,0,0)
DD_Hot_Coffee$Sodium_mg <- c(60,50,10,30)
DD_Hot_Coffee$TotalCarbs_g <- c(39,38,0,38)
DD_Hot_Coffee$DietaryFiber_g <- c(0,0,0,2)
DD_Hot_Coffee$Sugars_g <- c(38,37,0,34)
DD_Hot_Coffee$Protein_g <- c(3,2,0,2)
DD_Hot_Coffee$Caffeine_mg <- c(210,210,210,210)

DD.EspressoShots <- c("Café con Leche","Cortadito","Espresso with Sugar","Espresso")
DD_Espresso_Shots <- as.data.frame(DD.EspressoShots)
DD_Espresso_Shots$Calories <- c(250,80,60,5)
DD_Espresso_Shots$TotalFat_g <-c(9,1,0,0)
DD_Espresso_Shots$SatFat_g <- c(5,0.5,0,0)
DD_Espresso_Shots$TransFat_g <- c(0,0,0,0)
DD_Espresso_Shots$Cholesterol_mg <- c(25,5,0,0)
DD_Espresso_Shots$Sodium_mg <- c(125,20,5,5)
DD_Espresso_Shots$TotalCarbs_g <- c(35,16,15,1)
DD_Espresso_Shots$DietaryFiber_g <- c(0,0,0,0)
DD_Espresso_Shots$Sugars_g <- c(34,16,14,0)
DD_Espresso_Shots$Protein_g <- c(9,1,0,0)
DD_Espresso_Shots$Caffeine_mg <- c(118,118,118,118)

DD.Latte <- c("Caramel Craze","Caramel Swirl","Chai Hot Latte","Cocoa Mocha Latte","French Vanilla Swirl","Hot Latte","Matcha Latte","Mocha Swirl")
DD_Latte <- as.data.frame(DD.Latte)
DD_Latte$Calories <- c(340,260,220,330,260,100,180,250)
DD_Latte$TotalFat_g <- c(5,0,0,6,0,0,0,1)
DD_Latte$SatFat_g <- c(3,0,0,3.5,0,0,0,0.5)
DD_Latte$TransFat_g <- c(0,0,0,0,0,0,0,0)
DD_Latte$Cholesterol_mg <- c(25,10,5,20,10,5,5,5)
DD_Latte$Sodium_mg <- c(180,170,150,160,170,125,115,150)
DD_Latte$TotalCarbs_g <- c(61,53,44,61,53,15,34,52)
DD_Latte$DietaryFiber_g <- c(0,0,2,2,0,0,1,2)
DD_Latte$Sugars_g <- c(57,52,41,53,50,14,32,48)
DD_Latte$Protein_g <- c(12,11,10,11,11,9,11,10)
DD_Latte$Caffeine_mg <- c(166,166,80,166,166,166,166,166)

DD.Macchiato <- c("Caramel Swirl","French Vanilla Swirl","Hot Macchiato","Mocha Swirl")
DD_Macchiato <- as.data.frame(DD.Macchiato)
DD_Macchiato$Calories <- c(240,230,70,230)
DD_Macchiato$TotalFat_g <-c(0,0,0,1)
DD_Macchiato$SatFat_g <- c(0,0,0,0.5)
DD_Macchiato$TransFat_g <- c(0,0,0,0)
DD_Macchiato$Cholesterol_mg <- c(5,5,5,5)
DD_Macchiato$Sodium_mg <- c(140,135,90,110)
DD_Macchiato$TotalCarbs_g <- c(49,49,11,49)
DD_Macchiato$DietaryFiber_g <- c(0,0,0,2)
DD_Macchiato$Sugars_g <- c(47,46,9,43)
DD_Macchiato$Protein_g <- c(8,8,6,7)
DD_Macchiato$Caffeine_mg <- c(284,284,284,284)

DD.Cappuccino <- c("Cappuccino","Caramel Swirl","French Vanilla Swirl","Mocha Swirl")
DD_Cappuccino <- as.data.frame(DD.Cappuccino)
DD_Cappuccino$Calories <- c(70,230,230,220)
DD_Cappuccino$TotalFat_g <-c(0,0,0,1)
DD_Cappuccino$SatFat_g <- c(0,0,0,0.5)
DD_Cappuccino$TransFat_g <- c(0,0,0,0)
DD_Cappuccino$Cholesterol_mg <- c(5,5,5,5)
DD_Cappuccino$Sodium_mg <- c(85,135,130,105)
DD_Cappuccino$TotalCarbs_g <- c(10,49,48,48)
DD_Cappuccino$DietaryFiber_g <- c(0,0,0,2)
DD_Cappuccino$Sugars_g <- c(9,47,46,43)
DD_Cappuccino$Protein_g <- c(6,8,8,7)
DD_Cappuccino$Caffeine_mg <- c(166,166,166,166)

SB.ChaiTea <- c("Chai Tea Latte","Chai Tea")
SB_Chai_Tea <- as.data.frame(SB.ChaiTea)
SB_Chai_Tea$Calories <- c(240,0)
SB_Chai_Tea$TotalFat_g <-c(4.5,0)
SB_Chai_Tea$SatFat_g <- c(2,0)
SB_Chai_Tea$TransFat_g <- c(0,0)
SB_Chai_Tea$Cholesterol_mg <- c(20,0)
SB_Chai_Tea$Sodium_mg <- c(115,0)
SB_Chai_Tea$TotalCarbs_g <- c(45,0)
SB_Chai_Tea$DietaryFiber_g <- c(0,0)
SB_Chai_Tea$Sugars_g <- c(42,0)
SB_Chai_Tea$Protein_g <- c(8,0)
SB_Chai_Tea$Caffeine_mg <- c(95,40)

SB.BlackTea <- c("Earl Grey Tea","London Fog Tea Latte","Royal English Breakfast Tea","Royal English Breakfast Tea Latte")
SB_Black_Tea <- as.data.frame(SB.BlackTea)
SB_Black_Tea$Calories <- c(0,180,0,150)
SB_Black_Tea$TotalFat_g <-c(0,4,0,4)
SB_Black_Tea$SatFat_g <- c(0,2.5,0,2.5)
SB_Black_Tea$TransFat_g <- c(0,0,0,0)
SB_Black_Tea$Cholesterol_mg <- c(0,15,0,15)
SB_Black_Tea$Sodium_mg <- c(0,105,0,105)
SB_Black_Tea$TotalCarbs_g <- c(0,29,0,21)
SB_Black_Tea$DietaryFiber_g <- c(0,0,0,0)
SB_Black_Tea$Sugars_g <- c(0,29,0,21)
SB_Black_Tea$Protein_g <- c(0,7,0,7)
SB_Black_Tea$Caffeine_mg <- c(40,40,40,40)

SB.GreenTea <- c("Emperor's Clouds & Mist","Matcha Tea Latte","Honey Citrus Mint Tea","Jade Citrus Mint Brewed Tea")
SB_Green_Tea <- as.data.frame(SB.GreenTea)
SB_Green_Tea$Calories <- c(0,240,130,0)
SB_Green_Tea$TotalFat_g <-c(0,7,0,0)
SB_Green_Tea$SatFat_g <- c(0,4.5,0,0)
SB_Green_Tea$TransFat_g <- c(0,0,0,0)
SB_Green_Tea$Cholesterol_mg <- c(0,25,0,0)
SB_Green_Tea$Sodium_mg <- c(0,160,10,0)
SB_Green_Tea$TotalCarbs_g <- c(0,34,32,0)
SB_Green_Tea$DietaryFiber_g <- c(0,1,0,0)
SB_Green_Tea$Sugars_g <- c(0,32,30,0)
SB_Green_Tea$Protein_g <- c(0,12,0,0)
SB_Green_Tea$Caffeine_mg <- c(16,80,16,40)

SB.HerbalTea <- c("Mint Majesty","Peach Tranquility")
SB_Herbal_Tea <- as.data.frame(SB.HerbalTea)
SB_Herbal_Tea$Calories <- c(0,0)
SB_Herbal_Tea$TotalFat_g <- c(0,0)
SB_Herbal_Tea$SatFat_g <- c(0,0)
SB_Herbal_Tea$TransFat_g <- c(0,0)
SB_Herbal_Tea$Cholesterol_mg <- c(0,0)
SB_Herbal_Tea$Sodium_mg <- c(0,0)
SB_Herbal_Tea$TotalCarbs_g <- c(0,0)
SB_Herbal_Tea$DietaryFiber_g <- c(0,0)
SB_Herbal_Tea$Sugars_g <- c(0,0)
SB_Herbal_Tea$Protein_g <- c(0,0)
SB_Herbal_Tea$Caffeine_mg <- c(0,0)

DD.GreenTea <- c("Harmony Leaf Green")
DD_Green_Tea <- as.data.frame(DD.GreenTea)
DD_Green_Tea$Calories <- c(0)
DD_Green_Tea$TotalFat_g <-c(0)
DD_Green_Tea$SatFat_g <- c(0)
DD_Green_Tea$TransFat_g <- c(0)
DD_Green_Tea$Cholesterol_mg <- c(0)
DD_Green_Tea$Sodium_mg <- c(0)
DD_Green_Tea$TotalCarbs_g <- c(0)
DD_Green_Tea$DietaryFiber_g <- c(0)
DD_Green_Tea$Sugars_g <- c(0)
DD_Green_Tea$Protein_g <- c(0)
DD_Green_Tea$Caffeine_mg <- c(70)

DD.BlackTea <- c("Bold Breakfast Black","Decaf Breakfast Black")
DD_Black_Tea <- as.data.frame(DD.BlackTea)
DD_Black_Tea$Calories <- c(0,0)
DD_Black_Tea$TotalFat_g <-c(0,0)
DD_Black_Tea$SatFat_g <- c(0,0)
DD_Black_Tea$TransFat_g <- c(0,0)
DD_Black_Tea$Cholesterol_mg <- c(0,0)
DD_Black_Tea$Sodium_mg <- c(0,0)
DD_Black_Tea$TotalCarbs_g <- c(0,0)
DD_Black_Tea$DietaryFiber_g <- c(0,0)
DD_Black_Tea$Sugars_g <- c(0,0)
DD_Black_Tea$Protein_g <- c(0,0)
DD_Black_Tea$Caffeine_mg <- c(90,0)

DD.HerbalTea <- c("Chamomile Fields Herbal Infusion","Cool Mint Herbal Infusion","Hibuscus Kiss Herbal Infusion")
DD_Herbal_Tea <- as.data.frame(DD.HerbalTea)
DD_Herbal_Tea$Calories <- c(0,0,0)
DD_Herbal_Tea$TotalFat_g <-c(0,0,0)
DD_Herbal_Tea$SatFat_g <- c(0,0,0)
DD_Herbal_Tea$TransFat_g <- c(0,0,0)
DD_Herbal_Tea$Cholesterol_mg <- c(0,0,0)
DD_Herbal_Tea$Sodium_mg <- c(0,0,0)
DD_Herbal_Tea$TotalCarbs_g <- c(0,0,0)
DD_Herbal_Tea$DietaryFiber_g <- c(0,0,0)
DD_Herbal_Tea$Sugars_g <- c(0,0,0)
DD_Herbal_Tea$Protein_g <- c(0,0,0)
DD_Herbal_Tea$Caffeine_mg <- c(70,70,70)

SB.HotChocolate<- c("Hot Chocolate","White Hot Chocolate")
SB_Hot_Chocolate <- as.data.frame(SB.HotChocolate)
SB_Hot_Chocolate$Calories <- c(370,440)
SB_Hot_Chocolate$TotalFat_g <- c(16,19)
SB_Hot_Chocolate$SatFat_g <- c(10,13)
SB_Hot_Chocolate$TransFat_g <- c(0.5,0.5)
SB_Hot_Chocolate$Cholesterol_mg <- c(50,55)
SB_Hot_Chocolate$Sodium_mg <- c(160,260)
SB_Hot_Chocolate$TotalCarbs_g <- c(43,55)
SB_Hot_Chocolate$DietaryFiber_g <- c(4,0)
SB_Hot_Chocolate$Sugars_g <- c(37,55)
SB_Hot_Chocolate$Protein_g <- c(14,15)
SB_Hot_Chocolate$Caffeine_mg <- c(25,0)

SB.HotJuice<- c("Caramel Apple Spice","Steamed Apple Juice")
SB_Hot_Juice <- as.data.frame(SB.HotJuice)
SB_Hot_Juice$Calories <- c(380,220)
SB_Hot_Juice$TotalFat_g <- c(8,0)
SB_Hot_Juice$SatFat_g <- c(5,0)
SB_Hot_Juice$TransFat_g <- c(0,0)
SB_Hot_Juice$Cholesterol_mg <- c(25,0)
SB_Hot_Juice$Sodium_mg <- c(35,20)
SB_Hot_Juice$TotalCarbs_g <- c(77,55)
SB_Hot_Juice$DietaryFiber_g <- c(0,0)
SB_Hot_Juice$Sugars_g <- c(70,50)
SB_Hot_Juice$Protein_g <- c(1,0)
SB_Hot_Juice$Caffeine_mg <- c(0,0)

SB.Steamer <- c("Cinnamon Dolce Crème","Steamed Milk","Vanilla Crème")
SB_Steamer<- as.data.frame(SB.Steamer)
SB_Steamer$Calories <- c(360,200,350)
SB_Steamer$TotalFat_g <- c(15,8,14)
SB_Steamer$SatFat_g <- c(9,4,9)
SB_Steamer$TransFat_g <- c(0.5,0,0.5)
SB_Steamer$Cholesterol_mg <- c(55,30,50)
SB_Steamer$Sodium_mg <- c(180,190,180)
SB_Steamer$TotalCarbs_g <- c(44,19,44)
SB_Steamer$DietaryFiber_g <- c(0,0,0)
SB_Steamer$Sugars_g <- c(42,19,43)
SB_Steamer$Protein_g <- c(13,13,13)
SB_Steamer$Caffeine_mg <- c(0,0,0)

DD.HotChocolate<- c("Box 'O Joe(R) Hot Chocolate","Hot Chocolate with Espresso Shot","Original")
DD_Hot_Chocolate <- as.data.frame(DD.HotChocolate)
DD_Hot_Chocolate$Calories <- c(220,280,330)
DD_Hot_Chocolate$TotalFat_g <- c(7,9,10)
DD_Hot_Chocolate$SatFat_g <- c(6,8,9)
DD_Hot_Chocolate$TransFat_g <- c(0,0,0)
DD_Hot_Chocolate$Cholesterol_mg <- c(0,0,0)
DD_Hot_Chocolate$Sodium_mg <- c(210,280,320)
DD_Hot_Chocolate$TotalCarbs_g <- c(40,51,59)
DD_Hot_Chocolate$DietaryFiber_g <- c(2,2,2)
DD_Hot_Chocolate$Sugars_g <- c(32,39,46)
DD_Hot_Chocolate$Protein_g <- c(2,2,3)
DD_Hot_Chocolate$Caffeine_mg <- c(13,131,13)

SB.ColdBrew<- c("Salted Caramel Cream","Starbucks Reserve","Coffee","Vanilla Sweet Cream",
                "Coffee with Milk")
SB_Cold_Brew <- as.data.frame(SB.ColdBrew)
SB_Cold_Brew$Calories <- c(220,5,5,110,35)
SB_Cold_Brew$TotalFat_g <- c(13,0,0,5,1.5)
SB_Cold_Brew$SatFat_g <- c(8,0,0,3.5,1)
SB_Cold_Brew$TransFat_g <- c(0,0,0,0,0)
SB_Cold_Brew$Cholesterol_mg <- c(40,0,0,15,5)
SB_Cold_Brew$Sodium_mg <- c(300,15,15,20,40)
SB_Cold_Brew$TotalCarbs_g <- c(24,0,0,14,3)
SB_Cold_Brew$DietaryFiber_g <- c(0,0,0,0,0)
SB_Cold_Brew$Sugars_g <- c(24,0,0,14,3)
SB_Cold_Brew$Protein_g <- c(2,0,0,1,2)
SB_Cold_Brew$Caffeine_mg <- c(185,200,205,185,205)

SB.NitroColdBrew<- c("Starbucks Reserve Nitro","Nitro","Vanilla Sweet Cream Nitro")
SB_Nitro_Cold_Brew <- as.data.frame(SB.NitroColdBrew)
SB_Nitro_Cold_Brew$Calories <- c(5,5,70)
SB_Nitro_Cold_Brew$TotalFat_g <- c(0,0,5)
SB_Nitro_Cold_Brew$SatFat_g <- c(0,0,3.5)
SB_Nitro_Cold_Brew$TransFat_g <- c(0,0,0)
SB_Nitro_Cold_Brew$Cholesterol_mg <- c(0,0,15)
SB_Nitro_Cold_Brew$Sodium_mg <- c(10,10,20)
SB_Nitro_Cold_Brew$TotalCarbs_g <- c(0,0,4)
SB_Nitro_Cold_Brew$DietaryFiber_g <- c(0,0,0)
SB_Nitro_Cold_Brew$Sugars_g <- c(0,0,4)
SB_Nitro_Cold_Brew$Protein_g <- c(0,0,1)
SB_Nitro_Cold_Brew$Caffeine_mg <- c(280,280,265)

SB.IcedAmericano<- c("Iced Caffè Americano")
SB_Iced_Americano <- as.data.frame(SB.IcedAmericano)
SB_Iced_Americano$Calories <- c(15)
SB_Iced_Americano$TotalFat_g <- c(0)
SB_Iced_Americano$SatFat_g <- c(0)
SB_Iced_Americano$TransFat_g <- c(0)
SB_Iced_Americano$Cholesterol_mg <- c(0)
SB_Iced_Americano$Sodium_mg <- c(15)
SB_Iced_Americano$TotalCarbs_g <- c(2)
SB_Iced_Americano$DietaryFiber_g <- c(0)
SB_Iced_Americano$Sugars_g <- c(0)
SB_Iced_Americano$Protein_g <- c(1)
SB_Iced_Americano$Caffeine_mg <- c(225)

SB.IcedCoffee<- c("Iced Coffee","Iced Coffee with Milk","Iced Espresso")
SB_Iced_Coffee <- as.data.frame(SB.IcedCoffee)
SB_Iced_Coffee$Calories <- c(80,110,10)
SB_Iced_Coffee$TotalFat_g <- c(0,1.5,0)
SB_Iced_Coffee$SatFat_g <- c(0,1,0)
SB_Iced_Coffee$TransFat_g <- c(0,0,0)
SB_Iced_Coffee$Cholesterol_mg <- c(0,5,0)
SB_Iced_Coffee$Sodium_mg <- c(10,40,0)
SB_Iced_Coffee$TotalCarbs_g <- c(20,23,2)
SB_Iced_Coffee$DietaryFiber_g <- c(0,0,0)
SB_Iced_Coffee$Sugars_g <- c(20,23,1)
SB_Iced_Coffee$Protein_g <- c(0,2,1)
SB_Iced_Coffee$Caffeine_mg <- c(165,125,150)

SB.IcedShakenEspresso <- c("Iced Toasted Vanilla Oatmilk","Iced Brown Sugar Oatmilk","Iced Chocolate Almondmilk","Iced Shaken Espresso")
SB_Iced_Shaken_Espresso <- as.data.frame(SB.IcedShakenEspresso)
SB_Iced_Shaken_Espresso$Calories <- c(140,120,110,100)
SB_Iced_Shaken_Espresso$TotalFat_g <- c(4.5,3,3,2)
SB_Iced_Shaken_Espresso$SatFat_g <- c(0,0,0,1)
SB_Iced_Shaken_Espresso$TransFat_g <- c(0,0,0,0)
SB_Iced_Shaken_Espresso$Cholesterol_mg <- c(0,0,0,5)
SB_Iced_Shaken_Espresso$Sodium_mg <- c(60,120,80,0)
SB_Iced_Shaken_Espresso$TotalCarbs_g <- c(23,20,20,17)
SB_Iced_Shaken_Espresso$DietaryFiber_g <- c(1,1,1,0)
SB_Iced_Shaken_Espresso$Sugars_g <- c(11,13,16,14)
SB_Iced_Shaken_Espresso$Protein_g <- c(2,2,2,4)
SB_Iced_Shaken_Espresso$Caffeine_mg <- c(255,255,255,225)

SB.IcedFlatWhite <- c("Iced Flat White","Iced CHoneyAlmondmilk Flat White")
SB_Iced_Flat_White <- as.data.frame(SB.IcedFlatWhite)
SB_Iced_Flat_White$Calories <- c(150,100)
SB_Iced_Flat_White$TotalFat_g <- c(8,2.5)
SB_Iced_Flat_White$SatFat_g <- c(4.5,0)
SB_Iced_Flat_White$TransFat_g <- c(0,0)
SB_Iced_Flat_White$Cholesterol_mg <- c(25,0)
SB_Iced_Flat_White$Sodium_mg <- c(110,70)
SB_Iced_Flat_White$TotalCarbs_g <- c(13,20)
SB_Iced_Flat_White$DietaryFiber_g <- c(0,1)
SB_Iced_Flat_White$Sugars_g <- c(11,17)
SB_Iced_Flat_White$Protein_g <- c(8,1)
SB_Iced_Flat_White$Caffeine_mg <- c(130,150)

SB.IcedLatte <- c("Starbucks Reserve","Starbucks Reserve Iced Hazelnut Bianco","Iced Caffè","Iced Cinnamon Dolce","Blonde Vanilla")
SB_Iced_Latte <- as.data.frame(SB.IcedLatte)
SB_Iced_Latte$Calories <- c(210,280,130,300,190)
SB_Iced_Latte$TotalFat_g <- c(11,13,4.5,13,4)
SB_Iced_Latte$SatFat_g <- c(6,6,2.5,8,2)
SB_Iced_Latte$TransFat_g <- c(0,0,0,45,0)
SB_Iced_Latte$Cholesterol_mg <- c(35,25,20,115,15)
SB_Iced_Latte$Sodium_mg <- c(150,120,115,38,100)
SB_Iced_Latte$TotalCarbs_g <- c(17,30,13,0,30)
SB_Iced_Latte$DietaryFiber_g <- c(0,1,0,0,0)
SB_Iced_Latte$Sugars_g <- c(16,26,11,35,28)
SB_Iced_Latte$Protein_g <- c(11,10,8,8,7)
SB_Iced_Latte$Caffeine_mg <- c(135,165,150,150,170)

SB.IcedMacchiato<- c("Iced Caramel Macchiato")
SB_Iced_Macchiato <- as.data.frame(SB.IcedMacchiato)
SB_Iced_Macchiato$Calories <- c(250)
SB_Iced_Macchiato$TotalFat_g <- c(7)
SB_Iced_Macchiato$SatFat_g <- c(4.5)
SB_Iced_Macchiato$TransFat_g <- c(0)
SB_Iced_Macchiato$Cholesterol_mg <- c(25)
SB_Iced_Macchiato$Sodium_mg <- c(150)
SB_Iced_Macchiato$TotalCarbs_g <- c(37)
SB_Iced_Macchiato$DietaryFiber_g <- c(0)
SB_Iced_Macchiato$Sugars_g <- c(34)
SB_Iced_Macchiato$Protein_g <- c(10)
SB_Iced_Macchiato$Caffeine_mg <- c(150)

SB.IcedMocha<- c("Iced White Chocolate","Iced Caffè","Starbucks Reserve Iced Dark Chocolate")
SB_Iced_Mocha <- as.data.frame(SB.IcedMocha)
SB_Iced_Mocha$Calories <- c(420,350,260)
SB_Iced_Mocha$TotalFat_g <- c(20,17,10)
SB_Iced_Mocha$SatFat_g <- c(14,11,6)
SB_Iced_Mocha$TransFat_g <- c(0.5,0.5,0)
SB_Iced_Mocha$Cholesterol_mg <- c(55,50,25)
SB_Iced_Mocha$Sodium_mg <- c(200,100,115)
SB_Iced_Mocha$TotalCarbs_g <- c(49,38,33)
SB_Iced_Mocha$DietaryFiber_g <- c(0,4,2)
SB_Iced_Mocha$Sugars_g <- c(48,30,28)
SB_Iced_Mocha$Protein_g <- c(11,10,10)
SB_Iced_Mocha$Caffeine_mg <- c(150,175,135)

DD.ColdBrew<- c("Cold Brew","Cold Brew with Cream","Cold Brew with Sweet Cold Foam","Nitro Cold Brew")
DD_Cold_Brew <- as.data.frame(DD.ColdBrew)
DD_Cold_Brew$Calories <- c(5,90,80,5)
DD_Cold_Brew$TotalFat_g <- c(0,9,3,0)
DD_Cold_Brew$SatFat_g <- c(0,4.5,1.5,0)
DD_Cold_Brew$TransFat_g <- c(0,0,0,0)
DD_Cold_Brew$Cholesterol_mg <- c(0,25,10,0)
DD_Cold_Brew$Sodium_mg <- c(15,45,35,5)
DD_Cold_Brew$TotalCarbs_g <- c(0,1,12,0)
DD_Cold_Brew$DietaryFiber_g <- c(0,0,0,0)
DD_Cold_Brew$Sugars_g <- c(0,1,11,0)
DD_Cold_Brew$Protein_g <- c(0,2,1,0)
DD_Cold_Brew$Caffeine_mg <- c(260,260,260,260)

DD.IcedAmericano<- c("Iced Americano")
DD_Iced_Americano <- as.data.frame(DD.IcedAmericano)
DD_Iced_Americano$Calories <- c(10)
DD_Iced_Americano$TotalFat_g <- c(0)
DD_Iced_Americano$SatFat_g <- c(0)
DD_Iced_Americano$TransFat_g <- c(0)
DD_Iced_Americano$Cholesterol_mg <- c(0)
DD_Iced_Americano$Sodium_mg <- c(30)
DD_Iced_Americano$TotalCarbs_g <- c(2)
DD_Iced_Americano$DietaryFiber_g <- c(0)
DD_Iced_Americano$Sugars_g <- c(0)
DD_Iced_Americano$Protein_g <- c(0)
DD_Iced_Americano$Caffeine_mg <- c(284)

DD.IcedCoffee<- c("Caramel Swirl","French Vanilla Swirl","Iced Café Au Lait","Iced Coffee","Mocha Swirl")
DD_Iced_Coffee <- as.data.frame(DD.IcedCoffee)
DD_Iced_Coffee$Calories <- c(170,170,60,5,160)
DD_Iced_Coffee$TotalFat_g <- c(0,0,0,0,0.5)
DD_Iced_Coffee$SatFat_g <- c(0,0,0,0,0)
DD_Iced_Coffee$TransFat_g <- c(0,0,0,0,0)
DD_Iced_Coffee$Cholesterol_mg <- c(5,5,5,0,0)
DD_Iced_Coffee$Sodium_mg <- c(65,60,90,15,35)
DD_Iced_Coffee$TotalCarbs_g <- c(39,38,9,0,38)
DD_Iced_Coffee$DietaryFiber_g <- c(0,0,0,0,2)
DD_Iced_Coffee$Sugars_g <- c(38,37,9,0,34)
DD_Iced_Coffee$Protein_g <- c(3,2,6,0,2)
DD_Iced_Coffee$Caffeine_mg <- c(297,297,297,297,297)

DD.IcedLatte <- c("Caramel Craze","Caramel Swirl","Chai","Cocoa Mocha","French Vanilla Swirl","Iced Latte","Matcha","Mocha Swirl")
DD_Iced_Latte <- as.data.frame(DD.IcedLatte)
DD_Iced_Latte$Calories <- c(340,260,220,330,260,100,180,250)
DD_Iced_Latte$TotalFat_g <- c(5,0,0,6,0,0,0,1)
DD_Iced_Latte$SatFat_g <- c(3,0,0,3.5,0,0,0,0.5)
DD_Iced_Latte$TransFat_g <- c(0,0,0,0,0,0,0,0)
DD_Iced_Latte$Cholesterol_mg <- c(25,10,5,20,10,5,5,5)
DD_Iced_Latte$Sodium_mg <- c(190,190,160,160,180,135,125,160)
DD_Iced_Latte$TotalCarbs_g <- c(61,53,44,60,53,15,34,52)
DD_Iced_Latte$DietaryFiber_g <- c(0,0,2,2,0,0,1,2)
DD_Iced_Latte$Sugars_g <- c(57,52,41,52,50,14,32,48)
DD_Iced_Latte$Protein_g <- c(12,11,10,11,11,9,11,10)
DD_Iced_Latte$Caffeine_mg <- c(166,166,80,166,166,166,166,166)

DD.IcedMacchiato<- c("Caramel Swirl","French Vanilla Swirl","Iced Macchiato","Mocha Swirl")
DD_Iced_Macchiato <- as.data.frame(DD.IcedMacchiato)
DD_Iced_Macchiato$Calories <- c(240,230,70,230)
DD_Iced_Macchiato$TotalFat_g <- c(0,0,0,1)
DD_Iced_Macchiato$SatFat_g <- c(0,0,0,0.5)
DD_Iced_Macchiato$TransFat_g <- c(0,0,0,0)
DD_Iced_Macchiato$Cholesterol_mg <- c(5,5,5,5)
DD_Iced_Macchiato$Sodium_mg <- c(150,150,100,125)
DD_Iced_Macchiato$TotalCarbs_g <- c(49,49,11,49)
DD_Iced_Macchiato$DietaryFiber_g <- c(0,0,0,2)
DD_Iced_Macchiato$Sugars_g <- c(47,46,9,43)
DD_Iced_Macchiato$Protein_g <- c(8,8,6,7)
DD_Iced_Macchiato$Caffeine_mg <- c(284,284,284,284)

DD.IcedCappuccino<- c("Caramel Swirl","French Vanilla Swirl","Iced Cappuccino","Mocha Swirl")
DD_Iced_Cappuccino <- as.data.frame(DD.IcedCappuccino)
DD_Iced_Cappuccino$Calories <- c(230,230,70,220)
DD_Iced_Cappuccino$TotalFat_g <- c(0,0,0,1)
DD_Iced_Cappuccino$SatFat_g <- c(0,0,0,0.5)
DD_Iced_Cappuccino$TransFat_g <- c(0,0,0,0)
DD_Iced_Cappuccino$Cholesterol_mg <- c(5,5,5,5)
DD_Iced_Cappuccino$Sodium_mg <- c(150,140,95,115)
DD_Iced_Cappuccino$TotalCarbs_g <- c(49,48,10,48)
DD_Iced_Cappuccino$DietaryFiber_g <- c(0,0,0,2)
DD_Iced_Cappuccino$Sugars_g <- c(47,46,9,43)
DD_Iced_Cappuccino$Protein_g <- c(8,8,6,7)
DD_Iced_Cappuccino$Caffeine_mg <- c(166,166,166,166)

SB.BottledTea<- c("Teavana Sparkling Unsweetened Peach Nectarine Green Tea",
                  "Teavana Mango Black Tea")
SB_Bottled_Tea <- as.data.frame(SB.BottledTea)
SB_Bottled_Tea$Calories <- c(0,100)
SB_Bottled_Tea$TotalFat_g <- c(0,0)
SB_Bottled_Tea$SatFat_g <- c(0,0)
SB_Bottled_Tea$TransFat_g <- c(0,0)
SB_Bottled_Tea$Cholesterol_mg <- c(0,0)
SB_Bottled_Tea$Sodium_mg <- c(15,10)
SB_Bottled_Tea$TotalCarbs_g <- c(1,24)
SB_Bottled_Tea$DietaryFiber_g <- c(0,0)
SB_Bottled_Tea$Sugars_g <- c(0,22)
SB_Bottled_Tea$Protein_g <- c(0,0)
SB_Bottled_Tea$Caffeine_mg <- c(16,55)

SB.IcedBlackTea<- c("Iced Black Tea","Iced Black Tea Lemonade","Iced Royal English Breakfast Tea",
                    "Iced London Fog Tea Latte")
SB_Iced_Black_Tea <- as.data.frame(SB.IcedBlackTea)
SB_Iced_Black_Tea$Calories <- c(0,50,140,140)
SB_Iced_Black_Tea$TotalFat_g <- c(0,0,2.5,2.5)
SB_Iced_Black_Tea$SatFat_g <- c(0,0,1.5,1.5)
SB_Iced_Black_Tea$TransFat_g <- c(0,0,0,0)
SB_Iced_Black_Tea$Cholesterol_mg <- c(0,0,10,10)
SB_Iced_Black_Tea$Sodium_mg <- c(10,10,70,70)
SB_Iced_Black_Tea$TotalCarbs_g <- c(0,12,25,25)
SB_Iced_Black_Tea$DietaryFiber_g <- c(0,0,0,0)
SB_Iced_Black_Tea$Sugars_g <- c(0,11,25,25)
SB_Iced_Black_Tea$Protein_g <- c(0,0,4,4)
SB_Iced_Black_Tea$Caffeine_mg <- c(25,25,40,40)

SB.IcedChaiTea<- c("Iced Chai Tea Latte")
SB_Iced_Chai_Tea <- as.data.frame(SB.IcedChaiTea)
SB_Iced_Chai_Tea$Calories <- c(240)
SB_Iced_Chai_Tea$TotalFat_g <- c(4)
SB_Iced_Chai_Tea$SatFat_g <- c(2)
SB_Iced_Chai_Tea$TransFat_g <- c(0)
SB_Iced_Chai_Tea$Cholesterol_mg <- c(15)
SB_Iced_Chai_Tea$Sodium_mg <- c(110)
SB_Iced_Chai_Tea$TotalCarbs_g <- c(44)
SB_Iced_Chai_Tea$DietaryFiber_g <- c(0)
SB_Iced_Chai_Tea$Sugars_g <- c(42)
SB_Iced_Chai_Tea$Protein_g <- c(7)
SB_Iced_Chai_Tea$Caffeine_mg <- c(95)

SB.IcedGreenTea<- c("Iced Peach Green Tea","Iced Peach Green Tea Lemonade","Iced Matcha Tea Latte",
                    "Iced Green Tea","Iced Green Tea Lemonade","Iced Matcha Lemonade")
SB_Iced_Green_Tea <- as.data.frame(SB.IcedGreenTea)
SB_Iced_Green_Tea$Calories <- c(60,80,200,0,50,120)
SB_Iced_Green_Tea$TotalFat_g <- c(0,0,5,0,0,0)
SB_Iced_Green_Tea$SatFat_g <- c(0,0,3,0,0,0)
SB_Iced_Green_Tea$TransFat_g <- c(0,0,0,0,0,0)
SB_Iced_Green_Tea$Cholesterol_mg <- c(0,0,20,0,0,0)
SB_Iced_Green_Tea$Sodium_mg <- c(20,20,120,10,10,10)
SB_Iced_Green_Tea$TotalCarbs_g <- c(15,21,29,0,12,29)
SB_Iced_Green_Tea$DietaryFiber_g <- c(0,0,1,0,0,1)
SB_Iced_Green_Tea$Sugars_g <- c(12,18,28,0,11,27)
SB_Iced_Green_Tea$Protein_g <- c(0,0,9,0,0,1)
SB_Iced_Green_Tea$Caffeine_mg <- c(25,25,80,25,25,80)

SB.IcedHerbalTea<- c("Iced Passion Tango Tea","Iced Passion Tango Tea Lemonade")
SB_Iced_Herbal_Tea <- as.data.frame(SB.IcedHerbalTea)
SB_Iced_Herbal_Tea$Calories <- c(0,50)
SB_Iced_Herbal_Tea$TotalFat_g <- c(0,0)
SB_Iced_Herbal_Tea$SatFat_g <- c(0,0)
SB_Iced_Herbal_Tea$TransFat_g <- c(0,0)
SB_Iced_Herbal_Tea$Cholesterol_mg <- c(0,0)
SB_Iced_Herbal_Tea$Sodium_mg <- c(10,10)
SB_Iced_Herbal_Tea$TotalCarbs_g <- c(0,12)
SB_Iced_Herbal_Tea$DietaryFiber_g <- c(0,0)
SB_Iced_Herbal_Tea$Sugars_g <- c(0,11)
SB_Iced_Herbal_Tea$Protein_g <- c(0,0)
SB_Iced_Herbal_Tea$Caffeine_mg <- c(0,0)

DD.IcedBlackTea<- c("Sweetened Tea","Unsweetened Tea","Sweet Tea")
DD_Iced_Black_Tea <- as.data.frame(DD.IcedBlackTea)
DD_Iced_Black_Tea$Calories <- c(100,5,230)
DD_Iced_Black_Tea$TotalFat_g <- c(0,0,0)
DD_Iced_Black_Tea$SatFat_g <- c(0,0,0)
DD_Iced_Black_Tea$TransFat_g <- c(0,0,0)
DD_Iced_Black_Tea$Cholesterol_mg <- c(0,0,0)
DD_Iced_Black_Tea$Sodium_mg <- c(20,20,20)
DD_Iced_Black_Tea$TotalCarbs_g <- c(26,1,60)
DD_Iced_Black_Tea$DietaryFiber_g <- c(0,0,0)
DD_Iced_Black_Tea$Sugars_g <- c(25,0,58)
DD_Iced_Black_Tea$Protein_g <- c(1,0,0)
DD_Iced_Black_Tea$Caffeine_mg <- c(67,67,67)

DD.IcedGreenTea<- c("Sweetened Green Tea","Unsweetened Green Tea")
DD_Iced_Green_Tea <- as.data.frame(DD.IcedGreenTea)
DD_Iced_Green_Tea$Calories <- c(100,5)
DD_Iced_Green_Tea$TotalFat_g <- c(0,0)
DD_Iced_Green_Tea$SatFat_g <- c(0,0)
DD_Iced_Green_Tea$TransFat_g <- c(0,0)
DD_Iced_Green_Tea$Cholesterol_mg <- c(0,0)
DD_Iced_Green_Tea$Sodium_mg <- c(10,10)
DD_Iced_Green_Tea$TotalCarbs_g <- c(25,0)
DD_Iced_Green_Tea$DietaryFiber_g <- c(0,0)
DD_Iced_Green_Tea$Sugars_g <- c(25,0)
DD_Iced_Green_Tea$Protein_g <- c(1,1)
DD_Iced_Green_Tea$Caffeine_mg <- c(64,64)

DD.IcedBlueberryTea<- c("Sweetened Blueberry Tea","Unsweetened Blueberry Tea","Sweet Blueberry Tea")
DD_Iced_Blueberry_Tea <- as.data.frame(DD.IcedBlueberryTea)
DD_Iced_Blueberry_Tea$Calories <- c(110,15,250)
DD_Iced_Blueberry_Tea$TotalFat_g <- c(0,0,0)
DD_Iced_Blueberry_Tea$SatFat_g <- c(0,0,0)
DD_Iced_Blueberry_Tea$TransFat_g <- c(0,0,0)
DD_Iced_Blueberry_Tea$Cholesterol_mg <- c(0,0,0)
DD_Iced_Blueberry_Tea$Sodium_mg <- c(20,20,20)
DD_Iced_Blueberry_Tea$TotalCarbs_g <- c(28,3,64)
DD_Iced_Blueberry_Tea$DietaryFiber_g <- c(0,0,0)
DD_Iced_Blueberry_Tea$Sugars_g <- c(25,0,60)
DD_Iced_Blueberry_Tea$Protein_g <- c(0,0,0)
DD_Iced_Blueberry_Tea$Caffeine_mg <- c(67,67,67)

DD.IcedRaspberryTea<- c("Sweetened Raspberry Tea","Unsweetened Raspberry Tea","Sweet Raspberry Tea")
DD_Iced_Raspberry_Tea <- as.data.frame(DD.IcedRaspberryTea)
DD_Iced_Raspberry_Tea$Calories <- c(110,15,250)
DD_Iced_Raspberry_Tea$TotalFat_g <- c(0,0,0)
DD_Iced_Raspberry_Tea$SatFat_g <- c(0,0,0)
DD_Iced_Raspberry_Tea$TransFat_g <- c(0,0,0)
DD_Iced_Raspberry_Tea$Cholesterol_mg <- c(0,0,0)
DD_Iced_Raspberry_Tea$Sodium_mg <- c(20,20,20)
DD_Iced_Raspberry_Tea$TotalCarbs_g <- c(28,3,64)
DD_Iced_Raspberry_Tea$DietaryFiber_g <- c(0,0,0)
DD_Iced_Raspberry_Tea$Sugars_g <- c(25,0,60)
DD_Iced_Raspberry_Tea$Protein_g <- c(0,0,0)
DD_Iced_Raspberry_Tea$Caffeine_mg <- c(67,67,67)

DD.CoconutRefresher<- c("Peach Passion","Strawberry Dragonfruit")
DD_Coconut_Refresher <- as.data.frame(DD.CoconutRefresher)
DD_Coconut_Refresher$Calories <- c(180,170)
DD_Coconut_Refresher$TotalFat_g <- c(4.5,4.5)
DD_Coconut_Refresher$SatFat_g <- c(3.5,3.5)
DD_Coconut_Refresher$TransFat_g <- c(0,0)
DD_Coconut_Refresher$Cholesterol_mg <- c(0,0)
DD_Coconut_Refresher$Sodium_mg <- c(65,65)
DD_Coconut_Refresher$TotalCarbs_g <- c(34,31)
DD_Coconut_Refresher$DietaryFiber_g <- c(0,0)
DD_Coconut_Refresher$Sugars_g <- c(30,28)
DD_Coconut_Refresher$Protein_g <- c(1,1)
DD_Coconut_Refresher$Caffeine_mg <- c(0,0)

DD.EnergyPunch<- c("Blue Raspberry","Strawberry")
DD_Energy_Punch <- as.data.frame(DD.EnergyPunch)
DD_Energy_Punch$Calories <- c(420,430)
DD_Energy_Punch$TotalFat_g <- c(0,0)
DD_Energy_Punch$SatFat_g <- c(0,0)
DD_Energy_Punch$TransFat_g <- c(0,0)
DD_Energy_Punch$Cholesterol_mg <- c(0,0)
DD_Energy_Punch$Sodium_mg <- c(460,420)
DD_Energy_Punch$TotalCarbs_g <- c(102,106)
DD_Energy_Punch$DietaryFiber_g <- c(0,1)
DD_Energy_Punch$Sugars_g <- c(96,96)
DD_Energy_Punch$Protein_g <- c(0,0)
DD_Energy_Punch$Caffeine_mg <- c(210,210)

DD.Refresher<- c("Peach Passion","Strawberry Dragonfruit")
DD_Refresher <- as.data.frame(DD.Refresher)
DD_Refresher$Calories <- c(130,130)
DD_Refresher$TotalFat_g <- c(0,0)
DD_Refresher$SatFat_g <- c(0,0)
DD_Refresher$TransFat_g <- c(0,0)
DD_Refresher$Cholesterol_mg <- c(0,0)
DD_Refresher$Sodium_mg <- c(15,15)
DD_Refresher$TotalCarbs_g <- c(32,29)
DD_Refresher$DietaryFiber_g <- c(0,0)
DD_Refresher$Sugars_g <- c(29,27)
DD_Refresher$Protein_g <- c(1,1)
DD_Refresher$Caffeine_mg <- c(0,0)

SB.Refresher <- c("Star Drink","Kiwi Starfruit","Kiwi Starfruit Lemonade","Dragon Drink",
                  "Mango Dragonfruit","Mango Dragonfruit Lemonade","Strawberry Acaí Lemonade",
                  "Pink Drink","Strawberry Acaí")
SB_Refresher <- as.data.frame(SB.Refresher)
SB_Refresher$Calories <- c(130,90,140,130,90,140,140,140,90)
SB_Refresher$TotalFat_g <- c(2.5,0,0,3,0,0,0,2.5,0)
SB_Refresher$SatFat_g <- c(2.5,0,0,2.5,0,0,0,2.5,0)
SB_Refresher$TransFat_g <- c(0,0,0,0,0,0,0,0,0)
SB_Refresher$Cholesterol_mg <- c(0,0,0,0,0,0,0,0,0)
SB_Refresher$Sodium_mg <- c(65,15,15,65,15,15,15,65,15)
SB_Refresher$TotalCarbs_g <- c(27,22,34,26,22,34,35,27,23)
SB_Refresher$DietaryFiber_g <- c(1,1,1,1,0,1,1,2,1)
SB_Refresher$Sugars_g <- c(23,19,30,23,19,31,32,24,20)
SB_Refresher$Protein_g <- c(1,0,0,1,0,0,0,1,0)
SB_Refresher$Caffeine_mg <- c(45,45,45,45,45,45,45,45,45)

SB.Juice <- c("BAYA Mango Guava","Evolution Fresh Vital Berry","Evolution Fresh Defense Up","Evolution Fresh Orange",
              "Evolution Fresh Super Fruit Greens","Evolution Fresh Mighty Watermelon","Tree Top Apple Juice",
              "BAYA Raspberry Lime","Lemonade","Blended Strawberry Lemonade")
SB_Juice <- as.data.frame(SB.Juice)
SB_Juice$Calories <- c(90,140,170,170,180,130,120,90,120,190)
SB_Juice$TotalFat_g <- c(0,0,0,0,0,0,0,0,0,0)
SB_Juice$SatFat_g <- c(0,0,0,0,0,0,0,0,0,0)
SB_Juice$TransFat_g <- c(10,0,0,0,0,0,0,0,0,0)
SB_Juice$Cholesterol_mg <- c(0,0,0,0,0,0,0,0,0,0)
SB_Juice$Sodium_mg <- c(10,0,0,10,170,10,25,0,10,200)
SB_Juice$TotalCarbs_g <- c(23,34,41,39,41,29,29,23,28,46)
SB_Juice$DietaryFiber_g <- c(0,0,0,0,3,2,0,0,0,0)
SB_Juice$Sugars_g <- c(23,32,37,35,36,25,26,22,27,45)
SB_Juice$Protein_g <- c(0,2,2,3,3,2,0,0,0,0)
SB_Juice$Caffeine_mg <- c(160,0,0,0,0,0,0,170,0,0)

SB.Milk <- c("Horizon Chocolate","Horizon Lowfat","Milk","Horizon Vanilla")
SB_Milk <- as.data.frame(SB.Milk)
SB_Milk$Calories <- c(150,150,260,140)
SB_Milk$TotalFat_g <- c(2.5,2.5,10,2.5)
SB_Milk$SatFat_g <- c(1.5,1.5,5,1.5)
SB_Milk$TransFat_g <- c(0,0,0,0)
SB_Milk$Cholesterol_mg <- c(10,10,40,15)
SB_Milk$Sodium_mg <- c(125,105,250,130)
SB_Milk$TotalCarbs_g <- c(24,23,25,22)
SB_Milk$DietaryFiber_g <- c(1,0,0,0)
SB_Milk$Sugars_g <- c(23,23,25,21)
SB_Milk$Caffeine_mg <- c(0,0,0,0)
SB_Milk$Protein_g <- c(8,0,17,8)


SB.SparklingWater <- c("Galvanina","Spindrift Grapefruit","Spindrift Raspberry Lime","Galvanina Lime")
SB_Sparkling_Water <- as.data.frame(SB.SparklingWater)
SB_Sparkling_Water$Calories <- c(0,15,9,0)
SB_Sparkling_Water$TotalFat_g <- c(0,0,0,0)
SB_Sparkling_Water$SatFat_g <- c(0,0,0,0)
SB_Sparkling_Water$TransFat_g <- c(0,0,0,0)
SB_Sparkling_Water$Cholesterol_mg <- c(0,0,0,0)
SB_Sparkling_Water$Sodium_mg <- c(10,0,0,10)
SB_Sparkling_Water$TotalCarbs_g <- c(0,4,2,0)
SB_Sparkling_Water$DietaryFiber_g <- c(0,0,0,0)
SB_Sparkling_Water$Sugars_g <-c(0,3,1,0)
SB_Sparkling_Water$Protein_g <- c(0,0,0,0)
SB_Sparkling_Water$Caffeine_mg <- c(0,0,0,0)

SB.Water <- c("DASANI","Ethos","Hawaii Volcanic","Water")
SB_Water <- as.data.frame(SB.Water)
SB_Water$Calories <- c(0,0,0,0)
SB_Water$TotalFat_g <- c(0,0,0,0)
SB_Water$SatFat_g <- c(0,0,0,0)
SB_Water$TransFat_g <- c(0,0,0,0)
SB_Water$Cholesterol_mg <- c(0,0,0,0)
SB_Water$Sodium_mg <- c(0,0,20,0)
SB_Water$TotalCarbs_g <- c(0,0,0,0)
SB_Water$DietaryFiber_g <- c(0,0,0,0)
SB_Water$Sugars_g <- c(0,0,0,0)
SB_Water$Protein_g <- c(0,0,0,0)
SB_Water$Caffeine_mg <- c(0,0,0,0)

DD.FrozenChocolate <- c("Caramel Swirl","French Vanilla","Frozen Chocolate")
DD_Frozen_Chocolate <- as.data.frame(DD.FrozenChocolate)
DD_Frozen_Chocolate$Calories <- c(700,700,690)
DD_Frozen_Chocolate$TotalFat_g <- c(14,14,15)
DD_Frozen_Chocolate$SatFat_g <- c(10,10,10)
DD_Frozen_Chocolate$TransFat_g <- c(0,0,0)
DD_Frozen_Chocolate$Cholesterol_mg <- c(35,35,30)
DD_Frozen_Chocolate$Sodium_mg <- c(290,280,250)
DD_Frozen_Chocolate$TotalCarbs_g <- c(135,135,134)
DD_Frozen_Chocolate$DietaryFiber_g <- c(1,1,3)
DD_Frozen_Chocolate$Sugars_g <- c(126,124,121)
DD_Frozen_Chocolate$Protein_g <- c(9,9,7)
DD_Frozen_Chocolate$Caffeine_mg <- c(6,6,6)

DD.FrozenCoffee <- c("Caramel Swirl","French Vanilla","Frozen Coffee","Mocha Swirl")
DD_Frozen_Coffee <- as.data.frame(DD.FrozenCoffee)
DD_Frozen_Coffee$Calories <- c(650,640,370,630)
DD_Frozen_Coffee$TotalFat_g <- c(4.5,4.5,0,5)
DD_Frozen_Coffee$SatFat_g <- c(3,3,0,3.5)
DD_Frozen_Coffee$TransFat_g <- c(0,0,0,0)
DD_Frozen_Coffee$Cholesterol_mg <- c(25,20,5,20)
DD_Frozen_Coffee$Sodium_mg <- c(180,180,115,150)
DD_Frozen_Coffee$TotalCarbs_g <- c(142,141,88,140)
DD_Frozen_Coffee$DietaryFiber_g <- c(0,0,0,2)
DD_Frozen_Coffee$Sugars_g <- c(135,133,84,129)
DD_Frozen_Coffee$Protein_g <- c(9,9,6,8)
DD_Frozen_Coffee$Caffeine_mg <- c(295,295,295,295)

DD.FrozenSpecialty <- c("Chai","Matcha")
DD_Frozen_Specialty <- as.data.frame(DD.FrozenSpecialty)
DD_Frozen_Specialty$Calories <- c(520,360)
DD_Frozen_Specialty$TotalFat_g <- c(9,0)
DD_Frozen_Specialty$SatFat_g <- c(5,0)
DD_Frozen_Specialty$TransFat_g <- c(0,0)
DD_Frozen_Specialty$Cholesterol_mg <- c(25,5)
DD_Frozen_Specialty$Sodium_mg <- c(160,70)
DD_Frozen_Specialty$TotalCarbs_g <- c(99,83)
DD_Frozen_Specialty$DietaryFiber_g <- c(2,1)
DD_Frozen_Specialty$Sugars_g <- c(96,82)
DD_Frozen_Specialty$Protein_g <- c(9,6)
DD_Frozen_Specialty$Caffeine_mg <- c(80,120)

DD.Coolata <- c("Blue Raspberry","Strawberry","Vanilla Bean")
DD_Coolata <- as.data.frame(DD.Coolata)
DD_Coolata$Calories <- c(350,350,590)
DD_Coolata$TotalFat_g <- c(0,0,4.5)
DD_Coolata$SatFat_g <- c(0,0,2.5)
DD_Coolata$TransFat_g <- c(0,0,0)
DD_Coolata$Cholesterol_mg <- c(0,0,15)
DD_Coolata$Sodium_mg <- c(45,15,240)
DD_Coolata$TotalCarbs_g <- c(84,86,129)
DD_Coolata$DietaryFiber_g <- c(0,1,0)
DD_Coolata$Sugars_g <- c(83,83,125)
DD_Coolata$Protein_g <- c(0,0,7)
DD_Coolata$Caffeine_mg <- c(0,0,0)

SB.CoffeeFrappe<- c("Mocha Cookie Crumble","Caramel Ribbon Crunch","Espresso","Caffè Vanilla",
                    "Caramel","Coffee","Mocha","Java Chip","White Chocolate Mocha")
SB_Coffee_Frappe <- as.data.frame(SB.CoffeeFrappe)
SB_Coffee_Frappe$Calories <- c(480,470,210,400,380,230,370,440,420)
SB_Coffee_Frappe$TotalFat_g <- c(24,22,2.5,14,16,3,15,18,17)
SB_Coffee_Frappe$SatFat_g <- c(15,14,1.5,9,10,2,10,12,11)
SB_Coffee_Frappe$TransFat_g <- c(0.5,0.5,0,0,0,0,0,0,0)
SB_Coffee_Frappe$Cholesterol_mg <- c(60,65,5,45,50,10,45,45,45)
SB_Coffee_Frappe$Sodium_mg <- c(270,280,210,230,230,230,220,260,260)
SB_Coffee_Frappe$TotalCarbs_g <- c(62,65,43,65,55,46,54,65,61)
SB_Coffee_Frappe$DietaryFiber_g <- c(2,0,0,0,0,0,1,2,0)
SB_Coffee_Frappe$Sugars_g <- c(55,60,42,64,54,45,51,60,61)
SB_Coffee_Frappe$Protein_g <- c(6,5,3,4,4,3,5,6,5)
SB_Coffee_Frappe$Caffeine_mg <- c(95,85,155,95,90,95,100,105,95)

SB.CremeFrappe<- c("Chocolate Cookie Crumble Creme","Caramel Ribbon Crunch Creme","Strawberry Creme","Chai Creme",
                   "Double Chocolaty Chip Creme","Matcha Creme","Vanilla Bean Creme","White Chocolate Creme")
SB_Creme_Frappe <- as.data.frame(SB.CremeFrappe)
SB_Creme_Frappe$Calories <- c(460,300,370,340,410,420,380,380)
SB_Creme_Frappe$TotalFat_g <- c(25,15,16,16,20,16,16,18)
SB_Creme_Frappe$SatFat_g <- c(16,10,10,10,13,10,10,12)
SB_Creme_Frappe$TransFat_g <- c(0.5,0,0.5,0.5,0.5,0.5,0.5,0.5)
SB_Creme_Frappe$Cholesterol_mg <- c(65,45,50,50,50,50,50,50)
SB_Creme_Frappe$Sodium_mg <- c(290,200,240,230,270,240,250,280)
SB_Creme_Frappe$TotalCarbs_g <- c(52,37,51,46,51,62,53,49)
SB_Creme_Frappe$DietaryFiber_g <- c(2,0,0,0,2,1,0,0)
SB_Creme_Frappe$Sugars_g <- c(46,34,51,45,47,61,52,49)
SB_Creme_Frappe$Protein_g <- c(7,4,5,5,7,6,5,6)
SB_Creme_Frappe$Caffeine_mg <- c(15,10,0,40,15,70,0,0)


ui <- dashboardPage(
  dashboardHeader(title = "Popular Coffee Shops"),
  skin = "black",
  dashboardSidebar(
    sidebarMenu(
      menuItem("Which Coffee Company?",tabName="dashboard",icon=icon("dashboard")),
      menuItem("Plots",tabName="c1",icon=icon("th")),
      menuItem("Simple Forecasting",tabName="c2",icon=icon("question")),
      menuItem("Nutrition Information",tabName="c3",icon=icon("circle"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName="dashboard",
              h1("Exploring Google Search Trends: Popular Coffee Shops"),
              h2("Introduction"),
              strong("The purpose of this app is to observe the interest of two popular coffee shops since 2004 to the present, as shown through Google search trends."),
              h2("Instructions"),
              strong("First, select the coffee shop you want to observe: Starbucks or Dunkin’. As you select one, the company logo will appear and the background will change to a color that reflects your choice."),
              strong("Second, go to the Plot tab. This is where you will observe Feature #1. You can select between four types of plots to show: full-time series, seasonality, autocorrelation, or decomposition. The plot will appear along with the interpretation. If you did not select a company, no plot will appear and you will see a message requesting that you do so."),
              strong("Third, go to the Simple Forecasting tab. This is where you will observe Feature #2. You can use the slider to select the number of years you want to forecast into the future, with choices being 1-10. As you select one, the plot will change to show three forecasting models: the mean model, naive model, and seasonal naive model. An explanation will appear underneath the plot, as well. If you did not select a company, there will be no plot and you will see a message requesting that you do so. "),
              selectInput("coffee",h3("Select a Coffee Company"),
                          choices= c("","Starbucks","Dunkin"),
                          selected = ""),
              uiOutput('style_tag'),
              imageOutput("Image")
      ),
      
      tabItem(tabName="c1",
              h1("Time Series Plot"),
              awesomeRadio(
                inputId = "plott",
                label = "Choose the Plot to Display", 
                choices = c("Full-Time Series", "Seasonality", "Autocorrelation", "Decomposition"),
                selected = "Full-Time Series"
              ),
              plotOutput("plot"),
              verbatimTextOutput("interpret")
      ),
      tabItem(tabName="c2",
              h1("Simple Forecasting"),
              sliderInput("h","How Many Years Do You Want to Forecast?", min=1, max=10,value=1),
              plotOutput("forecast"),
              verbatimTextOutput("forc")
      ),
      tabItem(tabName="c3",
              h1("Nutrition Information"),
              selectInput("hotcold",("What temperature do you want your drink to be?"),
                          choices= c("","Hot","Cold","Frozen"),
                          selected = ""),
              uiOutput("coffeeno"),
              dataTableOutput("nutr")
    )
  )
)
)

server <- function(input, output) {
  output$style_tag <- renderUI({
    if(input$coffee=='Starbucks')
      return(tags$head(tags$style(HTML('.content-wrapper {background-color:#00704A;}'))))
    
    if(input$coffee=='Dunkin')
      return(tags$head(tags$style(HTML('.content-wrapper {background-color:#FF671F;}'))))
    
  })
  
  output$Image <- renderImage({
    if(input$coffee == "") Leg <- "www/coffeecup.png"
    if(input$coffee == "Starbucks") Leg <- "www/SBLogo.png"
    if(input$coffee == "Dunkin") Leg <- "www/DunkinLogo.png"
    list(src=Leg)
  }, deleteFile = FALSE
  )
  
  output$interpret<- renderText({
    if(input$coffee == ""){
      paste("There is no plot to display because you have not selected a company.")} 
    else if(input$coffee == "Starbucks" & input$plott == "Full-Time Series"){
      paste("Google searches for Starbucks have trended upward since 2004 as both Starbucks and Google have increased in popularity and accessibility.", "There is strong seasonality within each year, likely corresponding with seasonal menu changes that appeal to the public. There does not", "appear to be cyclical behavior.",sep="\n")} 
    else if(input$coffee == "Dunkin" & input$plott == "Full-Time Series"){
      paste("Google searches for Dunkin’ have trended upward since 2004 as both Google and Dunkin' have increased in popularity and accessibility.", "There is strong seasonality within each year, likely corresponding with seasonal menu changes that appeal to the public. There does not", "appear to be cyclical behavior. There are a few interesting peaks, most notably in about late-2011 to early-2012. This may correspond", "either to big news stories involving Dunkin’, or drastic menu improvements. 
",sep="\n")} 
    else if(input$coffee == "Starbucks" & input$plott == "Seasonality"){
      paste("Since around 2010, Google searches for Starbucks have increased between April and May and then again between October and November. This lines up","with season changes- from spring to summer, then again from fall to winter. Starbucks is known to have menu changes that correspond with seasons," ,"so this lines up. A few other interesting notes about this plot are the sudden peaks in July 2008 and November 2015, as well as the sudden drops", "in April 2020 and October 2021.",sep="\n")} 
    else if(input$coffee == "Dunkin" & input$plott == "Seasonality"){
      paste("Since around 2012, Google searches for Dunkin’ have increased between April and May and then again between August and September. This lines up", "with season changes- from spring to summer, then again from summer to fall. Dunkin’ is known to have menu changes that correspond with seasons,","so this lines up. There are also large drops directly following these peaks. A few other interesting notes about this plot are the sudden peaks in", "May 2008 and December 2010.",sep="\n")} 
    else if(input$coffee == "Starbucks" & input$plott == "Autocorrelation"){
      paste("It is clear there is a trend in the data for Google searches for Starbucks because the autocorrelations for small lags are larger, and there is a", "slow decrease as lags increase. It is also clear there is seasonality because the bars appear to be scalloped since autocorrelations are larger", "for seasonal lags.",sep="\n")} 
    else if(input$coffee == "Dunkin" & input$plott == "Autocorrelation"){
      paste("It is clear there is a trend in the data for Google searches for Dunkin’ because the autocorrelations for small lags are larger, and there is a", "slow decrease as lags increase. It is also clear there is seasonality because the bars appear to be slightly scalloped since autocorrelations are", "larger for seasonal lags.",sep="\n")} 
    else if(input$coffee == "Starbucks" & input$plott == "Decomposition"){
      paste("Additive decomposition is used because the magnitude of the seasonal fluctuation does not vary much with the level of the time series. This", "decomposition shows that randomness is actually quite relevant to the overall data since the scale is actually larger than the one for seasonality.", "This means there is a lot of white noise.",sep="\n")} 
    else{
      paste("Additive decomposition is used because the magnitude of the seasonal fluctuation does not vary much with the level of the time series. This", "decomposition shows that randomness is actually quite relevant to the overall data since the scale is actually larger than the one for seasonality.","This means there is a lot of white noise.",sep="\n")} 
  })
  
  output$plot <- renderPlot({
    if (input$coffee == "Starbucks" & input$plott == "Full-Time Series"){
      autoplot(s_trends) + labs(title="Starbucks", y= "Interest (Relative to Peak)")} 
    else if (input$coffee == "Dunkin" & input$ plott == "Full-Time Series"){
      autoplot(d_trends) + labs(title="Dunkin",y="Interest (Relative to Peak)")}
    else if(input$coffee == "Starbucks" & input$plott == "Seasonality"){
      gg_season(s_trends) + labs(title="Seasonality of Starbucks", y="Interest (Relative to Peak)")}
    else if(input$coffee == "Dunkin" & input$plott == "Seasonality"){
      gg_season(d_trends) + labs(title="Seasonality of Dunkin", y="Interest (Relative to Peak)")}
    else if(input$coffee == "Starbucks" & input$plott == "Autocorrelation"){
      ACF(s_trends) %>% autoplot() + labs(title="Autocorrelation of Starbucks")}
    else if(input$coffee == "Dunkin" & input$plott == "Autocorrelation"){
      ACF(d_trends) %>% autoplot() + labs(title="Autocorrelation of Dunkin")}
    else if(input$coffee == "Starbucks" & input$plott == "Decomposition"){
      s_trends %>% model(classical_decomposition(Starbucks,type="additive")) %>% components() %>%  autoplot() + labs(title="Classical Additive Decomposition of Starbucks")}
    else if(input$coffee == "Dunkin" & input$plott == "Decomposition"){
      d_trends %>% model(classical_decomposition(Dunkin,type="additive")) %>% components() %>%  autoplot() + labs(title="Classical Additive Decomposition of Dunkin")}
    else{
      paste("There is no plot to display because you have not chosen a company.")
    }})
  
  hh <- reactive({ input$h * 12})
  
  output$forecast <- renderPlot({
    if(input$coffee == "Starbucks"){
      train <- s_trends %>% 
        filter_index("2004 Jan" ~ "2022 Mar") 
      ss_fit <- train %>% model(
        "Mean" = MEAN(Starbucks),
        "Naive" = NAIVE(Starbucks),
        "Seasonal Naive" = SNAIVE(Starbucks)
      )
      ss_fc <- ss_fit %>% forecast(h=hh())
      ss_fc %>% 
        autoplot(train,level=NULL)+
        autolayer(
          filter_index(s_trends, "2004 Jan"~"2022 Mar"),
          colour="black"
        ) +
        labs(
          y = "Interest",
          title = "Forecasts for Monthly Starbucks Searches"
        ) +
        guides(colour= guide_legend(title="Forecast"))}
    else if (input$coffee == "Dunkin"){
      train2 <- d_trends %>% 
        filter_index("2004 Jan" ~ "2022 Mar") 
      dd_fit <- train2 %>% model(
        "Mean" = MEAN(Dunkin),
        "Naive" = NAIVE(Dunkin),
        "Seasonal Naive" = SNAIVE(Dunkin)
      )
      dd_fc <- dd_fit %>% forecast(h=hh())
      dd_fc %>% 
        autoplot(train2,level=NULL)+
        autolayer(
          filter_index(d_trends, "2004 Jan"~"2022 Mar"),
          colour="black"
        ) +
        labs(
          y = "Interest",
          title = "Forecasts for Monthly Dunkin Searches"
        ) +
        guides(colour= guide_legend(title="Forecast"))}
    else{
      paste("There is nothing to display.")
    }
  })
  
  output$forc <- renderText({
    if(input$coffee== ""){
      paste("There is no forecasting plot to disply because you have not chosen a company.")}
    else{
      paste("These three simple models are used mostly as a benchmark for more advanced forecasting. The mean model forecasts all future values to be equal to", "the average of the historical data. The naive model forecasts all future values to be equal to the most recent observed value. The seasonal naive", "mode forecasts all future values to follow the exact same seasonal pattern as the most reason season. While one may argue that it is unecessary", "to even look at these models since they are unlikely to be true to the future, it is important to understand that they still hold importance…", "After all, all models are wrong, but some are useful!",sep="\n")
    }
  })
  
  cofnos <- reactive({
    switch(input$hotcold,
           "Hot" = c("Americano","Coffee","Espresso","Flat White","Latte","Macchiato","Mocha","Black Tea","Chai Tea","Green Tea","Herbal Tea","Hot Chocolate","Hot Juice","Steamer"),
           "Cold" = c("Iced Americano","Iced Coffee","Cold Brew","Iced Flat White","Iced Latte","Iced Macchiato","Iced Mocha","Nitro Cold Brew","Shaken Espresso","Iced Black Tea","Bottled Tea","Iced Chai Tea","Iced Green Tea","Iced Herbal Tea","Juice","Milk","Refresher","Sparkling Water","Still Water"),
           "Frozen" = c("Coffee Frappuccino","Creme Frappuccino")
    )})
  
  cofnod <- reactive({
    switch(input$hotcold,
           "Hot" = c("Americano","Cappuccino","Coffee","Espresso","Latte","Macchiato","Black Tea","Green Tea","Herbal Tea","Hot Chocolate"),
           "Cold" = c("Iced Americano","Iced Cappuccino","Iced Coffee","Cold Brew","Iced Latte","Iced Macchiato","Coconut Refresher","Energy Punch","Refresher","Iced Black Tea","Iced Blueberry Tea","Iced Green Tea","Iced Raspberry Tea"),
           "Frozen" = c("Frozen Chocolate","Frozen Coffee","Coolata","Frozen Specialty"))
  })
  
  cofnoo <- reactive({
    switch(input$hotcold,
           "Hot" = c("",""),
           "Cold" = c("",""))
  })
    
    output$coffeeno <- renderUI({
      if(input$coffee=="Starbucks"){
        selectInput("cn","Choose which type of drink you want:",cofnos())
      } else if(input$coffee=="Dunkin"){
      selectInput("cn","Choose which type of drink you want:",cofnod())
      } else{
      selectInput("cn","You need to select a coffee company.",cofnoo())
      }
    })
    
    output$nutr <- renderDataTable({
      if(input$coffee=="Starbucks" & input$cn== "Americano"){
        data= SB_Americano
      }
      else if(input$coffee=="Starbucks" & input$cn == "Coffee"){
        data=SB_Hot_Coffee
        } 
      else if(input$coffee=="Starbucks" & input$cn == "Espresso"){
        data=SB_Espresso_Shots
        } 
      else if(input$coffee=="Starbucks" & input$cn == "Flat White"){
        data=SB_Flat_White
        }
      else if(input$coffee=="Starbucks" & input$cn == "Latte"){
        data=SB_Latte
        }
      else if(input$coffee=="Starbucks" & input$cn == "Macchiato"){
        data=SB_Macchiato
        }
      else if(input$coffee=="Starbucks" & input$cn== "Mocha"){
        data=SB_Mocha
      }
      else if(input$coffee=="Dunkin" & input$cn == "Americano"){
        data=DD_Americano
      }
      else if(input$coffee=="Dunkin" & input$cn == "Cappuccino"){
        data=DD_Cappuccino
      }
      else if(input$coffee=="Dunkin" & input$cn == "Coffee"){
        data=DD_Hot_Coffee
      }
      else if(input$coffee=="Dunkin" & input$cn == "Espresso"){
        data=DD_Espresso_Shots
      }
      else if(input$coffee=="Dunkin" & input$cn == "Latte"){
        data=DD_Latte
      }
      else if(input$coffee=="Dunkin" & input$cn == "Macchiato"){
        data=DD_Macchiato
      }
      
      else if(input$coffee=="Starbucks" & input$cn == "Black Tea"){
        data=SB_Black_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn == "Chai Tea"){
        data=SB_Chai_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn == "Green Tea"){
        data=SB_Green_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn == "Herbal Tea"){
        data=SB_Herbal_Tea
      }
      else if(input$coffee=="Dunkin" & input$cn == "Black Tea"){
        data=DD_Black_Tea
      }
      else if(input$coffee=="Dunkin" & input$cn == "Green Tea"){
        data=DD_Green_Tea
      }
      else if(input$coffee=="Dunkin" & input$cn == "Herbal Tea"){
        data=DD_Herbal_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn =="Hot Chocolate"){
        data=SB_Hot_Chocolate
      }
      else if(input$coffee=="Starbucks" & input$cn =="Hot Juice"){
        data=SB_Hot_Juice
      }
      else if(input$coffee=="Starbucks" & input$cn =="Steamer"){
        data=SB_Steamer
      }
      else if(input$coffee=="Dunkin" & input$cn =="Hot Chocolate"){
        data=DD_Hot_Chocolate
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Americano"){
        data=SB_Iced_Americano
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Coffee"){
        data=SB_Iced_Coffee
      }
      else if(input$coffee=="Starbucks" & input$cn =="Cold Brew"){
        data=SB_Cold_Brew
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Flat White"){
        data=SB_Iced_Flat_White
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Latte"){
        data=SB_Iced_Latte
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Macchiato"){
        data=SB_Iced_Macchiato
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Mocha"){
        data=SB_Iced_Mocha
      }
      else if(input$coffee=="Starbucks" & input$cn =="Nitro Cold Brew"){
        data=SB_Nitro_Cold_Brew
      }
      else if(input$coffee=="Starbucks" & input$cn == "Shaken Espresso"){
        data=SB_Iced_Shaken_Espresso
      }
      else if(input$coffee=="Dunkin" & input$cn =="Iced Americano"){
        data=DD_Iced_Americano
      }
      else if(input$coffee=="Dunkin" & input$cn =="Iced Coffee"){
        data=DD_Iced_Coffee
      }
      else if(input$coffee=="Dunkin" & input$cn == "Iced Cappuccino"){
        data=DD_Iced_Cappuccino
      }
      else if(input$coffee=="Dunkin" & input$cn =="Cold Brew"){
        data=DD_Cold_Brew
      }
      else if(input$coffee=="Dunkin" & input$cn =="Iced Latte"){
        data=DD_Iced_Latte
      }
      else if(input$coffee=="Dunkin" & input$cn =="Iced Macchiato"){
        data=DD_Iced_Macchiato
      }
      else if(input$coffee=="Starbucks" & input$cn == "Iced Black Tea"){
        data=SB_Iced_Black_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn =="Bottled Tea"){
        data=SB_Bottled_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Chai Tea"){
        data=SB_Iced_Chai_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Green Tea"){
        data=SB_Iced_Green_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn =="Iced Herbal Tea"){
        data=SB_Iced_Herbal_Tea
      }
      else if(input$coffee=="Dunkin" & input$cn =="Coconut Refresher"){
        data=DD_Coconut_Refresher
      }
      else if(input$coffee=="Dunkin" & input$cn =="Energy Punch"){
        data=DD_Energy_Punch
      }
      else if(input$coffee=="Dunkin" & input$cn =="Refresher"){
        data=DD_Refresher
      }
      else if(input$coffee=="Dunkin" & input$cn =="Iced Black Tea"){
        data=DD_Iced_Black_Tea
      }
      else if(input$coffee=="Dunkin" & input$cn =="Iced Blueberry Tea"){
        data=DD_Iced_Blueberry_Tea
      }
      else if(input$coffee=="Dunkin" & input$cn =="Iced Green Tea"){
        data=DD_Iced_Green_Tea
      }
      else if(input$coffee=="Dunkin" & input$cn =="Iced Raspberry Tea"){
        data=DD_Iced_Raspberry_Tea
      }
      else if(input$coffee=="Starbucks" & input$cn =="Juice"){
        data=SB_Juice
      }
      else if(input$coffee=="Starbucks" & input$cn =="Refresher"){
        data=SB_Refresher
      }
      else if(input$coffee=="Starbucks" & input$cn =="Milk"){
        data=SB_Milk
      }
      else if(input$coffee == "Starbucks" & input$cn =="Sparkling Water"){
        data=SB_Sparkling_Water
      }
      else if(input$coffee =="Starbucks" & input$cn =="Still Water"){
        data=SB_Water
      }
      else if(input$coffee=="Starbucks" & input$cn == "Coffee Frappuccino"){
        data=SB_Coffee_Frappe
      }
      else if(input$coffee =="Starbucks" & input$cn =="Creme Frappuccino"){
        data=SB_Creme_Frappe
      }
      else if(input$coffee == "Dunkin" & input$cn == "Frozen Chocolate"){
        data=DD_Frozen_Chocolate
      }
      else if(input$coffee=="Dunkin" & input$cn == "Frozen Coffee"){
        data=DD_Frozen_Coffee
      }
      else if(input$coffee == "Dunkin" & input$cn == "Frozen Specialty"){
        data=DD_Frozen_Specialty
      }
      else if(input$coffee == "Dunkin" & input$cn =="Coolata"){
        data=DD_Coolata
      }
    })
    
    
    }
    

shinyApp(ui, server)





