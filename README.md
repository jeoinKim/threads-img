# threads-img

`@3line.goods` 스레드 게시물에 붙일 이미지를 둔다.

Threads API 는 파일 업로드를 받지 않는다 — 공개 URL 만 받고 Meta 가 그 주소로
직접 가져간다. 그래서 이미지를 어딘가 공개된 곳에 먼저 올려야 하는데, 서버에는
웹서버도 공인 포트도 없어서 GitHub raw 를 쓴다.

블로그 레포(ppbbi-blog)에 같이 두지 않는 이유는 그쪽이 Vercel 에 물려 있어서다.
하루 5장을 커밋하면 배포가 하루 5번 돈다.

  https://raw.githubusercontent.com/jeoinKim/threads-img/main/img/<파일명>

`threads_post.py --publish` 가 알아서 올리고 지운다. 손댈 일은 없다.
오래된 이미지는 `prune_images.sh` 가 60일 지난 것부터 정리한다 — 발행된 글이
아직 그 URL 을 참조하므로 바로 지우면 스레드에서 이미지가 깨진다.
