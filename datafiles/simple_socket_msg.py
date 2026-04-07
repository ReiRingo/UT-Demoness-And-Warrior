import socket
s = socket.socket(socket.AT_INEF, socket.SOCK_DGRAM)
s.bind(('127.0.0.1', 9999))
# async?

