# 🌐 Ngrok Auto-Installer

> **One-command ngrok setup for Termux, Linux & Windows — no manual steps, no PATH headaches.**

[![Platform](https://img.shields.io/badge/platform-Termux%20%7C%20Linux%20%7C%20Windows-blue?style=flat-square)](https://github.com/pidugulikhil/ngrok)
[![Shell](https://img.shields.io/badge/shell-bash%20%2F%20batch-green?style=flat-square)](https://github.com/pidugulikhil/ngrok)
[![License](https://img.shields.io/badge/license-MIT-orange?style=flat-square)](LICENSE)
[![ngrok](https://img.shields.io/badge/ngrok-v3-blueviolet?style=flat-square)](https://ngrok.com)

---

## 📋 Table of Contents

- [What is this?](#-what-is-this)
- [Supported Platforms](#-supported-platforms)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
  - [Linux](#-linux)
  - [Termux (Android)](#-termux-android)
  - [Windows](#-windows)
- [How It Works](#-how-it-works)
- [Getting Your Authtoken](#-getting-your-authtoken)
- [Usage After Install](#-usage-after-install)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)

---

## 💡 What is this?

This project provides **automated installer scripts** for [ngrok v3](https://ngrok.com) — a tool that creates secure tunnels from a public URL to your localhost. Instead of manually downloading, extracting, and configuring ngrok, these scripts handle everything in one go:

- ✅ Downloads the correct ngrok binary for your platform
- ✅ Extracts and installs it to the system PATH
- ✅ Configures your authtoken automatically
- ✅ Cleans up temp files after install

---

## 💻 Supported Platforms

| Platform | Script | Architecture |
|---|---|---|
| 🐧 Linux | `install_ngrok.sh` | x86_64 (amd64) |
| 📱 Termux (Android) | `install_ngrok.sh` | ARM64 |
| 🪟 Windows | `install_ngrok.bat` | x86_64 (64-bit) / x86 (32-bit) |

---

## ⚙️ Prerequisites

### Linux / Termux
- `wget` installed (`apt install wget` or `pkg install wget`)
- `tar` installed (usually pre-installed)
- Internet connection
- Your [ngrok authtoken](https://dashboard.ngrok.com/get-started/your-authtoken)

### Windows
- Windows 10 or later (for built-in `curl` and PowerShell)
- PowerShell (pre-installed on Win 10+)
- **Run as Administrator** (required to copy to `System32`)
- Internet connection
- Your [ngrok authtoken](https://dashboard.ngrok.com/get-started/your-authtoken)

---

## 🚀 Installation

### 🐧 Linux

```bash
# Clone the repo
git clone https://github.com/pidugulikhil/ngrok.git
cd ngrok

# Give execute permission
chmod +x install_ngrok.sh

# Run the installer
./install_ngrok.sh
```

When prompted:
1. Press `Y` to continue
2. Select `2` for **Linux**
3. Enter your ngrok authtoken

---

### 📱 Termux (Android)

```bash
# Install required packages first
pkg update && pkg install wget

# Clone the repo
git clone https://github.com/pidugulikhil/ngrok.git
cd ngrok

# Give execute permission
chmod +x install_ngrok.sh

# Run the installer
./install_ngrok.sh
```

When prompted:
1. Press `Y` to continue
2. Select `1` for **Termux**
3. Enter your ngrok authtoken

---

### 🪟 Windows

1. **Download** [`install_ngrok.bat`](https://github.com/pidugulikhil/ngrok/blob/main/install_ngrok.bat) from this repo

2. **Right-click** the file → **Run as Administrator**

3. When prompted:
   - Press `Y` to continue
   - Select `1` for **Windows 64-bit** *(most modern PCs)* or `2` for **32-bit**
   - Enter your ngrok authtoken

> ⚠️ **Must run as Administrator** — the script copies `ngrok.exe` to `C:\Windows\System32\` so it's accessible from any terminal.

---

## 🔍 How It Works

```
User runs script
      │
      ▼
Prompts for confirmation (Y/N)
      │
      ▼
Detects chosen platform
      │
      ▼
Downloads correct ngrok binary
  ├─ Termux  → ngrok-v3-stable-linux-arm64.tgz
  ├─ Linux   → ngrok-v3-stable-linux-amd64.tgz
  └─ Windows → ngrok-v3-stable-windows-amd64.zip (or 386)
      │
      ▼
Extracts binary
      │
      ▼
Runs: ngrok config add-authtoken <your_token>
      │
      ▼
Copies binary to PATH
  ├─ Termux  → $PREFIX/bin/ngrok
  ├─ Linux   → /bin/ngrok
  └─ Windows → C:\Windows\System32\ngrok.exe
      │
      ▼
Cleans up temp files
      │
      ▼
✅ Done! ngrok ready to use anywhere
```

---

## 🔑 Getting Your Authtoken

1. Go to [https://dashboard.ngrok.com](https://dashboard.ngrok.com)
2. Sign up or log in (free account works)
3. Navigate to **Getting Started → Your Authtoken**
4. Copy the token and paste it when the installer asks

---

## ▶️ Usage After Install

Once installed, open any terminal and run ngrok directly:

```bash
# Expose a local web server on port 80
ngrok http 80

# Expose port 8080
ngrok http 8080

# Expose a TCP port
ngrok tcp 22

# Check version
ngrok version
```

Your public URL will appear in the terminal like:
```
Forwarding   https://abc123.ngrok-free.app → http://localhost:8080
```

---

## 🛠️ Troubleshooting

| Problem | Fix |
|---|---|
| `Permission denied` on Linux | Run `chmod +x install_ngrok.sh` first |
| `wget: command not found` on Termux | Run `pkg install wget` |
| Windows: *"Access Denied"* when copying | Right-click `.bat` → Run as Administrator |
| Windows: `curl` not found | Upgrade to Windows 10 v1803 or later |
| `ngrok: command not found` after install | Restart your terminal / reopen CMD |
| Authtoken error | Double-check your token at [ngrok dashboard](https://dashboard.ngrok.com) |

---

## 🤝 Contributing

Pull requests are welcome! To add support for a new platform (e.g., macOS):

1. Fork this repo
2. Create your feature branch: `git checkout -b feature/macos-support`
3. Commit your changes: `git commit -m 'Add macOS installer'`
4. Push to the branch: `git push origin feature/macos-support`
5. Open a Pull Request

---

## 👨‍💻 Author

**Likhil Piduguleti**  
GitHub: [@pidugulikhil](https://github.com/pidugulikhil)

---

## ⭐ Support

If this saved you time, consider giving the repo a **star ⭐** — it helps others find it too!
