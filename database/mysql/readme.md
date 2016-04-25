# MSYQL

## User management

### Root password

```
mysqladmin -u root -p [old_password] [new_password]
```

### List

```sql
SELECT user, password, shutdown_priv FROM mysql.user;
```

### Creation

```sql
CREATE USER [user_name]@[host_name] IDENTIFIED BY 'password';
# OR
INSERT INTO user (host, user, password) VALUES('[host_name]','[user_name]',PASSWORD('password'));
```

### Password

```sql
ALTER USER [user_name]@[host_name] IDENTIFIED BY 'password';
# OR
SET PASSWORD FOR [user_name]@[host_name] = PASSWORD('password');
# OR MySQL > 5.7.6
SET PASSWORD FOR [user_name]@[host_name] = 'password';
```

### Rename

```sql
RENAME USER [user_name] TO [new_user_name];
```

### Remove

```sql
DROP USER [user_name]@[host_name];
```

### Show

```sql
SHOW CREATE USER [user_name].[host_name];
```

### List privileges
```sql
SHOW GRANTS FOR [user_name];
```

#### Privileges types

* USAGE
* ALL
* CREATE
* ALTER
* DROP
* DELETE
* INSERT
* UPDATE
* SELECT
* SHUTDOWN
* INDEX
* CREATE USER
* CREATE VIEW
* GRANT OPTION

### Add privilege

```sql
GRANT [privilege_type][, permission] ON [database_name].[table_name] TO [user_name]@[host_name];
FLUSH PRIVILEGES;
```

### Add all privileges

```sql
GRANT ALL PRIVILEGES ON [database_name].[table_name] TO [user_name]@[host_name] WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### Remove privilege

```sql
REVOKE [privilege_type] ON [database_name].[table_name] FROM [user_name]@[host_name];
FLUSH PRIVILEGES;
 ```
