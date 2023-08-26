

--Sample queries Dillards DATABASE - dummy data



--Obtain the day in which Dillards income, based on total sum of purchases, was the GREATEST
SELECT TOP 10 saledate, SUM(amt) AS tot_sales
FROM trnsact
WHERE stype='P'
GROUP BY saledateORDER BY tot_sales DESC




--Obtain the deptdesc of the departments that have the top 3 GREATEST numbers of skus from the skst table associated with them
SELECT TOP 3 s.dept, d.deptdesc,COUNT(DISTINCT s.sku) AS numskus
FROM skuinfo s JOIN deptinfo d
ON s.dept=d.dept
GROUP BY s.dept, d.deptdesc
ORDER BY numskus DESC




--Amount of skus in the skstinfo table, but NOT in the skuinfo table 
SELECT COUNT(DISTINCT st.sku)
FROM skstinfo st LEFT JOIN skuinfo si 
ON st.sku=si.sku 
WHERE si.sku IS NULL 





--Average amount of PROFIT Dillards made PER DAY 
SELECT SUM (amt - (cost*quantity))/COUNT(DISTINCT saledate) AS avg_sales 
FROM trnsact t JOIN skstinfo si 

ON t.sku=si.sku AND t.store=si.store 

WHERE stype='P' 

--Exclude return transact and only looks at purchase transactions 







--Amount of MSAs within the state of NC 
--and within these MSAs, query the lowest population level (msa_pop) and highest income level (msa_income)
SELECT COUNT(store), MIN(msa_pop), MAX(msa_income)
FROM store_msa
WHERE state='NC'








--Obtains the department, brand, style and color that brought in the greatest TOTAL amount of sales
SELECT TOP 20 d.deptdesc, s.dept, s.brand, s.style, s.color, SUM(t.AMT) AS tot_sales

--Using traditional join syntax
FROM trnsact t, skuinfo s, deptinfo d

WHERE t.sku=s.sku AND s.dept=d.dept AND t.stype='P'
GROUP BY d.deptdesc, s.dept, s.brand, s.style, s.color
ORDER BY tot_sales DESC






--Amount of stores that have more than 180000 distinct skus associated with them in the skstinfo table 
SELECT COUNT(DISTINCT sku) AS numskus
FROM skstinfo
GROUP BY store 
HAVING numskus>180000






--Obtains a query with distinct skus in the 'cop' department with a 'federal' brand and a 'rinse wash' color. 
--This query obtains the columns where these skus have different values from one another (their features differ)
SELECT DISTINCT s.sku, s.dept, s.style, s.color, s.size, s.vendor, s.brand, s.packsize, d.deptdesc, st.retail, st.cost 

FROM skuinfo s JOIN deptinfo d 
ON s.dept=d.dept JOIN skstinfo st ON s.sku=st.sku 

WHERE d.deptdesc='cop' AND s.brand='federal' AND s.color='rinse wash';








--Amount of skus in the skuinfo table but NOT in the skstinfo table 
SELECT COUNT(DISTINCT si.sku)
FROM skstinfo st RIGHT JOIN skuinfo si ON st.sku=si.sku 

WHERE st.sku IS NULL








--City and state where the store with the greatest total sum of sales is located
SELECT TOP 10 t.store, s.city, s.state, SUM(amt) AS tot_sales
FROM trnsact t JOIN strinfo s ON t.store=s.store 
WHERE stype='P'

GROUP BY t.store, s.state, s.city
ORDER BY tot_sales DESC 







--Amount of states that have more than 10 dillards stores in them
SELECT COUNT(*) AS numstores
FROM strinfo 
GROUP BY state 
HAVING numstores>10





--Suggested retail price of all the skus in the 'rebook' department with the 'sketchers' brand and a 'wht/saphire' color
SELECT DISTINCT s.sku, s.dept,s.color, d.deptdesc, st.retail 

FROM skuinfo s JOIN deptinfo d 
ON s.dept=d.dept JOIN skstinfo st 
ON s.sku=st.sku

WHERE d.deptdesc='reebok' AND s.brand='skechers' AND s.color='wht/saphire'




























