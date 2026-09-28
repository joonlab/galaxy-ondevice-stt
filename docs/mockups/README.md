# 목업 소스

`docs/images/*.png` 는 실제 화면 캡처가 아니라 이 폴더의 HTML 목업을 렌더한 것입니다(데이터는 전부 가상).
HTML 은 공용 목업 킷을 `https://mockup-kit.invalid/` 라는 가짜 주소로 불러옵니다. 렌더러가 이 주소를 킷 폴더로 바꿔 줍니다.

```bash
git clone https://github.com/joonlab/android-mac-lab
node android-mac-lab/mockup-kit/shot.mjs --batch docs/mockups   # → docs/images/
```

킷 사용법: https://github.com/joonlab/android-mac-lab/tree/main/mockup-kit

`scenes/` 는 README 「실제로 이렇게 씁니다」의 책상 사진에 합성한 화면입니다. 파일마다 배경 사진의 화면 영역 비율(맥 1.60, 폴드8 펼침 가로 1.35, 커버 0.63 등)에 맞춰 캔버스 크기를 정했습니다.
