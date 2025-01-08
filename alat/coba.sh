#!/bin/bash

# Auto shutdown dalam 30 menit

# Waktu shutdown dalam detik (30 menit = 1800 detik)
SHUTDOWN_TIME=1800

# Fungsi untuk menampilkan figlet di tengah terminal
center_figlet() {
    local text="$1"
    local term_width=$(tput cols)
    local term_height=$(tput lines)
    local figlet_output=$(figlet -c "$text")

    # Hitung jumlah baris figlet
    local figlet_lines=$(echo "$figlet_output" | wc -l)

    # Posisi vertikal tengah
    local vertical_start=$(((term_height - figlet_lines) / 2))

    # Clear layar dan pindahkan kursor
    tput clear
    tput cup $vertical_start 0

    # Tampilkan output figlet
    echo -e "\033[1;34m$figlet_output\033[0m"
}

# Fungsi untuk menampilkan teks biasa di bawah figlet
center_text() {
    local text="$1"
    local term_width=$(tput cols)

    # Hitung posisi horizontal
    local text_length=${#text}
    local horizontal_start=$(((term_width - text_length) / 2))

    # Tampilkan teks
    echo -e "\033[1;31m"
    printf "%*s\n" $((horizontal_start + text_length)) "$text"
    echo -e "\033[0m"
}

# Memberikan informasi kepada pengguna
for ((i = SHUTDOWN_TIME; i > 0; i--)); do
    local time_remaining=$(printf '%02d:%02d' $((i / 60)) $((i % 60)))
    center_figlet "$time_remaining"
    center_text "====== MENUJU TIDUR ======"
    sleep 1
done

poweroff
