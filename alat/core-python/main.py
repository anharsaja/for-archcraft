import psutil

core_count = psutil.cpu_count(logical=False)  # Jumlah core fisik
thread_count = psutil.cpu_count(logical=True)  # Jumlah thread (termasuk logical cores)

print(f"Jumlah core fisik CPU: {core_count}")
print(f"Jumlah thread CPU (termasuk logical cores): {thread_count}")

