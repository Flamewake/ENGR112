disp('I attest that I followed the JMU Honor Code')

%%% Task 2 - Loading Data

User1Data = readmatrix('user1.csv');
User2Data = readmatrix('user2.csv');
User3Data = readmatrix('user3.csv');
User4Data = readmatrix('user4.csv');
User5Data = readmatrix('user5.csv');
User6Data = readmatrix('user6.csv');
User7Data = readmatrix('user7.csv');
User8Data = readmatrix('user8.csv');
User9Data = readmatrix('user9.csv');
User10Data = readmatrix('user10.csv');

%%% Task 3 - Making a table

% Need # of list elements, mean, min, max
% User 1
User1Gaps = numel(User1Data);
User1Mean = mean(User1Data);
User1Min = min(User1Data);
User1Max = max(User1Data);

% User 2
User2Gaps = numel(User2Data);
User2Mean = mean(User2Data);
User2Min = min(User2Data);
User2Max = max(User2Data);

% User 3
User3Gaps = numel(User3Data);
User3Mean = mean(User3Data);
User3Min = min(User3Data);
User3Max = max(User3Data);

% User 4
User4Gaps = numel(User4Data);
User4Mean = mean(User4Data);
User4Min = min(User4Data);
User4Max = max(User4Data);

% User 5
User5Gaps = numel(User5Data);
User5Mean = mean(User5Data);
User5Min = min(User5Data);
User5Max = max(User5Data);

% User 6
User6Gaps = numel(User6Data);
User6Mean = mean(User6Data);
User6Min = min(User6Data);
User6Max = max(User6Data);

% User 7
User7Gaps = numel(User7Data);
User7Mean = mean(User7Data);
User7Min = min(User7Data);
User7Max = max(User7Data);

% User 8
User8Gaps = numel(User8Data);
User8Mean = mean(User8Data);
User8Min = min(User8Data);
User8Max = max(User8Data);

% User 9
User9Gaps = numel(User9Data);
User9Mean = mean(User9Data);
User9Min = min(User9Data);
User9Max = max(User9Data);

% User 10
User10Gaps = numel(User10Data);
User10Mean = mean(User10Data);
User10Min = min(User10Data);
User10Max = max(User10Data);

% Making table
analyzedTable = [User1Gaps, User1Mean, User1Min, User1Max; User2Gaps, User2Mean, User2Min, User2Max; 
User3Gaps, User3Mean, User3Min, User3Max; User4Gaps, User4Mean, User4Min, User4Max; User5Gaps, User5Mean, User5Min, User5Max; 
User6Gaps, User6Mean, User6Min, User6Max; User7Gaps, User7Mean, User7Min, User7Max; User8Gaps, User8Mean, User8Min, User8Max; 
User9Gaps, User9Mean, User9Min, User9Max; User10Gaps, User10Mean, User10Min, User10Max;];

% Exporting Table to excel
% writematrix(analyzedTable,'analyzedTable.xlsx')

%%% Task 5 - Making scatter plots for 5 users, to visualize gap lengths

% User 10
figure(1)
histogram(User10Data,10)
xlabel('Gap Length (Seconds)')
ylabel('Number of Gaps')
title('User 10 Gap Length Visualization')

% User 3
figure(2)
histogram(User3Data,10)
xlabel('Gap Length (Seconds)')
ylabel('Number of Gaps')
title('User 3 Gap Length Visualization')

% User 7
figure(3)
histogram(User7Data,10)
xlabel('Gap Length (Seconds)')
ylabel('Number of Gaps')
title('User 7 Gap Length Visualization')

% User 9
figure(4)
histogram(User9Data,10)
xlabel('Gap Length (Seconds)')
ylabel('Number of Gaps')
title('User 9 Gap Length Visualization')

% User 5
figure(5)
histogram(User5Data,10)
xlabel('Gap Length (Seconds)')
ylabel('Number of Gaps')
title('User 5 Gap Length Visualization')

%%% Task 7 - Appending lists to lists
AllUserData = cat(1,User1Data,User2Data,User3Data,User4Data,User5Data,User6Data,User7Data,User8Data,User9Data,User10Data);
figure(6)
histogram(AllUserData,20)
xlabel('Gap Length (Seconds)')
ylabel('Number of Gaps')
title('All Users Gap Length Visualization')

%%% Task 8 - Learning about then graphing the combined user data
AllUserMean = mean(AllUserData);
AllUserMin = min(AllUserData);
AllUserMax = max(AllUserData);
figure(7)
histogram(AllUserData,20)
xlabel('Gap Length (Seconds)')
ylabel('Number of Gaps')
title('All Users Gap Length Visualization')
hold on
plot(AllUserMean,0,'r.','MarkerSize',20)
plot(AllUserMin,0,'g.','MarkerSize',20)
plot(AllUserMax,0,'b.','MarkerSize',20)
legend('','Mean','Min','Max')
hold off

%%% Task 9 - Log Normal Fits
FitAllData = lognfit(AllUserData);
FitDataMean = mean(FitAllData);
FitDataSTDev = std(FitAllData);
AllDataLimit = logncdf(AllUserData,FitDataMean,FitDataSTDev);
figure(8)
plot(AllUserData,AllDataLimit)
xlabel('Gap Length (Seconds)')
ylabel('Probability of a Term Being Less Than X Value')
title('FIT DATA')