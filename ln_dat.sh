source config.sh

rm -rf parser/*
rm -rf generator/*
rm -rf tm/*

ln -s $ENG_PAR parser/eng.dat
ln -s $JPN_PAR parser/jpn.dat
ln -s $HANS_PAR parser/hans.dat
ln -s $IND_PAR parser/ind.dat

ln -s $ENG_GEN generator/eng.dat
ln -s $JPN_GEN generator/jpn.dat
ln -s $HANS_GEN generator/hans.dat
ln -s $IND_GEN generator/ind.dat

if [ "$ENG2ENG" != "" ]; then
    ln -s $ENG2ENG tm/eng2eng.dat
fi

if [ "$ENG2JPN" != "" ]; then
    ln -s $ENG2JPN tm/eng2jpn.dat
fi

if [ "$ENG2HANS" != "" ]; then
    ln -s $ENG2HANS tm/eng2hans.dat
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

if [ "$JPN2HANS" != "" ]; then
    ln -s $JPN2HANS tm/jpn2hans.dat
fi

if [ "$JPN2IND" != "" ]; then
    ln -s $JPN2IND tm/jpn2ind.dat
fi


if [ "$HANS2ENG" != "" ]; then
    ln -s $HANS2ENG tm/hans2eng.dat
fi

if [ "$HANS2JPN" != "" ]; then
    ln -s $HANS2JPN tm/hans2jpn.dat
fi

if [ "$HANS2HANS" != "" ]; then
    ln -s $HANS2HANS tm/hans2hans.dat
fi

if [ "$HANS2IND" != "" ]; then
    ln -s $HANS2IND tm/hans2ind.dat
fi


if [ "$IND2ENG" != "" ]; then
    ln -s $IND2ENG tm/ind2eng.dat
fi

if [ "$INDJPN" != "" ]; then
    ln -s $IND2JPN tm/ind2jpn.dat
fi

if [ "$IND2HANS" != "" ]; then
    ln -s $IND2HANS tm/ind2hans.dat
fi

if [ "$IND2IND" != "" ]; then
    ln -s $IND2IND tm/ind2ind.dat
fi


