<p align="center">
  <a href="https://github.com/badgers-ua/" target="blank"><img src="https://avatars.githubusercontent.com/u/106803527?s=200&v=4" width="120" alt="Badgers UA Logo" /></a>
</p>

<p align="center">SSDT Patch to fix missing speakers sound on Asus Zenbook s13 Oled UX5304VA</br>

# Pre Requirements

**BIOS Configuration**

- **BIOS Version:** 304
- **Fast Boot** Disabled
- **Secure Boot** Disabled

**Kernel**

As of now there linux kernels don't contain the ux5304va in `kernel_source_root/sound/pci/hda/patch_realtek.c ` so to make the patch work, you will have to compile the kernel yourself, the steps are:

1. Pull the kernel sources
2. Open `kernel_source_root/sound/pci/hda/patch_realtek.c` with your text editor and search for FIXUP*CS35L41* until you find a list of things like this: `SND_PCI_QUIRK(0x1043, 0x12af, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2)`
3. On next line add ux5304va config: `SND_PCI_QUIRK(0x1043, 0x16d3, "ASUS UX5304VA", ALC245_FIXUP_CS35L41_SPI_2)`
4. Compile the kernel
5. Install the kernel

---

# Patch installation

### build the _ssdt-csc3551.dsl_

`iasl -tc ssdt-csc3551.dsl`

### copy it in /boot

`sudo cp -f ssdt-csc3551.aml /boot`

### copy grub script

`sudo cp -f 01_acpi /etc/grub.d`
`sudo chmod +x /etc/grub.d/01_acpi`

### update grub config

`sudo update-grub`

### shutdown the laptop

`sudo shutdown -h now`

### Special thanks

| Codebase                                     |                                                                                      Description                                                                                       |
| :------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| [lamperez](https://gist.github.com/lamperez) | For [ACPI DSDT/SSDT patching guides](https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff) and [tools](https://gist.github.com/lamperez/d5b385bc0c0c04928211e297a69f32d7) |
| [Moooebie](https://gist.github.com/Moooebie) |                For [ACPI DSDT/SSDT patching guide](https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff?permalink_comment_id=4582983#gistcomment-4582983)                 |
| [thor2002ro](https://github.com/thor2002ro)  |                                        For [GRUB patch](https://github.com/thor2002ro/asus_zenbook_ux3402za/tree/main/Sound) for similar laptop                                        |
