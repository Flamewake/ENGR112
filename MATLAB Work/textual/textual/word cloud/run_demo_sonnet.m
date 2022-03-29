sonnets = string(fileread('sonnets.txt'));
extractBefore(sonnets,"II")

punctuationCharacters = ["." "?" "!" "," ";" ":"];
sonnets = replace(sonnets,punctuationCharacters," ");
words = split(join(sonnets));
words(strlength(words)<5) = [];
words = lower(words);
words(1:10)

C = categorical(words);
figure
wordcloud(C);
title("Sonnets Word Cloud")