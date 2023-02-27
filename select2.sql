SELECT  g.name, COUNT(исполнитель_id) FROM жанргруппы жг
LEFT JOIN жанр g ON жб.жанр_id = g.id
GROUP BY g.name;

SELECT COUNT(п.id) FROM песни п
LEFT JOIN альбом а ON п.альбом_id = а.id
where a.год_выпуска between 2019 and 2020;

SELECT a.name, avg(п.продолжительность) FROM песни п
LEFT JOIN альбом a ON п.альбом_id = а.id
group by а.id;

select name from исполнитель и
except
select и.name from альбомисполнителя аи
join альбом a on a.id = аи.альбом_id
join Исполнитель и on и.id = аи.исполнитель_id
where a.год_выпуска = 2020

SELECT distinct с.name FROM сборник с
JOIN сборникпесен сп ON сп.сборник_id  = с.id
join песни п on п.id = сп.песня_id
join альбом a on a.id = п.альбом_id
join альбомисполнителя аи on аи.альбом_id = a.id
join исполнители и on и.id = аи.исполнитель_id
where и.name = 'Megadeth'

select a.name, count(ж.name) from альбом a
join альбомисполнителя аи on аи.альбом_id = a.id
join исполнитель и on и.id = аи.исполнитель_id
join жанргруппы жг on жг.исполнитель_id = и.id
join жанр ж on ж.id = жг.жанр_id
group by a.name
having count(ж.name) > 1

select п.name from песни п
left join сборникпесен сп on сп.песня_id = п.id
where сп.сборник_id is null

SELECT п.name from songs п
where п.продолжительность = (select MIN(продолжительность) FROM песни);

select а.name, count(п.id)  from альбом а
join песни п on п.альбом_id = а.id
group by а.id
having count(п.id) =
	(select count(п.id)  from альбом а
	join songs п on п.альбом_id = а.id
	group by а.id
	order by count(п.id)
	limit 1)
