#!/bin/bash

# Script para copiar configurações locais do Amazon Q para ~/.aws/
# Preserva arquivos existentes em ~/.aws/ que não estão em ./.aws/

set -e

# Detectar se estamos executando de dentro de ./.aws
CURRENT_DIR=$(basename "$(pwd)")
if [ "$CURRENT_DIR" = ".aws" ]; then
    LOCAL_AWS_DIR="."
    echo "🔄 Executando de dentro do diretório .aws"
else
    LOCAL_AWS_DIR="./.aws"
fi

HOME_AWS_DIR="$HOME/.aws"

echo "🔄 Sincronizando configurações do Amazon Q..."
echo "📂 Origem: $LOCAL_AWS_DIR"
echo "📁 Destino: $HOME_AWS_DIR"

# Verificar se ~/.aws existe, sempre falhar se não existir
if [ ! -d "$HOME_AWS_DIR" ]; then
    echo "❌ Erro: Diretório $HOME_AWS_DIR não existe"
    echo "💡 Execute 'aws configure' primeiro para criar a estrutura básica"
    exit 1
fi

# Função para copiar recursivamente preservando estrutura
copy_recursive() {
    local src="$1"
    local dest="$2"
    
    # Percorrer todos os arquivos e diretórios na origem
    find "$src" -type f -o -type d | while read -r item; do
        # Calcular caminho relativo
        relative_path="${item#$src/}"
        
        # Pular o diretório raiz
        if [ "$item" = "$src" ]; then
            continue
        fi
        
        dest_path="$dest/$relative_path"
        
        if [ -d "$item" ]; then
            # Criar diretório se não existir
            if [ ! -d "$dest_path" ]; then
                echo "📁 Criando diretório: $dest_path"
                mkdir -p "$dest_path"
            fi
        else
            # Copiar arquivo
            dest_dir=$(dirname "$dest_path")
            if [ ! -d "$dest_dir" ]; then
                mkdir -p "$dest_dir"
            fi
            
            if [ -f "$dest_path" ]; then
                echo "🔄 Atualizando: $dest_path"
            else
                echo "📄 Copiando: $dest_path"
            fi
            
            cp "$item" "$dest_path"
        fi
    done
}

# Verificar se diretório local existe
if [ ! -d "$LOCAL_AWS_DIR" ]; then
    echo "❌ Erro: Diretório $LOCAL_AWS_DIR não encontrado"
    exit 1
fi

# Executar cópia
copy_recursive "$LOCAL_AWS_DIR" "$HOME_AWS_DIR"

echo "✅ Sincronização concluída!"
echo "📋 Arquivos copiados de $LOCAL_AWS_DIR para $HOME_AWS_DIR"
echo "🔒 Arquivos existentes em $HOME_AWS_DIR foram preservados"
