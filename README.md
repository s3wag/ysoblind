# ysoblind


It automates the generation of **Java gadget chain payloads** with OOB triggers like `nslookup` or `curl`, encoded and ready to be injected into **headers, cookies, or parameters** for blind exploitation.

---

## Features

- Blind payload generation using `ysoserial`
- Automatic base64 and URL encoding
- Supports multiple gadget chains (CommonsCollections, Jython, JRMP, etc.)
- Plug-and-play with **Burp Collaborator** or any external listener
- Minimalistic CLI interface

---

## Requirements

```bash
mkdir ysoblind
cd ysoblind
wget https://github.com/frohoff/ysoserial/releases/download/v0.0.6/ysoserial-all.jar -O ysoserial-all.jar
chmod +x ysoserial-all.jar
git clone
chmod +x ysoblind.sh
```

## 🚀 Usage

```bash
./ysoblind.sh
```
