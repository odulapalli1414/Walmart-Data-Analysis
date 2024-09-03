# Walmart-Data-Analysis
This project focuses on analyzing Walmart's sales data to identify top-performing branches and products, examine sales trends across different product categories, and understand customer behavior. The goal is to develop strategies to optimize and enhance sales performance. The dataset for this analysis was sourced from the Kaggle Walmart Sales Forecasting Competition.

# Purposes Of The Project
The major aim of thie project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

# About Data
The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

# Column	Description	Data Type
| Column Name              | Description                                  | Data Type         |
|--------------------------|----------------------------------------------|-------------------|
| `invoice_id`             | Invoice of the sales made                    | `VARCHAR(30)`     |
| `branch`                 | Branch at which sales were made              | `VARCHAR(5)`      |
| `city`                   | The location of the branch                   | `VARCHAR(30)`     |
| `customer_type`          | The type of the customer                     | `VARCHAR(30)`     |
| `gender`                 | Gender of the customer making purchase       | `VARCHAR(10)`     |
| `product_line`           | Product line of the product sold             | `VARCHAR(100)`    |
| `unit_price`             | The price of each product                    | `DECIMAL(10, 2)`  |
| `quantity`               | The amount of the product sold               | `INT`             |
| `VAT`                    | The amount of tax on the purchase            | `FLOAT(6, 4)`     |
| `total`                  | The total cost of the purchase               | `DECIMAL(10, 2)`  |
| `date`                   | The date on which the purchase was made      | `DATE`            |
| `time`                   | The time at which the purchase was made      | `TIMESTAMP`       |
| `payment_method`         | The total amount paid                        | `DECIMAL(10, 2)`  |
| `cogs`                   | Cost Of Goods Sold                           | `DECIMAL(10, 2)`  |
| `gross_margin_percentage`| Gross margin percentage                      | `FLOAT(11, 9)`    |
| `gross_income`           | Gross Income                                 | `DECIMAL(10, 2)`  |
| `rating`                 | Rating                                       | `FLOAT(2, 1)`     |


# questions that are answered
## Business Questions To Answer
## Generic Question

1. How many unique cities does the data have?
2. In which city is each branch located?
3. How many unique product lines does the data have?
4. What is the most common payment method?
5. What is the most selling product line?
6. What is the total revenue by month?
7. What month had the largest COGS?
8. What product line had the largest revenue?
9. What is the city with the largest revenue?
10. What product line had the largest VAT?
11. Fetch each product line and add a column to those product lines showing "Good" or "Bad" based on whether it has greater than average sales.
12. Which branch sold more products than the average number of products sold?
13. What is the most common product line by gender?
14. What is the average rating of each product line?

Sales
Number of sales made in each time of the day per weekday
Which of the customer types brings the most revenue?
Which city has the largest tax percent/ VAT (Value Added Tax)?
Which customer type pays the most in VAT?
Customer
How many unique customer types does the data have?
How many unique payment methods does the data have?
What is the most common customer type?
Which customer type buys the most?
What is the gender of most of the customers?
What is the gender distribution per branch?
Which time of the day do customers give most ratings?
Which time of the day do customers give most ratings per branch?
Which day fo the week has the best avg ratings?
Which day of the week has the best average ratings per branch?
