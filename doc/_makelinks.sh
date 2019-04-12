
# Enter directory 
# cd xxx

# Generate the shell script
ls -l *h | awk '{printf("ln -sf %s %s\n", $9, $9)}' > _ln.sh
sed -i -e 's/WTF\.h$/\.h/g' _ln.sh
sed -i -e 's/h BC/h /g' _ln.sh
sh _ln.sh
rm -f _ln.sh

# Edit ln.sh
# vim ln.sh
#:%s/WTF\.h/\.h/g
#:%s/h BC/h /g

