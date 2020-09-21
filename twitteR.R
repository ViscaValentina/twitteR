#insert token given from twitter dev app

consumer_key <- '.....'
consumer_secret <- '......'

access_token <- '......'
access_secret <- '.....'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

#choose yes

1

#set what to search on twitter (keyword, hashtags, account, volume, period)

tweets <- searchTwitter("keyword or hashtag", n=80, since='2020-05-01')
tweets

#classify the tweets

class(tweets)
tweets_text <- sapply(tweets, function(x) x$getText())
str(tweets_text)

#turn the tweets into corpus
                      
tweets_corpus <- Corpus(VectorSource(tweets_text))
tweets_corpus
                      
#clean up the corpus

tweets_clean <- tm_map(tweets_corpus, function(x) iconv(enc2utf8(x), sub = "byte"))
tweets_clean <- tm_map(tweets_corpus, content_transformer(function(x)    iconv(enc2utf8(x), sub = "bytes")))
tweets_clean <- tm_map(tweets_corpus, content_transformer(stri_trans_tolower))
tweets_clean <- tm_map(tweets_corpus, removeWords, stopwords("english"))
tweets_clean <- tm_map(tweets_corpus, removeNumbers)
tweets_clean <- tm_map(tweets_corpus, stripWhitespace)
