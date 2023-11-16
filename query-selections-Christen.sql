-- What are the Top 25 schools (.edu domains)?
select email_domain as School, count(*) as Learner_Count from users
group by 1
order by 2 desc
limit 25;

-- How many .edu learners are located in New York?
select city, count(user_id) as Learner_Count from users
where city='New York';

-- How many of these Codecademy learners are using the mobile app?
select mobile_app, count(mobile_app) as Learner_Count from users
where mobile_app='mobile-user';

-- Sign up counts for each hour - SQLite
select strftime('%H', sign_up_at) as Hour, count(*) as Signup_Count
from users
group by 1
order by 1;

-- Sign up counts for each hour - mySQL
select date_format(sign_up_at,'%H') as Hour, count(*) as Signup_Count
from users
group by 1
order by 1;

-- Do different schools (.edu domains) prefer different courses?
select u.email_domain, sum(
case when p.learn_cpp!='' then 1
else 0
end) as 'cpp',
sum(case when p.learn_sql!='' then 1
else 0
end) as 'sql',
sum(case when p.learn_html!='' then 1
else 0
end) as 'html',
sum(case when p.learn_javascript!='' then 1
else 0
end) as 'javascript',
sum(case when p.learn_java!='' then 1
else 0
end) as 'java',
count(*) as Learner_Count
from users u
join progress p
where u.user_id = p.user_id
group by u.email_domain;

-- What courses are the New Yorkers students taking?
select u.city, sum(
case when p.learn_cpp!='' then 1
else 0
end) as 'cpp',
sum(case when p.learn_sql!='' then 1
else 0
end) as 'sql',
sum(case when p.learn_html!='' then 1
else 0
end) as 'html',
sum(case when p.learn_javascript!='' then 1
else 0
end) as 'javascript',
sum(case when p.learn_java!='' then 1
else 0
end) as 'java',
count(*) as Learner_Count
from users u
join progress p
where u.user_id = p.user_id and u.city="New York";

-- What courses are the Chicago students taking?
select u.city, 
sum(case when p.learn_cpp!='' then 1
else 0
end) as 'cpp',
sum(case when p.learn_sql!='' then 1
else 0
end) as 'sql',
sum(case when p.learn_html!='' then 1
else 0
end) as 'html',
sum(case when p.learn_javascript!='' then 1
else 0
end) as 'javascript',
sum(case when p.learn_java!='' then 1
else 0
end) as 'java',
count(*) as Learner_Count
from users u, progress p
where u.user_id = p.user_id and u.city="Chicago";