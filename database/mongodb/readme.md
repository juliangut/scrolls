# MongoDB

## Backup

### Creating

```
mongodump -h [host] -p [port] --db [database_name] --username [user_name] --password [password] --out [backup_directory]
tar -zcvf [backup_file_name].tar.gz [backup_directory]
rm -rf [backup_directory]
```

### Restoring

```
tar -xvf [backup_file_name].tar.gz ./
mongorestore -h [host] -p [port] --db [database_name] ./[backup_directory]/[database_name]
rm -rf ./[backup_directory]
```
