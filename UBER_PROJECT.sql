SELECT * FROM uber.bookings1; 
#1. Retrieve all successful bookings
CREATE VIEW successful_bookings AS
SELECT * 
FROM uber.bookings1
WHERE Booking_Status = 'success';


#2.Find the average ride distance for each vehicle type:
CREATE VIEW 
Average_ride_distance_for_each_vehicle AS
SELECT Vehicle_Type ,ROUND(AVG(ride_distance),2)
AS avg_distace 
FROM bookings1
GROUP BY Vehicle_Type;


#3.Get the total number of cancelled rides by customers:
create view canceled_by_customer as
select 
count(*) from uber.bookings1
where booking_status = 'canceled by customer';


#4.List the top 5 customers who booked the highest number of rides
create view top_5_customers_BY_rides_booking_no as
select customer_id, count(booking_id) as booking_no 
from bookings1 group by customer_id
order by count(booking_id)  desc
limit 5;


#5.the number of rides cancelled by drivers due to personal and car-related issues 
create view 
cancelled_by_drivers_for_personal_and_car_related_issues as
select count(*) from bookings1
where canceled_rides_by_driver = 'Personal & Car related issue';


#6.Find the maximum and minimum driver ratings for Bike bookings:
create view max_min_driver_ratings as
select max(cast(driver_ratings as decimal(5,2))) as max_rating,
 min(cast(driver_ratings as decimal(5,2))) as min_rating
from bookings1
where vehicle_type = 'Bike' and driver_ratings is not null ;


#7.Retrieve all rides where payment was made using UPI.
create view tot_cash_payment as
select * from bookings1 
where payment_method = 'cash';

 
#8. Find the average customer rating per vehicle type:
create view avg_customer_rating_per_vehicle_type as
select Vehicle_type,round(avg(customer_rating),2) from bookings1
group by Vehicle_type;


#9.Calculate the total booking value of rides completed successfully:
create view tot_successful_booking_value as
select sum(booking_value) from bookings1
where booking_status = 'success';


#10.List all incomplete rides along with the reason:
create view incomplete_rides as
select booking_id, Incomplete_Rides_Reason
from bookings1 where Incomplete_Rides = 'yes';






