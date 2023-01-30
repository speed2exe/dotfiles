# Usage

# Limitation
- Support only unix-like system(e.g. Linux, MacOS)

# Usage
- load from dotfile: `fish load.fish`
- store to dotfile: `fish save.fish`
  - check diff before committing

# Container Setup
```
docker run -e TZ=Asia/Singapore -d --name dev --gpus all archlinux /usr/bin/bash -c "tail -f /dev/null"
docker exec -it dev /usr/bin/bash
```
