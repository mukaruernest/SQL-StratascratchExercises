WITH categories AS
  (SELECT unnest(string_to_array(categories, ';')) AS category,
          review_count
   FROM yelp_business)
SELECT category,
       sum(review_count) as review_cnt
FROM categories
GROUP BY category
ORDER BY review_cnt DESC