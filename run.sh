rm -f parser/* tm/* generator/*
mkdir -p parser
mkdir -p tm
mkdir -p generator
mkdir -p logs
mkdir -p outputs

rm -f log.tmp

LOG=$(echo $1 | sed "s/\//-/g" | sed "s/-$//g" | sed "s/-$//g")
if ! test -e logs/$LOG
then     
    touch logs/$LOG
fi

./ln_dat.sh

python scripts/make_pairs.py > pairs
python scripts/cleanup.py

./mmt.sh $@

python scripts/make_tbl_empty.py | python scripts/create_tbl.py > pdf/tbl_empty.tex
python scripts/make_tbl_parse-success.py | python scripts/create_tbl.py > pdf/tbl_parse-success.tex
python scripts/make_fig_parse-success.py | python scripts/create_fig.py > pdf/fig_parse-success.tex
python scripts/make_tbl_items-with-end-to-end-success.py | python scripts/create_tbl.py > pdf/tbl_items-with-end-to-end-success.tex
python scripts/make_fig.py | python scripts/create_fig.py > pdf/fig_items-with-end-to-end-success.tex
python scripts/make_tbl_items-with-exact-match-output.py $1 | python scripts/create_tbl.py > pdf/tbl_items-with-exact-match-output.tex
python scripts/make_fig.py | python scripts/create_fig.py > pdf/fig_items-with-exact-match-output.tex
python scripts/make_tbl_total-number-of-output.py | python scripts/create_tbl.py > pdf/tbl_total-number-of-output.tex
python scripts/make_fig.py | python scripts/create_fig.py > pdf/fig_total-number-of-output.tex
python scripts/make_tbl_avg-number-of-output.py $1 | python scripts/create_tbl.py > pdf/tbl_avg-number-of-output.tex
python scripts/make_fig.py | python scripts/create_fig.py > pdf/fig_avg-number-of-output.tex
python scripts/make_tbl_max-number-of-output.py $1 | python scripts/create_tbl.py > pdf/tbl_max-number-of-output.tex
python scripts/make_fig.py | python scripts/create_fig.py > pdf/fig_max-number-of-output.tex

cd pdf
./create_pdf.sh tbl_empty
./create_pdf.sh tbl_parse-success
./create_pdf.sh fig_parse-success
./create_pdf.sh tbl_items-with-end-to-end-success
./create_pdf.sh fig_items-with-end-to-end-success
./create_pdf.sh tbl_items-with-exact-match-output
./create_pdf.sh fig_items-with-exact-match-output
./create_pdf.sh tbl_total-number-of-output
./create_pdf.sh fig_total-number-of-output
./create_pdf.sh tbl_avg-number-of-output
./create_pdf.sh fig_avg-number-of-output
./create_pdf.sh tbl_max-number-of-output
./create_pdf.sh fig_max-number-of-output
cd ..

date=$(date "+%Y-%m-%d")
pdflatex report.tex
mv report.pdf report.${date}.pdf
rm -f report.log
rm -f report.aux
rm -f pairs

evince report.${date}.pdf &

echo -n "Do you want to store this result [Y/n]: "
read ANSWER
if [ "$ANSWER" = "y" ] || [ "$ANSWER" = "Y" ]
then
    echo "=== ${date} ===" >> logs/$LOG
    cat log.tmp >> logs/$LOG
    echo "" >> logs/$LOG
fi


rm -f log.tmp
rm -f temp.tmp

