DELIMITER $$ ;
CREATE FUNCTION correcting_gender(GENDER INT)
RETURNS INT
DETERMINISTIC 
BEGIN
 
   DECLARE gender INT;
   SET gender = GENDER ;
   IF gender > 1 THEN 
   SET gender = 1;
   ELSE 
   SET gender = 0;
   END IF;
	RETURN gender;
	
END; $$
DELIMITER ;


DELIMITER $$
CREATE procedure gender_updation()
BEGIN
UPDATE user_info
SET gender = correcting_gender(gender);
END;$$
DELIMITER ;
 