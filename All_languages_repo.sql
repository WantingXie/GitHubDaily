All the csv files are uploaded on Google BigQuery.
I selected a one month period from 2016-08-01 to 2016-09-01




SELECT repoName,(login) as login,(week) as time, sum(c) as commit_num
FROM [example-171516:GitHub_All.c] c, 
  [example-171516:GitHub_All.java] java, 
  [example-171516:GitHub_All.clojure] clojure,
  [example-171516:GitHub_All.cpp] cpp,
  [example-171516:GitHub_All.csharp] csharp,
  [example-171516:GitHub_All.go] go,
  [example-171516:GitHub_All.haskell] haskell,
  [example-171516:GitHub_All.javascript] javascript,
  [example-171516:GitHub_All.julia] julia,
  [example-171516:GitHub_All.ocaml] ocaml,
  [example-171516:GitHub_All.php] php,
  [example-171516:GitHub_All.python] python,
  [example-171516:GitHub_All.r] r,
  [example-171516:GitHub_All.ruby] ruby,
  [example-171516:GitHub_All.rust] rust,
  [example-171516:GitHub_All.scala] scala,
  [example-171516:GitHub_All.scheme] scheme 
WHERE week >='2016-08-01 00:00:00' and week<= '2016-09-01 00:00:00'
GROUP BY 1,2,3
ORDER BY 4 desc
