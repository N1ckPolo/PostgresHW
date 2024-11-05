--Задание №2
--1.Название и продолжительность самого длительного трека.
SELECT track_title, track_duration  
  FROM trackinfo  
 WHERE track_duration = (SELECT MAX(track_duration) FROM trackinfo);

--2.Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_title, track_duration
  FROM trackinfo  
 WHERE track_duration >= 210;
 
-- 3.Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select mixtape_title, mixtape_year
  from mixtape
 where mixtape_year between 2018 and 2020;
 
-- 4.Исполнители, чьё имя состоит из одного слова.
select artist_name
  from artist 
 where artist_name not like '% %';
 
-- 5.Название треков, которые содержат слово «мой» или «my».
-- select track_title  
--   from trackinfo 
--  where lower(track_title) like '%you%';
-- --заменил 'my' на 'you'
select track_title 
  from trackinfo 
 where string_to_array(lower(track_title), ' ') && array ['my'];
 
-- Задание №3
-- 1.Количество исполнителей в каждом жанре.
select genre_name, count(artist_id) 
  from artistgenre ag
  join genre g 
    on ag.genre_id=g.genre_id 
 group by g.genre_name;

-- 2.Количество треков, вошедших в альбомы 2019–2020 годов.
select count(track_id) 
  from trackinfo t 
  join album a 
    on t.album_id = a.album_id
 where album_year between 2018 and 2020;
--заменил годы на 2018 - 2020

-- 3.Средняя продолжительность треков по каждому альбому.
select album_title, avg(track_duration) 
  from trackinfo t
  join album a 
    on t.album_id = a.album_id
 group by album_title;  

--4.Все исполнители, которые не выпустили альбомы в 2020 году.
select distinct artist_name 
  from artistalbum aa
  join artist ar 
    on aa.artist_id = ar.artist_id 
 where aa.artist_id not in (select artist_id 
 			      from artistalbum aa
 		              join album a 
                                on aa.album_id = a.album_id
 		             where album_year = 2019);
  --заменил год на 2019 
		            
-- 5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).          
select distinct mixtape_title
  from mixtape m
  join mixtapetracklist mt on m.mixtape_id = mt.mixtape_id
  join trackinfo tr on mt.track_id = tr.track_id
  join album al on tr.album_id = al.album_id
  join artistalbum aa on al.album_id = aa.album_id
  join artist ar on aa.artist_id = ar.artist_id
 where artist_name like '%Die Antwoord%';
 
 
--Задание №4 
--1.Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select ar.artist_name, al.album_title   
  from album al
  join artistalbum aa using(album_id)
  join artist ar using(artist_id)
  join artistgenre ag using(artist_id)
 where ar.artist_id = ag.artist_id 
 group by ar.artist_name, al.album_title
having count(genre_id) = 1
 order by ar.artist_name;

 --2.Наименования треков, которые не входят в сборники.
select track_id, track_title 
  from trackinfo t 
 where track_id not in (select track_id 
  	 		  from trackinfo t2
  			  join mixtapetracklist m using(track_id));
 
--3.Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — 
--теоретически таких треков может быть несколько.
select ar.artist_name, track_title, track_duration
  from trackinfo t
  join album al using(album_id)
  join artistalbum aa using(album_id)
  join artist ar using(artist_id)
 where aa.artist_id = ar.artist_id and track_duration in (select min(track_duration) from trackinfo where track_duration != 1) 
-- добавил в конце запроса 'where track_duration != 1', чтобы в выборку не попали тестовые треки из задания №2.5

--4.Названия альбомов, содержащих наименьшее количество треков.
select al.album_title, count(track_id) 
  from trackinfo t 
  join album al using(album_id) 
 group by al.album_title 
having count(track_id) = (select min(cnt)
  			    from (select al.album_title, count(track_id) as cnt
                                    from trackinfo t 
		                    join album al using(album_id)
	                           group by al.album_title) as sel);
--боже храни костыли:)
