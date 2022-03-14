# This assumes setup from docs/DEVELOPMENT.md

```bash
python3 server.py
```

```bash
$GOPATH/bin/ngrokd -domain ngrok.me
```

```bash
$GOPATH/bin/ngrok -config=debug.yml -subdomain=test 8080
```