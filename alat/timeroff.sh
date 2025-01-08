#!/bin/bash

# Auto shutdown dalam 30 menit

# Waktu shutdown dalam detik (30 menit = 1800 detik)
SHUTDOWN_TIME=3000

# Memberikan informasi kepada pengguna
clear
# Tampilan waktu mundur dengan figlet
for ((i = SHUTDOWN_TIME; i > 0; i--)); do
  clear
  # printf "\033[1;32mWaktu tersisa:\033[0m\n"
  echo -e "\033[1;31m==========================\033[0m"
  printf "\033[1;34m"
  # dikasih -c agar di tengah layar
  # figlet -c "$(printf '%02d:%02d' $((i / 60)) $((i % 60)))"

  figlet "$(printf '%02d:%02d' $((i / 60)) $((i % 60)))"
  printf "\033[0m"

  echo -e "\033[1;31m====== MENUJU TIDUR ======\033[0m"
  sleep 1
done

# echo -e "\033[1;31mWaktu habis. Sistem akan dimatikan sekarang.\033[0m"

# Menjalankan perintah shutdown
# sudo poweroff

# pacman -Syu
poweroff
