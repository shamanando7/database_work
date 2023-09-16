CREATE FUNCTION hello()
RETURNS VARCHAR(50)
BEGIN
    DECLARE greeting VARCHAR(50);
    DECLARE currentHour INT;

    SET currentHour = HOUR(NOW());

    IF currentHour >= 6 AND currentHour < 12 THEN
        SET greeting = 'Доброе утро';
    ELSEIF currentHour >= 12 AND currentHour < 18 THEN
        SET greeting = 'Добрый день';
    ELSEIF currentHour >= 18 AND currentHour < 24 THEN
        SET greeting = 'Добрый вечер';
    ELSE
        SET greeting = 'Доброй ночи';
    END IF;

    RETURN greeting;
END //

DELIMITER ;
