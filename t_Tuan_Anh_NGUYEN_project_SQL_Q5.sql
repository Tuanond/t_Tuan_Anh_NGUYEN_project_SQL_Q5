-- Výzkumná otázka č. 5
-- 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 
-- projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

SELECT *
FROM economies AS e
WHERE country = 'Czech republic';

SELECT *
FROM czechia_payroll AS cpay
LEFT JOIN czechia_price AS cp 
	ON cpay.payroll_year = YEAR(cp.date_from)
LEFT JOIN economies AS e
	ON cpay.payroll_year = e.`year`
WHERE e.country = 'Czech republic' AND cpay.value_type_code = "5958";
