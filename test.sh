LINE_NUM=1
while read LINE
do
       
	echo $LINE_NUM  
	echo $LINE | ace -g /home/sanghoun/resource/grammar/jacy/jacy.dat -n 5 --max-chart-megabytes=256 --max-unpack-megabytes=256 --timeout=5 2>/dev/null | ace -g ${LOGONROOT}/uio/tm/jaen/jaen.dat -n 5 --max-chart-megabytes=256 --max-unpack-megabytes=256 --timeout=5 2>/dev/null | ace -g /home/sanghoun/workspace/yelc/terg/erg.dat -e -n 5 --max-chart-megabytes=256 --max-unpack-megabytes=256 --timeout=5 2>/dev/null > outputs/$LINE_NUM.out
	LINE_NUM=$(expr $LINE_NUM + 1)    

done < $1
