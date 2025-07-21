#!/bin/bash

# Cyber Bukijutsu System Stripdown for Offensive Security
# Usage: sudo ./disable-bloat.sh

set -e

echo "🔥 Disabling unneeded services for offensive C rig..."

SERVICES=(
  cups.service                # Printing
  bluetooth.service          # Bluetooth stack
  avahi-daemon.service       # Local network discovery (AirDrop-like stuff)
  lvm2-monitor.service       # Only needed if using LVM
  ModemManager.service       # 3G/4G dongle management
  udisks2.service            # GUI automounter
  accounts-daemon.service    # GUI account management
  systemd-resolved.service   # DNS resolver - skip if you're using this
  polkit.service             # GUI privilege manager
  NetworkManager-wait-online.service # Slows down boot
)

for svc in "${SERVICES[@]}"; do
  if systemctl is-enabled --quiet "$svc"; then
    echo "⛔ Disabling $svc"
    systemctl disable "$svc"
    systemctl stop "$svc"
  else
    echo "✅ $svc already disabled"
  fi
done

echo "🧹 Optional: Vacuuming system logs older than 2 days..."
journalctl --vacuum-time=2d

echo "✅ System stripdown complete. You now wield a lighter, faster OS."
