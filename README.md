# Codmiryoku ZMK Config (Totem)

ZMK configuration for Totem split keyboards (Seeed XIAO BLE) with Colemak-DH /
Miryoku-derived layout. Sibling layout: Temper (Mac-only) in
[`temper-zmk`](https://github.com/willnapier/temper-zmk).

## Fleet (2026-07-24)

| BLE name | Keymap | Hardware |
|---|---|---|
| **Totem-Mac-1** | `config/totem.keymap` (Cmd) | Yes |
| **Totem-Mac-2** | `config/totem.keymap` (Cmd) | Yes |
| **Totem-Linux-1** | `config/totem_linux.keymap` (Ctrl) | Yes |
| **Totem-Linux-2** | `config/totem_linux.keymap` (Ctrl) | No HW yet — UF2s still built |

BLE name = `CONFIG_ZMK_KEYBOARD_NAME` via `config/totem_mac_N.conf` /
`config/totem_linux_N.conf` (`EXTRA_CONF_FILE` in CI). Same keymap within a host
OS; only the advertise name differs so pairs are distinguishable when re-pairing.

## Hardware

- Keyboard: Totem (38-key / outer pinkies)
- Controller: Seeed XIAO BLE
- Central: **left** half

## Firmware artifacts

Artifact: **`totem-firmware`**

| File | Flash to |
|---|---|
| `totem_mac_1_left.uf2` / `_right.uf2` | Totem-Mac-1 |
| `totem_mac_2_left.uf2` / `_right.uf2` | Totem-Mac-2 |
| `totem_linux_1_left.uf2` / `_right.uf2` | Totem-Linux-1 |
| `totem_linux_2_left.uf2` / `_right.uf2` | Totem-Linux-2 (future) |

After a name change: forget old Bluetooth devices on the host, then re-pair.
Double-tap reset → volume usually `XIAO-SENSE`.

## Keymap source of truth

- Mac: `config/totem.keymap` ↔ Temper `temper.keymap`
- Linux: `config/totem_linux.keymap` (Temper Linux not built for now)

## Files

- `config/totem.keymap` / `totem_linux.keymap` — host-specific keymaps
- `config/totem.conf` — shared Kconfig
- `config/totem_mac_1.conf` … `totem_linux_2.conf` — BLE names only
- `config/boards/shields/totem/` — shield
- `config/west.yml` — ZMK deps
- `.github/workflows/build.yml` — four-pair firmware matrix

## License

MIT License (see `LICENSE` file).
