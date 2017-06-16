select * from order_detail where order_date = '2017-06-17';

select * from order_detail where orderer_name = '0423 391 66';


update order_detail set orderer_name = '0423 391 661' where orderer_name = '0423 391 66';






INSERT INTO order_detail (product_name, order_date, orderer_name, order_amount, orderer_contact_number, orderer_address, order_comment) VALUES
  ('고구마앙금빵',     '2017-06-17', '김영아', 4, null, '8 Callan Ct, Mill Park VIC 3082', '배달'),
  ('고로케(감자)',    '2017-06-17', '김영아', 4, null, '8 Callan Ct, Mill Park VIC 3082', '배달'),
  ('소보루(튀김)',    '2017-06-17', '김영아', 4, null, '8 Callan Ct, Mill Park VIC 3082', '배달'),
  ('커피번',         '2017-06-17', '김영아', 4, null, '8 Callan Ct, Mill Park VIC 3082', '배달'),
  ('팥빵',          '2017-06-17', '김영아', 4, null, '8 Callan Ct, Mill Park VIC 3082', '배달');

INSERT INTO order_detail (product_name, order_date, orderer_name, order_amount, orderer_contact_number, orderer_address, order_comment) VALUES
  ('팥빵',          '2017-06-17', '0423 391 661', 4, null, null, null),
  ('소보루',         '2017-06-17', '0423 391 661', 6, null, null, null),
  ('고로케(감자)',    '2017-06-17', '0423 391 661', 2, null, null, null),
  ('고로케(당면)',    '2017-06-17', '0423 391 661', 2, null, null, null);


INSERT INTO order_detail (product_name, order_date, orderer_name, order_amount, orderer_contact_number, orderer_address, order_comment) VALUES
  ('꽈베기',         '2017-06-17', '0400 098 009:두이엄마', 14, null, null, null),
  ('커피번',         '2017-06-17', '0400 098 009:두이엄마', 4, null, null, null);


