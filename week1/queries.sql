select count(*)
from yellow_taxi_trips
where tpep_pickup_datetime::date = '2021-01-15';


select tpep_pickup_datetime::date, tip_amount
from yellow_taxi_trips
where date_part('month', tpep_pickup_datetime) = 1
order by tip_amount desc
limit 1;


select doz."Zone", count(*)
from yellow_taxi_trips t
inner join zones puz on t."PULocationID" = puz."LocationID"
inner join zones doz on t."DOLocationID" = doz."LocationID"
where puz."Zone" = 'Central Park'
	and tpep_pickup_datetime::date = '2021-01-14'
group by doz."Zone"
order by count(*) desc
limit 1;


select puz."Zone", doz."Zone", avg(total_amount) as avg_amt
from yellow_taxi_trips t
inner join zones puz on t."PULocationID" = puz."LocationID"
inner join zones doz on t."DOLocationID" = doz."LocationID"
group by puz."Zone", doz."Zone"
order by avg_amt desc
limit 1;
