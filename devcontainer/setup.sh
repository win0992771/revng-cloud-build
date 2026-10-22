#!/bin/bash
# سكريبت التثبيت التلقائي لـ rev.ng على GitHub Codespaces

echo "=== [1/4] تحديث حزم النظام وتثبيت الأدوات الأساسية ==="
sudo apt-get update -y
sudo apt-get install -y git build-essential cmake python3 python3-pip curl wget ninja-build

echo "=== [2/4] التحقق من جاهزية Docker داخل السحاب ==="
# الانتظار حتى يعمل محرك دوقر بالكامل خلف الكواليس
until sudo docker info >/dev/null 2>&1; do
    echo "بانتظار تشغيل خدمة Docker..."
    sleep 3
done

echo "=== [3/4] سحب حزم وصور الأدوات الخاصة بـ rev.ng ==="
# سحب الصورة الرسمية الجاهزة للمشروع لتوفر عليك وقت التجميع اليدوي الذي يستغرق ساعات
sudo docker pull revng/revng:latest

echo "=== [4/4] إعداد سكريبت التشغيل السريع للمستخدم ==="
# إنشاء اختصار (Alias) ليسهل عليك استدعاء الأداة فوراً داخل الطرفية
echo "alias revng='sudo docker run -it --rm -v \$(pwd):/workspace revng/revng:latest'" >> ~/.bashrc
source ~/.bashrc

echo "========================================================="
echo " تم إعداد بيئة rev.ng بنجاح على السحاب مجاناً!"
echo " يمكنك الآن استخدام الأمر 'revng' داخل الـ Terminal مباشرة."
echo "========================================================="
