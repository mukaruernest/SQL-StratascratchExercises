SELECT hs.nationality, count(un.unit_id) AS NumberOfApartments
FROM airbnb_hosts hs
    INNER JOIN airbnb_units un ON hs.host_id = un.host_id
WHERE hs.age < 30 AND un.unit_type = 'Apartment'
GROUP BY nationality
ORDER BY NumberOfAparts DESC