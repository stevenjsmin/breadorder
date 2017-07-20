-- 모든 주문출력
SELECT  a.orderer_name '주문자', 
        a.product_name '제품명', 
        (SELECT b.unit_price FROM product b WHERE b.product_name = a.product_name) '단가',
        a.order_amount '주문량',
        ((SELECT b.unit_price FROM product b WHERE b.product_name = a.product_name)*a.order_amount) '합계'
  FROM order_detail a
 WHERE order_date = '2016-10-15'
ORDER BY orderer_name ASC, product_name ASC;

-- 주문자별 주문합계
SELECT  a.orderer_name '주문자', 
        SUM(((SELECT b.unit_price FROM product b WHERE b.product_name = a.product_name)*a.order_amount)) '주문합계'
  FROM order_detail a
 WHERE order_date = '2016-10-15'
 GROUP BY orderer_name
ORDER BY orderer_name ASC;

-- 제품별 합계 및 가격
SELECT a.product_name '제품명', a.unit_price '단가', `b`.`Total Order` '주문량', ( a.unit_price * `b`.`Total Order`) '합계'
	FROM product a
         LEFT OUTER JOIN
			(SELECT 
				product_name,
				SUM(order_amount) 'Total Order'
			FROM 
				order_detail
			WHERE 
				order_date = '2016-10-15'
			GROUP BY product_name
			ORDER BY 'Product Name') b ON b.product_name = a.product_name
   WHERE `b`.`Total Order` IS NOT NULL
   ORDER BY 'Product Name';
