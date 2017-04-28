# Whoami

Simple Elixir service that prints its hostname.

```shell
$ mix deps.get
$ mix serve
```

## With Docker
```shell
$ docker run -d -p 4001:4001 --name whoami -t aliou/whoami
736ab83847bb12dddd8b09969433f3a02d64d5b0be48f7a5c59a594e3a6a3541

$ curl $(hostname):4001
I'm 736ab83847bb
```
