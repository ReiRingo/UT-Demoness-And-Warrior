import socket
import threading

def listen_func(sock):
    
    while True:
        try:
            # recvfrom blocks, but only THIS thread
            data, addr = sock.recvfrom(1024)
            print(f"\n[Received from {addr}]: {data.decode()}")
            print("You: ", end="", flush=True) # Keep the prompt visible
        except Exception as e:
            print(f"\nError: {e}")
            break

def main():

    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    
    my_port = int(input("Enter your listening port: "))
    target_port = int(input("Enter target port to message: "))
    target_ip = "127.0.0.1"


    s.bind(('0.0.0.0', my_port))

    listener = threading.Thread(target=listen_func, args=(s,), daemon=True)
    listener.start()

    print(f"--- Chat Active (Target: {target_port}) ---")
    
    try:
        while True:
            msg = input("You: ")
            if msg.lower() in ['exit', 'quit']:
                break
            s.sendto(msg.encode(), (target_ip, target_port))
    except KeyboardInterrupt:
        pass
    finally:
        s.close()
        print("\nSocket closed. Goodbye!")

if __name__ == "__main__":
    main()