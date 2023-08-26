

--SQL  teradata metadata info
Database ua_dillards; 

Select count(*) from trnsact;

HELP TABLE DEPTINFO;
HELP COLUMN deptinfo.dept;
SHOW table deptinfo;

SHOW table strinfo;
SHOW table skstinfo;
HELP COLUMN skstinfo.sku;
HELP table skstinfo;

SHOW TABLE skuinfo;
HELP COLUMN skuinfo.packsize;
HELP table skuinfo;

SHOW table trnsact;
HELP TABLE trnsact;
HELP COLUMN trnsact.store;

SHOW table store_msa;
HELP TABLE store_msa;
HELP COLUMN store_msa.longitude;

SELECT  style,color,size, sku, dept
FROM skuinfo
ORDER BY dept;

SELECT *
FROM DEPTINFO
ORDER BY DEPT;

SELECT DISTINCT *
FROM trnsact;

SELECT *
FROM trnsact;



SELECT TOP 100 amt, sprice
FROM trnsact
WHERE amt<>sprice
ORDER BY sprice ASC;


SELECT  amt, sprice
FROM trnsact
WHERE amt<>sprice
ORDER BY sprice ASC;


SELECT orgprice
FROM trnsact
WHERE orgprice=0;


SELECT COUNT(orgprice)
FROM trnsact
WHERE orgprice=0;

SELECT DISTINCT cost, retail, sku, store
FROM skstinfo
WHERE cost=0.00 AND retail=0.00;

SELECT DISTINCT cost,retail,sku,store
FROM skstinfo
WHERE cost>retail
ORDER BY cost;

SELECT  saledate, sku, store, register, quantity,seq 
FROM trnsact
ORDER BY saledate DESC;

SELECT  saledate, sku, store, register, quantity,seq 
FROM trnsact
WHERE saledate>"05/05/04"
ORDER BY saledate DESC;


HELP TABLE strinfo;
SHOW table strinfo;

SELECT orgprice, sku
FROM trnsact
WHERE sku=3631365
ORDER BY orgprice DESC;


SELECT color, sku, brand
FROM skuinfo
WHERE brand='LIZ CLAI'
ORDER BY sku DESC;

SELECT sku, orgprice
FROM trnsact
ORDER BY orgprice DESC;

SELECT DISTINCT state
FROM strinfo;

SELECT dept, deptdesc
FROM deptinfo
WHERE deptdesc LIKE 'e%';

SELECT saledate, sprice,orgprice, orgprice-sprice
FROM trnsact
WHERE sprice<>orgprice
ORDER BY saledate;


SELECT register, sprice, orgprice, saledate
FROM trnsact
WHERE saledate >'2004-08-01' AND saledate<'2004-08-10'
ORDER BY orgprice DESC, sprice DESC;


SELECT DISTINCT brand 
FROM skuinfo
WHERE brand LIKE '%liz%';



SELECT store, city
FROM store_msa
WHERE city='little rock' OR city='memphis' OR city='tulsa'
ORDER BY store DESC;



SELECT  trnsact.saledate, COUNT( trnsact.stype)
FROM trnsact
GROUP BY trnsact.saledate
ORDER BY COUNT( trnsact.stype) DESC
WHERE trnsact.stype='P';




SELECT top 100 *
FROM trnsact
WHERE quantity>1





SELECT count(DISTINCT skuinfo.sku) , deptdesc
FROM skuinfo RIGHT JOIN deptinfo
ON deptinfo.dept=skuinfo.dept 
GROUP BY deptdesc
ORDER BY count(distinct skuinfo.sku) DESC




SELECT COUNT(DISTINCT SKU)
from SKUINFO

select count(distinct sku)
FROM skstinfo;

SELECT COUNT (DISTINCT sku)
FROM trnsact;

SELECT COUNT(skstinfo.sku)
FROM skstinfo left join skuinfo
ON skstinfo.sku=skuinfo.sku
WHERE skuinfo.sku IS NULL;


SELECT COUNT(skstinfo.sku)
FROM skstinfo LEFT JOIN skuinfo
ON skstinfo.sku=skuinfo.sku
WHERE skuinfo.sku IS NULL;


SELECT AVG(sprice*quantity+amt*quantity-cost*quantity)
from trnsact,skstinfo
WHERE trnsact.sku=skstinfo.sku AND trnsact.store=skstinfo.store AND trnsact.stype='P';

