
## Exercise : Ranking Most Active Guests

## Table of Content
- [DataSet](https://github.com/mukaruernest/StratascratchExercises/tree/master/Ranking%20Most%20Active%20Users#dataset)
- [Question](https://github.com/mukaruernest/StratascratchExercises/tree/master/Ranking%20Most%20Active%20Users#question)
- [Solution](https://github.com/mukaruernest/StratascratchExercises/tree/master/Ranking%20Most%20Active%20Users#solution)
- [Results](https://github.com/mukaruernest/StratascratchExercises/tree/master/Ranking%20Most%20Active%20Users#result)

More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?id=10159&python=)

## DataSet

`airbnb_contacts`

**Table Name: airbnb_contacts**

_DataSet shows the first ten rows of the table, to view the full table follow [this link](https://platform.stratascratch.com/coding-question/output-preview)_
<html><body>
<!--StartFragment-->

id_guest | id_host | id_listing | ts_contact_at | ts_reply_at | ts_accepted_at | ts_booking_at | ds_checkin | ds_checkout | n_guests | n_messages
-- | -- | -- | -- | -- | -- | -- | -- | -- | -- | --
86b39b70-965b-479d-a0b0-719b195acea2 | 1dfb22ec-c20e-4bf9-b161-1607afa25c5a | d668de42-122a-45cd-b91f-91a70895f902 | 2014-04-18 09:32:23 | 2014-04-18 09:39:06 |   |   | 2014-12-31 | 2015-01-02 | 7 | 5
14f943bb-74e9-458b-be55-203dc7220688 | 3347390d-8670-4870-9dab-da30f3700141 | 14c47fb8-e831-4044-9674-9b3fd0499193 | 2014-10-06 06:55:45 | 2014-10-06 10:06:38 | 2014-10-06 10:06:38 | 2014-10-06 10:06:38 | 2014-11-03 | 2014-11-07 | 2 | 8
425aa1ed-82ab-4ecf-b62f-d61e1848706d | 02cafb86-5445-45cc-80f2-405291578356 | c5a4a913-a094-4a9d-82e2-0b2d4f9d9eeb | 2014-10-04 05:02:39 | 2014-10-04 23:10:01 |   |   | 2014-11-02 | 2014-11-09 | 2 | 2
bb490ede-8a70-4d61-a2e8-625855a393e2 | f49c3095-58de-4b8d-9d5b-3bfceceb47d8 | 27f4b429-d544-464f-b4b5-3c09fd5992e7 | 2014-08-31 11:46:11 | 2014-08-31 16:48:28 |   |   | 2014-11-03 | 2014-11-07 | 2 | 5
b2fda15a-89bb-4e6e-ae81-8b21598e2482 | 71f1d49e-2ff4-4d72-b8e6-fd4c67feaa74 | 95fb78ca-8e6e-436a-9830-949d995ad14f | 2014-10-08 15:07:56 | 2014-10-08 15:32:12 | 2014-10-08 15:32:12 | 2014-10-08 22:21:41 | 2014-11-06 | 2014-11-09 | 2 | 10
b8831610-31f2-4c58-8ada-63b3601ca476 | bdd8a691-31e2-48d8-b526-6a75a4363b89 | 9633168d-9834-4887-af97-6af7db1d96ab | 2014-10-14 04:05:14 | 2014-10-14 08:48:41 | 2014-10-14 08:48:41 |   | 2014-11-07 | 2014-11-29 | 2 | 17
136c10f8-af53-4e5a-a5b3-d9c9c495b166 | 6dc86890-53d7-4d06-b767-5e117762d76b | 2e6adb00-a660-465e-a85e-c8e341a5fb2f | 2014-12-06 20:24:54 | 2014-12-06 20:49:00 | 2014-12-06 20:51:56 | 2014-12-06 20:51:56 | 2014-12-12 | 2014-12-14 | 2 | 13
9a45a950-b4f7-4f16-abe6-f9286abf2641 | beeab7c3-ab4e-45d7-bde9-978de0fd8d57 | c318d3e3-b36e-43b8-9b0c-3400cbca3895 | 2014-10-11 21:15:30 | 2014-10-12 09:17:14 |   |   | 2014-10-24 | 2014-10-27 | 1 | 3
1759c05e-f12a-4eaa-8059-3bcaca443c88 | 200a661e-2758-45e9-8bcc-42e32342e6bd | e465ef3d-3c26-4c46-b515-4b24d10bcdf8 | 2014-10-31 12:40:58 | 2014-10-31 12:55:50 |   |   | 2014-10-31 | 2014-11-02 | 2 | 3
126ed661-fa20-4041-ac16-ec118bbcce3b | a33e4240-6a0c-47b4-b866-45f9b5952c18 | 2d77af55-7f10-41d6-93da-383cf59082b6 | 2014-10-03 12:02:49 | 2014-10-03 12:05:25 |   |   | 2014-10-25 | 2014-10-29 | 4 | 2

<!--EndFragment-->
</body>
</html>

## Question 

Rank guests based on the number of messages they've exchanged with the hosts. Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.

Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.

## Solution

``` SQL
SELECT
    DENSE_RANK() OVER(ORDER BY SUM(n_messages) DESC) AS Ranking, id_guest, SUM(n_messages) AS sum_n_message
FROM airbnb_contacts
Group by id_guest
Order by sum_n_message DESC
```

## Result 
<html><body>
<!--StartFragment-->

ranking | id_guest | sum_n_message
-- | -- | --
1 | 882f3764-05cc-436a-b23b-93fea22ea847 | 20
1 | 62d09c95-c3d2-44e6-9081-a3485618227d | 20
2 | 91c2a883-04e3-4bbb-a7bb-620531318ab1 | 17
2 | b8831610-31f2-4c58-8ada-63b3601ca476 | 17
3 | 6133fb99-2391-4d4b-a077-bae40581f925 | 16
3 | bdaf2e68-86dd-40d9-a5a1-9cc95ea25d91 | 16
4 | 94139517-e7e9-4afb-8b5d-bb6f306bf751 | 15
4 | 9b145027-2723-4c5f-988c-b5118c899912 | 15
4 | d328a4a0-df5f-4851-a864-a8845b45c1e0 | 15
5 | 136c10f8-af53-4e5a-a5b3-d9c9c495b166 | 13
5 | 6c541a87-d864-4de8-ae05-70ae57b50976 | 13
6 | 5dacf820-a573-4ce2-9fd8-0d7ed979b822 | 11
6 | 8375dde4-0de9-402c-8833-2127c1504601 | 11
7 | b2fda15a-89bb-4e6e-ae81-8b21598e2482 | 10
7 | 6a8cf97f-8a77-4b55-b79a-b560bca414a4 | 10
7 | bd8f3dd6-fecc-479a-a88f-1d0049600e9f | 10
8 | 5ed478e0-eae9-4537-826a-04ec779c1fd2 | 9
8 | 845e3c1d-6c06-4ef2-ade5-7eecefb56fbe | 9
8 | 125242de-91b4-43bd-a926-75ae4b7a9322 | 9
8 | 29ef2346-5fda-45d7-b4ed-eb34967a62b3 | 9
9 | 5c4b64d5-4869-4a02-b36c-c451758559e0 | 8
9 | aa9cf5bf-5667-4212-8018-1cb8beee530e | 8
9 | ca6a9321-d7f9-42e9-aeb1-5d1832034da0 | 8
9 | 02f0a750-34da-4268-94e8-f1a371f0460e | 8
9 | 14f943bb-74e9-458b-be55-203dc7220688 | 8
9 | 7e309181-e61e-426b-baef-dd031d5660d3 | 8
9 | 70180687-5888-4946-9578-83ab678cb997 | 8
9 | d418a1ab-b181-40a7-90fe-7216e40dc354 | 8
9 | 67aece73-e112-4e9e-9e05-8a2a94b003b9 | 8
9 | 25cfc206-89aa-4e63-b2f4-3cbb8631d9fb | 8
10 | f4602827-8672-4545-8887-43702f8c7ecc | 7
10 | 673af82f-6a4d-4fd5-8485-4459670da9bc | 7
10 | b6a8b1f9-5b40-4edd-91f3-ee522b0f9e5b | 7
11 | 8af13d02-bd2c-40fd-afd7-e4fe3a6a622e | 6
11 | fad1a097-a511-4f44-a603-6a271c1f159e | 6
11 | eaa8118b-aba6-4c25-96cd-c72f01d6b063 | 6
12 | 2889fccc-37ab-4a66-8d64-41b31314c7fc | 5
12 | eda96881-7b23-413a-9f6f-b45dc9fe2a5b | 5
12 | 176a2fb8-1de3-483a-92a3-34a826a91f5a | 5
12 | 86b39b70-965b-479d-a0b0-719b195acea2 | 5
12 | d61d88ae-7910-4832-8116-aab4603ab3b0 | 5
12 | bb490ede-8a70-4d61-a2e8-625855a393e2 | 5
12 | 3e6c2466-74fe-44c0-a6f3-dda79755d30a | 5
12 | 8d23aa41-c77c-4bbe-98bc-66abecfefbfe | 5
12 | 4ec2c8ec-9325-4b66-a370-820a56fbd1a3 | 5
12 | d528e24b-7c1f-446f-9bb0-a4ecb77c3acd | 5
12 | 72f07b78-99e1-46ac-8452-19dd2053eca3 | 5
13 | a9f7ffb1-4970-492b-b448-4bd9d0fbeef3 | 4
13 | a1a53da7-7a33-4693-8568-1d7f2cd32e31 | 4
13 | 3c3ec192-acd7-4c91-8e82-18cff7d859ec | 4
13 | 679d857b-08b8-4748-b703-86735aa42296 | 4
13 | 924f864f-db83-4945-9a65-cf42a657ca68 | 4
13 | 0f4ea370-702c-4f08-a00d-98e67c2a3574 | 4
13 | a09bf912-b21d-4859-b194-8512c30695f6 | 4
13 | a03f86ca-5c44-4e66-8695-71c380cfc48b | 4
13 | 20418fda-ffb2-46a3-9581-863725497c05 | 4
13 | 3e6fbc52-3e54-4a74-9ca1-7ce13048aab7 | 4
13 | e0d259e6-1b67-4964-a6dc-e8a8c69d3e01 | 4
13 | b91e6323-bd26-4172-9070-1a4993fdc397 | 4
13 | 6cbb33d1-6ecc-4f74-8b6a-a43d07d484b6 | 4
13 | 70a2c590-f854-4ca6-adf5-03fc081cfddf | 4
13 | e3cdd90a-8097-4220-9722-2b914d761a84 | 4
13 | f54989cf-459b-409d-be6a-9534a53cc4a9 | 4
13 | 1a66fe1c-fea6-4ec6-96c4-3ea3e0c7815e | 4
14 | b8285e97-9f11-4aec-bb05-e21f612ee41f | 3
14 | ffc234be-ca13-4bcb-a472-1c136b800891 | 3
14 | ebe81cf8-6037-43f2-81d2-fd386f5da74f | 3
14 | 2acf0e64-9da0-47c9-b0f9-1eceab379f84 | 3
14 | 9e5e2865-f257-4d19-9f79-9388ae925ad7 | 3
14 | 1759c05e-f12a-4eaa-8059-3bcaca443c88 | 3
14 | 9a45a950-b4f7-4f16-abe6-f9286abf2641 | 3
14 | f1877c99-430e-41e1-818a-713ff82f09da | 3
14 | c0075f4f-0cb0-489b-9f12-bf1dff573488 | 3
14 | 598f8459-96f6-4400-8bce-1474757dd589 | 3
14 | e8e41881-d3bf-4f1e-b55e-6052eae23ef6 | 3
15 | 15eb6f98-98ee-491e-8eeb-b5e2c61bfd8a | 2
15 | b3e35a8f-5503-4d78-adb8-7693097dfca7 | 2
15 | 4de8c8ea-728a-467a-aa69-4800e8880c95 | 2
15 | 67c4e87c-8a8f-4da4-a965-b89c9d74666b | 2
15 | 425aa1ed-82ab-4ecf-b62f-d61e1848706d | 2
15 | eb3500c2-b0b9-4753-8ab3-3fad4d5777f1 | 2
15 | 996d1871-8986-481b-8bbf-1a1420c68c90 | 2
15 | 37a63847-b09a-4f32-81a5-97cfb8e84c6d | 2
15 | be8a5e0c-e3fb-4517-a799-e1ed8a05b6e6 | 2
15 | 0a8e121b-c09c-4de1-abcc-81bce87de29e | 2
15 | 6cb23070-821b-467d-b4d0-af04645a0703 | 2
15 | 18d343e3-0ef0-4bb7-8cd9-b83d3fbbb82f | 2
15 | e079182c-7628-4f49-8301-29ff8b4938ec | 2
15 | 4995debc-b753-4401-b556-a2bcbb897eba | 2
15 | 7424d151-b449-40e1-9e8f-c258289c581c | 2
15 | 126ed661-fa20-4041-ac16-ec118bbcce3b | 2
15 | 0187b377-ad1c-4da4-8a17-568b2c9098f4 | 2
15 | e764ddb5-126e-4474-8e4e-4bdc330b51d1 | 2
15 | f5ba8f82-682e-4ec9-9c6e-cedc2cd628ca | 2
16 | ea445eea-3fac-4edd-b1d6-569f57f6abe4 | 1
16 | b11cd744-101d-409b-9a55-7e151f2e79d5 | 1

<!--EndFragment-->
</body>
</html>
