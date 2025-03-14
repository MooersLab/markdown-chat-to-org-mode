m2o () {
	echo "Convert chat in markdown into org-mode. Uses pandoc."
	echo "Takes only the filestem of the markdown file."
	if [ $# -lt 1 ]
	then
		echo "$0: not enough arguments" >&1
		echo "Supply the mp3 file stem."
		echo "Usage: m2o fileStem"
		return 2
	elif [ $# -gt 1 ]
	then
		echo "$0: too many arguments" >&1
		echo "Supply the mp3 file stem."
		echo "Usage: m2o fileStem"
	fi
	pandoc -f markdown -t org $1.md -o $1.org
	(
		echo "#+Title: $1."
		echo "#+Date: $(date +%Y-%m-%d)"
		echo "#+Author: Claude 3.5 Sonnet"
		echo "\n"
		cat $1.org
	) > temp
	mv temp $1.org
}
