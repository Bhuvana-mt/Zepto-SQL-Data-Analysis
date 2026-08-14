drop table if exists zepto;

create table zepto(
sku_id SERIAL primary key,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
discountpercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weighIngms integer,
outOfStock boolean,
quantity integer );

-- data exploration

--count of rows
select count(*) from zepto;

--sample data
select * from zepto
limit 10;

--null values
select * from zepto
where name is null
or
category is null
or
mrp is null
or 
discountPercent is null
or 
weightnGms is null
or
availableQuantity is null
or
outOfStock is null
or
quantity is null;

--explore different product categories
select distinct category
from zepto
order by category;

--products in stock vs out of stock
select outOfstock, count(sku_id)
from zepto
group by outOfStock;

-- product names present multiple times
select name, count(sku_id) as "number of skus"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

-- data cleaning

--products with price = 0
select * from zepto
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto
where mrp = 0;

-- convert paise to rupees
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto;

-- business problems

--Q1. find the top 10 best-value products based on the discount percentage.
select distinct name, mrp, discountPercent
from zepto
order by discountPercent DESC
limit 10;

-- Q2. what are theproducts with high mrp but out of stock
select distinct name , mrp
from zepto
where outOfStock = true and mrp >300
order by mrp desc;

-- Q3. calculate estimated revenue for each category
select category,
sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

-- Q4. find all products where mrp is greater than ₹500 and discountis less that 10%.
select distinct name, mrp, discountPercent
from zepto
where mrp > 500 AND discountPercent < 10
order by mrp DESC, discountPercent DESC;

-- Q5. indentify which product category give the best avg discount or the top 5 categories offering the highest average discount percentage.
select category,
round (avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount DESC
limit 5;

-- Q6. find the price per gram for products above 100g and sort by best value.
select distinct name, weightngms, discountedSellingPrice,
round(discountedSellingPrice/weightngms,2) as price_per_gram
from zepto
where weightngms >= 100
order by price_per_gram;

-- Q7. group the product into categories like low, medium, bulk.
select distinct name, weightngms,
case when weightngms < 1000 then 'low'
when weightngms < 5000 then 'medium'
else 'bulk'
end as weight_category
from zepto;

-- Q8. what is the total inventory weight per category
select category,
sum(weightngms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;

