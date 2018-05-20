package docker

import (
	"encoding/json"
	"io/ioutil"
	// "log"
	"net/http"
	"strings"
)

type Container struct {
	IPAddress struct {
		Networks struct {
			Bridge struct {
				IPAddress string `json:"IPAddress"`
			} `json:"bridge"`
		} `json:"Networks"`
	} `json:"NetworkSettings"`
	Ports []struct {
		PrivatePort int    `json:"PrivatePort"`
		Type        string `json:"Type"`
	} `json:"Ports"`
	Id     string   `json:"Id"`
	Names  []string `json:"Names"`
	Image  string   `json:"Image"`
	Status string   `json:"Status"`
}

func GetRunningContainers() (err error, result []Container) {
	resp, err := http.Get("http://127.0.0.1:2375/containers/json?all=1")
	if err != nil {
		return
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return
	}

	err = json.Unmarshal(body, &result)
	if err != nil {
		return
	}

	tmp := []Container{}
	for i := range result {
		// 去掉开头的斜杠
		result[i].Names[0] = result[i].Names[0][1:]

		// sha256 开头，表示是正在构建或者已经挂了的
		if !strings.HasPrefix(result[i].Image, "sha256:") {
			tmp = append(tmp, result[i])
		}
	}

	result = tmp
	return
}

func GetContainerIP(name string) (err error, result string) {
	err, containers := GetRunningContainers()

	containerName := strings.Split(name, ".")[0]
	for _, container := range containers {
		// ID 或者名字匹配
		if container.Names[0] == containerName || container.Id == containerName {
			result = container.IPAddress.Networks.Bridge.IPAddress
			break
		}
	}
	return
}
