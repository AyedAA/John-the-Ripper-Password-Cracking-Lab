#!/bin/bash

clear
echo "=============================================="
echo "      AYED CTF – John the Ripper Lab Setup"
echo "=============================================="
echo

mkdir -p jtr_lab
cd jtr_lab

# ======================================================
# 1) Create Large Wordlist (110+ entries, hidden passwords)
# ======================================================
echo "[+] Creating enhanced wordlist johnpass.txt"

cat <<EOF > johnpass.txt
password
admin
123456
letmein
welcome
dragon
football
shadow
sunshine
flower
butterfly
baseball
superman
batman
spiderman
computer
internet
security
default
monitor
mouse
keyboard
student
teacher
school
university
love123
hello123
root123
guest123
adminadmin
mypassword
testing123
starwars
trustno1
iloveyou
masterkey
jordan123
palestine123
qwerty123
qwertyuiop
abc12345
abcdef
zaq12wsx
1q2w3e4r
1qaz2wsx
123qwe
654321
999999
777777
111111
12345678
123456789
admin1234
pass1234
test1234
secure123
ay3dc7f
p4ssw0rd
letmeinnow
football12
summer2024
winter2024
spring2024
fall2024
hacker123
ctfplayer
crackthis
breakme
password2024
rockyou2024
hashcrack
flagfinder
zipattack
pdfattack
jtrstudent
linux123
terminal123
command123
unix123
shell123
process123
hashingfun
johndoe123
cracker2024
challenge123
ctfworld
passwordz
training123
cyberday2024
hacktheplanet
worldlistpro
EOF

# Add the REAL challenge passwords hidden in noise
echo "ayedjohn33" >> johnpass.txt
echo "nicepdf5" >> johnpass.txt

echo "[+] Wordlist johnpass.txt created with 110+ entries."
echo "[+] Real ZIP/PDF passwords hidden inside."
echo

# ======================================================
# 2) Create Temporary Flag Files (Removed later)
# ======================================================
echo "[+] Creating temporary flag files..."

echo "AYEDCTF{ZIP_CHALLENGE_UNLOCKED_OKAY}" > flag_zip.txt
echo "AYEDCTF{PDF_CRACK_ME_STUDENT_OKAY}" > flag_pdf.txt

echo "[+] Temporary flags created."
echo

# ======================================================
# 3) Create ZIP Challenge (Password: ayedjohn33)
# ======================================================
echo "[+] Creating ZIP challenge file ayed_secreats.zip"

zip -P ayedjohn33 ayed_secreats.zip flag_zip.txt >/dev/null
rm flag_zip.txt

echo "[+] ZIP created with password: ayedjohn33"
echo "[+] Plaintext ZIP flag removed."
echo

# ======================================================
# 4) Create PDF Challenge (Password: nicepdf5)
# ======================================================
echo "[+] Creating PDF challenge ayed_secreats2.pdf"

pandoc flag_pdf.txt -o temp.pdf

PDFPASS="nicepdf5"
qpdf --encrypt "$PDFPASS" "$PDFPASS" 256 -- temp.pdf ayed_secreats2.pdf

rm temp.pdf
rm flag_pdf.txt

echo "[+] PDF created with password: nicepdf5"
echo "[+] Plaintext PDF flag removed."
echo

# ======================================================
# 5) Create 5 Hash Challenge Files
# ======================================================
echo "[+] Creating hash challenge files..."

# === 3 hashes solvable with johnpass.txt ===
echo -n "password"       | md5sum    | cut -d " " -f1 > hash1
echo -n "welcome"        | sha1sum   | cut -d " " -f1 > hash2
echo -n "AYEDCTF_easy"   | sha256sum | cut -d " " -f1 > hash3

# === 2 hashes solvable ONLY with rockyou.txt ===
echo -n "superman"  | md5sum  | cut -d " " -f1 > hash4
echo -n "qwerty123" | sha1sum | cut -d " " -f1 > hash5

echo "[+] 5 hash files created: hash1, hash2, hash3, hash4, hash5"
echo
echo "[INFO] 3 hashes crack with johnpass.txt"
echo "[INFO] 2 hashes need rockyou.txt"
echo "[INFO] Use hashid to determine hash type."
echo

# ======================================================
# 6) Create Solutions Guide (No passwords)
# ======================================================
echo "[+] Creating solutions.txt"

cat <<EOF > solutions.txt
=====================================================
             AYED CTF – Solutions Guide
        (This file does NOT contain passwords)
=====================================================

Your job is to identify and crack each file properly.

-----------------------------------------------------
1) Identify Hash Types
-----------------------------------------------------
Use hashid on each file:
    hashid hash1
    hashid hash2
    hashid hash3
    hashid hash4
    hashid hash5

-----------------------------------------------------
2) Crack Hashes Using the Correct Format
-----------------------------------------------------
Examples:
    john --format=raw-md5 --wordlist=johnpass.txt hash1
    john --format=raw-sha1 --wordlist=johnpass.txt hash2
    john --format=raw-sha256 --wordlist=johnpass.txt hash3

Some hashes require:
    /usr/share/wordlists/rockyou.txt

-----------------------------------------------------
3) ZIP Cracking Instructions
-----------------------------------------------------
Convert ZIP to hash:
    zip2john ayed_secreats.zip > zip.hash

Crack it:
    john --wordlist=johnpass.txt zip.hash

-----------------------------------------------------
4) PDF Cracking Instructions
-----------------------------------------------------
Convert PDF:
    pdf2john ayed_secreats2.pdf > pdf.hash

Crack it:
    john --wordlist=johnpass.txt pdf.hash

-----------------------------------------------------
5) Show Cracked Results
-----------------------------------------------------
    john --show hashX
    john --show zip.hash
    john --show pdf.hash

=====================================================
EOF

echo "[+] solutions.txt created."
echo

# ======================================================
# FINAL STUDENT INSTRUCTIONS
# ======================================================
echo "=============================================="
echo " ✔ Lab setup complete!"
echo " ✔ Files created:"
echo "      - ayed_secreats.zip   (ZIP challenge)"
echo "      - ayed_secreats2.pdf  (PDF challenge)"
echo "      - johnpass.txt        (110+ password wordlist)"
echo "      - hash1, hash2, hash3, hash4, hash5"
echo "      - solutions.txt"
echo
echo "📘 Your Tasks:"
echo "----------------------------------------------"
echo "1. Use hashid to identify each hash file:"
echo "       hashid hash1"
echo "       hashid hash2"
echo "       hashid hash3"
echo "       hashid hash4"
echo "       hashid hash5"
echo
echo "2. Remember:"
echo "   - 3 hashes crack with johnpass.txt"
echo "   - 2 hashes require rockyou.txt"
echo
echo "3. Convert the ZIP and PDF into crackable format using 2john tools:"
echo "       zip2john ayed_secreats.zip > zip.hash"
echo "       pdf2john ayed_secreats2.pdf > pdf.hash"
echo
echo "4. Crack the ZIP and PDF passwords:"
echo "       john --wordlist=johnpass.txt zip.hash"
echo "       john --wordlist=johnpass.txt pdf.hash"
echo
echo "5. Crack all hash files using the correct formats:"
echo "       john --format=<type> --wordlist=<list> hashX"
echo
echo "6. Show your cracked results:"
echo "       john --show hashX"
echo "       john --show zip.hash"
echo "       john --show pdf.hash"
echo
echo "This lab teaches you:"
echo "✔ how to identify unknown hash types"
echo "✔ how to convert ZIP & PDF files using 2john tools"
echo "✔ how to crack multiple hash formats using John the Ripper"
echo "✔ how password strength affects security"
echo "=============================================="
