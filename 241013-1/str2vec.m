function vec = str2vec(vecstr)
str = "vec = [__];";
str = replace(str,'__',vecstr);
eval(str);
end