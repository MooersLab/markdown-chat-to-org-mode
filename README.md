# markdown-chat-to-org-mode

Most of the chatbots generate chats in markdown.
If you want to save these chats and store them as org-mode files that you may include in a knowledge graph under the subfolder called *projects*, *protocols*, *resources*, or *code*, you have to carry out the conversion of the org file format.
The program pandoc does a good job of this.
I developed a bash function that runs pandoc and adds the front matter to the file, which pandoc skips doing.

I developed this bash function because I have trouble remembering the syntax for the pandoc command.
I do not like wasting time looking it up for the 100th time.
Other solutions out there enable this operation to be done from inside of Emacs.
However, if you run a chatbot outside of Emacs, you will probably handle the downloaded file outside of Emacs.
Because you are already outside of the Emacs, you could use a little Bash.

This bash function takes the single argument of the markdown file's filestem.
To incorporate this into the org-roam database, you must run the command org-id-get-create to add a unique identifier to this file.
