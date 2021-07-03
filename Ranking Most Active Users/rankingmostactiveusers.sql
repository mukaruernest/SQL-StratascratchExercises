SELECT
    DENSE_RANK() OVER(ORDER BY SUM(n_messages) DESC) AS Ranking, id_guest, SUM(n_messages) AS sum_n_message
FROM airbnb_contacts
Group by id_guest
Order by sum_n_message DESC