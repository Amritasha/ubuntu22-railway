FROM ubuntu:22.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl git python3 python3-pip neofetch \
        net-tools iproute2 iputils-ping dnsutils \
        vim nano htop tree unzip zip \
        build-essential gcc g++ make \
        openssh-client telnet netcat \
        jq less man-db sudo lsof strace && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

RUN echo "neofetch" >> /root/.bashrc && \
    echo "cd /root" >> /root/.bashrc

EXPOSE 7681

# Optional: Claude Code, installed on first boot when INSTALL_CLAUDE_CODE=true.
# Kept out of the image so this stays a small terminal for everyone who does not
# want it. See the script for why the install happens at boot and not here.
COPY install-claude-code.sh /usr/local/bin/install-claude-code.sh
RUN chmod +x /usr/local/bin/install-claude-code.sh

# /root is a mounted volume, so anything baked into it at build time is hidden
# once the volume mounts. Seed the shell config on first boot instead, and only
# once -- this used to append on every restart, growing .bashrc without bound.
CMD ["/bin/bash", "-c", "\
    /usr/local/bin/install-claude-code.sh; \
    if ! grep -q 'railway-terminal-init' /root/.bashrc 2>/dev/null; then \
      { echo '# railway-terminal-init'; \
        echo 'neofetch'; \
        echo \"export PS1='\\[\\033[01;32m\\]$USERNAME@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '\"; \
      } >> /root/.bashrc; \
    fi && \
    exec /bin/ttyd -p \"$PORT\" -c \"$USERNAME:$PASSWORD\" /bin/bash"]
