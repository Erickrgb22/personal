SELECT * FROM glpi.glpi_tickets;
ANALYZE TABLE glpi.glpi_tickets;

SELECT 
    table_schema AS 'Base de datos',
    ROUND(SUM(data_length + index_length) / 1024 / 1024,
            2) AS 'Tamaño (MB)'
FROM
    information_schema.TABLES
GROUP BY table_schema;

SELECT 
    table_name AS 'Table',
    ROUND(((data_length + index_length) / 1024 / 1024),
            2) AS 'Size (MB)'
FROM
    information_schema.TABLES
WHERE
    table_schema = 'glpi'
ORDER BY (data_length + index_length) DESC;