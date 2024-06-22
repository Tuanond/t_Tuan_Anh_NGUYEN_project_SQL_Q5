-- Výzkumná otázka č. 5
-- 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 
-- projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

SELECT *
FROM economies AS e
WHERE country = 'Czech republic';

SELECT
*
FROM czechia_payroll AS cpay
LEFT JOIN czechia_price AS cp 
	ON cpay.payroll_year = YEAR(cp.date_from)
ORDER BY cpay.payroll_year;

SELECT
	payroll_year,
	avg(value)
FROM czechia_payroll AS cp
WHERE value_type_code = 5958
GROUP BY payroll_year;

SELECT
	e.country,
	e.YEAR,
	avg(cpay.value) AS average_payroll,
	avg(cp.value) AS average_prices,
	e.GDP,
	e.gini
FROM czechia_payroll AS cpay
LEFT JOIN czechia_price AS cp 
	ON cpay.payroll_year = YEAR(cp.date_from)
LEFT JOIN economies AS e
	ON cpay.payroll_year = e.`year`
WHERE e.country = 'Czech republic' AND cpay.value_type_code = "5958"
GROUP BY e.year;


