#!/bin/bash

# 設定ファイルから変数を読み込む
source ./config.txt

# 対象のPDFファイル名
PDF_FILE="./pdf/西村昭治_${STUDENT_ID}_${NAME}_卒研.pdf"
PDF_NAME="西村昭治_${STUDENT_ID}_${NAME}_卒研.pdf"

# count ディレクトリを作成（存在しない場合）
mkdir -p count

# PDFファイルをテキストに変換
pdftotext "${PDF_FILE}" "count/temp.txt"

# テキストファイルの文字数をカウントし、結果を変数に格納
WORD_COUNT=$(wc -m "count/temp.txt" | awk '{print $1}')

# カスタマイズしたメッセージを表示
echo "${WORD_COUNT} ${PDF_NAME}"

# 一時ファイルを削除
rm -f "count/temp.txt"
# count ディレクトリを削除
rm -r count
