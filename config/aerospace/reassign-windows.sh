#!/bin/zsh
# Reads on-window-detected rules from aerospace.toml and re-applies them to all open windows.

log() { echo "[reassign-windows] $1" }

CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/aerospace/aerospace.toml"
log "Parsing rules from $CONFIG"

# Parse config into parallel arrays: bundle ID/regex -> workspace
APP_IDS=()
APP_ID_WORKSPACES=()
APP_REGEXES=()
APP_REGEX_WORKSPACES=()

current_app_id=""
current_app_regex=""

while IFS= read -r line; do
  if [[ "$line" =~ "if.app-id *= *'([^']+)'" ]]; then
    current_app_id="${match[1]}"
    current_app_regex=""
  elif [[ "$line" =~ "if.app-name-regex-substring *= *'([^']+)'" ]]; then
    current_app_regex="${match[1]}"
    current_app_id=""
  elif [[ "$line" =~ "move-node-to-workspace +([A-Za-z0-9]+)" ]]; then
    ws="${match[1]}"
    if [[ -n "$current_app_id" ]]; then
      APP_IDS+=("$current_app_id")
      APP_ID_WORKSPACES+=("$ws")
      current_app_id=""
    elif [[ -n "$current_app_regex" ]]; then
      APP_REGEXES+=("$current_app_regex")
      APP_REGEX_WORKSPACES+=("$ws")
      current_app_regex=""
    fi
  fi
done < "$CONFIG"

log "Found ${#APP_IDS[@]} app-id rules and ${#APP_REGEXES[@]} regex rules"

# Build app-name -> bundle-id mapping
typeset -A NAME_TO_BUNDLE
while IFS=$'\t' read -r bundle_id app_name; do
  NAME_TO_BUNDLE[$app_name]="$bundle_id"
done < <(aerospace list-apps --json | jq -r '.[] | "\(.["app-bundle-id"])\t\(.["app-name"])"')

# Process each window
aerospace list-windows --all --json | jq -r '.[] | "\(.["window-id"])\t\(.["app-name"])"' | while IFS=$'\t' read -r id app_name; do
  bundle_id="${NAME_TO_BUNDLE[$app_name]}"
  ws=""

  # Try app-id match
  if [[ -n "$bundle_id" ]]; then
    for i in {1..${#APP_IDS[@]}}; do
      if [[ "$bundle_id" == "${APP_IDS[$i]}" ]]; then
        ws="${APP_ID_WORKSPACES[$i]}"
        break
      fi
    done
  fi

  # Fall back to regex match on app name
  if [[ -z "$ws" ]]; then
    for i in {1..${#APP_REGEXES[@]}}; do
      if [[ "$app_name" =~ "${APP_REGEXES[$i]}" ]]; then
        ws="${APP_REGEX_WORKSPACES[$i]}"
        break
      fi
    done
  fi

  if [[ -n "$ws" ]]; then
    if aerospace move-node-to-workspace --fail-if-noop --window-id "$id" "$ws" 2>/dev/null; then
      log "Moved $app_name (window $id) -> workspace $ws"
    fi
  fi
done

log "Done"
