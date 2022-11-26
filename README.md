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

## License

[MIT](LICENSE)
