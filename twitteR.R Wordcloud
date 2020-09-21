consumer_key <- '.....'
consumer_secret <- '......'

access_token <- '......'
access_secret <- '.....'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

1

tweets <- searchTwitter("keyword or hashtag", n=80, since='2020-05-01')
tweets 

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
