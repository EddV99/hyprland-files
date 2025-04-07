#!/usr/bin/env bash
right_path=/org/bluez/hci0/dev_C4_CE_3E_B7_6C_98/service0015/char0016
left_path=/org/bluez/hci0/dev_C4_CE_3E_B7_6C_98/service0010/char0011


l_kb_hex=$(gdbus call --system --dest org.bluez --object-path $left_path --method org.bluez.GattCharacteristic1.ReadValue "{}"  2>&1 | sed -E 's/.*0x([0-9a-fA-F]+).*/\1/');
r_kb_hex=$(gdbus call --system --dest org.bluez --object-path $right_path --method org.bluez.GattCharacteristic1.ReadValue "{}" 2>&1 | sed -E 's/.*0x([0-9a-fA-F]+).*/\1/');

(( 16#$l_kb_hex )) > /dev/null 2>&1
if [ $? -ne 0 ]; then
  left_string="N/A"
else
  left_string="$((16#$l_kb_hex))%"
fi

(( 16#$r_kb_hex )) > /dev/null 2>&1
if [ $? -ne 0 ]; then
  right_string="N/A"
else
  right_string="$((16#$r_kb_hex))%"
fi

if [[ "$left_string" = "N/A" && "$right_string" = "N/A" ]]; then
  exit 0
fi

echo "$left_string 🦀 $right_string"
