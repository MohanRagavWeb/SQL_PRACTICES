--1.Fetch the top 10 videos having more number of views.

SELECT
  name,
  no_of_views
FROM
  video
ORDER BY
  no_of_views DESC,
  name ASC
LIMIT
  10;

--2.Get all the review videos i.e., videos which contain "review" in their name.
SELECT
  name,
  no_of_views
FROM
  video
WHERE
  LOWER(name) LIKE '%review%'
ORDER BY
  no_of_views DESC;