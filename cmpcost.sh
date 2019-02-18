REVLIB=/Users/nhspc/exchange/real_revlib_gbdl_q
PROG=/Users/nhspc/cirkit/build/programs/revkit
LOG=/Users/nhspc/revlib_exp/log_revlib_gbdl_q_cost
ls $PROG
TO=3000

for file in $( ls ${REVLIB}/*.real )
do
	file=`basename $file`
	echo $file
	echo "read_real ${REVLIB}/${file}" > command.cmd
	echo "ps -c" >> command.cmd
	echo "quit" >> command.cmd
	time gtimeout ${TO} ${PROG} -f command.cmd > ${LOG}/${file}.log
done
