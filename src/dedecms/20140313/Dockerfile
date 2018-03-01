FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/DedeCMS-UTF8-SP1-20140313.zip
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.zip \
	&& unzip package.zip \
	&& rm -f package.tar.gz \
	&& mv DedeCMS-5.7-UTF8-SP1/uploads "$install_path" \
	&& chmod 777 -R "$install_path"

RUN mkdir -p "$install_path"/dedecms \
	&& echo '<?php phpinfo(); ?>' > "$install_path"/dedecms/demodata.a.txt

