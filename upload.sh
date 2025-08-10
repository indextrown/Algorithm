#!/bin/bash

# 색상 정의
GREEN="\033[0;32m"
NC="\033[0m" # No Color

# 접두사 입력받기
read -p "접두사(예: Programmers, Baekjoon, Fix, Feat): " prefix

# 커밋 메시지 입력받기 (빈 값 방지)
while [ -z "$msg" ]; do
    read -p "커밋 메시지를 입력하세요: " msg
done

# 현재 브랜치 이름 가져오기
branch=$(git branch --show-current)

# 커밋 및 푸시 실행
git add .
git commit -m "[$prefix] $msg"
git push origin "$branch"

echo -e "${GREEN}✅ 커밋 & 푸시 완료: [$prefix] $msg → $branch${NC}"
