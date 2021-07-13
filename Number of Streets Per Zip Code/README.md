# Exercise: Number of Streets Per Zip Code

## Table of Contents

- [DataSets](https://github.com/mukaruernest/StratascratchExercises/tree/master/Number%20of%20Streets%20Per%20Zip%20Code#dataset)
- [Questions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Number%20of%20Streets%20Per%20Zip%20Code#question)
- [Solutions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Number%20of%20Streets%20Per%20Zip%20Code#solution)
- [Approach](https://github.com/mukaruernest/StratascratchExercises/tree/master/Number%20of%20Streets%20Per%20Zip%20Code#approach)


More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?id=10182)

## DataSet

`sf_restaurant_health_violations`

**Table 1: sf_restaurant_health_violations**

This partial display of the table see the full table [here](https://platform.stratascratch.com/coding-question/output-preview)
<html><body>
<!--StartFragment-->

business_id | business_name | business_address | business_city | business_state | business_postal_code | business_latitude | business_longitude | business_location | business_phone_number | inspection_id | inspection_date | inspection_score | inspection_type | violation_id | violation_description | risk_category
-- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | --
5800 | John Chin Elementary School | 350 Broadway St | San Francisco | CA | 94133 | 37.798 | -122.403 | {'longitude':  '-122.403154', 'needs_recoding': False, 'latitude': '37.798358',  'human_address': '{"address":"","city":"","state":"","zip":""}'} |   | 5800_20171017 | 2017-10-17 | 98 | Routine - Unscheduled | 5800_20171017_103149 | Wiping cloths not clean or properly stored or inadequate sanitizer | Low Risk
64236 | Sutter Pub and Restaurant | 700 Sutter St | San Francisco | CA | 94102 | 37.789 | -122.412 | {'longitude':  '-122.41188', 'needs_recoding': False, 'latitude': '37.78881',  'human_address': '{"address":"","city":"","state":"","zip":""}'} |   | 64236_20170725 | 2017-07-25 | 88 | Routine - Unscheduled | 64236_20170725_103133 | Foods not protected from contamination | Moderate Risk
1991 | SRI THAI CUISINE | 4621 LINCOLN Way | San Francisco | CA | 94122 | 37.764 | -122.508 | {'longitude':  '-122.507779', 'needs_recoding': False, 'latitude': '37.764073',  'human_address': '{"address":"","city":"","state":"","zip":""}'} |   | 1991_20171129 | 2017-11-29 | 86 | Routine - Unscheduled | 1991_20171129_103139 | Improper food storage | Low Risk
3816 | Washington Bakery & Restaurant | 733 Washington St | San Francisco | CA | 94108 | 37.795 | -122.406 | {'longitude':  '-122.405845', 'needs_recoding': False, 'latitude': '37.795174',  'human_address': '{"address":"","city":"","state":"","zip":""}'} |   | 3816_20160728 | 2016-07-28 | 67 | Routine - Unscheduled | 3816_20160728_103108 | Contaminated or adulterated food | High Risk
39119 | Brothers Restaurant | 4128 GEARY Blvd | San Francisco | CA | 94118 | 37.781 | -122.464 | {'longitude':  '-122.463762', 'needs_recoding': False, 'latitude': '37.781148',  'human_address': '{"address":"","city":"","state":"","zip":""}'} |   | 39119_20160718 | 2016-07-18 | 79 | Routine - Unscheduled | 39119_20160718_103133 | Foods not protected from contamination | Moderate Risk
6643 | T & L FOOD MARKET | 405 EDDY St | San Francisco | CA | 94109 | 37.784 | -122.414 | {'longitude':  '-122.414341', 'needs_recoding': False, 'latitude': '37.783661',  'human_address': '{"address":"","city":"","state":"","zip":""}'} |   | 6643_20160609 | 2016-06-09 | 69 | Routine - Unscheduled | 6643_20160609_103102 | Unclean hands or improper use of gloves | High Risk
79974 | Antonelli Brothers Meat, Fish, and Poultry Inc. | 3585 California St | San Francisco | CA | 94118 |   |   |   | 14155757413 | 79974_20161017 | 2016-10-17 | 94 | Routine - Unscheduled | 79974_20161017_103161 | Low risk vermin infestation | Low Risk
1939 | STARBUCKS COFFEE CO. #603 | 74 NEW MONTGOMERY St | San Francisco | CA | 94105 | 37.788 | -122.401 | {'longitude':  '-122.400998', 'needs_recoding': False, 'latitude': '37.787838',  'human_address': '{"address":"","city":"","state":"","zip":""}'} |   | 1939_20161214 | 2016-12-14 | 98 | Routine - Unscheduled | 1939_20161214_103154 | Unclean or degraded floors walls or ceilings | Low Risk
68872 | Jiang Ling Cuisine Restaurant | 2517 SAN BRUNO Ave | San Francisco | CA | 94134 | 37.73 | -122.405 | {'longitude':  '-122.404526', 'needs_recoding': False, 'latitude': '37.729985',  'human_address': '{"address":"","city":"","state":"","zip":""}'} |   | 68872_20171212 | 2017-12-12 | 72 | Routine - Unscheduled | 68872_20171212_103105 | Improper cooling methods | High Risk
80242 | Wing Lee BBQ Restaurant | 501 Clement St. | San Francisco | CA | 94118 |   |   |   |   | 80242_20160509 | 2016-05-09 | 78 | Routine - Unscheduled | 80242_20160509_103149 | Wiping cloths not clean or properly stored or inadequate sanitizer | Low Risk

<!--EndFragment-->
</body>
</html>

## Question 

Find the number of different street names for each postal code, for the given business dataset. For simplicity, just count the first part of the name if the street name has multiple words. 

For example, East Broadway can be counted as East. East Main and East Broadly may be counted both as East, which is fine for this question. 

Counting street names should also be case insensitive, meaning FOLSOM should be counted the same as Folsom. Lastly, consider that some street names have different structures. For example, Pier 39 is not the same as 39 Pier, and E Broadway is not the same as East Broadway, so your solution should count both situations correctly.

Output the result along with the corresponding postal code. Order the result based on the number of streets in descending order and based on the postal code in ascending order.

## Solution

``` SQL
WITH
    combinedcolumns
    AS
    (
        SELECT business_postal_code, LOWER(SPLIT_PART(business_address, ' ', 1 )) street
        FROM sf_restaurant_health_violations
        WHERE business_address ~ '^[A-Za-z]' AND business_postal_code IS NOT NULL UNION ALL
        SELECT business_postal_code, LOWER(SPLIT_PART(business_address, ' ', 2)) street
        FROM sf_restaurant_health_violations
        WHERE business_address ~ '^[0-9]' AND business_postal_code IS NOT NULL
    )
SELECT business_postal_code, count(distinct street)
FROM combinedcolumns
GROUP BY business_postal_code
ORDER BY 2 DESC, 1 ASC
```

**Result**
This partial display of the table see the full table [here](https://platform.stratascratch.com/coding-question/output-preview)

<html><body>
<!--StartFragment-->

business_postal_code | count
-- | --
94103 | 16
94102 | 12
94133 | 11
94109 | 9
94107 | 8
94108 | 8
94110 | 8
94112 | 8
94104 | 7
94105 | 7
94114 | 6
94111 | 5
94115 | 5

<!--EndFragment-->
</body>
</html>

## Approach

- Consider situation where the address has different structure: with number on the first place and with street name on the first place
- Use the COUNT() function to count the street names.
- Use the SPLIT_PART() function to extract the street name from the business address.
- Use the LOWER() function to convert street names to lower case. It avoids recounting the same street name with different letter cases.
- Use GROUP BY to group records based on the postal code.


