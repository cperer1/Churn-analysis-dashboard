SELECT  COUNT (*)
FROM telco_churn;

SELECT COUNT (*)
FROM telco_churn 
WHERE churn ='Yes';

SELECT 
ROUND(SUM(CASE WHEN churn= 'Yes'THEN 1 ELSE 0 END) * 100.0/ COUNT (*),2 ) AS churn_rate
FROM telco_churn;

SELECT ROUND(AVG(MonthlyCharges)::numeric,2)
FROM telco_churn;

SELECT 
contract,
COUNT(*) AS clientes,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
/ COUNT (*),2) AS churn_rate
FROM telco_churn
GROUP BY contract
ORDER BY churn_rate DESC;

SELECT 
InternetService,
COUNT(*) AS clientes,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100.0 /COUNT (*),2) AS churn_rate
FROM telco_churn 
GROUP BY InternetService

SELECT 
PaymentMethod,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100.0 /COUNT (*),2) AS churn_rate
FROM telco_churn 
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

SELECT
CASE
	WHEN MonthlyCharges < 35 THEN 'Low'
	WHEN MonthlyCharges < 70 THEN 'Medium'
	ELSE 'High'
END AS rango_precio,
ROUND(SUM (CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY rango_precio
ORDER BY churn_rate DESC;


SELECT 
 CASE 
 	WHEN tenure <= 6  THEN '0-6 meses'
 	WHEN tenure <= 12 THEN '7-12 meses'
 	WHEN tenure <= 24 THEN '13-24 meses'
 	WHEN tenure <= 48 THEN '25-48 meses'
 	ELSE '49+ meses'
END AS rango_tenure,
COUNT (*) AS total_clientes,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churners,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 /COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY rango_tenure
ORDER BY churn_rate DESC;
 
