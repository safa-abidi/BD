SELECT nom, prenom
FROM etudiant;

SELECT nom,prenom
FROM etudiant
WHERE ville LIKE 'tunis' OR ville LIKE 'sfax'
ORDER BY ville DESC;

SELECT nom,prenom
FROM etudiant
WHERE nom LIKE 't%' OR nom like 'f%'
ORDER BY nom DESC;

SELECT nom,prenom
FROM enseignant
WHERE nom LIKE '%a_';

SELECT nom,prenom, nom_departement
FROM enseignant, departement
WHERE enseignant.departement_id = departement.departement_id
GROUP BY nom_departement, nom, prenom;

select (count(*)) as 'nombre de moniteurs'
from enseignant
where grade like 'moniteur';

select nom,prenom
from etudiant
where fax is null;

select intitule
from enseignement
where description like '%SQL%' or description like '%licence%';

select avg(capacite) as 'capacite moy' , max(capacite) as 'cap max'
from salle;

select * , avg(capacite) as 'capacite moy'
from salle
where capacite < ( select avg (capacite) from salle);

select *
from etudiant
group by ville;




