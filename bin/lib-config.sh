# lib-config.sh — 설정 파일을 읽는다. phone-stt 가 source 한다.
#
# 설정 파일: ${STT_CONFIG:-$HOME/.config/galaxy-ondevice-stt/config.env}
# 형식: KEY=VALUE 한 줄씩 (# 주석, 빈 줄 허용). 값의 ~ 와 $HOME 은 펼친다.
# 우선순위: 이미 설정된 환경변수 > 설정 파일 > 스크립트 기본값

load_config() {
  local f="${STT_CONFIG:-$HOME/.config/galaxy-ondevice-stt/config.env}"
  [ -f "$f" ] || return 0
  local line key val
  while IFS= read -r line || [ -n "$line" ]; do
    case "$line" in ''|\#*) continue ;; esac
    key="${line%%=*}"; val="${line#*=}"
    key="$(printf '%s' "$key" | tr -d '[:space:]')"
    case "$key" in ''|*[!A-Za-z0-9_]*) continue ;; esac
    # 따옴표 벗기기
    case "$val" in \"*\") val="${val#\"}"; val="${val%\"}" ;; \'*\') val="${val#\'}"; val="${val%\'}" ;; esac
    val="${val/#\~/$HOME}"
    val="${val//\$HOME/$HOME}"
    # 환경변수로 이미 준 값은 덮지 않는다
    if [ -z "${!key+x}" ]; then export "$key=$val"; fi
  done < "$f"
}
