<p align="center">
  <a href="https://github.com/badgers-ua/" target="blank"><img src="https://avatars.githubusercontent.com/u/106803527?s=200&v=4" width="120" alt="Badgers UA Logo" /></a>
</p>

<p align="center">SSDT Patch to fix missing speakers sound on Asus Zenbook s13 Oled UX5304VA</br>

# Pre Requirements

**BIOS Configuration**

- **BIOS Version:** Tested on 304
- **Fast Boot:** Disabled
- **Secure Boot:** Disabled

**Kernel**

According to [DolevRavid](https://github.com/badgers-ua/asus_zenbook_ux5304va_sound/issues/3#issue-2119441397) latest kernels has the support of ux5304va in `kernel_source_root/sound/pci/hda/patch_realtek.c` so compling manually the kernel seems to be no longer required.

---

# Patch installation

### build the _ssdt-csc3551.dsl_

```
iasl -tc ssdt-csc3551.dsl
```

### copy it in /boot

```
sudo cp -f ssdt-csc3551.aml /boot
```

### copy grub script

```
sudo cp -f 01_acpi /etc/grub.d && sudo chmod +x /etc/grub.d/01_acpi
```

### update grub config

```
sudo update-grub
```

### shutdown the laptop

```
sudo shutdown -h now
```

### Special thanks

| User                                         |                                                                                      Description                                                                                       |
| :------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| [lamperez](https://gist.github.com/lamperez) | For [ACPI DSDT/SSDT patching guides](https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff) and [tools](https://gist.github.com/lamperez/d5b385bc0c0c04928211e297a69f32d7) |
| [Moooebie](https://gist.github.com/Moooebie) |                For [ACPI DSDT/SSDT patching guide](https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff?permalink_comment_id=4582983#gistcomment-4582983)                 |
| [thor2002ro](https://github.com/thor2002ro)  |                                        For [GRUB patch](https://github.com/thor2002ro/asus_zenbook_ux3402za/tree/main/Sound) for similar laptop                                        |
| [DolevRavid](https://github.com/DolevRavid) | For [Providing kernel uptodate info](https://github.com/badgers-ua/asus_zenbook_ux5304va_sound/issues/3)|
