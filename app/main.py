import os
from http.server import BaseHTTPRequestHandler, HTTPServer

name = os.getenv("STUDENT_NAME", "Miras")
surname = os.getenv("STUDENT_SURNAME", "Amalbek")
group = os.getenv("STUDENT_GROUP", "IT2-2313")
student_id = os.getenv("STUDENT_ID", "37270")
port = int(os.getenv("APP_PORT", "8080"))

info = f"""================================
DevOps Student Application
================================
Name: {name}
Surname: {surname}
Group: {group}
Student ID: {student_id}
Application is running successfully!"""


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        body = info
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write((body + "\n").encode())

    def log_message(self, fmt, *args):
        print("Request:", self.path, flush=True)


print(info, flush=True)
print(f"Listening on port {port}", flush=True)
HTTPServer(("0.0.0.0", port), Handler).serve_forever()
