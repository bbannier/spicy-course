FROM rust

RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
RUN cargo binstall -y mdbook mdbook-cmdrun mdbook-admonish mdbook-linkcheck

# # hadolint ignore=DL3008,DL3015
# RUN apt-get update \
#  && apt-get install -y \
#       plantuml \
#       python3-mistletoe \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*
