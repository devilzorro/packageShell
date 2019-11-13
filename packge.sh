#!/bin/bash

FILENAME='type.csv'
CHECKFILE='check.properties'
#MACHINETYPE=''
#osmaintype=''
#ostype=''
#stringData='abcd/efg'
#echo $stringData | sed 's/\///g'

readFile()
{
    cat $FILENAME | while read LINE
    do
#        echo $LINE
#        MACHINETYPE=`echo $LINE |awk -F, '{print $1}'`
#        osmaintype=`echo $LINE |awk -F, '{print $2}'`
#        ostype=`echo $LINE |awk -F, '{print $3}'`
#        echo $MACHINETYPE
#        echo "machinetype=$MACHINETYPE" >> $CHECKFILE
#        echo "osMainType=$osmaintype" >> $CHECKFILE
#        echo "osType=$ostype" >> $CHECKFILE
        for i in 1 2
        do
            for j in 1 2
            do
                MACHINETYPE=`echo $LINE |awk -F, '{print $1}'`
                osmaintype=`echo $LINE |awk -F, '{print $2}'`
                ostype=`echo $LINE |awk -F, '{print $3}'`
#                echo $MACHINETYPE
                echo "machinetype=$MACHINETYPE" >> $CHECKFILE
                echo "osMainType=$osmaintype" >> $CHECKFILE
                echo "osType=$ostype" >> $CHECKFILE
                echo "channel=$i" >> $CHECKFILE
                echo "axisNum=$j" >> $CHECKFILE
                reMachineType=`echo $MACHINETYPE | sed 's/ //g'`
                reOsMainType=`echo $osmaintype | sed 's/ //g' | sed 's/\///g'`
                reOsType=`echo $ostype | sed 's/ //g'`
                mv $CHECKFILE bin/
                cd bin
                pkgName=toolMonitor_${reMachineType}_${reOsMainType}_${reOsType}_${i}_${j}.tgz
                tar -zcvf ../pkg/$pkgName *
                cd ..
            done
        done
    done

}
readFile





