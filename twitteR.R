consumer_key <- 'ZMx0TvdtotQaFKEJuOHMnqQkK'
consumer_secret <- 'P2r0S89VCfHaAcE04XJsKXNEW55nzJmvNDQ0dUtc0NTNdJmFe0'

access_token <- '1241904847789547520-1t9JD8jt9eVi4uO9XDmK1EYJ1tPnPH'
access_secret <- 'HCCH40D7rejqocrzjzKO9XehCKeoTEqplVEyweTInHQXK'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

1

tweets <- searchTwitter("keperawanan", n=80, since='2020-05-01')
tweets 

df <- do.call("rbind", lapply(tweets, as.data.frame))
View(df)

write.csv(df, "disabilitas.csv")

list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)

class(tweets)
tweets_text <- sapply(tweets, function(x) x$getText())
str(tweets_text)


tweets_corpus <- Corpus(VectorSource(tweets_text))
tweets_corpus

tweets_clean <- tm_map(tweets_corpus, function(x) iconv(enc2utf8(x), sub = "byte"))
tweets_clean <- tm_map(tweets_corpus, content_transformer(function(x)    iconv(enc2utf8(x), sub = "bytes")))
tweets_clean <- tm_map(tweets_corpus, content_transformer(stri_trans_tolower))
tweets_clean <- tm_map(tweets_corpus, removeWords, stopwords("english"))
tweets_clean <- tm_map(tweets_corpus, removeNumbers)
tweets_clean <- tm_map(tweets_corpus, stripWhitespace)

wordcloud(tweets_clean, random.order=F, col=rainbow(50))
wordcloud

tdm <- TermDocumentMatrix(tweets_clean)   
tdm

dtm <- DocumentTermMatrix(tweets_clean)   
dtm 

freq <- colSums(as.matrix(dtm))   
freq

wf <- data.frame(word=names(freq), freq=freq)   
head(wf)  

p <- ggplot(subset(wf, freq>50), aes(x = reorder(word, -freq), y = freq)) +
  geom_bar(stat = "identity") + 
  theme(axis.text.x=element_text(angle=45, hjust=1))
p   


print("abc");

1

print("abc")