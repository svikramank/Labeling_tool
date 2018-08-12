# A tool for creating labeled data for machine learning problems
This tool can be used to label images in order to create a structured supervised learning dataset for any machine learning or deep learning problem. 

The app is built in shiny (a package in R) and is hosted on shinyapps server. 

## Setup
In order to run this app in your local machine follow the steps - 
1. Install R and R Studio in your machine. 
2. Open R Studio. 
3. Change your working directory to this folder (shiny). 
4. Your current folder should have - 
   a. A ui.R file
   b. A server.R file
   c. A folder named www 
   d. A folder names images inside /www folder (Here you will keep all your images that you want to label). 
5. Open ui.R and server.R file in R Studio. 
6. Install the package shiny in R Studio in the console using command > install.packages("shiny")
7. Once you've installed the package, run the app by pressing the "Run App" button on the top right of editor panel. 
8. An app will open in your local R browser. 

Currently, the app is been made to create a labeled dataset for cat and dog images. This can be modified to label any number of classes and any number of images. 

## The UI of the App
The UI has a control panel on the left hand side. Currently there are 2 buttons to label the images as Cat or Dog along with a Previous and Next button to roll the images. 
The right hand side is the main panel which has 3 tabs - 
  Tab 1: This tab will display all the images one by one as you press the Next/Previous button.
  Tab 2: This tab will display the original unlabeled data that you have in your folder (/shiny/www/images)
  Tab 3: This is a structured labeled dataset that is being created dynamically as you keep on labeling the images. 
  
  There is a "Download the labeled data" button which can be used to download the tabel in the Tab 3 as a .csv file once you've labeled all your images. 
  
  
