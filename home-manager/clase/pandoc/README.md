# My pandoc setup

This is the setup y use for converting my notes and documents from Pandoc's Markdown 
to PDF and HTML.

It includes my defaults, css and js files as well as my script for 
working on any directory.

# Deployment

* `akdmik.sh` goes in the `$HOME/.local/bin` or `/bin` folder.
* Everything else goes in the root of the default Pandoc `$DATADIR`, 
  which is `$HOME/.local/share/pandoc`

# Dependencies

* `pandoc` obviously.
* `weasyprint` for PDF conversion.
* `yq-go` for the script to parse YAML files.

# Usage

To convert with `akdmik`:  
```console
akdmik INPUT OUTPUT DEFAULT
```

Currently there are two `defaults`:
- apuntes
- apuntes-imprimir
