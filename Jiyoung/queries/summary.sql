-- 제품별합계
SELECT a.product_name '제품명', a.unit_price '단가', `b`.`Total Order` '주문량', ( a.unit_price * `b`.`Total Order`) '합계'
	FROM product a
         LEFT OUTER JOIN
			(SELECT
				product_name,
				SUM(order_amount) 'Total Order'
			FROM
				order_detail
			WHERE
				order_date = '2017-07-21'
			GROUP BY product_name
			ORDER BY 'Product Name') b ON b.product_name = a.product_name
   WHERE `b`.`Total Order` IS NOT NULL
   ORDER BY 'Product Name';


-- 모든주문
SELECT  CASE
			WHEN a.orderer_contact_number IS NOT null THEN CONCAT(a.orderer_name, '(', a.orderer_contact_number, ')')
            ELSE a.orderer_name
        END '주문자',
        a.product_name '제품명',
        a.order_amount '주문량',
        (SELECT b.unit_price FROM product b WHERE b.product_name = a.product_name) '단가',
        ((SELECT b.unit_price FROM product b WHERE b.product_name = a.product_name)*a.order_amount) '주문소계',
        b.`TotalPrice` '총 주문금액',
        CONCAT( CASE WHEN a.order_comment IS NULL THEN '' ELSE a.order_comment END,
                ':',
			    CASE WHEN a.orderer_address IS NULL THEN '' ELSE a.orderer_address END) '비고'
  FROM order_detail a
	   LEFT OUTER JOIN (
			SELECT  a.orderer_name '주문자',
					SUM(((SELECT b.unit_price FROM product b WHERE b.product_name = a.product_name)*a.order_amount)) 'TotalPrice'
			  FROM order_detail a
			 WHERE order_date = '2017-07-21'
			 GROUP BY orderer_name
       ) b ON b.`주문자` = a.orderer_name
 WHERE order_date = '2017-07-21'
ORDER BY orderer_name ASC, product_name ASC;


