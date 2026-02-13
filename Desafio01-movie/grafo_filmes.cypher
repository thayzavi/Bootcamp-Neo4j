#CONSTRAINTS
CREATE CONSTRAINT user_id_unique IF NOT EXISTS
FOR (u:User) REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT movie_id_unique IF NOT EXISTS
FOR (m:Movie) REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT series_id_unique IF NOT EXISTS
FOR (s:Series) REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT actor_id_unique IF NOT EXISTS
FOR (a:Actor) REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT director_id_unique IF NOT EXISTS
FOR (d:Director) REQUIRE d.id IS UNIQUE;

CREATE CONSTRAINT genre_id_unique IF NOT EXISTS
FOR (g:Genre) REQUIRE g.id IS UNIQUE;

#GÊNEROS
CREATE
(g1:Genre {id:1, name:"Ação"}),
(g2:Genre {id:2, name:"Drama"}),
(g3:Genre {id:3, name:"Comédia"}),
(g4:Genre {id:4, name:"Ficção Científica"}),
(g5:Genre {id:5, name:"Suspense"});

#FILMES
CREATE
(m1:Movie {id:1, title:"Matrix"}),
(m2:Movie {id:2, title:"Inception"}),
(m3:Movie {id:3, title:"Titanic"}),
(m4:Movie {id:4, title:"Vingadores"}),
(m5:Movie {id:5, title:"Coringa"});

#Series
CREATE
(s1:Series {id:1, title:"Stranger Things"}),
(s2:Series {id:2, title:"Breaking Bad"}),
(s3:Series {id:3, title:"Dark"}),
(s4:Series {id:4, title:"The Witcher"}),
(s5:Series {id:5, title:"La Casa de Papel"});

#ATORES
CREATE
(d1:Director {id:1, name:"Christopher Nolan"}),
(d2:Director {id:2, name:"James Cameron"}),
(d3:Director {id:3, name:"Lana Wachowski"}),
(d4:Director {id:4, name:"Todd Phillips"}),
(d5:Director {id:5, name:"Russo Brothers"});

#USUARIO 
CREATE
(u1:User {id:1, name:"Ana"}),
(u2:User {id:2, name:"Bruno"}),
(u3:User {id:3, name:"Carlos"}),
(u4:User {id:4, name:"Daniela"}),
(u5:User {id:5, name:"Eduardo"}),
(u6:User {id:6, name:"Fernanda"}),
(u7:User {id:7, name:"Gabriel"}),
(u8:User {id:8, name:"Helena"}),
(u9:User {id:9, name:"Igor"}),
(u10:User {id:10, name:"Juliana"});

#RELACIONAMENTOS

FILMES e GÊNEROS
MATCH (m1:Movie {id:1}), (g4:Genre {id:4})
CREATE (m1)-[:IN_GENRE]->(g4);

MATCH (m2:Movie {id:2}), (g4:Genre {id:4})
CREATE (m2)-[:IN_GENRE]->(g4);

MATCH (m3:Movie {id:3}), (g2:Genre {id:2})
CREATE (m3)-[:IN_GENRE]->(g2);

MATCH (m4:Movie {id:4}), (g1:Genre {id:1})
CREATE (m4)-[:IN_GENRE]->(g1);

MATCH (m5:Movie {id:5}), (g5:Genre {id:5})
CREATE (m5)-[:IN_GENRE]->(g5);

#Séries → Gêneros
MATCH (s1:Series {id:1}), (g4:Genre {id:4})
CREATE (s1)-[:IN_GENRE]->(g4);

MATCH (s2:Series {id:2}), (g2:Genre {id:2})
CREATE (s2)-[:IN_GENRE]->(g2);

MATCH (s3:Series {id:3}), (g5:Genre {id:5})
CREATE (s3)-[:IN_GENRE]->(g5);

MATCH (s4:Series {id:4}), (g1:Genre {id:1})
CREATE (s4)-[:IN_GENRE]->(g1);

MATCH (s5:Series {id:5}), (g1:Genre {id:1})
CREATE (s5)-[:IN_GENRE]->(g1);

#Atores → Filmes
MATCH (a1:Actor {id:1}), (m1:Movie {id:1})
CREATE (a1)-[:ACTED_IN]->(m1);

MATCH (a2:Actor {id:2}), (m2:Movie {id:2})
CREATE (a2)-[:ACTED_IN]->(m2);

MATCH (a3:Actor {id:3}), (m4:Movie {id:4})
CREATE (a3)-[:ACTED_IN]->(m4);

MATCH (a4:Actor {id:4}), (m5:Movie {id:5})
CREATE (a4)-[:ACTED_IN]->(m5);

#Diretores → Filmes
MATCH (d3:Director {id:3}), (m1:Movie {id:1})
CREATE (d3)-[:DIRECTED]->(m1);

MATCH (d1:Director {id:1}), (m2:Movie {id:2})
CREATE (d1)-[:DIRECTED]->(m2);

MATCH (d2:Director {id:2}), (m3:Movie {id:3})
CREATE (d2)-[:DIRECTED]->(m3);

MATCH (d5:Director {id:5}), (m4:Movie {id:4})
CREATE (d5)-[:DIRECTED]->(m4);

MATCH (d4:Director {id:4}), (m5:Movie {id:5})
CREATE (d4)-[:DIRECTED]->(m5);

#Usuários → WATCHED

MATCH (u1:User {id:1}), (m1:Movie {id:1})
CREATE (u1)-[:WATCHED {rating:5}]->(m1);

MATCH (u2:User {id:2}), (m2:Movie {id:2})
CREATE (u2)-[:WATCHED {rating:4}]->(m2);

MATCH (u3:User {id:3}), (s1:Series {id:1})
CREATE (u3)-[:WATCHED {rating:5}]->(s1);

MATCH (u4:User {id:4}), (s2:Series {id:2})
CREATE (u4)-[:WATCHED {rating:5}]->(s2);

MATCH (u5:User {id:5}), (m3:Movie {id:3})
CREATE (u5)-[:WATCHED {rating:4}]->(m3);

MATCH (u6:User {id:6}), (s3:Series {id:3})
CREATE (u6)-[:WATCHED {rating:4}]->(s3);

MATCH (u7:User {id:7}), (m4:Movie {id:4})
CREATE (u7)-[:WATCHED {rating:5}]->(m4);

MATCH (u8:User {id:8}), (s4:Series {id:4})
CREATE (u8)-[:WATCHED {rating:3}]->(s4);

MATCH (u9:User {id:9}), (m5:Movie {id:5})
CREATE (u9)-[:WATCHED {rating:4}]->(m5);

MATCH (u10:User {id:10}), (s5:Series {id:5})
CREATE (u10)-[:WATCHED {rating:5}]->(s5);

