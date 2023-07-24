## asus_zenbook_ux5304va_sound

sound fix

- edit ssdt-csc3551.dsl if needed

- build it

`iasl -tc ssdt-csc3551.dsl`

- copy it in /boot

`sudo cp -f ssdt-csc3551.aml /boot`

- copy grub script

`sudo cp -f 01_acpi /etc/grub.d`

`sudo chmod +x /etc/grub.d/01_acpi`

- update grub config

`sudo update-grub`

- reboot

# TODO: Update guide

ssdt7.dat contains CSC3551 info

# kernel:

SND_PCI_QUIRK(0x1043, 0x16d3, "ASUS UX5304VA", ALC245_FIXUP_CS35L41_SPI_2),
