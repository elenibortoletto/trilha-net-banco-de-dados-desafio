USE [Filmes]
-- 1 Buscar o nome e o ano dos filmes
SELECT F.Nome,F.Ano FROM Filmes F

-- 2 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano 
   -- ( o campo duração foi incluido porque foi apresentado no resultado esperado )
SELECT F.Nome,F.Ano,F.Duracao FROM Filmes F ORDER BY F.Ano

-- 3 Buscar pelo filme de volta para o futuro,trazendo o nome,ano e a duração
SELECT F.Nome,F.Ano,F.Duracao FROM Filmes F WHERE F.Nome = 'De Volta para o Futuro'
	-- ou poderia buscar pelo ID
	SELECT F.Nome,F.Ano,F.Duracao FROM Filmes F WHERE F.Id = 28

-- 4 Buscar os filmes lançados em 1997
SELECT F.Nome,F.Ano,F.Duracao FROM Filmes F WHERE F.Ano = 1997

--5 Buscar os filmes APÓS o ano 2000
SELECT F.Nome,F.Ano,F.Duracao FROM Filmes F WHERE F.Ano > 2000

-- 6 Buscar os filmes com a duração maior que 100 e menor que 150, ordenando pela duração em ordem crescente
SELECT F.Nome,F.Ano,F.Duracao FROM Filmes F WHERE ( F.Duracao > 100 and F.Duracao < 150 ) ORDER BY F.Duracao

-- 7 Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenado pela duração em ordem crescente
SELECT F.Ano ,COUNT(*) as Quantidade FROM Filmes F GROUP BY F.Ano order by Quantidade desc

-- 8 Buscar os atores do gênero masculino, retornando PrimeiroNome,UltimoNome
SELECT A.Id,A.PrimeiroNome,A.UltimoNome,A.Genero FROM Atores A WHERE A.Genero='M'

-- 9 Buscar os atores de genero feminimo, retornando o PrimeiroNome,UltimoNome, e ordenando pelo PrimeiroNome
SELECT A.Id,A.PrimeiroNome,A.UltimoNome,A.Genero FROM Atores A WHERE A.Genero='F' ORDER BY A.PrimeiroNome

-- 10 Buscar o nome do filme e o gênero
SELECT F.Nome,G.Genero FROM Filmes F
INNER JOIN FilmesGenero FG ON FG.IdFilme=F.Id
INNER JOIN Generos G ON G.id=FG.IdGenero

-- 11 Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT F.Nome,G.Genero FROM  FilmesGenero FG
INNER JOIN Filmes F ON F.Id=FG.IdFilme
INNER JOIN Generos G ON G.id=FG.IdGenero
WHERE G.Genero='Mistério'

	
-- 12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome,UltimoNome e seu Papel
SELECT F.Nome,A.PrimeiroNome,A.UltimoNome,EF.Papel FROM ElencoFilme EF
INNER JOIN Filmes F ON EF.IdFilme=F.Id
INNER JOIN Atores A ON EF.IdAtor=A.Id