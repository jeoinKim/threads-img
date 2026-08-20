#!/bin/bash
# 60일 지난 이미지를 지운다.
#
# 바로 못 지우는 이유: 발행된 스레드 글이 이 raw URL 을 계속 참조한다.
# 지우면 그 글의 사진이 깨진다. 60일이면 노출이 끝난 글이라고 본다.
set -euo pipefail
cd "$(dirname "$0")"
find img -name '*.jpg' -mtime +60 -print -delete | head -50
if ! git diff --quiet; then
  git add -A
  git commit -q -m "60일 지난 이미지 정리"
  git push -q origin main
  echo "정리 완료"
else
  echo "지울 것 없음"
fi
