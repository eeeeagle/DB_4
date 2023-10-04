/* INDEX */

/* TASK 1*/
CREATE INDEX artist_name_index on artist(NAME);

SELECT * FROM artist
WHERE NAME = "Atom Heart";
 
/* TASK 2*/
CREATE INDEX group_main_artist_id_index ON discogs.group(MAIN_ARTIST_ID);

EXPLAIN SELECT * FROM discogs.artist
WHERE discogs.artist.ARTIST_ID IN (
	SELECT GROUP_ARTIST_ID FROM artist
	JOIN discogs.group ON discogs.artist.ARTIST_ID = discogs.group.MAIN_ARTIST_ID
    WHERE discogs.artist.NAME = "Atom Heart"
);

/* TASK 3*/
CREATE INDEX release_artist_index on release_artist(ARTIST_ID);

EXPLAIN SELECT discogs.artist.NAME, TITLE, RELEASED FROM discogs.release
JOIN discogs.release_artist ON discogs.release_artist.RELEASE_ID = discogs.release.RELEASE_ID
JOIN discogs.artist on discogs.artist.ARTIST_ID = discogs.release_artist.ARTIST_ID
WHERE discogs.artist.NAME = "Pink Floyd" 
GROUP BY discogs.release.RELEASE_ID
ORDER BY discogs.release.RELEASED DESC;

/* TASK 4*/
CREATE INDEX release_index ON discogs.release(IS_MAIN_RELEASE, RELEASED);

SELECT discogs.release.TITLE, discogs.style.STYLE_NAME FROM discogs.release
JOIN discogs.style on discogs.release.RELEASE_ID = discogs.style.RELEASE_ID
WHERE year(discogs.release.RELEASED) = 1990 AND discogs.release.IS_MAIN_RELEASE = 1;

/* TASK 5*/
CREATE FULLTEXT INDEX artist_fulltext_index ON artist(PROFILE);

EXPLAIN ANALYZE SELECT * FROM artist 
WHERE MATCH (artist.PROFILE) AGAINST ("Russian");

SELECT discogs.artist.NAME FROM discogs.artist
WHERE MATCH (discogs.artist.PROFILE) AGAINST ("music");