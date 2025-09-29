# 🏋️‍♂️ Sports & Health Expert Database

A **mini SQL project** demonstrating **database design, views, functions, procedures, CTEs, and triggers**.  
It models the relationship between **Users, Sports, and Health Experts** using a structured PostgreSQL schema.

---

## 🧩 Schema Design

We created a schema named `s` which contains 4 main tables:

### 1. `s.user`
Stores user details.

```sql
u_id SERIAL PRIMARY KEY,
u_n VARCHAR(100),
u_e VARCHAR(100),
u_m VARCHAR(10),
u_a INT CHECK(u_a < 61)

2. s.healthexpert

Stores health expert details.

he_id SERIAL PRIMARY KEY,
he_n VARCHAR(100),
he_e VARCHAR(100),
he_m VARCHAR(10)

3. s.sport

Stores sports and the expert responsible.

s_id SERIAL PRIMARY KEY,
s_n VARCHAR(100),
s_he INT REFERENCES s.healthexpert(he_id)

4. s.mapping

Mapping between users and sports.

m_u_id INT REFERENCES s.user(u_id),
m_s_id INT REFERENCES s.sport(s_id),
PRIMARY KEY(m_u_id, m_s_id)

🗂️ Sample Data

Inserted users, experts, sports, and mapping data.

Example:

User a plays Cricket and Hockey

User ae plays Tennis with expert ae5

👁️ View

A view was created to easily see user → sport → expert relationships:

CREATE OR REPLACE VIEW ShowAllData AS
SELECT u.u_id, u.u_n, s.s_n, h.he_n
FROM s.user u
JOIN s.mapping m ON u.u_id = m.m_u_id
JOIN s.sport s ON m.m_s_id = s.s_id
JOIN s.healthexpert h ON s.s_he = h.he_id;


Usage:

SELECT * FROM ShowAllData;

🧮 Functions

Function to fetch sports and expert names for a given user:

CREATE OR REPLACE FUNCTION sportorexpert(u_id INT)
RETURNS TABLE(sport_name VARCHAR, expert_name VARCHAR)
AS $$
BEGIN
  RETURN QUERY
  SELECT sp.s_n, h.he_n
  FROM s.mapping mp
  JOIN s.sport sp ON mp.m_s_id = sp.s_id
  JOIN s.healthexpert h ON sp.s_he = h.he_id
  WHERE mp.m_u_id = u_id;
END;
$$ LANGUAGE plpgsql;


Usage:

SELECT * FROM sportorexpert(1);

🧾 Procedures

Procedure to add a new user:

CREATE OR REPLACE PROCEDURE adduser(
 u_n VARCHAR,
 u_e VARCHAR,
 u_m VARCHAR,
 u_a INT
) LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO s.user(u_n, u_e, u_m, u_a)
  VALUES (u_n, u_e, u_m, u_a);
  RAISE NOTICE 'User % added successfully', u_n;
END;
$$;


Usage:

CALL adduser('Am','am@gmail','456789123',25);

🧱 Common Table Expressions (CTEs)

Used to insert a user and directly map them to a sport in one query:

WITH new_user AS (
  INSERT INTO s.user (u_n, u_e, u_m, u_a)
  VALUES ('pradeep','pradeep@gmail.com','123456789',30)
  RETURNING u_id
)
INSERT INTO s.mapping (m_u_id, m_s_id)
SELECT u_id, 1 FROM new_user;

⚙️ Triggers

Automatically inserts a user-sport mapping whenever a new user is added.

Trigger Function:

CREATE OR REPLACE FUNCTION insert_into_mapping()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO s.mapping(m_u_id, m_s_id)
  VALUES (NEW.u_id, 1);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


Trigger:

CREATE TRIGGER after_user_insert
AFTER INSERT ON s.user
FOR EACH ROW
EXECUTE FUNCTION insert_into_mapping();


Example:

INSERT INTO s.user (u_n, u_e, u_m, u_a)
VALUES ('pari','pari@gmail.com','123456789',20);


This automatically creates a mapping (pari → sport_id = 1)

🧠 Key Learnings

Schema design with primary & foreign keys

Views for simplified queries

Functions for reusable logic

Procedures for tasks with messages

CTE for one-shot insert + mapping

Triggers for automation

🚀 How to Run

Open pgAdmin or PostgreSQL client

Create a new database (e.g., sportsdb)

Execute Sport.sql to create schema, tables, and logic

Run sample queries from this README to test functionality

💡 Summary

This mini project covers SQL basics + advanced features (views, functions, procedures, CTE, triggers) in one place.
Ideal for learning PostgreSQL, preparing for SQL developer roles, or practicing DBA skills.
