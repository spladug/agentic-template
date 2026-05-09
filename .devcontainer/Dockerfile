FROM mcr.microsoft.com/devcontainers/base:debian

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /src

# Claude code repo
COPY ./claude-code.asc /etc/apt/keyrings/claude-code.asc
COPY ./claude-code.list /etc/apt/sources.list.d/claude-code.list

# Base tools
RUN <<EOF
apt-get update
apt-get install -y --no-install-recommends \
    awscli \
    bat \
    claude-code \
    curl \
    eza \
    fzf \
    gh \
    git \
    git-delta \
    gpg \
    jq \
    less \
    make \
    man-db \
    ripgrep \
    shellcheck \
    sudo \
    unzip \
    vim \
    wget \
    yamllint \
    yq \
    zsh \
    ;
apt-get clean
rm -rf /var/lib/apt/lists/*

chsh -s /bin/zsh vscode

# Persist ~/.claude.json across rebuilds by redirecting it into the claude-home
# volume (which is mounted at /home/vscode/.claude in devcontainer.json).
ln -s /home/vscode/.claude/.claude.json /home/vscode/.claude.json
EOF

USER vscode

ENV DEVCONTAINER=true
ENV EDITOR=vim VISUAL=vim
