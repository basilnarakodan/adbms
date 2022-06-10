CREATE DEFINER=`root`@`localhost` TRIGGER `emp`.`saleItem_AFTER_INSERT` AFTER INSERT ON `saleItem` FOR EACH ROW
BEGIN

update product set quantity_in_stock = quantity_in_stock - new.quantity
where product.product_id = new.product_id;

END