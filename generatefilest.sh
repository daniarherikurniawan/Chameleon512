echo ================================================
echo                MY START SCRIPT
echo ================================================
echo Starting the script!

echo What is the size? "(1024 for 1KB)"
read size

echo How many files? "(10000 for 10k files)"
read numThreads


cd gutenberg/

counter=1
while [ $counter -le $numThreads ]
do
	(dd if=/dev/zero of=file$counter bs=$size count=1 ) &
	((counter++))
done

wait
echo Generate $numThreads files is done