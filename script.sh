for i in *.jpg
do
	curl -F "file=@$i" 0x0.st >> name.txt
done

file=$(cat name.txt)

for line in $file
do
	code="${code}  <img src='"$line"' alt=''><br>"
done

number=$(awk '/<img/{ print NR; exit }' august-eights.html)
sed "$number i $code" august-eights.html > new.html


