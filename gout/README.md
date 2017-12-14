# gout - like echo written in golang

For scratch based containers putting this in the container allows you to print things.

To build:
```bash
CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags '-w' .
```
