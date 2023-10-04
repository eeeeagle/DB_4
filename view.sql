/* VIEW */

/* TASK 1*/
CREATE
ALGORITHM = MERGE
VIEW artist_view_first_100
AS SELECT artist.ARTIST_ID AS artist_id, NAME as artist_name
FROM artist LIMIT 100;

CREATE
ALGORITHM = TEMPTABLE
VIEW release_artist_view
AS SELECT RELEASE_ID AS release_id, COUNTRY AS country, RELEASED as release_date, NOTES as notes
FROM discogs.release
WHERE MASTER_ID = 20683;

/* TASK 2 */
CREATE VIEW group_view
AS SELECT GROUP_ID AS group_id, MAIN_ARTIST_ID AS main_artist_id, GROUP_ARTIST_ID AS group_artist_id FROM discogs.group
WHERE GROUP_ID > -3230 AND GROUP_ID < -3220;

INSERT INTO group_view VALUE (-3222, -2178, 24578);

UPDATE group_view
SET group_artist_id = -21
WHERE main_artist_id = 2;

/* TASK 3 */
CREATE VIEW artist_view
AS SELECT NAME AS artist_name, PROFILE AS artist_profile, DATA_QUALITY AS data_quality
FROM artist;

INSERT INTO artist_view (artist_name, artist_profile, data_quality)
VALUE ("!!!ABOBA", "amogus", "sus");

SET SQL_SAFE_UPDATES = 0;

UPDATE artist_view 
SET artist_name = "Группа Сиськи", data_quality = "Correct"
WHERE data_quality = "sus";

SET SQL_SAFE_UPDATES = 1;

/* TASK 4 */
CREATE VIEW group_view_with_check
AS SELECT * FROM artist_view
WHERE artist_name = "Atom Heart"
WITH LOCAL CHECK OPTION;

SELECT * FROM group_view_with_check;

UPDATE group_view_with_check 
SET NAME = "HAHAHAHAHAHA" 
WHERE Data = "Correct";