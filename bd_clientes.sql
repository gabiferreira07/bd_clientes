#CRIANDO BANCO - DDL
create database bd_clientes; 

#USANDO BANCO		
use bd_clientes;

#CRIANDO TABELA - DDL
create table tbl_clientes(
	cod_cliente int not null primary key auto_increment,
    nome varchar(40) not null, 
    sexo char(1) not null);
    
#ISERINDO INFORMAÇÕES NA TABELA - DML
insert into tbl_clientes(nome, sexo)
	values("Hamilton", "M"), ("Ayrton Senna", "M"), ("Mari Becker", "F");

#DML
select * from tbl_clientes; 

DELIMITER $$
create procedure sp_lista_clientes(in opcao int)
begin
	if opcao = 0 then
		select * from tbl_clientes where sexo = 'F';
	elseif opcao = 1 then
		select * from tbl_clientes where sexo = 'M';
	else
		select * from tbl_clientes;
	end if;
end $$
DELIMITER ;

show procedure status;

#LISTA SEXO FEMININO
call sp_lista_clientes(0);
#LISTA SEXO MASCULINO
call sp_lista_clientes(1);
#LISTA TODOS
call sp_lista_clientes(2);

#EXEMPLO 2 SORED PROCEDURE
DELIMITER $$
create procedure sp_busca_cliente_por_nome
(in nome_parcial varchar(100))
begin
	select * from tbl_clientes
    where nome like concat('%', nome_parcial, '%');
end $$
DELIMITER ;

call sp_busca_clientes_por_nome('Ayrton'); -- RETORNA O CLIENTE 'Ayrton Senna'

create table tbl_clientes2(
	id int not null  primary key auto_increment,
    nome varchar(100) not null,
    idade int not null,
    sexo char(1),
    email varchar(100) not null,
    telefone varchar(15) not null,
    endereco varchar(255));
    
insert into tbl_clientes2(nome, idade, sexo, email, telefone, endereco)
	values	("Reinaldo", 48, "M", "rei@email.com", "11 99887-5432", "São Paulo"),
			("Sergiana", 27, "F", "sergi@email.com", "11 99885-1398", "Cotia"),
            ("Lucas", 22, "M", "luc4s@email.com", "15 99882-7634", "Itapetininga"),
            ("Camily", 16, "F", "camily@email.com", "15 99805-4523", "Sorocaba"),
            ("Kendra", 17, "F", "kendra4@email.com", "11 99881-8756", "Itapetininga");
            
select * from tbl_clientes2;

DELIMITER $$
create procedure cliente_idade(in opcao int)
begin
	if opcao = 0 then
		select * from tbl_clientes2 where idade > '18';
	elseif opcao = 1 then
		select * from tbl_clientes2 where idade < '18';
	else
		select * from tbl_clientes2;
	end if;
end $$
DELIMITER ;

show procedure status;

#LISTA MAIOR IDADE
call cliente_idade(0);
#LISTA MENOR IDADE
call cliente_idade(1);
#LISTA TODOS
call cliente_idade(3);
