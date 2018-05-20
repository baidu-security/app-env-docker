package docker

import (
	"golang.org/x/net/context"
	"log"
	"net"
)

type DNSResolver struct{}

func (d DNSResolver) Resolve(ctx context.Context, name string) (context.Context, net.IP, error) {
	// 解析 docker IP
	err, result := GetContainerIP(name)
	if err != nil {
		log.Println("Docker API error:", err)
	} else if result != "" {
		log.Println("Docker resolves", name, "to", result)

		// 转换为 net.IP 类型
		ip, _, err := net.ParseCIDR(result + "/32")
		if err == nil {
			return ctx, ip, nil
		} else {
			log.Println("net.ParseCIDR error:", err)
			return ctx, nil, err
		}
	}

	// 其他情况正常解析吧
	addr, err := net.ResolveIPAddr("ip", name)
	if err != nil {
		return ctx, nil, err
	}
	return ctx, addr.IP, err
}
