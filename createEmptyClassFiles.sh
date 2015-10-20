#!/bin/sh
header=$1".hh"
file=$1".cc"
if [ $1 ]
    then
        if [ -e $header ]
            then
                rm $header
        fi
        touch $header
        cat joel_861238902.txt >> $header
        if [ -e $file ]
            then
                rm $file
        fi
        cp $header $file
        #build header file
        echo >> $header
        echo "#ifndef "$1"_hh" >> $header
        echo "#define "$1"_hh" >> $header
        echo >> $header
        echo "class "$1 >> $header
        echo "{" >> $header
        echo "    public:" >> $header
        echo "    "$1"();" >> $header
        echo "    ~"$1"();" >> $header
        echo >> $header
        echo "    private:" >> $header
        echo "};" >> $header
        echo "#endif" >> $header

        #build class file
        echo >> $file
        echo "#include \"./"$header"\"" >> $file
        echo >> $file
        echo $1"::"$1"()" >> $file
        echo "{}" >> $file
        echo >> $file
        echo $1"::~"$1"()" >> $file
        echo "{}" >> $file
fi
