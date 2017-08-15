# SQL Tables

1. [Listing tables](#listing-tables)
2. [Creating tables](#creating-tables)
3. [Changing tables](#changing-tables)
4. [Cleaning tables](#cleaning-tables)
5. [Removing tables](#removing-tables)

## Managing Tables

### Listing tables

The following statement will list tables.

```sql
SHOW [FULL] TABLES 
    [{FROM | IN} [database_name]]
    [LIKE 'pattern' | WHERE expr];
```

#### Examples

The following statement will list all tables of the current database.

```sql
SHOW TABLES;
```

The following statement will list all tables in the `sandbox` database.

```sql
SHOW TABLES IN sandbox;
```

The following statement will list all tables in the `sandbox` database which names are starting with the term `customer` followed by any string.

```sql
SHOW TABLES IN sandbox LIKE 'customer%';
```

The following statement will list all tables in the `sandbox` database which are of table type `base table`. The optional `FULL` keyword is required in order to make the columns of `BASE TABLE` accessible.

```sql
SHOW FULL TABLES IN sandbox WHERE table_type = 'base table';
```

### Creating Tables

The following statement will create a table.

```sql
CREATE TABLE [table_name] ( 
    [column1] [datatype], 
    [column2] [datatype],
    [column3] [datatype],
    ...
);
```

The _column_ parameters specify the names of the colums the table will consist of. The respective _datatype_ parameters specifies the type of the data that a column can hold (TODO LINK).

#### Examples

The following statement will create a table called `pets` with five columns (`name`, `onwer`, `species`, `sex` and `birth`).

```sql
CREATE TABLE pets (
    name carchar(20),
    owner varchar(20),
    species varchar(20),
    sex char(1),
    birth date
);
```

The resulting table looks like this.

```sql
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
```

### Changing Tables

Once a table is create there are several options to alter the columns it consists of.

The following statement will add a column.

```sql
ALTER TABLE [table_name] ADD [column_name] [datatype];
```

The following statement will remove a existing column.

```sql
ALTER TABLE [table_name] DROP [column_name] [datatype];
```

The following statement will change the datatype of a existing column.

```sql
ALTER TABLE [table_name] MODIFY COLUMN [column_name] [datatype];
```

#### Examples

Assuming we have a given table `pets`.

```sql
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
```

The following statement will add a column named `alive` to the table.

```sql
ALTER TABLE pets ADD COLUMN alive varchar(10);
```

```sql
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| alive   | varchar(10) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
```

Assuming the datatype of the recently created column `alive` needs to be changed to `BOOLEAN`, the following statement will achive the change.

```sql
ALTER TABLE pets MODIFY COLUMN alive boolean;
```

```sql
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| alive   | tinyint(1)  | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
```

Assuming the column `birth` is not needed anymore, the following statement will remove it from the table.

```sql
ALTER TABLE pets DROP COLUMN birth;
```

```sql
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| alive   | tinyint(1)  | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
```

### Cleaning Tables

The following statement will delete all data inside a specific table, but not the table itself.

```sql
TRUNCATE TABLE [table_name];
```

#### Examples

The following statement will remove all records helt in the `pets` table.

```sql
TRUNCATE TABLE pets;
```

### Removing Tables

The following statement will remove a existing table.

```sql
DROP TABLE [table_name];
```

#### Examples

The following statement will remove the `pets` table.

```sql
DROP TABLE pets;
```