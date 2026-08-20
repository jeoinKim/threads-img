#!/bin/bash
# 60일 지난 이미지를 지운다.
#
# Meta 는 발행 시점에 이미지를 자기 CDN(cdninstagram.com)으로 복사해 간다.
# 발행된 글의 media_url 을 조회해 보면 우리 raw URL 이 아니라 Meta 주소다.
# 그래서 발행만 끝나면 이 사본은 필요 없다. 그래도 7일은 남긴다 —
# 발행에 실패해 재시도하는 경우와, 사람이 나중에 원본을 확인하고 싶은 경우 때문.
set -euo pipefail
cd "$(dirname "$0")"
find img -name '*.jpg' -mtime +7 -print -delete | head -50
if ! git diff --quiet; then
  git add -A
  git commit -q -m "60일 지난 이미지 정리"
  git push -q origin main
  echo "정리 완료"
else
  echo "지울 것 없음"
fi
