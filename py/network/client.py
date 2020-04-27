# -*- coding: utf-8 -*-

import socket

sock = socket.socket()

try:
    sock.connect(('localhost', 9090))
except ConnectionRefusedError:
    print("Connection Refused...")
    raise SystemExit(1)
except OSError:
    print("Unreachable host")
    raise SystemExit(1)

sock.send(b'hello, world!')
data = sock.recv(1024)
sock.close()

print(data) # raw bytes
print(data.decode("utf-8"))