CREATE TABLE editora
(
   codigo serial primary key,
   nome varchar(100) not null,
   datafundacao date
);

CREATE TABLE categoria
(
   codigo serial primary key,
   nome varchar(100) not null
   
);

CREATE TABLE regiao
(
   codigo serial primary key,
   nome varchar(100) not null,
   descricao text
   
);
CREATE TABLE equipe
(
   codigo serial primary key,
   nome varchar(100) not null,
   descricao text
   
);
CREATE TABLE jogador
(
   login varchar(50) primary key,
   email varchar(50) not null,
   senha varchar(50) not null
   
);

CREATE TABLE heroi
(
   codigo serial primary key,
   codinome varchar(100) not null,
   nome varchar(50),
   descricao text,
   foto varchar(100),
   inteligencia integer,
   forca integer,
   velocidade integer,
   resistencia integer,
   projecaoenergia integer,
   habilidadecombate integer,
   categoria integer,
   editora integer,
   regiao integer,
   foreign key (categoria) references categoria,
   foreign key (editora) references editora,
   foreign key (regiao) references regiao
   
);

CREATE TABLE heroiequipe
(
	heroi integer,
	equipe integer,
	primary key (heroi,equipe),
	foreign key (heroi) references heroi,
	foreign key (equipe) references equipe
	
);