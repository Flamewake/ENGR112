load 'birth-rates.mat'

figure;
bar(Ages,x1950,'r');
xlabel('Age Ranges');
ylabel('Birth Rate Per 1000 Women');
title('Birth Rate in the US 1950');

figure;
bar(Ages,x1980,'b');
xlabel('Age Ranges');
ylabel('Birth Rate Per 1000 Women');
title('Birth Rate in the US 1980');

figure;
bar(Ages,x2010,'y');
xlabel('Age Ranges');
ylabel('Birth Rate Per 1000 Women');
title('Birth Rate in the US 2010');

figure;

hold on;

bar(Ages,x1950,'r');
%bar(Ages,x1970);
bar(Ages,x1980,'b');
%bar(Ages,x1990);
%bar(Ages,x2000);
bar(Ages,x2010,'y');

legend('1950','1980','2010')

%legend('1950','1970','1980','1990','2000','2010');

xlabel('Age Ranges');
ylabel('Birth Rate Per 1000 Women');
title('Birth Rate in the US for Various Years');