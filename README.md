# Projeto de Analise de Dados

Este projeto tem por objetivo a criação e análise de uma Database dos top 1000 filmes do IMDB (internet movie database).

## Tecnologias Utilizadas

- Python notebook
- MySQL

## Schema

Nossos dados Brutos começam com o seguinte ER diagram (diagrama de relação de entidades):

```mermaid
erDiagram
    imdb_top_1000 {
        TEXT Poster_Link
        TEXT Series_Title
        TEXT Released_Year
        TEXT Certificate
        TEXT Runtime
        TEXT Genre
        TEXT IMDB_Rating
        TEXT Overview
        TEXT Meta_score
        TEXT Director
        TEXT Star1
        TEXT Star2
        TEXT Star3
        TEXT Star4
        TEXT No_of_Votes
        TEXT Gross
    }

```

Após a limpeza de dados, teremos ao final o seguinte ER diagram.
Onde serão gerados insights a partir de determinadas `VIEWS` e `PROCEDURES`

```mermaid
erDiagram
    movies {
        INT id
        VARCHAR title
        YEAR released_year
        VARCHAR certificate 
        INT runtime_in_minutes
        VARCHAR genre
        DECIMAL IMDB_rating
        INT meta_score
        INT votes
        INT gross
    }
    
    actors {
        INT id
        VARCHAR actor
    }
    
	directors {
		INT id
		VARCHAR director
	}

    plots {
		INT movie_id
		TEXT plot
	}
	
    actors }o--|{ movies : stars
    movies }|--|| directors : directs
    movies ||--|| plots: have
```

## Setup

Para aqueles que nao apenas desejam ver os resultados, mas também acompanhar seu desenvolvimento, é necessário primeiramente clonar o repositório.

```
git clone https://github.com/Costa-LG/Movies-Data-Analysis.git
cd Movies-Data-Analysis
```

### Criando o ambiente virtual

```
python -m venv venv
venv\Scripts\activate # Windows
source venv/bin/activate # Linux
```

### Instalando Dependências

```
pip install -r requirements.txt
```

## Passos

Terminada as preparações, aqui estão ordenados os próximos passos, assim como os arquivos correspondentes do repositório.

1. Cleaning_Data.ipynb
> Como o nome indica, este notebook contém um programa em `pandas` para a limeza de dados.
2. schema.sql
> Neste arquivo foram criadas as devidas tabelas em `MySQL`

