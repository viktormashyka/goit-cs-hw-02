#!/bin/bash

# Масив з URL вебсайтів
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Файл логів
log_file="website_status.log"

# Очистити файл логів перед записом нового результату
echo "Website Availability Check - $(date)" > "$log_file"

echo "Перевірка вебсайтів, будь ласка, зачекайте..."

# Перевірка кожного сайту
for site in "${websites[@]}"; do
    # Використання curl з опціями для обробки перенаправлення та HTTPS
    http_status=$(curl -L -o /dev/null -s -w "%{http_code}" "$site")
    
    if [ "$http_status" -eq 200 ]; then
        echo "$site is UP" | tee -a "$log_file"
    else
        echo "$site is DOWN" | tee -a "$log_file"
    fi
done

# Підсумкове повідомлення
echo "Результати записано у файл: $log_file"

