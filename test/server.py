"""server used for testing locally"""
import socketserver
from http import HTTPStatus
from http.server import SimpleHTTPRequestHandler

class Handler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(HTTPStatus.OK)
        self.end_headers()
        self.wfile.write(bytes([1 for i in range(10000000)]))

socketserver.TCPServer(('', 8080), Handler).serve_forever()