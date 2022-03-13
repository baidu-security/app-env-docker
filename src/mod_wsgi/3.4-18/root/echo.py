import cStringIO

def application(environ, start_response):
    headers = []
    headers.append(('Test-Header', 'text/plain'))
    write = start_response('200 OK', headers)

    input = environ['wsgi.input']
    output = cStringIO.StringIO()

    print >> output, "test"

    output.write(input.read(int(environ.get('CONTENT_LENGTH', '0'))))
    output.write('\n')
    return [output.getvalue()]
