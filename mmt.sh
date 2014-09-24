rm -rf outputs/*

while read LINE
do           
	echo "Parsing: " $LINE
	LINE_NUM=0
	while read SENTENCE
	do	
		LINE_NUM=$(expr $LINE_NUM + 1)
		echo $SENTENCE | ace -g parser/$LINE.dat 2>/dev/null > outputs/$LINE.$LINE_NUM.out
	done < $1/$LINE.txt

done < languages 

while read LINE
do           
	echo "Translating: " $LINE
	SOURCE=$(echo $LINE | cut -d2 -f1)
	TARGET=$(echo $LINE | cut -d2 -f2)
	LINE_NUM=0
	
	while read SENTENCE
	do	
		LINE_NUM=$(expr $LINE_NUM + 1)
		if test -e tm/$LINE.dat
		then 
		    echo $SENTENCE | ace -g parser/$SOURCE.dat 2>/dev/null | ace -g tm/$LINE.dat 2>/dev/null | ace -g generator/$TARGET.dat -e 2>/dev/null > outputs/$LINE.$LINE_NUM.out
		else
		    echo $SENTENCE | ace -g parser/$SOURCE.dat 2>/dev/null | ace -g generator/$TARGET.dat -e 2>/dev/null > outputs/$LINE.$LINE_NUM.out		    
		fi

	done < $1/$SOURCE.txt
	
done < pairs 
