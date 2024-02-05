# 設定ファイルから変数を読み込む
include config.txt
export

# PDF生成
pdf:
	mkdir -p pdf
	platex sample.tex
	dvipdfmx sample.dvi
	mv sample.pdf pdf/
	pdfjam --outfile pdf/sample_temp.pdf pdf/sample.pdf 2-
	pdfjam --outfile pdf/西村昭治_$(STUDENT_ID)_$(NAME)_卒研.pdf pdf/表紙テンプレート.pdf pdf/sample_temp.pdf
	rm pdf/sample.pdf pdf/sample_temp.pdf

# 文字数カウント
count:
	bash utils/wordcount_all_pdf.sh

.PHONY: pdf count
