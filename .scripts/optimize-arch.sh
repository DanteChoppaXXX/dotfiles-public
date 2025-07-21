#!/bin/bash

# Cyber Bukijutsu Arch Optimization Script
# Use: sudo ./optimize-arch.sh

set -e

echo "🔧 Starting system optimization..."

# 1. Enable parallel downloads
echo "🛠 Enabling parallel downloads in pacman.conf..."
sed -i 's/^#ParallelDownloads =.*/ParallelDownloads = 10/' /etc/pacman.conf
sed -i 's/^#Color/Color/' /etc/pacman.conf
sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
echo "ILoveCandy" >> /etc/pacman.conf

# 2. Enable fstrim timer for SSD/flash drives
echo "🧹 Enabling weekly TRIM for SSD..."
systemctl enable fstrim.timer

# 3. Install preload (for app launch speed)
echo "🚀 Installing preload..."
pacman -S --noconfirm preload
systemctl enable preload

# 4. Install fast and modern replacements for common tools
echo "⚡ Installing fast CLI tools (bat, eza, fd, ripgrep)..."
pacman -S --noconfirm bat eza fd ripgrep zsh

# 5. Optional: Setup zram
#echo "🧠 Installing and setting up ZRAM..."
#pacman -S --noconfirm zram-generator

#cat <<EOF > /etc/systemd/zram-generator.conf
#[zram0]
#zram-size = ram / 2
#compression-algorithm = zstd
#EOF

#systemctl daemon-reexec

# 6. Disable unneeded services (customize this as needed)
echo "🚫 Disabling unused services..."
systemctl disable bluetooth.service || true
systemctl disable cups.service || true
systemctl disable lvm2-monitor.service || true

# 7. Set GRUB/systemd-boot timeout to 1 (check which is used)
echo "⏱ Reducing boot timeout..."
if [ -d /boot/loader ]; then
  bootctl set-timeout 1
elif grep -q GRUB /boot/grub/grub.cfg 2>/dev/null; then
  sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=1/' /etc/default/grub
  grub-mkconfig -o /boot/grub/grub.cfg
fi

# 8. Enable haveged (for entropy if needed)
echo "🔐 Installing and enabling haveged..."
pacman -S --noconfirm haveged
systemctl enable haveged

echo "✅ Optimization complete!"
echo "🔁 Reboot recommended to apply all changes."
