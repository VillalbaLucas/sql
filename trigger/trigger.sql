USE  sql_database;
DROP TRIGGER IF EXISTS verify_age_client;
CREATE TRIGGER verify_age_client
    BEFORE INSERT ON clients
    FOR EACH ROW
    BEGIN
        IF NEW.age < 18 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'EL cliente tiene que ser mayor de edad';
        END IF;
    END;


