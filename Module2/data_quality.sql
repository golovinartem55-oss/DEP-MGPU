-- Проверка количества записей:
select count(*) from stg.orders;
SELECT COUNT(*) FROM dw.sales_fact;
-- Пример проверки связей
SELECT COUNT(*)
FROM dw.sales_fact f
LEFT JOIN dw.shipping_dim s ON f.ship_id = s.ship_id
WHERE s.ship_id IS NULL;