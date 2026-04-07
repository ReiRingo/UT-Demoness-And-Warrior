import threading
import time

class PausableThread(threading.Thread):
    def __init__(self):
        super().__init__()
        self.pause_event = threading.Event()
        self.pause_event.set()  # Set to True initially (running)
        self.running = True

    def run(self):
        while self.running:
            # This blocks if the event is cleared (False), effectively pausing
            self.pause_event.wait()
            
            print("Working...")
            time.sleep(1)

    def pause(self):
        self.pause_event.clear()

    def resume(self):
        self.pause_event.set()

    def stop(self):
        self.running = False
        self.pause_event.set() # Unblock if paused so it can exit

def timer():
	a    = 0.000
	time = PausableThread()
	time.start()

	while True:
		time.sleep(1)
		time.pause()
		print( a )
		a += 1.0
		time.sleep(1)
		time.resume()

timer()