FROM mcr.microsoft.com/vscode/devcontainers/base:dev-bullseye

ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y webp python3 pip ca-certificates curl gnupg git \
    && mkdir -p /etc/apt/keyrings && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main' | tee /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install nodejs -y \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g mystmd http-server nodemon

ADD requirements.txt requirements.txt

RUN python3 -m pip install -r requirements.txt