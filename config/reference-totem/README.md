# Reference Totem (default / pre-experiment snapshot)

Frozen copy of the live Totem keymaps **before** the 36-key-oriented experiment
(captured 2026-07-19 from working Urob punct + N+H hyphen layout).

## What this snapshot still has

- Outer thumbs: `lt MEDIA ESC` / `lt FUN ESC`
- No `xcd` / `h,.` layer bars
- No `Q+W` Esc combo
- No thumb dual-Shift

## Live experiment (in `config/totem*.keymap`)

- Outer thumbs: dual Shift (tap sticky / hold held; **no** paren morphs)
- Esc: `Q+W` combo
- MEDIA: hold `xcd` (momentary)
- FUN: sticky `h,.`
- Outer pinkies: still smart Shift + paren morphs (Totem only)

Restore: copy these files over `../totem.keymap` and `../totem_linux.keymap`.
