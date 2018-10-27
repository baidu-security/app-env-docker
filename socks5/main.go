package main

import (
	"docker"
	"flag"
	// "fmt"
	"log"
	"socks5"
)

var (
	socks5_addr = flag.String("socks5", ":3080", "socks5 listening address")
	http_addr   = flag.String("http", ":3081", "http server listening address")
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

	go docker.StartHTTPServer(*http_addr)

	log.Println("Socks5 server listening on", *socks5_addr)
	if err := server.ListenAndServe("tcp", *socks5_addr); err != nil {
		panic(err)
	}

}
