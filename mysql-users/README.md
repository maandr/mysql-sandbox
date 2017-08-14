# MYSQL Users

## Managing Users

### Create a new user

Creates a new user.

```sql
CREATE USER '[username]'@'[hostname]' IDENTIFIED BY '[password]';
```

At this point the created user has no permissions to do anything with the database. In fact MySQL will even prevent the user from logging in as long as it's lacking any permissions.

#### Examples

```sql
CREATE USER 'samantha'@'%' IDENTIFIED BY 'some-secret-password';
```

Creates a new user `samantha` that is allowed to connect from any host and is authenticated by a password prompt.

### Delete an existing user

Deletes an existing user.
```sql
 DROP USER '[username]'@'[hostname]';
```

## User Permissions

### Grant Permissions

Grants permissions to user.
```sql
 GRANT [type of permission] ON [database name].[table name] TO '[username]'@'[hostname]';
 ```

 To grant more fine-grained permissions to a user there is a couple of different options to limit the users access to specific operations.

* `ALL PRIVILIGES` - allows all access
* `CREATE` - allows to create new tables or databases
* `DROP` - allows to delete tables or databases
* `DELETE` - allows to delete rows from tables
* `INSERT` - allows to insert rows into tables
* `SELECT` - allows to run select statements

#### Examples

```sql
GRANT ALL PRIVILIGES ON *.* TO 'administrator'@'%';
```
Allows access accoss all system to `administrator` connecting from any host.

```sql
GRANT SELECT ON 'customers'.* TO 'john'@'localhost';
```
Allows read-only access on `customers` database to `john` when connecting from `localhost`.

### Revoke Permissions

Revokes permissions from a user.
 ```sql
REVOKE [type of permission] ON [database name].[table name] FROM '[username]'@'[hostname]';
 ```

### Reload Permissions

Once your done configuring permissions, always make sure to reload all the priviliges.

```sql
FLUSH PRIVILIGES;
```