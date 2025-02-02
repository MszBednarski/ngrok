.PHONY: default server client deps fmt clean all release-all assets client-assets server-assets contributors

BUILDTAGS=debug
default: all

deps: assets
	go mod download

server: deps
	go install -tags '$(BUILDTAGS)' ./main/ngrokd

fmt:
	go fmt ./...

client: deps
	go install -tags '$(BUILDTAGS)' ./main/ngrok

assets: client-assets server-assets

go-bindata:
	go install github.com/jteeuwen/go-bindata/go-bindata

client-assets: go-bindata
	$(GOPATH)/bin/go-bindata -nomemcopy -pkg=assets -tags=$(BUILDTAGS) \
		-debug=$(if $(findstring debug,$(BUILDTAGS)),true,false) \
		-o=./client/assets/assets_$(BUILDTAGS).go \
		assets/client/...

server-assets: go-bindata
	$(GOPATH)/bin/go-bindata -nomemcopy -pkg=assets -tags=$(BUILDTAGS) \
		-debug=$(if $(findstring debug,$(BUILDTAGS)),true,false) \
		-o=./server/assets/assets_$(BUILDTAGS).go \
		assets/server/...

release-client: BUILDTAGS=release
release-client: client

release-server: BUILDTAGS=release
release-server: server

release-all: fmt release-client release-server

all: fmt client server

clean:
	go clean -i -r ./...
	rm -rf ./client/assets/ ./server/assets/

contributors:
	echo "Contributors to ngrok, both large and small:\n" > CONTRIBUTORS
	git log --raw | grep "^Author: " | sort | uniq | cut -d ' ' -f2- | sed 's/^/- /' | cut -d '<' -f1 >> CONTRIBUTORS
