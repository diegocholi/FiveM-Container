FROM ubuntu:20.04

WORKDIR /home/gta/server

COPY . .

# Instalando as ferramentas necessárias para baixar e extrair o arquivo
RUN apt-get update && \
    apt-get install -y curl xz-utils && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 40120
EXPOSE 30120

CMD ["sh", "-c", "chmod +x ./fabric-server.sh && ./fabric-server.sh"]
