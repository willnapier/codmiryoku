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

### BLE rename requires settings_reset

ZMK **persists** the advertise name. Reflashing new UF2s alone leaves the old
name (e.g. `TOTEM`). Per pair, in order:

1. Flash `totem_settings_reset_left.uf2` then `_right.uf2` (wipes settings/bonds)
2. Flash the numbered firmware for that pair (left, then right)
3. On the host: forget old `TOTEM` / prior Totem entries
4. Power left (central) then right; re-pair — should show `Totem-Mac-1` etc.

Double-tap reset → volume usually `XIAO-SENSE`.

### Totem-Linux-1 left-half reset constraint

> **⚠️ CONFOUNDED — do not rely on this section's conclusion (added 2026-08-27,
> later the same day).** The finding below was made while flashing **from the
> Mac**, whose USB-C port was later proved to enumerate **zero** USB devices
> across two known-good cables. The same left half enumerated on nimbini
> instantly, and **NAV+Q mounted `XIAO-SENSE` first time there**. A dead USB data
> path produces the exact symptom recorded below — the reset fires, the MCU
> enters the bootloader, and no volume can mount. **The switch has NOT been shown
> to be faulty.** Settle it with a five-second double-tap while the half is
> plugged into nimbini, then rewrite this section. Until then, treat the warning
> about `totem_settings_reset_left.uf2` as a precaution resting on an unproven
> premise, not an established constraint.

The physical reset switch on the **Totem-Linux-1 left half** mechanically
clicks but did not enter the XIAO bootloader on 2026-08-27 **when connected to
the Mac**. The normal firmware's software route, **hold left Space/NAV + tap Q**,
was verified to mount `XIAO-SENSE` — on nimbini, repeatedly. The right half's
physical reset works normally.

Routine keymap changes (bindings, layers, combos, macros, hold-taps) do **not**
need a settings reset and can continue through the software bootloader.

Before any larger Totem-Linux change that *does* require wiping persistent
settings (for example a BLE rename, bond recovery, or split-role/storage
change), stop and first provide a **recoverable left reset image**. Do not flash
the current stock `totem_settings_reset_left.uf2`: ZMK's `settings_reset`
shield uses a mock scanner, so NAV+Q is unavailable after it boots. Build the
left reset image from the real `totem_left` shield and normal Linux keymap with
`CONFIG_ZMK_SETTINGS_RESET_ON_START=y`; after the wipe, use NAV+Q to return to
`XIAO-SENSE` and flash the normal left firmware.

## Flashing from Linux (nimbini) — the preferred host

nimbini is the better flashing host: the UF2s are built and downloaded there,
and the USB stack can be watched live, which is how the Mac-port fault above was
actually found. **Three Linux-specific steps have no macOS equivalent and each
one silently looks like a failed flash if skipped:**

```bash
# 1. enter the bootloader: hold left Space (NAV) a full half-second, then tap Q
lsblk -o NAME,SIZE,LABEL | rg XIAO          # expect sda / XIAO-SENSE

# 2. mount AND copy as root — the vfat mount is root-owned (fmask=0022),
#    so a user-level cp is silently denied
sudo mount /dev/sda /tmp/xiao
sudo cp totem_linux_1_left.uf2 /tmp/xiao/

# 3. FLUSH. Linux buffers the write; without this the file is listed on the
#    volume at the right size while no bytes have reached the device.
sync
```

After `sync` the board reboots itself and `/dev/sda` disappears — that is
success. On macOS the copy flushes on its own, which is why no previous runbook
mentions step 3. Volume names differ by board: Totem (`seeeduino_xiao_ble`) is
`XIAO-SENSE`; Temper and Chocofi (`nice_nano_v2`) are `NICENANO`.

Independently repairing the physical reset circuit remains desirable **if** the
double-tap retest above shows it is genuinely faulty.

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
