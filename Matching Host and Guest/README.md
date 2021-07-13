# Exercise: Find matching hosts and guests in a way that they are both of the same gender and nationality 

## Table of Contents

- [DataSets](https://github.com/mukaruernest/StratascratchExercises/tree/master/Income%20by%20Title%20and%20Gender#datasets)
- [Questions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Income%20by%20Title%20and%20Gender#question)
- [Solutions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Income%20by%20Title%20and%20Gender#solution)
- [Approach](https://github.com/mukaruernest/StratascratchExercises/tree/master/Income%20by%20Title%20and%20Gender#approach)


More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?id=10078&python=)

## DataSets

`airbnb_hosts`
`airbnb_guests`

**Table 1: airbnb_hosts**
<html><body>
<!--StartFragment-->

host_id | nationality | gender | age
-- | -- | -- | --
0 | USA | M | 28
1 | USA | F | 29
2 | China | F | 31
3 | China | M | 24
4 | Mali | M | 30
5 | Mali | F | 30
6 | Luxembourg | M | 25
7 | Luxembourg | F | 25
8 | Australia | F | 33
9 | Australia | M | 35
10 | Brazil | M | 39
11 | Brazil | F | 42

<!--EndFragment-->
</body>
</html>

**Table 2: airbnb_guests**
<html><body>
<!--StartFragment-->

guest_id | nationality | gender | age
-- | -- | -- | --
0 | Mali | M | 21
1 | China | F | 23
2 | Mali | F | 27
3 | Australia | F | 24
4 | Luxembourg | M | 19
5 | USA | F | 33
6 | Brazil | M | 32
7 | China | M | 27
8 | Australia | M | 37
9 | USA | M | 29
10 | Luxembourg | F | 28
11 | Brazil | F | 24

<!--EndFragment-->
</body>
</html>


<html><body>
<!--StartFragment-->


## Question 

Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.

Output the host id and the guest id of matched pair

## Solution

``` SQL
SELECT airbnb_hosts.host_id, airbnb_guests.guest_id
FROM airbnb_hosts
    INNER JOIN airbnb_guests
    ON 
            airbnb_hosts.nationality = airbnb_guests.nationality
        AND
        airbnb_hosts.gender = airbnb_guests.gender
```

**Result**
<html><body>
<!--StartFragment-->

host_id | guest_id
-- | --
8 | 3
9 | 8
11 | 11
10 | 6
2 | 1
3 | 7
7 | 10
6 | 4

<!--EndFragment-->
</body>
</html>

## Approach

INNER JOIN on the nationality and the gender to combine records from both datasets.
