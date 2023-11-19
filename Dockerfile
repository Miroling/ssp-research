FROM ubuntu

ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y webp python3 pip ca-certificates curl gnupg git \
    && mkdir -p /etc/apt/keyrings && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main' | tee /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install nodejs -y \
    && git config --global user.name 'Taras Omelianenko' \
    && git config --global user.email 'inbox@taras.pro' \
    && rm -rf /var/lib/apt/lists/*