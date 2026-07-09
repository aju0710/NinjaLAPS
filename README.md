# NinjaLAPS

## Overview

NinjaLAPS is a lightweight Local Administrator Password Solution (LAPS) developed for Microsoft Windows endpoints managed through NinjaOne RMM.

This project was created as a Proof of Concept (POC) to automate the creation, management, rotation, and rollback of a dedicated local administrator account without relying on the built-in Windows Administrator account.

The solution is designed for Small and Medium Business (SMB) environments and can be deployed through NinjaOne Scheduled Automations.

---

## Features

- Create a dedicated local administrator account (`Efficium`)
- Generate secure, human-readable random passwords
- Automatically rotate the local administrator password
- Store the current password securely in a NinjaOne Device Custom Field
- Download and maintain a local password dictionary
- Complete rollback script for removing the implementation
- Windows platform validation
- Designed for deployment through NinjaOne Policies

---

## Repository Structure

```
NinjaLAPS/
│
├── README.md
├── dict.csv
│
├── Scripts/
│   ├── Script1 - Dictionary Download.ps1
│   ├── Script2 - Rotate Local Password.ps1
│   ├── Script3 - LAPS Remove.ps1
│   └── Create Local Administrator.ps1
│
├── Documentation/
│   ├── LAPS Implementation SOP.docx
│   ├── LAPS Rollback SOP.docx
│   └── KB Articles
│
└── Images/
```

---

## Requirements

- Windows 10 / Windows 11
- Windows Server (optional)
- NinjaOne RMM Agent
- PowerShell 5.1 or later
- Device Custom Field:

```
Name: localpass
Type: Text
```

---

## Deployment Workflow

### Step 1

Run:

```
Create Local Administrator
```

Creates:

```
Local User:
Efficium
```

Adds the account to:

```
Administrators Group
```

---

### Step 2

Run:

```
Script1
Dictionary Download
```

Downloads

```
dict.csv
```

to

```
C:\NinjaLAPS\
```

---

### Step 3

Run:

```
Script2
Rotate Local Password
```

The script:

- Generates a random passphrase
- Updates the Efficium account password
- Updates the NinjaOne Custom Field (`localpass`)

---

### Step 4

(Optional)

Run:

```
Script3
LAPS Remove
```

Removes:

- Local Administrator
- Dictionary
- NinjaLAPS folder
- NinjaOne custom field value

---

## Password Dictionary

The password dictionary is hosted using jsDelivr CDN.

Current URL

```
https://cdn.jsdelivr.net/gh/aju0710/NinjaLAPS@main/dict.csv
```

---

## Known Limitations

During testing, GitHub Raw (`raw.githubusercontent.com`) returned HTTP 429 (Too Many Requests) due to GitHub rate limiting.

As a temporary solution, the dictionary is served through jsDelivr CDN.

Future improvement:

- Host the dictionary on an internal company web server.

---

## Current Status

Project Status:

```
Proof of Concept (POC)
```

Current Progress

- ✅ Local Administrator Creation
- ✅ Dictionary Download
- ✅ Password Rotation
- ✅ NinjaOne Integration
- ✅ Rollback Script
- ✅ Documentation
- ✅ SOP
- ⏳ Policy Deployment
- ⏳ Production Rollout

---

## Future Improvements

- Internal dictionary hosting
- Dictionary version checking
- Automatic dictionary updates
- Password history
- Logging improvements
- Multi-language dictionary support
- Support for Windows Servers
- Deployment through Base Windows Workstation Policy

---

## Author

**AJ Ugjoc**

System Engineer / Microsoft 365 Administrator

Created for internal automation and Proof of Concept using NinjaOne RMM.

---

## Disclaimer

This repository is intended for educational, testing, and internal automation purposes.
Review all scripts before deploying into a production environment.
Always validate in a controlled test environment before mass deployment.

END
