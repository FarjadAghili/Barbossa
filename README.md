## 🔐 Barbossa

**Barbossa** is a lightweight encryption utility built with **AutoIt**, designed for experimenting with cryptographic operations and building a simple GUI-based security tool.  
It was originally created years ago as a personal project for learning encryption and Windows desktop GUI development.

---

## ✨ Features

### 📝 Text Encryption
- AES-256 encryption for plain text
- User-defined password combined with an internal random salt
- Output automatically copied to clipboard

### 🔓 Text Decryption
- Restores original text from encrypted input
- Extracts embedded salt and reconstructs the encryption key internally

### #️⃣ MD5 Hashing
- Generates MD5 hash of input text
- Useful for quick integrity checks and comparisons

### 📁 File Encryption
- Encrypts any file using AES-256
- Outputs encrypted files with `.barbossa` extension
- Simple GUI-based file selection workflow

### 📂 File Decryption
- Restores original files from `.barbossa` encrypted format
- Validates file type before decryption

---

## 🖥 User Interface

- Fully custom GUI built with image-based components
- No standard Windows controls (fully custom look & feel)
- Draggable header bar
- Dedicated About window
- Animated loading indicator during file operations
- Minimal and clean design focused on usability

---

## ⚙️ Technologies Used

- AutoIt v3
- Windows Cryptography API (via `_Crypt` UDF)
- AES-256 encryption
- MD5 hashing algorithm
- Custom GUI system with image-based controls
- `GIFAnimation.au3` for animated loading indicator

---

## 📦 Build Information

The project compiles into a single executable:

Barbossa.exe (v5.0.0.0)

---

## 🧠 Technical Highlights

- Password is combined with a randomly generated number for added variability
- Uses AES-256 for both text and file encryption workflows
- Temporary UI assets are extracted at runtime using `FileInstall`
- Custom event loop-based GUI handling
- Clipboard integration for instant output copying
- Lightweight architecture with no external dependencies

---

## 📜 About the Project

Barbossa is an **educational/experimental project**, created to explore:

- Desktop GUI development with AutoIt
- Basic cryptographic workflows (AES + hashing)
- File encryption and decryption logic
- Custom UI systems without native Windows controls

It represents an early exploration of building security tools in a lightweight scripting environment.

---

## ⚠️ Disclaimer

This project is intended for **educational purposes only**.  
It is not recommended for production or high-security environments.
