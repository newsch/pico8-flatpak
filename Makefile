# Build/Install flatpak wrapper for PICO-8
# Requires:
# - flatpak-builder (for building)
# - flatpak (for install)
# - PICO-8 <https://www.lexaloffle.com/pico-8.php> for linux downloaded and unzipped into the local pico-8/ folder
.POSIX:

# flatpak-builder
BUILDER=flatpak run org.flatpak.Builder # installed from flatpak
# BUILDER=flatpak-builder # installed externally
# BUILDER=org.flatpak.Builder # installed from flatpak and in PATH

# location of local flatpak repository to place built flatpak
# (required to export .flatpak file)
REPO=repo
# directory used by flatpak for building
BUILD_DIR=build

pico8.flatpak: build
	flatpak build-bundle $(REPO) pico8.flatpak com.lexaloffle.pico8
build: com.lexaloffle.pico8.yml pico-8/pico8 pico-8/pico8.dat pico8.desktop pico8.png
	$(BUILDER) --repo=$(REPO) build com.lexaloffle.pico8.yml

install: pico8.flatpak
	flatpak --user install pico8.flatpak -y
install-from-repo: build
	$(BUILDER) --user --install --force-clean build com.lexaloffle.pico8.yml
run:
	flatpak run com.lexaloffle.pico8

clean:
	rm -rf build pico8.flatpak $(REPO)

.PHONY: install install-from-repo run clean
