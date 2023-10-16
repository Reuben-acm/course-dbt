1. What is our repeat rate ?
answer: 3.96
query:
WITH order_cohort AS (
    SELECT
        user_id,
        COUNT(DISTINCT order_id) AS user_orders
    FROM
        DEV_DB.DBT_RLACM10ICLOUDCOM.STG_POSTGRES_ORDERS
    GROUP BY
        1
),
user_bucket AS (
    SELECT
        user_id,
        (user_orders = 1)::INT AS has_one_purchase,
        (user_orders = 2)::INT AS has_two_purchase,
        (user_orders = 3)::INT AS has_three_purchase,
        (user_orders > 1)::INT AS has_twoplus_purchase
    FROM
        order_cohort
)

SELECT
    SUM(has_one_purchase) AS one_purchase,
    SUM(has_two_purchase) AS two_purchases,
    SUM(has_three_purchase) AS three_purchases,
    SUM(has_twoplus_purchase) AS twoplus_purchases,
    COUNT(DISTINCT user_id) AS num_users_w_purchase,
    DIV0(SUM(has_twoplus_purchase), SUM(has_one_purchase)) AS repeat_rate
FROM
    user_bucket;



2.What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
answer: a good indicator could be time spent on a page for a product, maybe crate a indictor if time spent on a website is greater than x minuites per session
An indictor of somebody of sombody who is not liekly to purchase could be a indictor created if a user has revisited the site less than x amount of times.

3.Explain the product mart models you added. Why did you organize the models in the way you did?
answer:
using olegs follow along, i added a mart model to the products folder.

4.What assumptions are you making about each model? (i.e. why are you adding each test?)
answer: that there would not be null values for certain fields, adress related data such as zipcode

5.Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
ansere: no issues found for the few test i added

6.Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through
ansere:we could run test daily and check when failiures, i would look into the bad data and check source it came from, this may be something we can adress or shoot to dev to figure out.

SNAPSHOTS
7.Which products had their inventory change from week 1 to week 2? 
none changed for me since i setup snapshots in week 1 wrong, figured out and was able to snapshot sucesfully.
