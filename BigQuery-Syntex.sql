T1 - [githubarchive:month.201706]
T2 - [github_repos.languages]
T3 - [github_repos.commits]

Time length is 2 weeks from 2017-06-11 to 2017-06-25

To study the collaoration patterns in GitHub, 17 programming languages were selected: 
C, C#, C++, Clojure, Go, Haskell, Java, Javascript, Julia, OCaml,
PHP, Python, R, Ruby, Rust, Scala, Scheme. 

--------------------------------------------------------------------------------------------------
1 - 17 languages, all events
-------------------------------------------------------------------------------------------------------
SELECT T2.language.name as Language, Count (distinct T1.repo.name) as repo_num, count (distinct T3.author.name) as Developer, count (distinct T3.commit) as Commits
FROM (SELECT * FROM [githubarchive:month.201706] 
      WHERE created_at>='2017-06-11 00:00' 
      and created_at<='2017-06-25 00:00') T1
join [[bigquery-public-data:github_repos.commits] T3
ON T3.committer.date = T1.created_at
JOIN (SELECT * FROM [bigquery-public-data:github_repos.languages] 
      WHERE language.name ='C' 
      or language.name = 'C#'
      or language.name = 'C++'
      or language.name = 'Clojure'
      or language.name = 'Go'
      or language.name = 'Haskell'
      or language.name = 'Java'
      or language.name = 'JavaScript'
      or language.name = 'Julia'
      or language.name = 'OCaml'
      or language.name = 'PHP'
      or language.name = 'Python'
      or language.name = 'R'
      or language.name = 'Ruby'
      or language.name = 'Rust'
      or language.name = 'Scala'
      or language.name = 'Scheme') T2
ON T2.repo_name = T1.repo.name
WHERE T2.language.name is not null
GROUP BY 1 
Order by 2 desc
Limit 20
-----------------------------------------------------------------------------
2 - 17 languages, 7 events
-------------------------------------------------------------------------------

SELECT T2.language.name as Language, Count (distinct T1.repo.url) as repo_num, count (distinct T3.author.name) as Developer, count (distinct T3.commit) as Commits
FROM (
  SELECT * FROM [githubarchive:month.201706] 
  WHERE created_at>='2017-06-11 00:00' and created_at<='2017-06-25 00:00'
  and type ='CommitCommentEvent'
       OR type = 'PushEvent'
       OR type = 'IssueCommentEvent'
       OR type = 'PullRequestEvent'
       OR type = 'PullRequestReviewCommentEvent'
       OR type = 'IssuesEvent'
       or type = 'createEvent') T1 
join [[bigquery-public-data:github_repos.commits] T3
ON T3.committer.date = T1.created_at
JOIN (SELECT * FROM [bigquery-public-data:github_repos.languages] 
        WHERE language.name ='C' 
        or language.name = 'C#'
        or language.name = 'C++'
        or language.name = 'Clojure'
        or language.name = 'Go'
        or language.name = 'Haskell'
        or language.name = 'Java'
        or language.name = 'JavaScript'
        or language.name = 'Julia'
        or language.name = 'OCaml'
        or language.name = 'PHP'
        or language.name = 'Python'
        or language.name = 'R'
        or language.name = 'Ruby'
        or language.name = 'Rust'
        or language.name = 'Scala'
        or language.name = 'Scheme') T2
ON T2.repo_name = T1.repo.name
WHERE T2.language.name is not null
GROUP BY 1 
Order by 2 desc
Limit 20


--------------------------------------------------------------
3 - all languages, 7 events
-------------------------------------------------------------------

SELECT T2.language.name as Language, Count (distinct T1.repo.name) as repo_num, count (distinct T3.author.name) as Developer, count (distinct T3.commit) as Commits
FROM (
  SELECT * FROM [githubarchive:month.201706] 
  WHERE created_at>='2017-06-11 00:00' and created_at<='2017-06-25 00:00'
  and type ='CommitCommentEvent'
       OR type = 'PushEvent'
       OR type = 'IssueCommentEvent'
       OR type = 'PullRequestEvent'
       OR type = 'PullRequestReviewCommentEvent'
       OR type = 'IssuesEvent'
       or type = 'createEvent') T1 
join [[bigquery-public-data:github_repos.commits] T3
ON T3.committer.date = T1.created_at
JOIN [bigquery-public-data:github_repos.languages]  T2
ON T2.repo_name = T1.repo.name
WHERE T2.language.name is not null
GROUP BY 1 
Order by 2 desc

------------------------------------------------------------------
4 - all languages, all events
-----------------------------------------------------------------
SELECT T2.language.name as Language, Count (distinct T1.repo.name) as repo_num, count (distinct T3.author.name) as Developer, count (distinct T3.commit) as Commits
FROM (SELECT * FROM [githubarchive:month.201706] 
      WHERE created_at>='2017-06-11 00:00' 
      and created_at<='2017-06-25 00:00') T1
join [[bigquery-public-data:github_repos.commits] T3
ON T3.committer.date = T1.created_at
JOIN [bigquery-public-data:github_repos.languages]  T2
ON T2.repo_name = T1.repo.name
WHERE T2.language.name is not null
GROUP BY 1 
Order by 2 desc
