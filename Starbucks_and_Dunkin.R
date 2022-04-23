library(shiny)
library(shinyWidgets)
library(shinythemes)
library(shinydashboard)
library(plotly)
library(DT)
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
              selectInput("hotcold",("Do you want a hot or cold drink?"),
                          choices= c("","Hot","Cold"),
                          selected = ""),
              uiOutput("coffeeno")
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
  
  cofno <- reactive({
    switch(input$hotcold,
           "Hot" = c("Coffee","Tea","Hot Chocolate"),
           "Cold" = c("Iced Coffee","Frappuccino","Tea","Energy Drink","Refresher","Water")
    )
  })
    
    output$coffeeno <- renderUI({
      selectInput("cn","Choose which type of drink you want (coffee or not):",cofno())
    })

  
}

shinyApp(ui, server)





