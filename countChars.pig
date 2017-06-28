A = load '/root/in';
B = FOREACH A GENERATE  FLATTEN(TOKENIZE(LOWER((chararray)$0))) as words;
C = foreach B generate flatten(TOKENIZE(REPLACE(words,'','|'), '|')) as letter;
D = group C by letter;
E = FOREACH D GENERATE group,COUNT(C);
store E into './charCount';