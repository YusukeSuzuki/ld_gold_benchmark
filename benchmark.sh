rm -f log.txt

echo 'GNU ld' >> log.txt

for i in {1..5}; do
    rm -f goldtest
    /usr/bin/time -o log.txt -a -f "%e %s" make > /dev/null
    mv goldtest ld.goldtest
done

echo 'ld.gold' >> log.txt
for i in {1..5}; do
    rm -f goldtest
    /usr/bin/time -o log.txt -a -f "%e %s" make GOLD=-fuse-ld=gold > /dev/null
    mv goldtest gold.goldtest
done

