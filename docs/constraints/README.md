# SQL Constraints

Constraints are rules that can be applied to the data that can be stored in a table. 

They are used to limit the type of data that can be stored within a table. The advantage of such limitations is, that it ensures the accuracy and reliability of the data that is helt within a table. As soon there is any violation between the defined constraints and an action performed on the table, this action is aborted, which leaves the table in reliable state.

Constaints can be either specified on column or table level.

|Constraint|Description|
|-|:-|
|`NOT NULL`|Ensures that a column cannot have the value `NULL`.|
|`UNIQUE`|Ensures that all values stored in a column are different.|
|`PRIMARY_KEY`|A combination of `UNIQUE` and `NOT NULL`. A column with this constraints is able to uniquely identifie each row of a table.|
|`FOREIGN_KEY`|A column with this constaints uniquely identifies a row in another table.|
|`CHECK`|Ensures that all values helt in a column are satisfing a specific condition.|
|`DEFAULT`|Sets a default value for a column that is used when there is no value specified.|
|`INDEX`|Used to create and retrieve data from the database in a high performant manner.|

## Constrains

### NOT NULL

By default each table column can hold `NULL` values.

Adding a `NOT NULL` constraint to a column enforces the column to not accept `NULL` values. This means it's not possible to insert new records, or update records without providing a value for this column.

#### Examples

The following statement creates a table `person` with three columns that won't accept `NULL` as values.

```sql
CREATE TABLE person (
    id int NOT NULL,
    name varchar(60) NOT NULL,
    age int NOT NULL
);
```

### UNIQUE

Adding a `UNIQUE` constraint to a column ensures that all values in that column are different. So it guarantees for the data uniqueness of it's related column.

A column with a `PRIMARY KEY` constraint has also always a implicit `UNIQUE` constraint. The difference is you can have multiple `UNIQUE` constraints per table but only one `PRIMARY KEY` constraint.

#### Examples

The following statement creates a table `person` with a `id` column that won't accept duplicate values.

```sql
CREATE TABLE person (
    id int NOT NULL,
    name varchar(60) NOT NULL,
    age int NOT NULL,
    UNIQUE(id)
);
```

The constaints prevents that the table `person` accepts the same value for the `id` column again.

```sql
mysql> INSERT INTO person (id, name, age) VALUES (1, "Hans", 56);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO person (id, name, age) VALUES (1, "Anna", 32);
ERROR 1062 (23000): Duplicate entry '1' for key 'id'
```

### PRIMARY KEY

Adding a `PRIMARY KEY` constraint to a column marks it as unique identifiert of each record in that table. Each table can have only one primary key, which itself may consist of one or multiple columns.

A column with a `PRIMARY KEY` constaint must contain unique values, and is not allowed to contain `NULL` as a value. So each column with a `PRIMARY KEY` constraint has implicit `UNIQUE` and `NOT NULL` constraints as well.

#### Examples

The following statement creates a table `person` with a `id` is able to uniquely identify each row of that table.

```sql
CREATE TABLE person (
    id int NOT NULL,
    name varchar(60) NOT NULL,
    age int NOT NULL,
    PRIMARY KEY(id)
);
```

The constaints prevents that the table `person` accepts the same value for the `id` column again. Also proving `NULL` as a value is prevented by the constraint.

```
mysql> INSERT INTO person (id, name, age) VALUES (1, 'Nadine', 41);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO person (id, name, age) VALUES (1, 'Andrew', 23);
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

mysql> INSERT INTO person (id, name, age) VALUES (2, 'Andrew', 23);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO person (id, name, age) VALUES (NULL, 'Henry', 35);
ERROR 1048 (23000): Column 'id' cannot be null
```

### FOREIGN KEY

Adding a `FOREIGN KEY` constraints to a column likes it to the `PRIMARY KEY` of another table. It prevents actions that would destroy the links between the connected tables. Furthermore it also prevents the insertion of invalid data to the column and makes sure it contains values existing in the table it points to.

Each table can have multiple foreign keys, which itself can consist of multiple columns that refere to the `PRIMIARY KEY` of another table.

#### Examples

The following statements create a table `person` and a table `bankAccount`. The table `bankAccount` has a `FOREIGN KEY` constaint on the column `accountHolder` that is refering to the primiary key of the `person` table.

```sql
CREATE TABLE person (
    id int NOT NULL,
    name varchar(60) NOT NULL,
    age int NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE bankAccount (
    id int NOT NULL,
    accountHolder int NOT NULL,
    balance decimal NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(accountHolder) REFERENCES person(id)
);
```

The constraints prevents the `bankAccount` table from accepting values that aren't existing in the linked `person` table. It also ensures no duplicate values can be entered. Finally it also ensures that the linked record in the `person` table can not be deleted as long as `bankAccount` still uses it as a foreign key.

```
mysql> INSERT INTO bankAccount (id, accountHolder, balance) VALUES (1, 1, 500.00);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO bankAccount (id, accountHolder, balance) VALUES (2, 3, 2350.00);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`sandbox`.`bankAccount`, CONSTRAINT `bankAccount_ibfk_1` FOREIGN KEY (`accountHolder`) REFERENCES `person` (`id`))

mysql> INSERT INTO bankAccount (id, accountHolder, balance) VALUES (1, 1, 1500.00);
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

mysql> DELETE * FROM person WHERE id = 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM person WHERE id = 1' at line 1
```

### DEFAULT

The `DEFAULT` constaint is used to provide a default value for a column. The specified default value will then be used for all newly created records if no other value is specified instead.

#### Examples

The following statement creates a table `person` with a `DEFAULT` constraints on the `species` column.

```sql
CREATE TABLE animal (
    id int NOT NULL,
    name varchar(60),
    species varchar(60) DEFAULT 'mammal'
);
```

When entering two new records to the `animal` table, one of them missing a value for the column `species`.

```
mysql> INSERT INTO animal (id, name) VALUES (1, 'Bobby');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO animal (id, name, species) VALUES (2, 'Anthony', 'Goldfish');
Query OK, 1 row affected (0.00 sec)
```

The resulting `animal` table will look like this.

```sql
+----+---------+----------+
| id | name    | species  |
+----+---------+----------+
|  1 | Bobby   | mammal   |
|  2 | Anthony | Goldfish |
+----+---------+----------+
```