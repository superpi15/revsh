REVLIB=/Users/nhspc/bdd2014/
PROG=/Users/nhspc/cirkit/build/programs/revkit
LOG=/Users/nhspc/revlib_exp/log_jsc_dbs
ls $PROG
TO=3000

for file in $( ls ${REVLIB}*.pla )
do
	file=`basename $file`
	echo $file
	echo "read_pla ${REVLIB}/${file}" > command.cmd
	echo "embed -b" >> command.cmd
	#echo "write_pla -b --full --filename ${DEST}${file}" >> command.cmd
	echo "dbs -s --esop_minimizer 1" >> command.cmd
	echo "ps -c" >> command.cmd
	echo "quit" >> command.cmd
	time gtimeout ${TO} ${PROG} -f command.cmd > ${LOG}/${file}.log
done
