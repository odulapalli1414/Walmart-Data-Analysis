CREATE DATABASE IF NOT EXISTS WALMART;

create table SALES(
	invoice_id varchar(30) not null primary key,
    branch varchar(5) not null,
    city varchar(30) not null,
    customer_type varchar(30) not null,
    gender varchar(10) not null,
    product_line varchar(100) not null,
    unit_price decimal(10,2) not null,
    quantity int not null,
    VAT float(6,4) not null,
    total decimal(12,4) not null,
    date datetime not null,
    time time not null,
    payment_method varchar(15) not null,
    cogs decimal(10,2) not null,
    gross_margin_percentage float(11,9) not null,
    gross_income decimal(12,4) not null,
    rating float(2,1) not null
);
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Adding a column time_of_day to determine in which part of the day the sale is made 

select  
	time,
    (case
		when `time` between "00:00:00" and "12:00:00" then "Morning"
        when `time` between "12:00:01" and "16:00:00" then "Afternoon"
        else "Evening"
    end) AS time_of_date
 from sales;

alter table sales add column time_of_day varchar(20);

update sales 
set time_of_day = (
case
		when `time` between "00:00:00" and "12:00:00" then "Morning"
        when `time` between "12:00:01" and "16:00:00" then "Afternoon"
        else "Evening"
    end
);

-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Adding day_name column to determine which day the sale is made

select date, dayname(date) from sales;
alter table sales add column day_name varchar(10);
update sales set day_name = dayname(date);

-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Adding month_name column to determine which month the sale is made

select date, monthname(date) from sales;
alter table sales add column month_name varchar(10);
update sales set month_name = monthname(date);
-- ----------------------------------------------------------------------------------------------------------------------------------------

-- BUSINESS QUESTIONS
-- Generic Questions

-- 1. HOW MANY UNIQUE CITIES DOES THE DATA HAVE?
select distinct(city) from sales;

-- 2. In which city is each branch?
select distinct branch from sales;
select distinct city, branch from sales;

-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Product Questions
-- 1. How many unique product lines does the data have?
select count(distinct product_line) from sales;
select distinct product_line from sales;

-- 2. What is the most common payment method?
select payment_method, count(payment_method) as count from sales group by payment_method order by count desc;

-- 3. What is the most selling product line?
select product_line, count(product_line) as count from sales group by product_line order by count desc; 

-- 4. What is the total revenue by month?
select month_name as month, sum(total) as total_revenue from sales group by month_name order by total_revenue desc;

-- 5. What month had the largest COGS?
select month_name as month, sum(cogs) as COGS from sales group by month_name order by COGS desc;

-- 6. What product line had the largest revenue?
select product_line, sum(total) total from sales group by product_line order by total desc;

-- 7. What is the city with the largest revenue?
select branch, city, sum(total) as total from sales group by city, branch order by total desc;

-- 8. What product line had the largest VAT?
select product_line, sum(VAT) as vat from sales group by product_line order by vat desc;

-- 9. Which branch sold more products than average product sold?
select branch, sum(quantity) as qty from sales group by branch having sum(quantity) > (select avg(quantity) from sales);

-- 10. What is the most common product line by gender?
select product_line, gender, count(gender) as gender_count from sales group by gender, product_line order by gender_count;

-- 11. What is the average rating of each product line?
select product_line, avg(rating) as average from sales group by product_line order by average desc;

-- ----------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Sales Questions
-- 1. Number of sales made in each time of the day per weekday
select time_of_day, count(*) as total_sales from sales group by time_of_day;

-- 2. Which of the customer types brings the most revenue?
select customer_type, sum(total) as total_revenue from sales group by customer_type order by total_revenue desc;

-- 3. Which city has the largest tax percent/ VAT (Value Added Tax)?
select city, avg(VAT) as vat from sales group by city order by vat desc;

-- 4. Which customer type pays the most in VAT?
select customer_type, avg(VAT) as vat from sales group by customer_type order by vat desc;

-- ----------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Customer Questions

-- 1. How many unique customer types does the data have?
select distinct customer_type from sales;

-- 2. How many unique payment methods does the data have?
select distinct payment_method from sales;

-- 3. What is the most common customer type?
select customer_type, count(customer_type) as count from sales group by customer_type order by count desc;

-- 4. Which customer type buys the most?
select customer_type, count(customer_type) as count from sales group by customer_type order by count desc;

-- 5. What is the gender of most of the customers?
select gender, count(*) as count from sales group by gender order by count desc;

-- 6. What is the gender distribution per branch?
select branch, gender, count(*) as distribution from sales group by branch, gender order by branch asc;

-- 7. Which time of the day do customers give most ratings?
select time_of_day, avg(rating) as avg_rating from sales group by time_of_day order by avg_rating;

-- 8. Which time of the day do customers give most ratings per branch?
select time_of_day, branch, avg(rating) as avg_rating from sales group by time_of_day, branch order by avg_rating desc;

-- 9. Which day fo the week has the best avg ratings?
select day_name, avg(rating) as avg_rating from sales group by day_name order by avg_rating desc;

-- 10. Which day of the week has the best average ratings per branch?
select branch, day_name, avg(rating) as avg_rating from sales group by branch, day_name order by branch asc;


select * from sales;
