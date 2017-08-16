# SQL Constraints

Constraints are rules that can be applied to the data that can be stored in a table. 

They can be used to limit the type of data that can be stored within a table. The advantage of such limitations is that it ensures the accuracy and reliability of the data that is helt within a table. As soon there is any violation between the constraints that are defined on a table and an action performed on the table, this action is aborted, which leaves the table in reliable state.

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

```sql
mysql> INSERT INTO person (id, name, age) VALUES (1, 'Nadine', 41);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO person (id, name, age) VALUES (1, 'Andrew', 23);
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

mysql> INSERT INTO person (id, name, age) VALUES (2, 'Andrew', 23);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO person (id, name, age) VALUES (NULL, 'Henry', 35);
ERROR 1048 (23000): Column 'id' cannot be null
```