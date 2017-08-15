# SQL Views

In SQL, a view is a virtual table that is based on the result of an SQL statement. A view consists of rows and columns, just like a regular table. The fields in a view can stem from one or multiple real tables in the database. A view does not hold any actual data, it's just a projection towards data stored in the regular tables it referes to.

## Managing Views

### Create View

The following statement creates a new view.

```sql
CREATE VIEW [view_name] AS SELECT [column1], [column2], ... FROM [table_name] WHERE [condition]
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

The following statement will create a view that is representing a subset of the `pets` table data.

```sql
CREATE VIEW dog_pets AS SELECT name, sex FROM pets WHERE species = 'dog';
```

The result will be a the following view.

```sql
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(20) | YES  |     | NULL    |       |
| sex   | char(1)     | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
```

Assuming we have some data stored in the `pets` table.

```sql
INSERT INTO pets 
    (name, owner, species, sex, birth) 
VALUES 
    ('Petty', 'Ida', 'parrot', 'f', '2015-05-08'),
    ('Kitty', 'John', 'cat', 'f', '2011-04-05'),
    ('Rex', 'Henry', 'dog', 'm', '2009-01-09'),
    ('Goldie', 'Mike', 'fish', 'm', '2016-11-10'),
    ('Sammy', 'Nina', 'dog', 'f', '2014-11-01');
```

```sql
+--------+-------+---------+------+------------+
| name   | owner | species | sex  | birth      |
+--------+-------+---------+------+------------+
| Petty  | Ida   | parrot  | f    | 2015-05-08 |
| Kitty  | John  | cat     | f    | 2011-04-05 |
| Rex    | Henry | dog     | m    | 2009-01-09 |
| Goldie | Mike  | fish    | m    | 2016-11-10 |
| Sammy  | Nina  | dog     | f    | 2014-11-01 |
+--------+-------+---------+------+------------+
```

Then the view `dog_pets` will look like this.

```sql
+-------+------+
| name  | sex  |
+-------+------+
| Rex   | m    |
| Sammy | f    |
+-------+------+
```