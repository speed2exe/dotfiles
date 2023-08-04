FROM rust

# Credentials
COPY .gitconfig /root/.gitconfig
COPY .ssh /root/.ssh

# Install tools
COPY inner_install.sh inner_install.sh
RUN ./inner_install.sh

CMD ["/bin/bash", "-c", "tail -f /dev/null"]
