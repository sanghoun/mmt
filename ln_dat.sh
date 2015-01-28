source config.sh

rm -rf parser/*
rm -rf generator/*
rm -rf tm/*

ln -s $ENG_PAR parser/eng.dat
ln -s $JPN_PAR parser/jpn.dat
ln -s $ZHS_PAR parser/zhs.dat
ln -s $ZHT_PAR parser/zht.dat
ln -s $YUE_PAR parser/yue.dat
ln -s $IND_PAR parser/ind.dat

ln -s $ENG_GEN generator/eng.dat
ln -s $JPN_GEN generator/jpn.dat
ln -s $ZHS_GEN generator/zhs.dat
ln -s $ZHT_GEN generator/zht.dat
ln -s $YUE_GEN generator/yue.dat
ln -s $IND_GEN generator/ind.dat

if [ "$ENG2ENG" != "" ]; then
    ln -s $ENG2ENG tm/eng2eng.dat
fi

if [ "$ENG2JPN" != "" ]; then
    ln -s $ENG2JPN tm/eng2jpn.dat
fi

if [ "$ENG2ZHS" != "" ]; then
    ln -s $ENG2ZHS tm/eng2zhs.dat
fi

if [ "$ENG2ZHT" != "" ]; then
    ln -s $ENG2ZHT tm/eng2zht.dat
fi

if [ "$ENG2IND" != "" ]; then
    ln -s $ENG2IND tm/eng2ind.dat
fi


if [ "$JPN2ENG" != "" ]; then
    ln -s $JPN2ENG tm/jpn2eng.dat
fi

if [ "$JPNJPN" != "" ]; then
    ln -s $JPN2JPN tm/jpn2jpn.dat
fi

if [ "$JPN2ZHS" != "" ]; then
    ln -s $JPN2ZHS tm/jpn2zhs.dat
fi

if [ "$JPN2ZHT" != "" ]; then
    ln -s $JPN2ZHT tm/jpn2zht.dat
fi

if [ "$JPN2IND" != "" ]; then
    ln -s $JPN2IND tm/jpn2ind.dat
fi


if [ "$ZHS2ENG" != "" ]; then
    ln -s $ZHS2ENG tm/zhs2eng.dat
fi

if [ "$ZHS2JPN" != "" ]; then
    ln -s $ZHS2JPN tm/zhs2jpn.dat
fi

if [ "$ZHS2ZHS" != "" ]; then
    ln -s $ZHS2ZHS tm/zhs2zhs.dat
fi

if [ "$ZHS2ZHT" != "" ]; then
    ln -s $ZHS2ZHT tm/zhs2zht.dat
fi

if [ "$ZHS2IND" != "" ]; then
    ln -s $ZHS2IND tm/zhs2ind.dat
fi

if [ "$ZHT2ENG" != "" ]; then
    ln -s $ZHT2ENG tm/zht2eng.dat
fi

if [ "$ZHT2JPN" != "" ]; then
    ln -s $ZHT2JPN tm/zht2jpn.dat
fi

if [ "$ZHT2ZHS" != "" ]; then
    ln -s $ZHT2ZHS tm/zht2zhs.dat
fi

if [ "$ZHT2ZHT" != "" ]; then
    ln -s $ZHT2ZHT tm/zht2zht.dat
fi

if [ "$ZHT2IND" != "" ]; then
    ln -s $ZHT2IND tm/zht2ind.dat
fi

if [ "$IND2ENG" != "" ]; then
    ln -s $IND2ENG tm/ind2eng.dat
fi

if [ "$INDJPN" != "" ]; then
    ln -s $IND2JPN tm/ind2jpn.dat
fi

if [ "$IND2ZHS" != "" ]; then
    ln -s $IND2ZHS tm/ind2zhs.dat
fi

if [ "$IND2ZHT" != "" ]; then
    ln -s $IND2ZHT tm/ind2zht.dat
fi

if [ "$IND2IND" != "" ]; then
    ln -s $IND2IND tm/ind2ind.dat
fi



