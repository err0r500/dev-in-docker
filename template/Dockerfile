FROM fedora:30

# set user's home
ARG USER
ARG USER_ID
RUN useradd -m ${USER} -u ${USER_ID}
WORKDIR /home/${USER}

# system setup + emacs (add your common dev tools here)
RUN dnf update -y
RUN dnf install git curl wget tmux emacs ripgrep adobe-source-code-pro-fonts -y

# language-specific setup
{{ .dockerfile_languageDeps }}

# start a dummy process to keep the container alive
USER ${USER}
ENV HOME /home/${USER}
CMD sleep 9999999999999