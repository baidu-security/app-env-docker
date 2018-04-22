package docker

import (
	"encoding/json"
	"io"
	"log"
	"net/http"
)

func apiListContainer(w http.ResponseWriter, r *http.Request) {
	err, containers := GetRunningContainers()
	if err != nil {
		log.Println("Failed to get containers:", err)
		containers = []Container{}
	}

	data, _ := json.Marshal(containers)
	io.WriteString(w, string(data))
}

func StartHTTPServer(addr string) {
	fs := http.FileServer(http.Dir("web"))
	http.Handle("/", http.StripPrefix("/", fs))

	http.HandleFunc("/api/list", apiListContainer)

	log.Println("HTTP server listening on", addr)
	http.ListenAndServe(addr, nil)
}
