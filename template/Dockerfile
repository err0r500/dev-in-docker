FROM fedora:30

# set user's home
ARG USER_NAME
ARG USER_ID
RUN useradd -m ${USER_NAME} -u ${USER_ID}
WORKDIR /home/${USER_NAME}

# system setup + emacs (add your common dev tools here)
RUN dnf update -y
RUN dnf install git curl wget tmux make emacs ripgrep adobe-source-code-pro-fonts -y

# language-specific setup
{{ .dockerfile_languageDeps }}

# start a dummy process to keep the container alive
USER ${USER_NAME}
ENV HOME /home/${USER_NAME}
CMD sleep 9999999999999