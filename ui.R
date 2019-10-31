#ui.R

library(shinydashboard)
library(shiny)
source("chooser.R")
dashboardPage(
  skin="purple",
  dashboardHeader(title="Dota 2 Analysis"),
  dashboardSidebar(
    sidebarUserPanel("Minidotabuff"),
    sidebarMenu(
      menuItem("Intro to game", tabName = "intro"),
      menuItem("Quick Look", tabName = "ql",menuSubItem("Top Winning Ratio",tabName = "g1"),menuSubItem("Top Popular Heroes",tabName="g2"),menuSubItem("Top Rich Heroes",tabName = "g3"),menuSubItem("Top Popular Items",tabName="g4")),
      menuItem("Customised Heroes",tabName="compare"),
      menuItem("Pick one hero to see",tabName = "single"),
      menuItem("Four Teammates your choose", tabName="match"))
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "intro",
              h1("Introducing Dota 2"),
              h4("Dota Buff"),
              p("Dota 2 is a free-to-play multiplayer online battle arena (MOBA) video game developed and published by Valve Corporation.  
                Dota 2 is played in matches between two teams that consist of five players, with both teams occupying their own separate base on the map. Each of the ten players independently control a powerful character, known as a hero, that each feature unique abilities and different styles of play. During a match, 
                a player and their team collects experience points and items for their heroes in order to fight through the opposing team's defenses. A team wins by being the first to destroy a large structure located in the opposing team's base, called the Ancient.",style = "font-family: 'times'; font-si20pt"),
              #HTML('<center><img src="DotaTv.jpg" width="800"></center>'), some sary  
              br(),
              h3("Detail on this game"),
              p("Ten players each control one of the game's 123 playable characters, known as heroes, with each having their own design, benefits, 
                and weaknesses. Heroes are divided into two primary roles, known as the Carry and Support. Carries, which are also called \"cores\", begin each match as weak and vulnerable, 
                but are able to become more powerful later in the game, thus becoming able to \"carry\" their team to victory. Supports generally lack abilities that deal heavy damage, 
                instead having ones with more functionality and utility that provide assistance for their carries."),
              #HTML('<center><img src="Heroes.jpg" width="800"></center>'), 
              

              
      ),
      tabItem(tabName = "g1",
              fluidRow(sliderInput("Ng1","Number of Heroes to choose:",min=1,max=112,value=10)),
              fluidRow(column(8,plotOutput("g1", height = 500)),column(4,dataTableOutput("t1")))
              ),
      tabItem(tabName = "g2",
              fluidRow(sliderInput("Ng2","Number of Heroes to choose:",min=1,max=112,value=10)),
              fluidRow(column(8,plotOutput("g2", height = 500)),column(4,dataTableOutput("t2")))
      ),
      tabItem(tabName = "g3",
                fluidRow(sliderInput("Ng3","Number of Heroes to choose:",min=1,max=112,value=10)),
                fluidRow(column(8,plotOutput("g3", height = 500)),column(4,dataTableOutput("t3")))
      ),
      tabItem(tabName = "g4",
              fluidRow(sliderInput("Ng4","Number of Items to compare:",min=1,max=189,value=10)),
              fluidRow(column(8,plotOutput("g4", height = 500)),column(4,dataTableOutput("t4")))
      ),
      tabItem(tabName = "compare",
              column(6,chooserInput("mychooser", "Available Heroes", "Selected Heroes",as.vector(hname[,3]), c(), size = 10, multiple = TRUE)),
              column(6,img(src="header.jpg",width=300)),
              fluidRow(column(8,plotOutput("g5", height = 500)),column(4,dataTableOutput("t5")))
                       
              ),
      tabItem(tabName = "single",
              fluidRow(column(6,"Please select a hero:", selectInput("sig","Hero you choose",hname[,3])),
                       column(4,img(src="http://www.hdwallpaper.nu/wp-content/uploads/2019/02/dota_2_logo_wallpaper_download.jpg",height=150))),
              fluidRow(dataTableOutput("t6")),
              fluidRow(plotOutput("g6",height=400))
              ),
      tabItem(tabName= "match",
              fluidRow(column(6,selectInput("m1","Four Teammates you choose, don't repeat pick",hname[,3])),column(6,selectInput("m2","",hname[,3]))),
              fluidRow(column(6,selectInput("m3","",hname[,3])),column(6,selectInput("m4","",hname[,3]))),
              fluidRow(column(8,plotOutput("g7",height=400)),column(4,dataTableOutput("t7")))
              )
      
              
    )
  )
)

