![Version](https://img.shields.io/static/v1?label=markdown-chat-to-org-mode&message=0.1&color=brightcolor)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# markdown-chat-to-org-mode

## Problem addressed
Most of the chatbots generate chats in markdown.
If you want to save these chats and store them as org-mode files that you may include in a knowledge graph under the subfolder called *projects*, *protocols*, *resources*, or *code*, you have to carry out the conversion of the org file format.
The program pandoc does a good job of this, but I have trouble remembering the syntax for the pandoc command, and pandoc does not add the frontmatter of the org file.

## My solution
I developed a bash function that runs pandoc and adds the front matter to the file.
Other solutions out there enable this operation to be done from inside of Emacs while running a chatbot inside Emacs (e.g., gptel).
However, if you run a chatbot outside of Emacs, you will probably handle the downloaded file outside of Emacs.
Because you are already outside of the Emacs, you could use a little Bash.

This bash function takes the single argument of the markdown file's filestem.
To incorporate this new note into the org-roam database, you must run the command `M-x org-id-get-create` to add a unique identifier to this file.

```bash
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
```

Save the function where you save your bash aliases or, better yet, a dedicated `~/.bashFunctions` file.
Source this file from your .bashrc or .zshrc file so it is always available.
You can display the code in the terminal from any directory by entering `which m2o`.
I call this a bash function, but I use it in zsh.

This trivial function was generated ab inito.


## Update history

|Version      | Changes                                                                                                                                                                         | Date                 |
|:-----------|:------------------------------------------------------------------------------------------------------------------------------------------|:--------------------|
| Version 0.1 |   Added badges, funding, and update table.  Initial commit.                                                                                                                | 2025 March 14  |

## Sources of funding

- NIH: R01 CA242845
- NIH: R01 AI088011
- NIH: P30 CA225520 (PI: R. Mannel)
- NIH: P20 GM103640 and P30 GM145423 (PI: A. West)
