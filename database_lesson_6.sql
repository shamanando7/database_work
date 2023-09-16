DELIMITER //

CREATE PROCEDURE MoveUserToOldTable(IN user_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Проверка существования пользователя с заданным user_id
    IF (SELECT COUNT(*) FROM users WHERE id = user_id) = 1 THEN
        -- Вставка записи в таблицу users_old
        INSERT INTO users_old SELECT * FROM users WHERE id = user_id;
        -- Удаление записи из таблицы users
        DELETE FROM users WHERE id = user_id;
        COMMIT;
    ELSE
        -- Если пользователь с заданным user_id не найден, откатываем транзакцию
        ROLLBACK;
    END IF;
END //

DELIMITER ;
