#!/bin/bash
rdlkf() { [ -L "$1" ] && (local lk="$(readlink "$1")"; local d="$(dirname "$1")"; cd "$d"; local l="$(rdlkf "$lk")"; ([[ "$l" = /* ]] && echo "$l" || echo "$d/$l")) || echo "$1"; }
DIR="$(dirname "$(rdlkf "$0")")"
exec /usr/bin/env node --harmony "$DIR/index.js" "$@"
