nd () {

today=`date '+%Y_%m_%d'`;
filename="$JOURNAL/entries/$today.md"
cd $JOURNAL/entries
vim "$today.md"
}

decomp () {

if [ -f $1 ] ; then
  case $1 in
    *.tar.bz2)  tar xjf $1   ;;
    *.tar.gz)   tar xzf $1   ;;
    *.tar.xz)   tar zxvf $1  ;;
    *.bz2)      bunzip2 $1   ;;
    *.rar)      rar x $1     ;;
    *.gz)       gunzip $1    ;;
    *.tar)      tar xf $1    ;;
    *.tbz2)     tar xjf $1   ;;
    *.tgz)      tar xzf $1   ;;
    *.xz)       xz -d $1     ;;
    *.zip)      unzip $1     ;;
    *.Z)        uncompress $1;;
    *)          echo "contents of '$1' cannot be extracted" ;;
  esac
else
  echo "'$1' is not recognized as a compressed file"
fi

}

gitstatus () {

while read in;
do
	git -C "$in" status | (
	    unset dirty deleted untracked newfile ahead renamed
	    while read line ; do
		case "$line" in
		  *modified:*)                      dirty='!' ; ;;
		  *deleted:*)                       deleted='x' ; ;;
		  *'Untracked files:')              untracked='?' ; ;;
		  *'new file:'*)                    newfile='+' ; ;;
		  *'Your branch is ahead of '*)     ahead='*' ; ;;
		  *renamed:*)                       renamed='>' ; ;;
		esac
	    done
	    bits="$dirty$deleted$untracked$newfile$ahead$renamed"
	    [ -n "$bits" ] && echo "$in: $bits" || echo "$in: "
	);
done < $GITPROJECTS
}
