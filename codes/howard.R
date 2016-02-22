### howard's code here #



## n gram
library (devtools)
devtools::install_github("wrathematics/ngram")

library(ngram)
x <- "a b a c a b b"

library(ngram)

text = "YUMMMYYY  wish I can eat donuts every single day and look like Olive Oil....(from Pop Eye)....

They make u fresh donuts.....Menu is behind the cashier counter on the wall.  YOu can order many favor or donuts and different kind of glaze and topping.

The donuts was so soft and yummy......Even when i had it left over night,  I microwaved it for 7 mins..Viola ..it still taste good....yummmmmm donuts"
ng <- ngram(text, n=3)

print(ng, output="truncated")
babble(ng, genlen=5, seed=1234)




#######
library("RWeka")
library("tm")

# Sets the default number of threads to use
options(mc.cores=1) ## parallel on Mac
text <- c("[multiple events] ??? BEIJING, March 26 (AFP) - Hundreds of workers in southern China's Guizhou province blocked roads in the provincial capital Monday and demanded up to a year in unpaid retirement and unemployment pay, reports and officials said.?? ??? Some 1,500 workers and pensioners from the Guizhou Number Seven Metallurgical Construction Company blocked several main roads in Guiyang, the Hong Kong-based Information Center for Human Rights and Democracy said.?? ??? The protesters also demanded that retirement pensions should be increased from 300 yuan (36 dollars) a month in accordance with provincial regulations, the center said.?? ??? Officials from Guiyang's Baiyun district government confirmed to AFP that the protests took place, but said only 300 people were involved and that by mid-afternoon Monday the protesters had peacefully dispersed.?? ??? Nearly 7,000 people, mostly construction workers, are employed by the company but some 3,000 retired workers and another 1,500 newly-laid off workers must also be taken care of, the center said.?? ??? In a related event, some 500 workers from the Xinye County Fertilizer Factory in central Henan province blocked streets in front of the county government office to demand a year of back pay, the center said.?? ??? Following the arrest of five managers of the factory in a corruption scandal last year, the factory was forced to stop production due to huge losses, leaving 800 workers idle, it said.?? ??? An official at the county offices told AFP that only 100 workers protested Monday morning and denied there was any corruption scandal at the fertilizer factory.?? ??? This kind of thing doesn't happen very often, only several times last year.?? This is the first time this year and these kinds of things are unavoidable during the restructuring of state-run enterprises, the official said by telephone.?? ??? China has seen a rising tide of labor unrest and peasant uprisings in recent years over fees, growing unemployment, a widening gap between rich and poor and government corruption.?? ??? Tens of millions of people have also been laid off from loss-making state-owned enterprises in the past four years as the government tries to streamline the economy for membership of the World Trade Organisation.?? ?? [Description of Source: Hong Kong AFP in English -- Hong Kong service of the independent French press agency Agence France-Presse]")
BigramTokenizer <- function(x) NGramTokenizer(x,Weka_control(min=2,max=5))
corpus <- Corpus(VectorSource(text))
tdm <- TermDocumentMatrix(corpus,control = list(tokenize = BigramTokenizer))

DF <- data.frame(inspect(tdm))
#DF$sums <- DF$X1+DF$X2+DF$X3+DF$X4+DF$X5+DF$X6
#MostFreqNgrams <- rownames(head(DF[with(DF,order(-sums)),]))

my_matrix <- as.matrix(tdm[findFreqTerms(tdm, lowfreq = 2),])
DF <- data.frame(my_matrix, sums = rowSums(my_matrix))
DF


##



## end of howard's code
