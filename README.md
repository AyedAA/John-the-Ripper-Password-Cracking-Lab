
# John the Ripper Password Cracking Lab  
*A fully automated training environment for teaching hash cracking, ZIP/PDF attacks, and John the Ripper fundamentals.*

---

## 📌 Overview  
This repository contains a **Bash script** (`jtr_ctf_lab.sh`) that sets up a complete John the Ripper training lab.  
The lab automatically generates:

✔ 5 hash challenge files  
✔ A password-protected ZIP challenge  
✔ A password-protected PDF challenge  
✔ A custom 110+ wordlist (with real challenge passwords hidden)  
✔ A solutions guide (no answers exposed)  
✔ Student instructions printed in the terminal  
✔ Clean folder structure with no leftover plaintext flags  

---

## 📂 Repository Structure

```

.
├── jtr_ctf_lab.sh        # Main setup script
├── README.md             # Documentation
└── (Generated after running script)
├── ayed_secreats.zip
├── ayed_secreats2.pdf
├── johnpass.txt
├── hash1 … hash5
├── solutions.txt

```

---

## 🚀 Features

### 🔐 Hash Cracking Challenges (5 Files)
- Mix of MD5, SHA1, SHA256  
- 3 crackable with **johnpass.txt**  
- 2 crackable only with **rockyou.txt**  

### 🗂 ZIP & PDF Cracking Labs
- ZIP (password: hidden in wordlist)  
- PDF (encrypted, password hidden in wordlist)  
- Students must use:
```

zip2john
pdf2john

````

### 🧾 Wordlist Included (110+ Entries)
The script builds a wordlist containing:

- Common passwords  
- Realistic training passwords  
- Hidden real lab passwords 

### 📝 Solutions Guide
Includes methodology instructions WITHOUT revealing the flags.

---

## 🛠 Installation & Usage

### 1️⃣ Clone the Repository

### 2️⃣ Make Script Executable

```bash
chmod +x jtr_ctf_lab.sh
```

### 3️⃣ Run the Lab Setup

```bash
./jtr_ctf_lab.sh
```

### 4️⃣ Navigate to the Lab Folder

```bash
cd jtr_lab
ls
```

You should see:

```
ayed_secreats.zip
ayed_secreats2.pdf
johnpass.txt
hash1  hash2  hash3  hash4  hash5
solutions.txt
```

## ⚠️ Ethical Disclaimer

This project is for **educational purposes only**.
Do NOT use these techniques on unauthorized systems.

---

## 🧑‍💻 Author

**Ayed A. Areda**
---



