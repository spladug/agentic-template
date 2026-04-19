FROM mcr.microsoft.com/devcontainers/base:debian

ARG TZ
ENV TZ="$TZ"

# Install firewall tools
RUN apt-get update && apt-get install -y --no-install-recommends \
  fzf \
  iptables \
  ipset \
  iproute2 \
  dnsutils \
  aggregate \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true

# Copy and set up firewall script
COPY init-firewall.sh /usr/local/bin/
USER root
RUN chmod +x /usr/local/bin/init-firewall.sh && \
  echo "vscode ALL=(root) NOPASSWD: /usr/local/bin/init-firewall.sh" > /etc/sudoers.d/vscode && \
  chmod 0440 /etc/sudoers.d/vscode
USER vscode
