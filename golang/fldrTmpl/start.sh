x11docker --nxagent --homedir $(pwd)/home -- -v $(pwd)/src:/go/src/github.com/err0r500/go-realworl-clean -v $(pwd)/dep:/go/pkg/dep -- go-dev

