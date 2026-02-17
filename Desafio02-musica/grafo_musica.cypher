Nós (Nodes)
(:Usuario)
(:Musica)
(:Artista)
(:Genero)

Relacionamentos (Edges)
(:Usuario)-[:OUVIU]->(:Musica)
(:Usuario)-[:CURTIU]->(:Musica)
(:Usuario)-[:SEGUE]->(:Artista)
(:Musica)-[:PERTENCE_A]->(:Genero)
(:Artista)-[:CRIOU]->(:Musica)


Criando os Nós usuario

CREATE 
(u1:Usuario {id: 1, nome: "Thayza"}),
(u2:Usuario {id: 2, nome: "Carlos"}),

(m1:Musica {id: 1, titulo: "Blinding Lights"}),
(m2:Musica {id: 2, titulo: "Save Your Tears"}),
(m3:Musica {id: 3, titulo: "Levitating"}),

(a1:Artista {nome: "The Weeknd"}),
(a2:Artista {nome: "Dua Lipa"}),

(g1:Genero {nome: "Pop"});

Criando os Relacionamentos
// Artistas e músicas
MATCH (a1:Artista {nome: "The Weeknd"}), (m1:Musica {titulo: "Blinding Lights"})
CREATE (a1)-[:CRIOU]->(m1);

MATCH (a1:Artista {nome: "The Weeknd"}), (m2:Musica {titulo: "Save Your Tears"})
CREATE (a1)-[:CRIOU]->(m2);

MATCH (a2:Artista {nome: "Dua Lipa"}), (m3:Musica {titulo: "Levitating"})
CREATE (a2)-[:CRIOU]->(m3);

// Músicas e gêneros
MATCH (m:Musica), (g:Genero {nome: "Pop"})
CREATE (m)-[:PERTENCE_A]->(g);

// Interações dos usuários
MATCH (u1:Usuario {nome: "Thayza"}), (m1:Musica {titulo: "Blinding Lights"})
CREATE (u1)-[:OUVIU {vezes: 10}]->(m1);

MATCH (u1:Usuario {nome: "Thayza"}), (m2:Musica {titulo: "Save Your Tears"})
CREATE (u1)-[:CURTIU]->(m2);

MATCH (u1:Usuario {nome: "Thayza"}), (a1:Artista {nome: "The Weeknd"})
CREATE (u1)-[:SEGUE]->(a1);

Recomendação por artista seguido

MATCH (u:Usuario {nome: "Thayza"})-[:SEGUE]->(a:Artista)-[:CRIOU]->(m:Musica)
WHERE NOT (u)-[:OUVIU]->(m)
RETURN m.titulo AS recomendacao;

Recomendação por gênero que o usuário escuta

MATCH (u:Usuario {nome: "Thayza"})-[:OUVIU]->(:Musica)-[:PERTENCE_A]->(g:Genero)<-[:PERTENCE_A]-(m:Musica)
WHERE NOT (u)-[:OUVIU]->(m)
RETURN DISTINCT m.titulo AS recomendacao;

Recomendação baseada em usuários parecidos

MATCH (u:Usuario {nome: "Thayza"})-[:OUVIU]->(m:Musica)<-[:OUVIU]-(outro:Usuario)-[:OUVIU]->(rec:Musica)
WHERE NOT (u)-[:OUVIU]->(rec)
RETURN DISTINCT rec.titulo AS recomendacao;

