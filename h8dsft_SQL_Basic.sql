SELECT *
FROM 
--Quarter 1 2016
  (SELECT
    COUNT(trip_id) AS `Bikeshare Trip Count Q1 2016`
  FROM
    `bigquery-public-data.san_francisco.bikeshare_trips` AS trips 
  JOIN 
    `bigquery-public-data.san_francisco.bikeshare_stations` AS station
  ON
    trips.start_station_id = station.station_id
  WHERE
    trips.subscriber_type = 'Subscriber' 
    AND station.landmark = 'Redwood City'
    AND FORMAT_DATE('%Y',start_date) = '2016' 
    AND FORMAT_DATE('%Q',start_date)= '1'
  ) AS Q1

CROSS JOIN
-- Quarter 2 2016
  (SELECT
    COUNT(trip_id) AS `Bikeshare Trip Count Q2 2016`
  FROM
    `bigquery-public-data.san_francisco.bikeshare_trips` AS trips 
  JOIN 
    `bigquery-public-data.san_francisco.bikeshare_stations` AS station
  ON
    trips.start_station_id = station.station_id
  WHERE
    trips.subscriber_type = 'Subscriber' 
    AND station.landmark = 'Redwood City'
    AND FORMAT_DATE('%Y',start_date) = '2016' 
    AND FORMAT_DATE('%Q',start_date)= '2'
  ) AS Q2

