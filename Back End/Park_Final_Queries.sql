use drg; 

select * from user;
select * from Drugs;
select * from general_health;
select * from edu_employ;
select * from treatment_answers;
select * from drug_answers;

-- How many people in this survey (in %) never used drugs?
select count(User_id)/(select count(User_id) from drug_answers)*100
from drug_answers
where ever_used = 2;

-- % male (1) vs % female (2) who took this survey
select count(user_id)/(select count(user_id) from user)*100
from user
where sex = 1;

select count(user_id)/(select count(user_id) from user)*100
from user
where sex = 2;

-- Male and female ratio for drug use overall
-- Percent of males
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1)*100
from drug_answers join user using (user_id)
where sex = 1 and Ever_used = 1;

-- Percent of females
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1)*100
from drug_answers join user using (user_id)
where sex = 2 and Ever_used = 1;

-- Percentage of people using marijuana in each gender (of the people that uses marijuana)  
-- Percentage of males 
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 1)*100
from drug_answers join user using (user_id)
where sex = 1 and drug_id = 1 and Ever_used = 1;

-- Percentage of females
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 1)*100
from drug_answers join user using (user_id)
where sex = 2 and drug_id = 1 and Ever_used = 1;

-- Percentage of people using cocaine in each gender (of the people that uses cocaine) 
-- Percentage male
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 2)*100
from drug_answers join user using (user_id)
where sex = 1 and drug_id = 2 and Ever_used = 1;

-- Percentage female
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 2)*100
from drug_answers join user using (user_id)
where sex = 2 and drug_id = 2 and Ever_used = 1;

-- Percentage of people using crack in each gender (of the people that uses crack) 
-- Percentage male
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 3)*100
from drug_answers join user using (user_id)
where sex = 1 and drug_id = 3 and Ever_used = 1;

-- Percentage female
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 3)*100
from drug_answers join user using (user_id)
where sex = 2 and drug_id = 3 and Ever_used = 1;

-- Percentage of people using heroin in each gender (of the people that uses heroin) 
-- Percentage male
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 4)*100
from drug_answers join user using (user_id)
where sex = 1 and drug_id = 4 and Ever_used = 1;

-- Percentage female
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 4)*100
from drug_answers join user using (user_id)
where sex = 2 and drug_id = 4 and Ever_used = 1;

-- Percentage of people using hallucinogen in each gender (of the people that uses hallucinogen) 
-- Percentage male
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 5)*100
from drug_answers join user using (user_id)
where sex = 1 and drug_id = 5 and Ever_used = 1;

-- Percentage female
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 5)*100
from drug_answers join user using (user_id)
where sex = 2 and drug_id = 5 and Ever_used = 1;

-- Percentage of people using meth in each gender (of the people that uses meth) 
-- Percentage male
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 6)*100
from drug_answers join user using (user_id)
where sex = 1 and drug_id = 6 and Ever_used = 1;

-- Percentage female
select count(distinct User_id)/(select count(distinct User_id) 
						from drug_answers
						where ever_used = 1 
						and drug_id = 6)*100
from drug_answers join user using (user_id)
where sex = 2 and drug_id = 6 and Ever_used = 1;

-- Percentage of people who used marijuana before
select count(User_id)/(select count(*) from user)*100
from drug_answers join user using (user_id)
where drug_id = 1 and Ever_used = 1;

-- Percentage of people who used cocaine before
select count(User_id)/(select count(*) from user)*100
from drug_answers join user using (user_id)
where drug_id = 2 and Ever_used = 1;

-- Percentage of people who used crack before
select count(User_id)/(select count(*) from user)*100
from drug_answers join user using (user_id)
where drug_id = 3 and Ever_used = 1;

-- Percentage of people who used Heroin before
select count(User_id)/(select count(*) from user)*100
from drug_answers join user using (user_id)
where drug_id = 4 and Ever_used = 1;

-- Percentage of people using who used hallucinogen before
select count(User_id)/(select count(*) from user)*100
from drug_answers join user using (user_id)
where drug_id = 5 and Ever_used = 1;

-- Percentage of people using who used meth before
select count(User_id)/(select count(*) from user)*100
from drug_answers join user using (user_id)
where drug_id = 6 and Ever_used = 1;

-- Key: 1- Less than $20,000, 2- $20,000 to $49,999, 3- $50,000 to $74,999, 4- $75,000 or More
-- Income distribution of users who took survey
select income, count(user_id)/(select count(user_id) from user)*100
from edu_employ
group by income;

-- Distribution of income and drugs used in percentages; order by count desc 
select income, 
	count(distinct user_id)/
	(select count(distinct user_id) 
		from drug_answers
		where ever_used = 1)*100
from drug_answers join edu_employ using (user_id)
where ever_used = 1
group by income
order by count(distinct user_id) desc;

-- Percentage from each income group using marijuana; order by count desc
select income, 
	count(distinct user_id)/
    (select count(distinct User_id) 
		from drug_answers
		where ever_used = 1 
		and drug_id = 1)*100
from drug_answers join edu_employ using (user_id)
where drug_id = 1 and ever_used = 1
group by income
order by count(distinct user_id) desc;

-- Percentage from each income group using cocaine; order by count desc
select income, 
	count(distinct user_id)/
	(select count(distinct User_id) 
		from drug_answers
		where ever_used = 1 
		and drug_id = 2)*100
from drug_answers join edu_employ using (user_id)
where drug_id = 2 and ever_used = 1
group by income
order by count(distinct user_id) desc;

-- Percentage from each income group using crack; order by count desc
select income, 
	count(distinct user_id)/
    (select count(distinct User_id) 
		from drug_answers
		where ever_used = 1 
		and drug_id = 3)*100
from drug_answers join edu_employ using (user_id)
where drug_id = 3 and ever_used = 1
group by income
order by count(distinct user_id) desc;

-- Percentage from each income group using heroin; order by count desc
select income, 
	count(distinct user_id)/
    (select count(distinct User_id) 
		from drug_answers
		where ever_used = 1 
		and drug_id = 4)*100
from drug_answers join edu_employ using (user_id)
where drug_id = 4 and ever_used = 1
group by income
order by count(distinct user_id) desc;

-- Percentage from each income group using hallucinogen; order by count desc
select income, 
	count(distinct user_id)/
    (select count(distinct User_id) 
		from drug_answers
		where ever_used = 1 
		and drug_id = 5)*100
from drug_answers join edu_employ using (user_id)
where drug_id = 5 and ever_used = 1
group by income
order by count(distinct user_id) desc;

-- Percentage from each income group using meth; order by count desc
select income, 
	count(distinct user_id)/
    (select count(distinct User_id) 
		from drug_answers
		where ever_used = 1
		and drug_id = 6)*100
from drug_answers join edu_employ using (user_id)
where drug_id = 6 and ever_used = 1
group by income
order by count(distinct user_id) desc;

-- Distribution of age first using drugs 
select Age_first_used, 
	   count(Age_first_used)/
	  (select count(User_id) 
	          from drug_answers
			  where ever_used = 1)*100
from drug_answers
	where ever_used = 1 
    and Age_first_used <> 985
    and Age_first_used <> 994
    and Age_first_used <> 997
    and Age_first_used <> 998
group by Age_first_used;

-- Percentage distribution for marijuana
select Age_first_used, 
		count(Age_first_used)/
        (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 1)*100
from drug_answers
where drug_id = 1 
	and ever_used = 1 
    and Age_first_used <> 985
    and Age_first_used <> 994
    and Age_first_used <> 997
    and Age_first_used <> 998
group by Age_first_used;

-- Percentage distribution for  cocaine
select Age_first_used, 
		count(Age_first_used)/
        (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 2)*100
from drug_answers
where drug_id = 2
	and ever_used = 1 
    and Age_first_used <> 985
    and Age_first_used <> 994
    and Age_first_used <> 997
    and Age_first_used <> 998
group by Age_first_used;

-- Percentage distribution for crack
select Age_first_used, 
	count(Age_first_used)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 3)*100
from drug_answers
where drug_id = 3
	and ever_used = 1 
    and Age_first_used <> 985
    and Age_first_used <> 994
    and Age_first_used <> 997
    and Age_first_used <> 998
group by Age_first_used;

-- Percentage distribution for heroin
select Age_first_used, 
	count(Age_first_used)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 4)*100
from drug_answers
where drug_id = 4
	and ever_used = 1
    and Age_first_used <> 985
    and Age_first_used <> 994
    and Age_first_used <> 997
    and Age_first_used <> 998
group by Age_first_used;

-- Percentage distribution for hallucinogen; 
select Age_first_used, 
	count(Age_first_used)/
    (select count(User_id) 
		from drug_answers
		where ever_used = 1 
		and drug_id = 5)*100
from drug_answers
where drug_id = 5
	and ever_used = 1 
    and Age_first_used <> 985
    and Age_first_used <> 994
    and Age_first_used <> 997
    and Age_first_used <> 998
group by Age_first_used;

-- Percentage distribution for meth
select Age_first_used, 
	count(Age_first_used)/
    (select count(User_id) 
		from drug_answers
		where ever_used = 1 
		and drug_id = 6)*100
from drug_answers
where drug_id = 6
	and ever_used = 1 
    and Age_first_used <> 985
    and Age_first_used <> 994
    and Age_first_used <> 997
    and Age_first_used <> 998
group by Age_first_used;

-- Percentage of users who used marijuana x days in the past 30 days
select Days_in_past_30, 
	count(Days_in_past_30)/
	(select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 1)*100
from drug_answers
where ever_used = 1 
	and drug_id = 1 
	and Days_in_past_30 <> 85
	and Days_in_past_30 <> 93
    and Days_in_past_30 <> 94
    and Days_in_past_30 <> 97
    and Days_in_past_30 <> 98
group by Days_in_past_30;

-- Percentage of users who used cocaine x days in the past 30 days
select Days_in_past_30, 
	count(Days_in_past_30)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 2 
			and drug_id = 4)*100
from drug_answers
where ever_used = 1 
	and drug_id = 2
	and Days_in_past_30 <> 85
	and Days_in_past_30 <> 93
    and Days_in_past_30 <> 94
    and Days_in_past_30 <> 97
    and Days_in_past_30 <> 98
group by Days_in_past_30;

-- Percentage of users who used crack x days in the past 30 days
select Days_in_past_30, 
	count(Days_in_past_30)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 3)*100
from drug_answers
where ever_used = 1 
	and drug_id = 3
	and Days_in_past_30 <> 85
	and Days_in_past_30 <> 93
    and Days_in_past_30 <> 94
    and Days_in_past_30 <> 97
    and Days_in_past_30 <> 98
group by Days_in_past_30;

-- Percentage of users who used heroin x days in the past 30 days
select Days_in_past_30,
	count(Days_in_past_30)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 4)*100
from drug_answers
where ever_used = 1 
	and drug_id = 4
	and Days_in_past_30 <> 85
	and Days_in_past_30 <> 93
    and Days_in_past_30 <> 94
    and Days_in_past_30 <> 97
    and Days_in_past_30 <> 98
group by Days_in_past_30;

-- Percentage of users who used hallucinogen x days in the past 30 days
select Days_in_past_30, 
	count(Days_in_past_30)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 5)*100
from drug_answers
where ever_used = 1 
	and drug_id = 5
	and Days_in_past_30 <> 85
	and Days_in_past_30 <> 93
    and Days_in_past_30 <> 94
    and Days_in_past_30 <> 97
    and Days_in_past_30 <> 98
group by Days_in_past_30;

-- Percentage of users who used meth x days in the past 30 days
select Days_in_past_30, 
	count(Days_in_past_30)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 6)*100
from drug_answers
where ever_used = 1 
	and drug_id = 6
	and Days_in_past_30 <> 85
	and Days_in_past_30 <> 93
    and Days_in_past_30 <> 94
    and Days_in_past_30 <> 97
    and Days_in_past_30 <> 98
group by Days_in_past_30;

-- Key: 1- less high school, 2- high school grad, 3- some coll/asso dg, 4- college graduate, 5- 12 to 17 years old
-- Distribution of education 
select education, count(user_id)/(select count(user_id) from user)*100
from edu_employ
group by education;

-- Distribution of education and drugs used in percentages; order by count desc
select education,
	count(distinct user_id)/
    (select count(distinct user_id) 
		from drug_answers
		where ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
where ever_used = 1
group by education 
order by count(distinct user_id) desc;

-- Percentage usage of marijuana by education
select education,
	count(distinct user_id)/
    (select count(distinct User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 1)*100
from edu_employ join drug_answers using (user_id)
where ever_used = 1 and drug_id = 1 
group by education 
order by count(distinct user_id) desc;

-- Percentage usage of cocaine by education
select education,
	count(distinct user_id)/
    (select count(distinct User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 2)*100
from edu_employ join drug_answers using (user_id)
where ever_used = 1 and drug_id = 2
group by education 
order by count(distinct user_id) desc;

-- Percentage usage of crack by education
select education,
	count(distinct user_id)/
    (select count(distinct User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 3)*100
from edu_employ join drug_answers using (user_id)
where ever_used = 1 and drug_id = 3
group by education 
order by count(distinct user_id) desc;

-- Percentage usage of heroin by education
select education,
	count(distinct user_id)/
    (select count(distinct User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 4)*100
from edu_employ join drug_answers using (user_id)
where ever_used = 1 and drug_id = 4
group by education 
order by count(distinct user_id) desc;

-- Percentage usage of hallucinogen by education
select education,
	count(user_id)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 5)*100
from edu_employ join drug_answers using (user_id)
where ever_used = 1 and drug_id = 5
group by education 
order by count(user_id) desc;

-- Percentage usage of meth by education
select education,
	count(user_id)/
    (select count(User_id) 
			from drug_answers
			where ever_used = 1 
			and drug_id = 6)*100
from edu_employ join drug_answers using (user_id)
where ever_used = 1 and drug_id = 6
group by education 
order by count(user_id) desc;

-- Key: 1- yes, 2- no, 85- BAD DATA logically assigned, 94- dont know, 97- refused, 98- blank, 99- legitimate skip
-- How does mental health play a role?
-- Drug users who has mental health problems:
select count(distinct user_id)/
	(select count(distinct user_id) 
    from drug_answers 
    where ever_used = 1)*100
from general_health join drug_answers using (user_id)
where mental_health = 1 and ever_used = 1;

-- Drug users without any mental health problems:
select count(distinct user_id)/
	(select count(distinct user_id) 
    from drug_answers 
    where ever_used = 1)*100
from general_health join drug_answers using (user_id)
where mental_health = 2 and ever_used = 1;

-- Drug users who replied other, skipped, etc.
select count(distinct user_id)/
	(select count(distinct user_id) 
    from drug_answers 
    where ever_used = 1)*100
from general_health join drug_answers using (user_id)
where ever_used = 1 and 
	 (mental_health = 85 or 
	  mental_health = 94 or
      mental_health = 97 or
      mental_health = 98 or
      mental_health = 99);

-- Key: 1- excellent, 2- very good, 3- good, 4- fair, 5- poor, 94- dont know, 97- refused
-- How does regular health play a role? 
-- Percentage of healthy users who used drugs:
select count(distinct user_id)/
	  (select count(distinct user_id) 
       from drug_answers 
       where ever_used = 1)*100
from general_health join drug_answers using (user_id)
where ever_used = 1 and 
	  (health_status = 1 or
	   health_status = 2 or
	   health_status = 3 or 
	   health_status = 4);

-- Percentage of unhealthy users using drugs:
select count(distinct user_id)/
	  (select count(distinct user_id) 
       from drug_answers 
       where ever_used = 1)*100
from general_health join drug_answers using (user_id)
where ever_used = 1 and health_status = 5;

-- Percentage of drugs users with "other" health: 
select count(distinct user_id)/
	  (select count(distinct user_id) 
       from drug_answers 
       where ever_used = 1)*100
from general_health join drug_answers using (user_id)
where ever_used = 1 and 
	  (health_status = 94 or
	   health_status = 97);
       
-- For people with health problems, what is the percentage of people that tried marijuana (maybe for health problems?)
select count(distinct user_id)/
	  (select count(distinct user_id)
       from general_health
       where health_status = 5)*100
from general_health join drug_answers using (user_id)
where ever_used = 1 and health_status = 5 and drug_id = 1;

-- Key: 1- nonhisp white, 2- nonhisp black/afr am, 3- nonhisp native am/ak native, 4- nonhisp native HI/Other Pac Isl
-- 5- Nonhisp Asian, 6- NonHisp more than one race, 7- hispanic
-- Distribution for race 
select race, count(distinct user_id)/
	(select count(distinct user_id) 
		from drug_answers
		where ever_used = 1)*100
from user join drug_answers using (user_id)
where ever_used = 1
group by race;

-- Percentage usage for marijuana by race
select race, count(distinct user_id)/
	(select count(distinct user_id) 
		from drug_answers
		where ever_used = 1
        and drug_id = 1)*100
from user join drug_answers using (user_id)
where ever_used = 1 and drug_id = 1 
group by race;

-- Percentage usage for cocaine by race
select race, count(distinct user_id)/
	(select count(distinct user_id) 
		from drug_answers
		where ever_used = 1
        and drug_id = 2)*100
from user join drug_answers using (user_id)
where ever_used = 1 and drug_id = 2
group by race;

-- Percentage usage for crack by race
select race, count(distinct user_id)/
	(select count(distinct user_id) 
		from drug_answers
		where ever_used = 1
        and drug_id = 3)*100
from user join drug_answers using (user_id)
where ever_used = 1 and drug_id = 3 
group by race;

-- Percentage usage for heroin by race
select race, count(distinct user_id)/
	(select count(distinct user_id) 
		from drug_answers
		where ever_used = 1
        and drug_id = 4)*100
from user join drug_answers using (user_id)
where ever_used = 1 and drug_id = 4
group by race;

-- Percentage usage for hallucinogen by race
select race, count(distinct user_id)/
	(select count(distinct user_id) 
		from drug_answers
		where ever_used = 1
        and drug_id = 5)*100
from user join drug_answers using (user_id)
where ever_used = 1 and drug_id = 5
group by race;

-- Percentage usage for meth by race
select race, count(distinct user_id)/
	(select count(distinct user_id) 
		from drug_answers
		where ever_used = 1
        and drug_id = 6)*100
from user join drug_answers using (user_id)
where ever_used = 1 and drug_id = 6
group by race;

-- Race distribution for survey
select race, count(user_id)/
	(select count(user_id) from user)*100
from user
group by race;

-- Number of Users who needed treatment but couldn't afford it/ no health coverage
select count(distinct user_id)/
	  (select count(distinct user_id)
       from treatment_answers 
	   where need_treatment = 1
       or need_treatment = 11)*100
from treatment_answers
where (need_treatment = 1 or
	  need_treatment = 11) and
      (couldnt_afford = 1  or
      couldnt_afford = 11);
      
-- Out of the result from above, why couldn't people afford treatment?
-- Percentage of people that health-care covered for the users that need treatment
select count(distinct user_id)/
       (select count(distinct user_id)
       from treatment_answers 
	   where need_treatment = 1
       or need_treatment = 11)*100
from treatment_answers
where (need_treatment = 1 or
	  need_treatment = 11) and
      (treatment_not_covered = 6);

-- Did distance from rehab centers factor into the decision to receive/ not receive treatment?
select count(user_id)
from treatment_answers
where distance_from_rehab = 1 or distance_from_rehab = 11;

select count(distinct user_id)/
       (select count(distinct user_id)
       from treatment_answers 
	   where need_treatment = 1
       or need_treatment = 11)*100
from treatment_answers
where (need_treatment = 1 or
	  need_treatment = 11) and
      (distance_from_rehab = 1 or
       distance_from_rehab = 11);
       
-- For users who already received a treatment, have they used drugs in the last 30 days? 
-- This query shows that 43.0143% of people used drugs in the past 30 days 
-- after already receiving treatment/in progress of receiving treatment
select count(user_id)/ 
	   (select count(user_id)
        from treatment_answers 
        where (time_since_last = 1 or
			   time_since_last = 2 or
               time_since_last = 3 or 
               time_since_last = 7 or
               time_since_last = 8 or
			   time_since_last = 9 or
               time_since_last = 13))*100
from treatment_answers join drug_answers using (user_id)
where (time_since_last = 1 or
	   time_since_last = 2 or
       time_since_last = 3 or 
       time_since_last = 7 or
       time_since_last = 8 or
       time_since_last = 9 or
       time_since_last = 13) and
       (days_in_past_30 <> 85 and
	   days_in_past_30 <> 91 and
       days_in_past_30 <> 93 and
       days_in_past_30 <> 94 and
	   days_in_past_30 <> 97 and
       days_in_past_30 <> 98);

-- Key:1- employed full time, 2- employed part time, 3- unemployed, 4- other, 99- 12-14 years old
-- Out of all people who have used drugs before, what percent of them are employed full time? 
select count(user_id)/
	  (select count(user_id)
       from drug_answers
       where ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
where employment = 1 and ever_used = 1;

-- Part time?
select count(user_id)/
	  (select count(user_id)
       from drug_answers
       where ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
where employment = 2 and ever_used = 1;

-- Not employed?
select count(user_id)/
	  (select count(user_id)
       from drug_answers
       where ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
where employment = 3 and ever_used = 1;

-- None of the above/rest?
select count(user_id)/
	  (select count(user_id)
       from drug_answers
       where ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
where employment = 4 and ever_used = 1;

-- 12 to 14 years old?
select count(user_id)/
	  (select count(user_id)
       from drug_answers
       where ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
where employment = 99 and ever_used = 1;

-- For full employment/part time, what drugs do these users use the most by %?
select drug_name, count(user_id)/
	        (select count(user_id)
             from edu_employ join drug_answers using (user_id)
             where (employment = 1 or employment = 2) and ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
join drugs using (drug_id)
where (employment = 1 or employment = 2) and ever_used = 1
group by drug_id
order by count(user_id) desc;

-- For unemployment, what drugs do these users use the most by %?
select drug_name, count(user_id)/
	        (select count(user_id)
             from edu_employ join drug_answers using (user_id)
             where employment = 3 and ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
join drugs using (drug_id)
where employment = 3 and ever_used = 1
group by drug_id
order by count(user_id) desc;

-- For others?
select drug_name, count(user_id)/
	        (select count(user_id)
             from edu_employ join drug_answers using (user_id)
             where employment = 4 and ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
join drugs using (drug_id)
where employment = 4 and ever_used = 1
group by drug_id
order by count(user_id) desc;

-- 12-14 years old?
select drug_name, count(user_id)/
	        (select count(user_id)
             from edu_employ join drug_answers using (user_id)
             where employment = 99 and ever_used = 1)*100
from edu_employ join drug_answers using (user_id)
join drugs using (drug_id)
where employment = 99 and ever_used = 1
group by drug_id
order by count(user_id) desc;