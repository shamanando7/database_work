Задание 1.
Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. (использование транзакции с выбором commit или rollback – обязательно).
     
   
     
     
В этой процедуре мы выполняем следующие шаги:
    
- начинается транзакция с помощью START TRANSACTION.
- используется обработчик ошибок SQLEXCEPTION, чтобы в случае возникновения ошибки выполнить откат транзакции с помощью ROLLBACK.
- проверяется существует ли пользователь с заданным user_id в таблице users.
- если пользователь существует, мы вставляем его запись в таблицу users_old с помощью INSERT INTO ... SELECT, а затем удаляем его запись из таблицы users с помощью DELETE.
- если пользователь не найден, мы выполняем откат транзакции.