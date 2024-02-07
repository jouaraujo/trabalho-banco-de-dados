create table departamento(
    cod_departamento int,
    nome_departamento varchar(40) not null,
    primary key(cod_departamento))

insert into departamento (cod_departamento, nome_departamento) values(1,'D1');
insert into departamento (cod_departamento, nome_departamento) values(2,'D2');
insert into departamento (cod_departamento, nome_departamento) values(3,'D3')

create table empregado(
  cod_empregado int,
  nome_empregado varchar(40) not null,
  cod_departamento int,
  primary key(cod_empregado),
  foreign key(cod_departamento) references departamento
)

insert into empregado(cod_empregado, nome_empregado, cod_departamento) values(1,'jose',3);
insert into empregado(cod_empregado, nome_empregado, cod_departamento) values(2,'maria',2);
insert into empregado(cod_empregado, nome_empregado, cod_departamento) values(3,'joao',2);
insert into empregado(cod_empregado, nome_empregado, cod_departamento) values(4,'joao',1);
insert into empregado(cod_empregado, nome_empregado, cod_departamento) values(5,'pedro',3);
insert into empregado(cod_empregado, nome_empregado, cod_departamento) values(6,'ana',2)

create table depende(
  cod_depende int,
  nome_depende varchar(40) not null,
  cod_empregado int,
  primary key(cod_depende),
  foreign key(cod_empregado) references empregado
)

insert into depende(cod_depende, nome_depende, cod_empregado) values(1,'francisco',3);
insert into depende(cod_depende, nome_depende, cod_empregado) values(2,'juliana',3);
insert into depende(cod_depende, nome_depende, cod_empregado) values(3,'juliana',4);
insert into depende(cod_depende, nome_depende, cod_empregado) values(4,'manuel',1);
insert into depende(cod_depende, nome_depende, cod_empregado) values(5,'miguel',3);
insert into depende(cod_depende, nome_depende, cod_empregado) values(6,'hugo',2);
insert into depende(cod_depende, nome_depende, cod_empregado) values(7,'marcos',6);
insert into depende(cod_depende, nome_depende, cod_empregado) values(8,'daniela',1);
insert into depende(cod_depende, nome_depende, cod_empregado) values(9,'marieta',2)


--1) O código de todos os empregados com o nome Joao;--

select cod_empregado, nome_empregado
from empregado
where nome_empregado = 'joao'

--2) O nome e o código de todos os empregados com código entre 2 e 4;--

select nome_empregado, cod_empregado 
from empregado 
where cod_empregado between 2 and 4

--3) O nome dos empregados e o nome do departamento onde trabalham;--

select e.nome_empregado, d.nome_departamento 
from empregado e inner join departamento d on e.cod_departamento = d.cod_departamento 

--4) O nome dos empregados e o nome dos seus respectivos dependentes;--

select e.nome_empregado, d.nome_depende
from empregado e inner join depende d on e.cod_empregado = d.cod_empregado

--5) O nome e o código dos empregados que trabalham no departamento com código igual a 2;--

select nome_empregado, cod_empregado
from empregado
where cod_departamento = 2

--6) O nome e o código dos empregados que trabalham no departamento de nome D3;--

select e.nome_empregado, e.cod_empregado
from empregado e inner join departamento d on e.cod_departamento = d.cod_departamento 
where d.nome_departamento = 'D3'


--7) O nome dos dependentes do empregado com código igual a 3;--

select nome_depende 
from depende
where cod_empregado = 3

--8) O nome dos dependentes do empregado com nome igual a José;--

select d.nome_depende, e.nome_empregado
from depende d inner join empregado e on 
d.cod_empregado = e.cod_empregado
where nome_empregado = 'jose'

--9) O nome do empregado do qual Marieta é dependente ;--

select e.nome_empregado, d.nome_depende
from empregado e inner join depende d on
e.cod_empregado = d.cod_empregado 
where nome_depende = 'marieta'

--10) O nome dos empregados com código igual a 2 ou 3 e o nome de todos os seus dependentes.--

select e.nome_empregado, e.cod_empregado, d.nome_depende
from empregado e inner join depende d on
e.cod_empregado = d.cod_empregado
where e.cod_empregado = 2 or e.cod_empregado = 3