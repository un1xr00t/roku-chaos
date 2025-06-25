# Roku ECP Chaos Script

This project is a proof-of-concept (PoC) demonstrating how exposed IoT device APIs can be abused when no authentication or segmentation is in place. Specifically, it targets **Roku TVs** using their open **External Control Protocol (ECP)** available on port `8060`.

## 🔍 Overview

Roku devices expose a REST-like API on your local network via port `8060`, intended for use with the Roku app, smart remotes, or developer tools. This interface requires **no authentication**, allowing any device on the same network to send:

- Remote control commands (`keypress/Home`, `VolumeUp`, etc.)
- App launch requests
- Text input
- Device queries

## 💣 What This Script Does

This script:

- Floods the Roku with random navigation commands
- Spams volume up/down rapidly
- Cycles through HDMI inputs and apps repeatedly
- Injects random text into any open input field
- Runs multiple control loops simultaneously for maximum chaos

### ⚠️ Use Responsibly
This is for **educational purposes only**. Only test on devices you own and control.

## 📂 Setup

1. Clone this repo:
   ```bash
   git clone https://github.com/un1xr00t/roku-chaos.git
   cd roku-chaos
   chmod +x rokuspam.sh
   ./rokuspam.sh
   ```
