kids = load'/root/kids.txt' using PigStorage(' ') as (name:chararray, age: int);
purchases = load'/root/purchases.txt' using PigStorage(' ') as (name:chararray, flavor: chararray);
invoice = Join kids BY name, purchases BY name;
A = filter invoice by (age == 10) or (age ==11) or (age==12);
B = group A by flavor ;
C = FOREACH B GENERATE group, COUNT(A.flavor);
D = order C by $1 DESC;
E = limit D 1;
store E into './flavor';