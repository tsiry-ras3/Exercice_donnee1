-- 1- Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipe.
select id, first_name, last_name from Employee e join Team t on e.team_id = t.id where t.id = 0;

-- 2- Afficher l’id, first_name, last_name des employés qui n’ont jamais pris de congé de leur vie.
select id, first_name, last_name from Employee e left join Leave l on e.id= l.employee_id
where l.employee_id is null;

-- 3- Afficher les congés de tel sorte qu’on voie l’id du congé, le début du congé, la fin du congé,
-- le nom & prénom de l’employé qui prend congé et le nom de son équipe.
select l.id, l.start_date, l.end_date, employee.last_name, employee.first_name, team.name from Leave l
join employee e on e.id = l.employee_id 
join team t on t.id = e.team_id;

-- 4- Affichez par le nombre d’employés par contract_type, vous devez afficher le type de contrat,
-- et le nombre d’employés associés.
select contract_type, count(*) as employee_count from employee group by contract_type;

-- 5- Afficher le nombre d’employés en congé aujourd'hui. La période de congé s'étend de start_date inclus
-- jusqu’à end_date inclus
select count(*) as employee_on_leave_today from Leave l
where current_date between l.start_date and l.end_date;

-- 6- Afficher l’id, le nom, le prénom de tous les employés + le nom de leur équipe qui sont en congé
-- aujourd’hui. Pour rappel, la end_date est incluse dans le congé, l’employé ne revient que le lendemain. 
select e.id, e.last_name, e.first_name, t.name from Leave l 
join employee e on e.id = l.employee_id 
join team t on t.id = e.team_id
where current_date between l.start_date and l.end_date;
