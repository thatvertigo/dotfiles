#!/bin/bash

# Script to control keyboard backlight with swayosd OSD display
# Usage: kbd-backlight-osd.sh [raise|lower]
# gist.github.com/jondkinney/995a297244c4660b19535ddc841c126b

DEVICE="kbd_backlight"
STEP=10  # Percentage step

# Get current monitor for OSD display
MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')

# Get max brightness value
MAX=$(brightnessctl --device="$DEVICE" max)

# Calculate step size in raw value (10% of max)
RAW_STEP=$((MAX * STEP / 100))

# Get current brightness before adjustment
CURRENT=$(brightnessctl --device="$DEVICE" get)

# Special handling for going to 0%
if [ "$1" = "lower" ] && [ $CURRENT -le $RAW_STEP ]; then
    # Set to 0 first
    brightnessctl --device="$DEVICE" set 0 > /dev/null
    # Use swayosd with minimal progress value
    swayosd-client \
        --monitor "$MONITOR" \
        --custom-icon "keyboard-brightness-symbolic" \
        --custom-progress "0.00000000000000000000000001" \
        --custom-progress-text "0%"
    exit 0
fi

# Calculate new value and display percentage based on action
case "$1" in
    raise)
        # Calculate new value and ensure it's aligned to 10% increments
        NEW=$((CURRENT + RAW_STEP))
        # If we're close to max (within one step), go to max
        if [ $NEW -ge $((MAX - RAW_STEP)) ]; then
            NEW=$MAX
        else
            # Otherwise round to nearest 10% increment
            NEW=$((((NEW + RAW_STEP/2) / RAW_STEP) * RAW_STEP))
        fi
        ;;
    lower)
        # Calculate new value and ensure it's aligned to 10% increments
        NEW=$((CURRENT - RAW_STEP))
        # Round to nearest 10% increment
        NEW=$((((NEW + RAW_STEP/2) / RAW_STEP) * RAW_STEP))
        # Don't go below 0
        if [ $NEW -lt 0 ]; then NEW=0; fi
        ;;
    *)
        echo "Usage: $0 [raise|lower]"
        exit 1
        ;;
esac

# Set the new brightness
brightnessctl --device="$DEVICE" set "$NEW" > /dev/null

# Calculate percentage to display
PERCENTAGE=$(((NEW * 100 / MAX + 5) / 10 * 10))

# Calculate progress value for swayosd (0.0 to 1.0)
PROGRESS=$(awk "BEGIN {printf \"%.2f\", $NEW / $MAX}")

# Display OSD using swayosd
swayosd-client \
    --monitor "$MONITOR" \
    --custom-icon "keyboard-brightness-symbolic" \
    --custom-progress "$PROGRESS" \
    --custom-progress-text "${PERCENTAGE}%"
