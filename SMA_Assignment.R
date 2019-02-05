############ LIBRARIES ###############

library(twitteR)
library(ROAuth)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(rtweet)
library(SnowballC)
library(tm)
library(syuzhet)
library(SnowballC)
library(tm)
library(tidyverse)
library(leaflet)
library(maps)
library(OpenStreetMap)




########### TEXT ######### ACTION ############

consumer_key <- 'wAfobsXY7iKTBZXB5rhMaeQpU'
consumer_secret <- 'byEWzfG2pDXHYenjh7r272mMmYDWvUG72ngrxDET83UW19Eg5f'
access_token <- '628498531-sVxf0mdYj5tY48ZzPzaolorYtF2SnrTZF5RTcvNn'
access_secret <- 'Lp8EFIG5mijEbvys9JhHYX8HPSeOTKdA8yDZfr2oepHSy'

create_token(app = "Rohit_SMA", 'wAfobsXY7iKTBZXB5rhMaeQpU', 'byEWzfG2pDXHYenjh7r272mMmYDWvUG72ngrxDET83UW19Eg5f', '628498531-sVxf0mdYj5tY48ZzPzaolorYtF2SnrTZF5RTcvNn','Lp8EFIG5mijEbvys9JhHYX8HPSeOTKdA8yDZfr2oepHSy')
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


tweets <- userTimeline("_sachinbansal", n=200)

head(tweets)
library(rtweet)
#get friends 
Friends = get_friends("_sachinbansal" , n = 200)
Friends
Followers = get_followers("_sachinbansal", n = 200)
Followers


#Retweets
Retweets = get_retweets("1069255840492896256", n = 20)
Retweets


#text analysis
#Cleaning data
tweets.df <- twListToDF(tweets) 

head(tweets.df)
tweets.df2 <- gsub("http.*","",tweets.df$text)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)
#Getting sentiment score for each tweet
#Emotions
word.df <- as.vector(tweets.df2) #convert it into vector

emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(tweets.df2, emotion.df) 

head(emotion.df2)
#Category of Emotions

#Sentiments
sent.value <- get_sentiment(word.df)

most.positive <- word.df[sent.value == max(sent.value)]
most.positive
most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative 

#Alternative 
category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0, "Positive", "Neutral"))

head(category_senti)
table(category_senti)



################## NETWORK ####################


head(tweets)
library(rtweet)
#get freinds 
Friends = get_friends("_sachinbansal" , n = 200)
Friends
Followers = get_followers("_sachinbansal", n = 200)
Followers


#Retweets
Retweets = get_retweets("1069255840492896256", n = 20)

ben_profile <- search_users("BenInquiring")



########### LOCATION #########################


tweets <- userTimeline("_sachinbansal", n=200)
tweets.df <-twListToDF(tweets)
write.csv(tweets.df, "/Users/anuj/Desktop/untitled folder/tweets1.csv") 

#an example of a file extension of the folder in which you want to save the .csv file.
read.csv("/Users/anuj/Desktop/untitled folder/tweets1.csv", stringsAsFactors = FALSE)
mymap <- read.csv("/Users/anuj/Desktop/untitled folder/tweets1.csv", stringsAsFactors = FALSE)
m <- leaflet(mymap) %>% addTiles()
m
m %>% addCircles(longitude ~longitude, latitude ~latitude, popup = mymap$type, weight = 8, radius = 40, color = "#fb3004", stroke = TRUE, fillOpacity = 0.8)





