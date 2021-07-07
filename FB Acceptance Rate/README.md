# Exercise: Acceptance Rate By Date

## Table of Contents

- [DataSets](https://github.com/mukaruernest/StratascratchExercises/tree/master/FB%20Acceptance%20Rate#dataset)
- [Questions](https://github.com/mukaruernest/StratascratchExercises/tree/master/FB%20Acceptance%20Rate#question)
- [Solutions](https://github.com/mukaruernest/StratascratchExercises/tree/master/FB%20Acceptance%20Rate#solution)
- [Conclusion](https://github.com/mukaruernest/StratascratchExercises/tree/master/FB%20Acceptance%20Rate#conclusion)

More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?id=10285&python=)

## DataSet

`fb_friend_requests`


**Table 1: fb_friend_requests**
<html><body>
<!--StartFragment-->

user_id_sender | user_id_receiver | date | action
-- | -- | -- | --
ad4943sdz | 948ksx123d | 2020-01-04 | sent
fg503kdsdd | ofp049dkd | 2020-01-04 | sent
dfdfxf9483 | 9djjjd9283 | 2020-01-04 | sent
hh643dfert | 847jfkf203 | 2020-01-04 | sent
ad4943sdz | 948ksx123d | 2020-01-06 | accepted
fffkfld9499 | 993lsldidif | 2020-01-06 | sent
fg503kdsdd | ofp049dkd | 2020-01-10 | accepted
fffkfld9499 | 993lsldidif | 2020-01-10 | accepted
r4gfgf2344 | 234ddr4545 | 2020-01-06 | sent
ffdfff4234234 | lpjzjdi4949 | 2020-01-06 | sent
r4gfgf2344 | 234ddr4545 | 2020-01-11 | accepted
dfdfxf9483 | 9djjjd9283 | 2020-01-15 | accepted

<!--EndFragment-->
</body>
</html>

## Question 

What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.

Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

## Solution

``` SQL
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
```

<html><body>
<!--StartFragment-->

date | acceptancerate
-- | --
2020-01-04 | 0.75
2020-01-06 | 0.667

<!--EndFragment-->
</body>
</html>

## Conclusion 

The question was easy but very tricky. I used the hints provided

- Assume that each friend request starts by a user sending a friend request that's logged in the table with action = 'sent'

- When a friend request is accepted, a notification is sent to the user that sent the original friend request and action = 'accepted'. This also means that the original user_id_sender is now logged as user_id_accepted and vice versa for the original receiver. You'll need to filter your tables using this logic.

- Create two tables using subqueries where you're filtering out 'sent' and 'accepted' rows

- Join the two tables using a left join 

- The acceptance rate calculation should be (number of acceptance / number of sent requests)

- Group by the friend request sent date and order by DESC
