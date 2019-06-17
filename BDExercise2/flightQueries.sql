-------------------------------------------------------
-- Flights Queries ------------------------------------
-------------------------------------------------------

-- Total Count of Flights 
select count(*) from flights;

-- Arrival and departure delays by origin 
select origin, avg(ArrDelay) arrival_average ,avg(DepDelay) departure_average from flights group by origin order by origin;

-- Arrival delay by origin and year 
select origin, colYear,	colMonth, avg(ArrDelay) arrival_average from flights group by origin, colYear, colMonth order by origin, colYear, colMonth;

-- Arrival delay by origin description name origin
select a.Airport,f.origin, f.colYear, f.colMonth, avg(ArrDelay) arrival_average from flights f INNER JOIN usairports a ON f.Origin=a.IATA group by a.Airport, f.colYear, f.colMonth order by a.airport,  f.colYear, f.colMonth;

-- Arrival delay by origin description name origin 
select UniqueCarrier , colYear,colMonth, avg(ArrDelay) avg_delay, count(cancelled) total_cancelled from flights
where cancelled > 0
group by UniqueCarrier, colYear, colMonth 
order by total_cancelled desc;

-- Planes with more distance travelled
select tailNum, sum(distance) total_distance 
from flights 
where tailNum <> ''
group by tailNum
order by total_distance desc
limit 10;

-- Companies with 10-minutes arrival delay in average
select uniqueCarrier, avg(ArrDelay) avg_delay 
from flights 
group by uniqueCarrier
having avg(ArrDelay) > 10
order by avg_delay desc;
