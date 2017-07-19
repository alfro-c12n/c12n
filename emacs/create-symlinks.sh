# Remove existing emacs files (asking for it)
rm -ri ~/.emacs
rm -ri ~/.emacs.d
rm -ri ~/.spacemacs

# Enable emacs/spacemacs: (Still didn't figure how to have both simultaneously)
read -n1 -p "Install spacemacs?" doit
case $doit in
    y|Y)
        ln -s ~/.c12n/emacs/.spacemacs ~/.spacemacs
        ln -s ~/.c12n/emacs/.spacemacs.d ~/.emacs.d
        ;;
    *)
        printf "\nSpacemacs not installed\n"
        read -n1 -p "Install emacs?" doit
        case $doit in
            y|Y)
                ln -s ~/.c12n/emacs/.emacs ~/.emacs
                ln -s ~/.c12n/emacs/.emacs ~/.emacs.d
                ;;
            *)
                printf "\nEmacs not installed.\n NOTHING installed!!"
                ;;
        esac
        ;;
esac
printf "\n";


