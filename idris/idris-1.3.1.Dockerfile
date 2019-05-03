FROM fedora:29
RUN dnf update -y 
RUN dnf install idris -y && dnf install emacs -y
RUN dnf install git -y
ENTRYPOINT ["./startEmacs.sh"]
