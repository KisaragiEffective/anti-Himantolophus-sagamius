#!/bin/bash
DOT="$(dirname "$0")"
"$DOT/resolve_shopname_subdomain.sh"
"$DOT/compile_intermediate.sh"
"$DOT/compile_ublacklist.sh"
"$DOT/compile_ublockorigin.sh"
"$DOT/compile_ublockorigin_booth_search.sh"
"$DOT/compile_ublockorigin_google.sh"
