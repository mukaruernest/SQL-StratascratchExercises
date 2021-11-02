## Exercise: Reviews of Categories

## Table of Contents
- [DataSet](https://platform.stratascratch.com/coding-question/output-preview)
- [Question](https://github.com/mukaruernest/StratascratchExercises/tree/master/SalaryDifference#question)
- [Solution](https://github.com/mukaruernest/StratascratchExercises/tree/master/SalaryDifference#solution)
- [Result](https://github.com/mukaruernest/StratascratchExercises/tree/master/SalaryDifference#result)

More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding/10049-reviews-of-categories?python=)

## DataSet

`yelp_business`



**Table Name: yelp_business**
| business_id            | name                            | neighborhood  | address                        | city           | state | postal_code | latitude | longitude | stars | review_count | is_open | categories                                                                                            |
|------------------------|---------------------------------|---------------|--------------------------------|----------------|-------|-------------|----------|-----------|-------|--------------|---------|-------------------------------------------------------------------------------------------------------|
| G5ERFWvPfHy7IDAUYlWL2A | All Colors Mobile Bumper Repair |               | 7137 N 28th Ave                | Phoenix        | AZ    | 85051       | 33.448   | -112.074  | 1     | 4            | 1       | Auto Detailing;Automotive                                                                             |
| 0jDvRJS-z9zdMgOUXgr6rA | Sunfare                         |               | 811 W Deer Valley Rd           | Phoenix        | AZ    | 85027       | 33.683   | -112.085  | 5     | 27           | 1       | Personal Chefs;Food;Gluten-Free;Food Delivery Services;Event Planning & Services;Restaurants          |
| 6HmDqeNNZtHMK0t2glF_gg | Dry Clean Vegas                 | Southeast     | 2550 Windmill Ln, Ste 100      | Las Vegas      | NV    | 89123       | 36.042   | -115.118  | 1     | 4            | 1       | Dry Cleaning & Laundry;Laundry Services;Local Services;Dry Cleaning                                   |
| pbt3SBcEmxCfZPdnmU9tNA | The Cuyahoga Room               |               | 740 Munroe Falls Ave           | Cuyahoga Falls | OH    | 44221       | 41.14    | -81.472   | 1     | 3            | 0       | Wedding Planning;Caterers;Event Planning & Services;Venues & Event Spaces                             |
| CX8pfLn7Bk9o2-8yDMp_2w | The UPS Store                   |               | 4815 E Carefree Hwy, Ste 108   | Cave Creek     | AZ    | 85331       | 33.798   | -111.977  | 1.5   | 5            | 1       | Notaries;Printing Services;Local Services;Shipping Centers                                            |
| yzAB_pRwk8FJl3aILiiySA | CenturyLink                     | Spring Valley | 4850 S Fort Apache Rd, Ste 100 | Las Vegas      | NV    | 89147       | 36.101   | -115.297  | 1.5   | 35           | 0       | Home Services;Television Service Providers;Professional Services;Internet Service Providers;Utilities |
| p8keQs0xw0TzP0JjYPiZPQ | The Enfield Fox                 |               | 285 Enfield Place              | Mississauga    | ON    | L5B 3Y6     | 43.591   | -79.636   | 1.5   | 3            |         |                                                                                                       |

## Question 

Find the top business categories based on the total number of reviews. Output the category along with the total number of reviews. Order by total reviews in descending order.
## Solution

``` SQL
WITH categories AS
  (SELECT unnest(string_to_array(categories, ';')) AS category,
          review_count
   FROM yelp_business)
SELECT category,
       sum(review_count) as review_cnt
FROM categories
GROUP BY category
ORDER BY review_cnt DESC
```

## Result

| category        | review_cnt |
|-----------------|------------|
| Restaurants     | 1703       |
| Food            | 508        |
| Pizza           | 456        |
| Chinese         | 417        |
| Japanese        | 350        |
| Gluten-Free     | 344        |
| Sushi Bars      | 331        |
| American (New)  | 242        |
| Italian         | 222        |
| Nightlife       | 212        |
| Bars            | 212        |
| Modern European | 197        |
