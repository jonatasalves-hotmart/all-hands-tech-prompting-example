#!/bin/bash

# Exemplo de saída:

#  SEMPRE leia a documentação relacionada ao assunto atual:
#  - Arquitetura: ./docs/contributing/architecture.md
#  - Commits: ./docs/contributing/commits.md
#  - Pull Requests: ./docs/contributing/pull_requests.md
#  - Tarefas: ./docs/contributing/tasks.md

echo "SEMPRE leia a documentação relacionada ao assunto atual:"

# Encontrar todos os arquivos .md na pasta docs (excluindo sub pastas)
for file in ./docs/contributing/*.md; do
    if [ -f "$file" ]; then
        # Extrair o título da primeira linha que começa com #
        title=$(head -n 1 "$file" | sed 's/^# *//')
        
        # Exibir no formato: - Título: caminho
        echo "- $title: $file"
    fi
done
