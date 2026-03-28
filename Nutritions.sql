Create database nutrition;
use nutrition;

# Complete rows loading procedure.....
TRUNCATE TABLE foods;
select * from foods;
desc foods;
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Nutritions/foods.csv'
INTO TABLE foods FIELDS TERMINATED BY
',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;


# Total Unique Products
select count(distinct(item)) as Total_Items from foods;

# Average Calories
select avg(calories) as Average_Calories from foods;

# Average Fat Per Category
select type as Foods_Types, avg(Total_Fat_g) as Total_Fat from foods group by type;

# High Calories Items
select item, calories from foods where calories>500 order by calories desc ;

# Top 5 highest calories items
select item, calories from foods where calories>500 order by calories desc limit 5;

# Nutritional Health Score -> (Highest score= Not Healthy, Least Score = Healthy)
Select item, calories, Total_Fat_g, (calories + Total_Fat_g*9) as health_score from foods order by health_score desc;

# Classification of Calories
Select item, calories,
case
when calories<200 then "Healthy"
when calories between 200 and 500 then "Moderate"
Else "Unhealthy"
End as classification_of_calories
from foods;








