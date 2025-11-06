# 🧠 YARA Usage Checklist

A complete, step-by-step guide for installing, creating, testing, and using **YARA** for malware detection, threat hunting, and incident response.

---

## 🧩 1. About This Repository

This repository contains a structured **YARA usage checklist** and best practices to help cybersecurity professionals effectively detect, classify, and analyze malware using YARA rules.

It’s designed for:
- Security Analysts & Threat Hunters  
- Malware Researchers  
- SOC & DFIR Teams  
- Students learning threat detection frameworks  

---

## 🧩 2. Sample Repository Structure

Organize your YARA repository for scalability and clarity:

```
YARA-Repository/
│
├── README.md
├── rules/
│   ├── malware/
│   │   ├── ransomware_rules.yar
│   │   ├── trojan_rules.yar
│   │   └── worm_rules.yar
│   ├── phishing/
│   │   ├── doc_malware_rules.yar
│   │   └── macro_rules.yar
│   ├── powershell/
│   │   └── powershell_obfuscation.yar
│   └── test/
│       └── test_rules.yar
│
└── logs/
    └── yara_scan_results.txt
```

---

## 🧩 3. Installation & Setup

| Step | Task | Command / Notes |
|------|------|-----------------|
| 1 | Install YARA on your system | **Linux:** `sudo apt install yara` <br> **Windows/macOS:** Download from [YARA Releases](https://github.com/VirusTotal/yara/releases) |
| 2 | Verify installation | `yara --version` |
| 3 | Create a folder for your rules | `mkdir ~/yara_rules` |
| 4 | Download community rules | `git clone https://github.com/Yara-Rules/rules.git` |

---

## 🧩 4. Understanding YARA Rules

A basic rule contains three main parts:

```yara
rule ExampleRule
{
    meta:
        description = "Detects example malware"
        author = "YourName"
        date = "2025-11-06"

    strings:
        $a = "malicious_code"
        $b = { E8 00 00 00 00 }
        $c = /virus[0-9]+/

    condition:
        any of them
}
```

🧩 Rule Components

| Section   | Purpose                                      |
|-----------|----------------------------------------------|
| meta      | Information about the rule (author, date, description) |
| strings   | Text, hex, or regex patterns to detect       |
| condition | Logic defining when the rule triggers        |

---

## 🧩 5. Testing & Validation

| Step | Task                 | Example Command                          |
|------|----------------------|------------------------------------------|
| 1    | Validate syntax      | `yara -v myrule.yar`                     |
| 2    | Scan single file     | `yara myrule.yar suspicious.exe`         |
| 3    | Recursive folder scan| `yara -r myrule.yar /samples/`           |
| 4    | Analyze results      | Output shows rule name and matched file path |
| 5    | Test on clean samples| Ensure no false positives before deploying |

---

## 🧩 6. Rule Optimization Checklist

| ✅ Check              | Description                                      |
|----------------------|--------------------------------------------------|
| Unique rule name     | e.g. APT29_Dropper_V1                            |
| Metadata complete    | Include description, author, date, and reference |
| Strings are unique   | Avoid generic words like “exe” or “file”         |
| Balanced conditions  | Use `$a and $b` or `any of them` wisely          |
| Tested for accuracy  | No false positives on clean systems              |
| Performance tested   | Avoid too many wide or regex strings             |
| Tags added           | Example: `: ransomware trojan`                   |
| Stored in version control | Use GitHub to track updates                 |

---

## 🧩 7. Operational Usage

| Step | Task                   | Example / Notes                          |
|------|------------------------|------------------------------------------|
| 1    | Schedule automated scans| `yara -r ~/yara_rules/ /data/ > logs.txt` |
| 2    | Log detections         | Store results in CSV or JSON format      |
| 3    | Integrate with SOC tools| e.g. SIEM, MISP, TheHive, Velociraptor   |
| 4    | Update rules weekly    | `git pull` to get the latest signatures  |
| 5    | Document findings      | Keep a detection logbook or markdown report |

---

## 🧩 8. Recommended Repositories

- **Yara-Rules / rules** — community-maintained ruleset  
- **Florian Roth / signature-base** — high-quality YARA & Sigma rules  
- **ReversingLabs / yara-rules** — enterprise-grade rules  
- **MISP / misp-rules** — YARA rules for threat intelligence  

---

## 🧩 9. Tips: Combining YARA with Other Tools

| Tool / Platform        | Purpose                          | How to Combine                                      |
|------------------------|----------------------------------|----------------------------------------------------|
| VirusTotal Intelligence| Analyze malware samples          | Upload your rule → test against VT dataset         |
| Cuckoo Sandbox         | Dynamic malware analysis         | Use YARA to scan dropped or unpacked files         |
| TheHive / Cortex       | Threat response automation       | Create YARA analyzers for automated IOC scanning   |
| Velociraptor           | Endpoint visibility              | Deploy YARA rules for live hunting across endpoints|
| MISP                   | Threat intelligence sharing      | Import/export YARA rules with indicators           |
| Elastic / Splunk (SIEMs)| Log correlation                 | Trigger alerts when files match YARA detections    |

---

## 🧩 10. Best Practices

- Always test rules before production deployment  
- Keep rules organized and version-controlled  
- Avoid overly broad or common strings to reduce false positives  
- Regularly update rules with new threat intelligence  
- Maintain a detection logbook for analysis and auditing  

---

## 🤝 Contributing

Feel free to:
- Add new checklists, examples, or rules  
- Submit pull requests to improve detection logic  
- Open issues for discussion or suggestions  

---

## 📘 Author

Maintained by ATTA ULLAH KHAN — Cyber Threat Intelligence & SOC Automation  
📅 Last Updated: November 6, 2025  

---

> 💡 Tip: Combine YARA with tools like VirusTotal Intelligence, TheHive, or Velociraptor for deeper malware triage and automated detection workflows.
