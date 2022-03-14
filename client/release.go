//go:build release
// +build release

package client

var (
	rootCrtPaths = []string{"assets/client/tls/secret.pem"}
)

func useInsecureSkipVerify() bool {
	return false
}
