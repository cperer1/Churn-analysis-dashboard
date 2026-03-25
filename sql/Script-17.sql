SELECT 
Churn,
COUNT (*) AS total,
ROUND(COUNT(*)*100/ SUM(COUNT(*))  OVER(), 2) AS porcentaje 
FROM telco_churn
GROUP BY Churn;

SELECT 
contract,
COUNT (*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churners 
FROM telco_churn
GROUP BY contract;


SELECT 
contract,
COUNT (*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churners 
FROM telco_churn
GROUP BY contract;

SELECT 
contract,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0
/ COUNT (*),2) AS churn_rate
FROM telco_churn
GROUP BY contract
ORDER BY churn_rate DESC;

SELECT 
CASE 
	WHEN tenure <= 6 THEN '0-6 meses'
	WHEN tenure <= 12 THEN '7-12 meses'
	WHEN tenure <= 24 THEN '13-24 meses'
	ELSE '25+ meses'
END AS rango_tenure,
COUNT (*) AS total,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY rango_tenure 
ORDER BY churn_rate DESC;

SELECT AVG(MonthlyCharges)
FROM telco_churn;

SELECT AVG(tenure)
FROM telco_churn;

SELECT 
ROUND(AVG(MonthlyCharges * tenure)::numeric, 2) AS CLV_promedio
FROM telco_churn;

SELECT 
contract AS cohorte,
tenure,
COUNT (*) AS clientes
FROM telco_churn
GROUP BY contract,tenure
ORDER BY contract,tenure; 

SELECT 
InternetService,
COUNT(*) AS total_clientes,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) churners,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100.0 /COUNT (*),2) AS churn_rate
FROM telco_churn 
GROUP BY InternetService
ORDER BY churn_rate DESC;

SELECT 
PaymentMethod,
COUNT(*) AS total_clientes,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) churners,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100.0 /COUNT (*),2) AS churn_rate
FROM telco_churn 
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

SELECT 
MonthlyCharges,
COUNT(*) AS total_clientes,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) churners,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100.0 /COUNT (*),2) AS churn_rate
FROM telco_churn 
GROUP BY MonthlyCharges
ORDER BY churn_rate DESC;

SELECT 
SeniorCitizen,
COUNT(*) AS total_clientes,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) churners,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100.0 /COUNT (*),2) AS churn_rate
FROM telco_churn 
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;


SELECT
CASE
	WHEN MonthlyCharges < 35 THEN 'Low'
	WHEN MonthlyCharges < 70 THEN 'Medium'
	ELSE 'High'
END AS rango_precio,
COUNT (*) AS clientes,
ROUND(
SUM (CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY rango_precio
ORDER BY churn_rate DESC;

SELECT 
SeniorCitizen,
COUNT(*) AS total_clientes,
ROUND(SUM (CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100.0 /COUNT (*),2) AS churn_rate
FROM telco_churn 
GROUP BY SeniorCitizen;


