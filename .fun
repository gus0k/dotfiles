# vi ft=zsh
nd () {

today=`date '+%Y_%m_%d'`;
filename="$JOURNAL/entries/$today.md"
cd $JOURNAL/entries
vim "$today.md"
}

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
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


jekyll (){
	export JEKYLL_VERSION=3.8
	docker run --rm \
	  --volume="$PWD:/srv/jekyll" \
	  -p 4000:4000 \
	  -it jekyll/builder:$JEKYLL_VERSION \
	  jekyll "$*"
}
