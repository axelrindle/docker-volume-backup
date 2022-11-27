# Volume Backup

> Simple volume backup.

Inspired by [loomchild/volume-backup](https://hub.docker.com/r/loomchild/volume-backup).

I needed support for non-root access. Here you go.

## Usage
### Volumes

Mount to following volumes:

- `/volume`: The volume to backup. Usually a named volume.
- `/backup`: The backup archive is stored here. Usually a host volume.

### Configuration

Configuration is done using environment variables.

| Variable | Default | Description |
| --- | --- | --- |
| UID | 1000 | The user ID the archive should be owned by. |
| GID | 1000 | The group ID the archive should be owned by.
| ARCHIVE_NAME | volume | The archive basename. |

## Example

```shell
docker run --rm \
    -e ARCHIVE_NAME=important \
    -v important:/volume \
    -v "$HOME/backup/data:/backup" \
    axelrindle/volume-backup
```

Output:

```

             _                             _                _
            | |                           | |              | |
 __   _____ | |_   _ _ __ ___   ___ ______| |__   __ _  ___| | ___   _ _ __
 \ \ / / _ \| | | | | '_ ` _ \ / _ \______| '_ \ / _` |/ __| |/ / | | | '_ \
  \ V / (_) | | |_| | | | | | |  __/      | |_) | (_| | (__|   <| |_| | |_) |
   \_/ \___/|_|\__,_|_| |_| |_|\___|      |_.__/ \__,_|\___|_|\_\\__,_| .__/
                                                                      | |
                                                                      |_|


We're gonna pack an estimate of 34.3M. Please be patient...

+ tar c -f /backup/important.tar -C /volume .
+ pigz /backup/important.tar
+ chown 1000:1000 /backup/important.tar.gz
+ set +x

We're done here.

```

## License

[MIT](LICENSE)
