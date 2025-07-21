# ysoblind


It automates the generation of **Java-PHP gadget chain payloads** with OOB triggers like `nslookup` or `curl`, encoded and ready to be injected into **headers, cookies, or parameters** for blind exploitation.

---

## Features

- Blind payload generation using `ysoserial-phpggc`
- Automatic base64 and URL encoding
- Supports multiple gadget chains (CommonsCollections, Jython, Laravel/RCE1, Symfony/RCE1, etc.)
- Plug-and-play with **Burp Collaborator** or any external listener
- Minimalistic CLI interface

---

## Requirements

```bash
git clone https://github.com/s3wag/ysoblind.git
cd ysoblind
sudo apt install phpggc
wget https://github.com/frohoff/ysoserial/releases/download/v0.0.6/ysoserial-all.jar -O ysoserial-all.jar
chmod +x ysoserial-all.jar ysoblind-java.sh ysoblind-php.sh
```

## 🚀 Usage

```bash
./ysoblind-XXXX.sh
```
