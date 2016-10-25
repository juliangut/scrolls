# MongoDB

## Backup

### Creating

```
mongodump --db [database_name] --username [user_name] --password [password] --out [destination_directory]
```

### Restoring

```
mongorestore --dbpath /var/lib/mongo --db [database_name] [destination_directory]/[database_name]
```
