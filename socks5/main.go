package main

import (
	"docker"
	"flag"
	// "fmt"
	"log"
	"socks5"
)

func main() {
	flag.Parse()

	// 自定义 DNS 解析，实现 docker 自动化转发
	server, err := socks5.New(&socks5.Config{
		Resolver: docker.DNSResolver{},
	})

	if err != nil {
		log.Fatal("Can't start socks5 server:", err)
	}

	go docker.StartHTTPServer()

	log.Println("Socks5 server listening on 3080")
	if err := server.ListenAndServe("tcp", "0.0.0.0:3080"); err != nil {
		panic(err)
	}

}
