-- Return which product has high demand among people
SELECT MAX(Product_Category) 
from customer_spend.`product_details`;

-- Return male clothing overall count
SELECT count('clothing') as mens_clothing_count
from customer_details
join product_details on product_details.index = customer_details.Customer_id
where customer_gender = 'm' and product_category = 'Clothing';

-- Return female clothing overall count

SELECT count('clothing') 
from customer_details
join product_details on product_details.index = customer_details.Customer_id
where customer_gender = 'f' and product_category = 'Clothing';

-- Resolve aggregate error
SET sql_mode = '';
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- find accessories purchased count of france.
select 
country,
count(Product_Category)
from customer_details cus 
join product_details pds
on cus.Customer_id = pds.index
where Customer_Gender='m' 
and Country in ("france")
and Product_Category= "accessories";

-- find accessories purchased count of US.
select country, Product_Category
from customer_details cus 
join product_details pds
on cus.Customer_id = pds.index
where country in ("united states") and Product_Category = "accessories";

-- find accessories purchased count of men in US.
select country, Product_Category,
count(Product_Category) as US_Accessories_purchased_count_of_mens
from customer_details cus 
join product_details pds
on cus.Customer_id = pds.index
where country= 'united states' and Product_Category = 'accessories';



-- Which country are more interested in accessory, clothing & Bike?
-- In accessories?
select country, count('Product_Category')
from customer_details cus 
join product_details pds
on cus.Customer_id = pds.index
where country in ('united states', 'france', 'United kingdom', 'germany') and Product_Category = 'accessories'
group by country
order by Product_Category;

-- In bikes
select country, count('Product_Category')
from customer_details cus 
join product_details pds
on cus.Customer_id = pds.index
where country in ('united states', 'france', 'United kingdom', 'germany') and Product_Category = 'bikes'
group by country
order by Product_Category;

-- In clothing
select country, count('Product_Category')
from customer_details cus 
join product_details pds
on cus.Customer_id = pds.index
where country in ('united states', 'france', 'United kingdom', 'germany') and Product_Category = 'clothing'
group by country
order by Product_Category;

-- write a query to find which country has high revenue and product of the year ?
SELECT country, max(Product_Category), count(Sub_Category), avg(Revenue)
from customer_details cus 
join product_details pds
on cus.Customer_id = pds.index
where Country in ('france', 'germany', 'united states', 'united kingdom')
group by country
order by 4,1 desc
limit 100;




 


