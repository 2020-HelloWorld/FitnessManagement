-- natural join
create view completeuserinfo as  select * from user_info ui natural join user_info_email;

-- join operation
create view loyalty_pts_feedback as select dl.loyalty_id,feedback from daily_log dl join loyalty_pts lp on dl.loyalty_id = lp.loyalty_id;

-- 2 more examples for join
create view exercise_routine_dailylog as select * from exercise_routine natural join daily_log;

create view exercise_routine_fname as select d.ex_routine_id,ui.fname from user_info ui join does d on d.id = ui.id;

-- aggregate function
create view no_of_user_per_trainer as select trainer_id,count(*) as no_of_user_per_trainer from membership_type group by trainer_id;

select max(calories_burnt) from exercise_routine_dailylog;

select min(calories_consumed) from exercise_routine_dailylog;

select avg(calories_burnt) as calories_burnt,duration from exercise_routine_dailylog group by duration;  
--set operator
create view userid_of_trainer_3and7 as select id from membership_type where trainer_id = "TRAINER3" union select id from membership_type where trainer_id = "TRAINER7";

select fname from exercise_routine_fname where ex_routine_id="EX_routine52"and exists (select fname from exercise_routine_fname where ex_routine_id="EX_routine93");

select fname from exercise_routine_fname where ex_routine_id="EX_routine39"and exists (select fname from exercise_routine_fname where ex_routine_id="EX_routine29");

(select ex_id from exercise_routine where ex_routine_id="EX_routine52") union (select ex_id from exercise_routine where ex_routine_id="EX_routine93");


select count(u.id),t.trainer_id from user_info u,membership_type m,trainer t where u.id=m.id and t.trainer_id=m.trainer_id group by t.trainer_id;

insert into membership_type values ("MEM6",3,5955.00,"USR79","TRAINER11");