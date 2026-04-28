# Desktop Organizer (Windows)

A simple Windows Batch + PowerShell script that organizes files and folders on your Desktop into categorized subfolders.

## What it does

Creates these folders on your Desktop (if missing) and moves items into them:

- `Images` (`.jpg`, `.jpeg`, `.png`, `.gif`)
- `Documents` (`.pdf`, `.docx`, `.txt`, `.html`, `.xlsx`, `.log`, `.crt`, and other unknown file types)
- `Archives` (`.zip`, `.iso`, `.rar`, `.7z`)
- `Shortcuts` (`.lnk`)
- `Code_and_Data` (`.js`, `.hex`, `.fig`, `.drl`, `.rpt`, `.gbr`, `.sldprt`)
- `Folders` (any other folders on Desktop)

It skips `desktop.ini` and the script file itself.

## Usage

Double-click `OrganizeDesktop.bat`, or run from a terminal:

```bat
OrganizeDesktop.bat
```

### Options

```bat
OrganizeDesktop.bat --dry-run
OrganizeDesktop.bat --no-pause
```

- `--dry-run`: prints what would be moved without moving anything
- `--no-pause`: does not wait for keypress at the end

## Safety

This script moves items (it does not delete anything). Still, it’s a good idea to run `--dry-run` first.

