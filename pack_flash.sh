sof2flash --input=de2i_150_qsys_pcie.sof --output=hwimage.flash --epcs --verbose
elf2flash --input=danmaku_de2/software/nios_fw/nios_fw.elf --output=swimage.flash --epcs --after=hwimage.flash --verbose
nios2-elf-objcopy -I srec -O ihex hwimage.flash  hwimage.hex
nios2-elf-objcopy -I srec -O ihex swimage.flash  swimage.hex
