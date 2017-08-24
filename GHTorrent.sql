------------------------
---below is the count of developers for each project, 4 year, core developer selected 
----------------------------------

-- SELECT SUBSTR(url, 30) repoN, count (distinct(t1.committer_id)) as num_developers
-- FROM  [ghtorrent-bq.ght.commits] t1 INNER JOIN [ghtorrent-bq.ght.projects] t2 ON t1.project_id = t2.id
-- WHERE t1.committer_id in (SELECT coreDev_id from [example-171516:GitHub_4yr.Coredevelopers_id] GROUP BY 1)
-- AND t2.forked_from is null
-- --AND repoN not in (SELECT repoName from [example-171516:GitHub_All.python] GROUP BY 1)
-- AND language = 'Python'
-- //and author_id in (SELECT coreDev_id from [example-171516:GitHub_4yr.Coredevelopers_id] GROUP BY 1)
-- and t1.created_at >= '2015-10-01 00:00:00' and t1.created_at <='2016-07-01 00:00:00'
-- //and t1.created_at >= '2013-7-01 00:00:00' and t1.created_at <'2016-07-01 00:00:00'
-- GROUP BY 1
-- HAVING count (distinct(t1.committer_id)) >= 2
-- ORDER BY 2 desc 

-- ------------
 SELECT repoN, num_developers
 FROM [example-171516:GHTORRENT.Python_coreDevelopers_Repo_2015to2016]
 WHERE repoN not in (SELECT repoName from [example-171516:GitHub_All.python] GROUP BY 1)
