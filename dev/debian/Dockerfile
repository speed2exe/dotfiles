FROM debian

# Credentials
COPY .gitconfig /root/.gitconfig
COPY .ssh /root/.ssh
COPY .init.fish /root/.init.fish

RUN apt update
RUN apt install -y fish gcc cmake git gh curl exa bat fd-find ripgrep fzf wget fortune btop

# Run setup script
COPY setup.sh setup.sh
RUN ./setup.sh

CMD ["/bin/bash", "-c", "sleep infinity"]
