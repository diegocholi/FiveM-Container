#!/bin/bash
# Define o URL de download

# Baixa e extrai o arquivo fx.tar.xz
curl -L $ARTIFACT | tar -xJ

# Verifica se o comando foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "Download e extração bem-sucedidos."

    iptables -A INPUT -p tcp --dport 30120 -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 30120 -j ACCEPT

    iptables -A INPUT -p udp --dport 30120 -j ACCEPT
    iptables -A OUTPUT -p udp --sport 30120 -j ACCEPT

    chmod +x run.sh
    # Executa a aplicação 
    ./run.sh
     # Verifica se o script 'setup.sh' foi executado com sucesso
    if [ $? -eq 0 ]; then
        echo "Script 'setup.sh' executado com sucesso."
    else
        echo "Falha na execução do script 'setup.sh'."
    fi
else
    echo "Falha no download ou na extração."
fi
