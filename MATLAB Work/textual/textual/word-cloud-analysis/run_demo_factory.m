%%%https://www.mathworks.com/help/textanalytics/ug/visualize-text-data-using-word-clouds.html

filename = "factoryReports.csv";
tbl = readtable(filename,'TextType','string');

textData = tbl.Description;
textData(1:10)

figure
wordcloud(textData);
title("Factory Reports")

figure
labels = tbl.Category;

subplot(1,2,1)
idx = labels == "Leak";
wordcloud(textData(idx),'Color','blue');
title("Leak")

subplot(1,2,2)
idx = labels == "Mechanical Failure";
wordcloud(textData(idx),'Color','magenta');
title("Mechanical Failure")


figure
urgency = tbl.Urgency;

subplot(1,3,1)
idx = urgency == "Low";
wordcloud(textData(idx));
title("Urgency: Low")

subplot(1,3,2)
idx = urgency == "Medium";
wordcloud(textData(idx));
title("Urgency: Medium")

subplot(1,3,3)
idx = urgency == "High";
wordcloud(textData(idx));
title("Urgency: High")

cost = tbl.Cost;
idx = cost > 100;
figure
wordcloud(textData(idx),'HighlightColor','blue');
title("Cost > $100")

idx = cost > 1000;
figure
wordcloud(textData(idx),'HighlightColor','red');
title("Cost > $1,000")