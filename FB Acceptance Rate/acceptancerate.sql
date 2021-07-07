WITH
    sent
    AS
    (
        SELECT *
        FROM fb_friend_requests
        WHERE action = 'sent'
    ),
    accepted
    AS
    (
        SELECT *
        FROM fb_friend_requests
        WHERE action = 'accepted'
    )
SELECT s.date, COUNT(a.action)::FLOAT/COUNT(s.action) AS AcceptanceRate
FROM sent s
LEFT JOIN accepted a ON s.user_id_receiver = a.user_id_receiver
GROUP BY s.date
ORDER BY s.date ASC


