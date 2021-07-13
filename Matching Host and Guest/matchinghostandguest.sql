SELECT airbnb_hosts.host_id, airbnb_guests.guest_id
FROM airbnb_hosts
    INNER JOIN airbnb_guests
    ON 
            airbnb_hosts.nationality = airbnb_guests.nationality
        AND
        airbnb_hosts.gender = airbnb_guests.gender

