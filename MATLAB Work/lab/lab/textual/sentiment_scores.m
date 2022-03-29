%%% https://www.mathworks.com/help/textanalytics/ug/analyze-sentiment-in-text.html

filename = "messages.xlsx";
tbl = readtable(filename,'TextType','string');
head(tbl);

str = tbl.Messages;
documents = tokenizedDocument(str);

compoundScores = vaderSentimentScores(documents);

for i=1:size(compoundScores)
   sprintf("String:  %s\nScore %f",str(i),compoundScores(i)) 
    
end



