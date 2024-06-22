# Find all .asm source files
x86_64_asm_source_files := $(shell find src/impl/x86_64 -name "*.asm")

# Convert .asm source file paths to .o object file paths
x86_64_asm_object_files := $(patsubst src/impl/x86_64/%.asm, build/x86_64/%.o, $(x86_64_asm_source_files))

# Rule for assembling .asm files to .o files
$(x86_64_asm_object_files): build/x86_64/%.o : src/impl/x86_64/%.asm
	@mkdir -p $(dir $@)
	nasm -f elf64 $< -o $@

# Phony target for building the x86_64 project
.PHONY: build-x86_64
build-x86_64 : $(x86_64_asm_object_files)
	@mkdir -p dist/x86_64
	x86_64-elf-ld -n -o dist/x86_64/kernel.bin -T targets/x86_64/linker.ld $(x86_64_asm_object_files)
	cp dist/x86_64/kernel.bin targets/x86_64/iso/boot/kernel.bin
	grub-mkrescue /usr/lib/grub/i386-pc -o dist/x86_64/kernel.iso targets/x86_64/iso
