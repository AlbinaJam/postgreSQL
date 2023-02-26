SELECT name, год_выпуска  FROM Альбом
where год_выпуска = 2018;

SELECT name, длительность FROM Песни
order by длительность desc
limit 1;

SELECT name  FROM Песни
where длительность >= 3.5*60;

SELECT name, год_выпуска  FROM Сборник
where год_выпуска BETWEEN 2018 and 2021;

SELECT name  FROM Исполнитель
where name not like '% %';

SELECT name FROM Песни
WHERE LOWER(name) like '%my%' or LOWER(name) like '%мой%';
