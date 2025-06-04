# Codmiryoku ZMK Config

This repository contains a ZMK configuration for a Miryoku-based layout on the Totem 36-key split keyboard using Seeed XIAO BLE controllers. It includes custom mouse key settings for enhanced functionality.

## Hardware
- Keyboard: Totem (36-key split)
- Controller: Seeed XIAO BLE

## Setup
1. Clone this repository.
2. Edit `config/totem.keymap` to customize the Miryoku layout or mouse settings.
3. Push changes to trigger a GitHub Actions build.
4. Download the firmware (`totem_left.uf2`, `totem_right.uf2`) from the Actions tab.
5. Flash the firmware to your Seeed XIAO BLE controllers.

## Files
- `config/totem.keymap`: Primary keymap with Miryoku layout and custom mouse settings.
- `config/totem.conf`: Primary configuration for ZMK features.
- `config/boards/shields/totem/`: Totem shield definitions for left and right sides.
- `config/west.yml`: West manifest for ZMK dependencies.
- `.github/workflows/build.yml`: GitHub Actions workflow for firmware builds.

## Notes
- The `config/totem.keymap` and `config/totem.conf` files take precedence over any shield directory files.
- Based on Miryoku ZMK with customizations for mouse keys and Colemak-DH layout with custom acceleration settings.
- Join the ZMK Discord for support: https://zmk.dev/community/discord

## License
MIT License (see `LICENSE` file).