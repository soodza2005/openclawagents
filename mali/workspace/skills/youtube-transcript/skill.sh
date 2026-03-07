#!/bin/bash
# YouTube Transcript Skill for OpenClaw
# Called when user asks for transcript

set -e

# Get YouTube URL from argument
YOUTUBE_URL="$1"

if [ -z "$YOUTUBE_URL" ]; then
    echo "❌ กรุณาใส่ YouTube URL ค่ะ"
    echo "Usage: @transcript <youtube_url>"
    echo "Example: @transcript https://www.youtube.com/watch?v=WqWMszBB9t0"
    exit 1
fi

echo "📥 กำลังดึง transcript จาก: $YOUTUBE_URL"

# Check if yt-dlp is installed
if ! command -v yt-dlp &> /dev/null; then
    echo "📦 กำลังติดตั้ง yt-dlp..."
    pip3 install yt-dlp --break-system-packages -q
fi

# Download subtitles
OUTPUT_FILE="/tmp/yt-transcript-$(date +%s)"
yt-dlp --write-subs --write-auto-subs --skip-download \
    "$YOUTUBE_URL" \
    -o "$OUTPUT_FILE" \
    --sub-lang en \
    --convert-subs=vtt 2>&1

# Find the downloaded file
SUBTITLE_FILE=$(find /tmp -name "*.vtt" -newer /tmp -type f 2>/dev/null | tail -1)

if [ -n "$SUBTITLE_FILE" ] && [ -f "$SUBTITLE_FILE" ]; then
    echo "✅ ดึง transcript สำเร็จค่ะ!"
    echo ""
    echo "📄 Transcript:"
    echo "---"
    cat "$SUBTITLE_FILE"
    echo "---"
    echo ""
    echo "💾 ไฟล์: $SUBTITLE_FILE"
else
    echo "❌ ไม่สามารถดึง transcript ได้ค่ะ"
    exit 1
fi
