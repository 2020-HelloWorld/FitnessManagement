DELIMITER $$
CREATE TRIGGER total_no_of_user_per_trainer_exceed_check  
BEFORE INSERT 
ON membership_type FOR EACH ROW  
BEGIN  
    DECLARE error_msg VARCHAR(255);  
    SET error_msg = (' total number of users per trainer exceeds more than 4');  
    IF (select count(*) from membership_type where trainer_id=new.trainer_id group by trainer_id) > 4 THEN  
    SIGNAL SQLSTATE '45000'   
    SET MESSAGE_TEXT = error_msg;  
    END IF;  
END $$   
DELIMITER ;