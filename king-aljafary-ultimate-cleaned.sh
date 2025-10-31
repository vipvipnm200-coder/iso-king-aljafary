#!/bin/bash
# King Aljafary Ultimate Setup for Ubuntu 22.04 with XFCE and Cyberpunk UI

# تحديث النظام
sudo apt update && sudo apt upgrade -y

# تحديث النظام
sudo apt update && sudo apt upgrade -y

# تغيير اسم النظام
sudo hostnamectl set-hostname King-Aljafary
echo "Welcome to King Aljafary OS" | sudo tee /etc/issue

# تثبيت بيئة XFCE
sudo apt install -y xfce4 xfce4-goodies

# تثبيت أدوات الأمن السيبراني
sudo apt install -y nmap wireshark metasploit-framework john hydra aircrack-ng sqlmap nikto netcat neofetch figlet grub-customizer gnome-tweaks cubic

# تخصيص الطرفية
echo "figlet King Aljafary" >> ~/.bashrc
echo "neofetch" >> ~/.bashrc

# إنشاء مجلد الخلفيات
mkdir -p ~/Pictures/KingAljafary
cp "abstract-techno-background-with-connecting-dots-lines-circuit-board-texture.jpg" ~/Pictures/KingAljafary/background.jpg
cp "Designer.png" ~/Pictures/KingAljafary/grub.png

# تعيين خلفية سطح المكتب (XFCE)
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "$HOME/Pictures/KingAljafary/background.jpg"

# إعداد صورة الإقلاع (GRUB)
sudo mkdir -p /boot/grub/themes/king-aljafary
sudo cp "Designer.png" /boot/grub/themes/king-aljafary/background.png
cat << EOF | sudo tee /boot/grub/themes/king-aljafary/theme.txt
+ set background_image=/boot/grub/themes/king-aljafary/background.png
EOF
sudo sed -i 's/^GRUB_THEME=.*/GRUB_THEME="\/boot\/grub\/themes\/king-aljafary\/theme.txt"/' /etc/default/grub
sudo update-grub

# تثبيت أيقونات وثيم Cyberpunk
mkdir -p ~/.themes ~/.icons
cd /tmp
wget -O cyberpunk-theme.zip https://github.com/vinceliuice/Cyberpunk/releases/download/2023-10-01/Cyberpunk.zip
unzip cyberpunk-theme.zip -d ~/.themes/Cyberpunk
wget -O tela-icons.zip https://github.com/vinceliuice/Tela-icon-theme/archive/refs/heads/master.zip
unzip tela-icons.zip -d ~/.icons/Tela

# تطبيق الثيم والأيقونات
xfconf-query -c xsettings -p /Net/ThemeName -s "Cyberpunk"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela"

# إنشاء قوائم أدوات الأمن السيبراني في XFCE
mkdir -p ~/.local/share/applications
cat << EOF > ~/.local/share/applications/nmap.desktop
[Desktop Entry]
Name=Nmap
Exec=nmap
Icon=utilities-terminal
Type=Application
Categories=CyberTools;
EOF
cat << EOF > ~/.local/share/applications/sqlmap.desktop
[Desktop Entry]
Name=SQLMap
Exec=sqlmap
Icon=utilities-terminal
Type=Application
Categories=CyberTools;
EOF
# يمكن إضافة المزيد بنفس الطريقة

# إعادة تشغيل النظام
echo "✅ تم تجهيز توزيعة King Aljafary بالكامل. لإعادة التشغيل استخدم الأمر: sudo reboot"