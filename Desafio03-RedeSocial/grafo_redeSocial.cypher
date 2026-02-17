Usuários
CREATE 
(u1:User {id: 1, name: "Ana"}),
(u2:User {id: 2, name: "Bruno"}),
(u3:User {id: 3, name: "Carla"});

Posts
CREATE
(p1:Post {id: 101, content: "Aprendendo Neo4j", likes: 10}),
(p2:Post {id: 102, content: "Grafos são incríveis", likes: 20});

Tópicos
CREATE
(t1:Topic {name: "Banco de Dados"}),
(t2:Topic {name: "Grafos"});

4. Criando relacionamentos
MATCH (a:User {name:"Ana"}), (b:User {name:"Bruno"})
CREATE (a)-[:FOLLOWS]->(b);

MATCH (b:User {name:"Bruno"}), (c:User {name:"Carla"})
CREATE (b)-[:FOLLOWS]->(c);

MATCH (a:User {name:"Ana"}), (p1:Post {id:101})
CREATE (a)-[:POSTED]->(p1);

MATCH (b:User {name:"Bruno"}), (p2:Post {id:102})
CREATE (b)-[:POSTED]->(p2);

MATCH (c:User {name:"Carla"}), (p2:Post {id:102})
CREATE (c)-[:LIKED]->(p2);

MATCH (p1:Post {id:101}), (t1:Topic {name:"Banco de Dados"})
CREATE (p1)-[:ABOUT]->(t1);

MATCH (p2:Post {id:102}), (t2:Topic {name:"Grafos"})
CREATE (p2)-[:ABOUT]->(t2);

5. Consultas complexas (o coração do desafio)

1. Quem interage com quem?
MATCH (u1:User)-[:FOLLOWS]->(u2:User)
RETURN u1.name AS Seguidor, u2.name AS Seguido;

2. Conteúdos mais populares
MATCH (p:Post)
RETURN p.content, p.likes
ORDER BY p.likes DESC;

3. Usuários que curtiram posts sobre um tópico
MATCH (u:User)-[:LIKED]->(p:Post)-[:ABOUT]->(t:Topic {name:"Grafos"})
RETURN u.name;

4. Comunidades de interesse (usuários conectados por tópico)
MATCH (u:User)-[:POSTED|LIKED]->(p:Post)-[:ABOUT]->(t:Topic)
RETURN t.name AS Topico, collect(DISTINCT u.name) AS Usuarios;

5. Amigos de amigos (conexões indiretas)
MATCH (u:User {name:"Ana"})-[:FOLLOWS]->()-[:FOLLOWS]->(outro:User)
RETURN DISTINCT outro.name;

Exportar diagrama

MATCH (n)-[r]->(m)
RETURN n, r, m;
