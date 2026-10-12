#!/bin/bash
# 전시용 실행 파일 — 인터넷 없이 이 폴더를 로컬 서버(http://localhost:8000)로 띄웁니다.
# Finder에서 더블클릭하면 서버가 켜지고 Chrome(없으면 기본 브라우저)이 열립니다.
# 끄려면 이 터미널 창에서 Ctrl+C 를 누르거나 창을 닫으세요.
cd "$(dirname "$0")" || exit 1
PORT=8000
URL="http://localhost:$PORT"

( sleep 1.5; open -a "Google Chrome" "$URL" 2>/dev/null || open "$URL" ) &

echo "Portage-map 실행 중: $URL  (종료: Ctrl+C)"
if python3 -c "" 2>/dev/null; then
  python3 -m http.server "$PORT"
else
  ruby -run -e httpd . -p "$PORT"
fi
