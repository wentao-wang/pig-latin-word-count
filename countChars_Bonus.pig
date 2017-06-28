A = load '/root/in';
B = FOREACH A GENERATE  FLATTEN(TOKENIZE(LOWER((chararray)$0))) as words;
C = foreach B generate flatten(TOKENIZE(REPLACE(words,'','|'), '|')) as letter;
D = group C by letter;
E = FOREACH D GENERATE group,COUNT(C);
F = filter E by (group=='a')OR(group=='e')OR(group=='i')OR(group=='o')OR(group=='u');
store F into './bonus';