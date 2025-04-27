# fix_typora_link_real.py
import sys
import os
import re
from urllib.parse import unquote

def fix_links(file_path):
    if not os.path.isfile(file_path):
        print("❗ 파일을 찾을 수 없습니다:", file_path)
        return

    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()

    # 정규식으로 URL만 찾아서 디코딩
    # (전체 텍스트를 디코딩하면 안 돼, 링크만 디코딩해야 돼)
    def decode_url(match):
        url = match.group(0)
        return unquote(url)

    # Markdown 링크 형태에서 URL만 찾아서 디코딩
    fixed_content = re.sub(r'https?://[^\s\)\]]+', decode_url, content)

    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(fixed_content)

    print(f"✅ 링크 수정 완료: {file_path}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("사용법: python fix_typora_link_real.py [수정할 .md 파일 경로]")
    else:
        file_path = sys.argv[1]
        fix_links(file_path)
