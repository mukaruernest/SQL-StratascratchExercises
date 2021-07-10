SELECT bike_number, MAX(end_time) AS lasttimeused
FROM dc_bikeshare_q1_2012
GROUP BY bike_number
ORDER BY lasttimeused ASC