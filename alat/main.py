import os
import time
from subprocess import getoutput

# Waktu shutdown dalam detik (30 menit = 1800 detik)
SHUTDOWN_TIME = 3600


def clear_terminal():
    """Bersihkan terminal."""
    os.system("clear")


def get_terminal_size():
    """Dapatkan ukuran terminal."""
    rows, cols = os.popen("stty size", "r").read().split()
    return int(rows), int(cols)


def set_terminal_size(width, height):
    """Ubah ukuran jendela terminal."""
    os.system(f"wmctrl -r :ACTIVE: -e 0,0,0,{width},{height}")


def center_text(text, color_code=""):
    """Tampilkan teks di tengah terminal."""
    rows, cols = get_terminal_size()
    lines = text.split("\n")
    padding_top = (rows - len(lines)) // 2
    output = "\n" * padding_top
    for line in lines:
        padding_left = (cols - len(line)) // 2
        output += f"{' ' * padding_left}{line}\n"
    print(f"{color_code}{output}\033[0m")


def center_figlet(text):
    """Tampilkan teks dari figlet di tengah terminal."""
    figlet_output = getoutput(f"figlet {text}")
    center_text(figlet_output, "\033[1;34m")


def countdown():
    """Jalankan hitungan mundur."""
    # Ubah ukuran terminal menjadi lebih kecil (misal: 30x80)
    set_terminal_size(30, 30)

    for i in range(SHUTDOWN_TIME, 0, -1):
        time_remaining = f"{i // 60:02d}:{i % 60:02d}"
        clear_terminal()
        center_figlet(time_remaining)
        time.sleep(1)

    # Shutdown command
    os.system("poweroff")


if __name__ == "__main__":
    countdown()
