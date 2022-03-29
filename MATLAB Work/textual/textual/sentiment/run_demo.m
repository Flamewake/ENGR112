%%% https://www.mathworks.com/help/textanalytics/ug/analyze-sentiment-in-text.html

filename = "weekendUpdates.xlsx";
tbl = readtable(filename,'TextType','string');
head(tbl)

str = tbl.TextData;
documents = tokenizedDocument(str);
documents(1:5)

compoundScores = vaderSentimentScores(documents);

compoundScores(1:5);

idx = compoundScores > 0;
strPositive = str(idx);
strNegative = str(~idx);

figure
subplot(1,2,1)
wordcloud(strPositive);
title("Positive Sentiment")

subplot(1,2,2)
wordcloud(strNegative);
title("Negative Sentiment")