/*select all coloumns*/
select * from movies;

/*select only the title and id of first 10 rows*/
select title, movieid
from movies
where movieid <= '10';

/*find movies with id of 485*/
select title, movieid
from movies
where movieid = '485';

/*find id of movie Made in America(1993)*/
select movieid
from movies
where title = 'Made in America (1993)';

/*find the first 10 sorted alphabetically*/
select title, movieid
from movies
where movieid <= '10' ORDER BY title ASC;

/*find all movies from 2002*/
select title, movieid
from movies
where title like '%(2002)%';

/*find out what year the Godfather came out*/
select title, movieid
from movies
where title like '%Godfather, The%';

/*find all comedies */
select title, movieid, genres
from movies
where genres like '%Comedy%';

/*Find all comedies in the year 2000*/
select title, movieid, genres
from movies
where genres like '%Comedy%' and title like '%(2000)%';

/*Find any movies that are about death and are a comedy*/
select title, movieid, genres
from movies
where genres like '%Comedy%' and title like '%Death%';

/*Find any movies from either 2001 or 2002 with a title containing super*/
select title, movieid
from movies
where (title like '%(2001)%' or title like '%(2002)%') and title like '%Super%';

/*Joins*/
/*Find all the ratings for the movie Godfather, show just the title and the rating*/
select title, rating
from movies
  join ratings on movies.movieid = ratings.movieid
where movies.title like '%Godfather, The%';

/*Order the previous objective by newest to oldest*/
select title, rating, timestamp
from movies
  join ratings on movies.movieid = ratings.movieid
where movies.title like '%Godfather, The%' order by timestamp asc;

/*Find the comedies from 2005 and get the title and imdbid from the links table*/
select title, links.imdbid, genres
from movies
  join links on movies.movieid = links.movieid
where genres like '%Comedy%' and title like '%(2005)%';

/*Find all movies that have no ratings*/
select title, ratings.rating
from movies
left join ratings on movies.movieid = ratings.movieid
where rating isnull;

/*Find all fantasy movies using the many to many join between movies and genres through movie_genre table.*/
select title, genres
from movies
left outer join (movies_genre join genre on (movies.movieid = movie_genre.movieid ))
where genres like '%Fantasy%';

/*Hard Mode*/
/*Use concat and research about internet movie database to produce a valid url from the imdbid*/
select concat('www.imdb.com/title/tt0','368578','/?ref_=nv_sr_4'  );

/*Use concat and research about the movie database to produce a valid url from tmdbid*/
select concat('www.themoviedb.org/movie/','11637','-are-we-there-yet');

/*Get the ratings for The Usual Suspects and convert the timestamp into a human readable date time*/
select title, rating, timestamp
from movies
  join ratings on movies.movieid = ratings.movieid
where movies.title like '%Usual Suspects, The%';

/*Using SQL normalize the tags in the tags table. Make them lowercased and replace the spaces with -*/

/*The movie_genre table was produced by a sql query that could match a movie to the appropriate rows in genre without the use of the join table. Reproduce that query.*/
