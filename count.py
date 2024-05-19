# Copyright (C) 2024 KevinZonda
# https://github.com/KevinZonda/MLBook/blob/master/count.py

import os
import sys

def count_chars(file_path, zh_only=True):
    count = 0
    with open(file_path, 'r', encoding='utf-8') as file:
        for line in file:
            for char in line:
                if not zh_only:
                    count += 1
                    continue
                
                if '\u4e00' <= char <= '\u9fff':  # 判断是否为中文字符
                    count += 1
    return count

def count_folder(path, zh_only=True, ext='.md'):
    total_count = 0
    for root, _, files in os.walk(path):
        for file in files:
            if not file.endswith(ext):
                continue
            file_path = os.path.join(root, file)
            total_count += count_chars(file_path, zh_only=zh_only)
    return total_count

if __name__ == '__main__':
    zh_only = True
    if len(sys.argv) > 1 and (sys.argv[1] == 'all'):
        zh_only = False
    total = count_folder('.', zh_only=zh_only)
    print(total)