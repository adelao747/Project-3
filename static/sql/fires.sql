--List all address and neighborhoods fires have occurred
SELECT "neighborhood_district", "Address" FROM fire_data;

--List all fires from 2003 to now
SELECT "Incident_Date", "Address", "Incident_Number"
FROM fire_data
WHERE "Incident_Date" BETWEEN '2003-01-01T00:00:000' AND '2023-03-27T00:00:00';

--How many?
SELECT COUNT("Incident_Date") 
FROM fire_data;

--List all fires from the last year
SELECT "Incident_Date", "Address", "Incident_Number"
FROM fire_data
WHERE "Incident_Date" BETWEEN '2022-03-31T00:00:00' AND '2023-03-31T00:00:00';

--How many?
SELECT COUNT("Incident_Date") 
FROM fire_data
WHERE "Incident_Date" BETWEEN '2022-03-31T00:00:00' AND '2023-03-31T00:00:00';

--Which neighborhood has the most fires?
SELECT "neighborhood_district", COUNT("neighborhood_district") as COUNT
FROM fire_data
GROUP BY "neighborhood_district"
ORDER BY count DESC
LIMIT 5;

--Which neighborhood has the least fires?
SELECT "neighborhood_district", COUNT("neighborhood_district") as COUNT
FROM fire_data
GROUP BY "neighborhood_district"
ORDER BY count ASC
LIMIT 2;

--What is the average amount of EMS Personnel that arrive to a fire?
SELECT AVG("EMS_Personnel") as average
FROM fire_data;

--What is the most amount of deaths that occurred from a fire?
SELECT "Fire_Fatalities", COUNT("Fire_Fatalities") as COUNT
FROM fire_data
GROUP BY "Fire_Fatalities"
ORDER BY count DESC
LIMIT 2;

--What is the average amount of injuries per fire?
SELECT AVG("Fire_Injuries") as average
FROM fire_data;

--Which battalion responded to the most fires?
SELECT "Battalion", COUNT("Battalion") as COUNT
FROM fire_data
GROUP BY "Battalion"
ORDER BY count DESC
LIMIT 1;

--What is the average amount of suppression units used against fires?
SELECT AVG("Suppression_Units") as average
FROM fire_data;

--What is the most common cause of fires?
SELECT "Primary_Situation", COUNT("Primary_Situation") as COUNT
FROM fire_data
GROUP BY "Primary_Situation"
ORDER BY count DESC
LIMIT 5;