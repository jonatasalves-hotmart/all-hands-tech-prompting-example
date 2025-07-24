# Convenções de Pull Requests

Este documento define as convenções para Pull Requests.

## Pré-requisitos

**IMPORTANTE**: Antes de criar um Pull Request, certifique-se de seguir o workflow de branches:

### Workflow Obrigatório
1. **Branch específica**: Deve estar na branch prefixada pelo TASK_CODE
2. **Commits organizados**: Seguir convenções de commit
3. **Branch atualizada**: Garantir que a branch está atualizada com a principal
4. **Testes**: Validar que as mudanças funcionam

## Formato do Título

```
[TIPO] Descrição concisa do que foi implementado
```

## Regras Gerais

- **Idioma**: Português brasileiro
- **Título**: Descritivo e conciso
- **Descrição**: Detalhada, explicando contexto e mudanças
- **Testes**: Evidências de que as mudanças funcionam
- **Review**: Obrigatório antes do merge

## Tipos de PR

- **[FEATURE]**: Nova funcionalidade
- **[BUGFIX]**: Correção de bug
- **[DOCS]**: Mudanças na documentação
- **[REFACTOR]**: Refatoração de código
- **[CHORE]**: Tarefas de manutenção, build, etc

## Template de Descrição

```markdown
## O que foi implementado
[Descrição clara das mudanças]

## Por que foi necessário
[Contexto e justificativa]

## Como testar
- [ ] Passo 1
- [ ] Passo 2
- [ ] Passo 3

## Checklist
- [ ] Código testado localmente
- [ ] Documentação atualizada (se necessário)
- [ ] Sem quebra de funcionalidades existentes
- [ ] Segue padrões de código do projeto

## Issues relacionadas
Closes #123
Relates to #456
```

## Exemplos

### Título de PRs
```
[FEATURE] Implementar sistema de autenticação JWT
[BUGFIX] Corrigir validação de campos obrigatórios
[DOCS] Atualizar documentação de instalação
[REFACTOR] Reorganizar estrutura de componentes
[CHORE] Atualizar dependências e configurações
```

### PR Completo
```markdown
# [FEATURE] Implementar cache Redis para consultas

## O que foi implementado
Sistema de cache usando Redis para otimizar consultas ao banco de dados,
com configuração flexível via variáveis de ambiente.

## Por que foi necessário
As consultas ao banco estavam impactando a performance da aplicação,
especialmente em horários de pico.

## Como testar
- [ ] Configurar Redis localmente
- [ ] Executar consultas e verificar logs de cache
- [ ] Validar melhoria na performance

## Checklist
- [x] Código testado localmente
- [x] Documentação atualizada
- [x] Sem quebra de funcionalidades existentes
- [x] Segue padrões de código do projeto

## Issues relacionadas
Closes #123 - Melhorar performance das consultas
```

## Criação, análise e review de PRs

### Ferramentas Recomendadas

**IMPORTANTE**: Para análise de PRs, utilize o GitHub CLI ao invés de requisições HTTP diretas.

Para mais comandos e configurações, consulte: [Documentação do GitHub CLI](./CLIs/gh.md)

### Comandos Práticos para Análise Rápida

#### Buscar e Listar PRs
```bash
# Listar todos os PRs abertos
gh pr list

# Listar PRs com filtros específicos
gh pr list --state open --author @me
gh pr list --state merged --limit 10
gh pr list --label "bug" --state open

# Buscar PR por número específico
gh pr view 1
gh pr view 42 --json title,body,state,author
```

#### Análise Detalhada de PR
```bash
# Ver informações completas de um PR
gh pr view 1 --json title,body,state,author,additions,deletions,files,commits

# Ver diff completo do PR
gh pr diff 1

# Ver apenas arquivos modificados
gh pr view 1 --json files | jq '.files[].path'

# Ver commits do PR
gh pr view 1 --json commits | jq '.commits[].messageHeadline'
```

#### Comandos de Review
```bash
# Fazer checkout do PR para teste local
gh pr checkout 1

# Aprovar PR
gh pr review 1 --approve

# Solicitar mudanças
gh pr review 1 --request-changes --body "Comentários sobre mudanças necessárias"

# Adicionar comentário
gh pr comment 1 --body "Comentário sobre o PR"
```

#### Comandos de Criação
```bash
# Criar PR da branch atual
gh pr create --title "[FEATURE] Título do PR" --body "Descrição detalhada"

# Criar PR com template
gh pr create --title "[FEATURE] Título" --body-file .github/pull_request_template.md

# Criar draft PR
gh pr create --draft --title "[WIP] Trabalho em progresso"
```

#### Comandos de Merge
```bash
# Merge do PR
gh pr merge 1 --merge

# Squash merge
gh pr merge 1 --squash

# Rebase merge
gh pr merge 1 --rebase

# Merge com confirmação automática
gh pr merge 1 --merge --delete-branch
```

#### Comandos de Status e Monitoramento
```bash
# Ver status de checks/CI
gh pr checks 1

# Ver PRs que precisam de review
gh pr list --search "review-requested:@me"

# Ver PRs que você criou
gh pr list --author @me

# Ver PRs por milestone
gh pr list --search "milestone:v1.0"
```

#### Comandos Úteis para Assistentes de IA
```bash
# Obter informações estruturadas para análise
gh pr view 1 --json title,body,state,author,additions,deletions,files,commits,reviews

# Exportar diff para análise
gh pr diff 1 > pr_1_diff.txt

# Listar PRs em formato JSON para processamento
gh pr list --json number,title,state,author,createdAt --limit 50
```

### Processo de Review

1. **Autor**: Cria PR seguindo as convenções usando `gh pr create`
2. **Reviewers**: Analisam código usando `gh pr view` e `gh pr diff`
3. **Teste Local**: Fazem checkout com `gh pr checkout` se necessário
4. **Review**: Usam `gh pr review` para aprovar ou solicitar mudanças
5. **Discussão**: Feedbacks via `gh pr comment`
6. **Merge**: Realizam merge com `gh pr merge`

### Automação e Scripts Úteis

#### Script para Análise Completa de PR
```bash
#!/bin/bash
# Salve como: scripts/analyze-pr.sh
PR_NUMBER=$1

if [ -z "$PR_NUMBER" ]; then
    echo "Uso: ./analyze-pr.sh <numero_do_pr>"
    exit 1
fi

echo "=== ANÁLISE DO PR #$PR_NUMBER ==="
echo

echo "📋 INFORMAÇÕES BÁSICAS:"
gh pr view $PR_NUMBER --json title,state,author,createdAt,additions,deletions | jq -r '
"Título: " + .title + "
Estado: " + .state + "
Autor: " + .author.login + "
Criado em: " + .createdAt + "
Linhas adicionadas: " + (.additions | tostring) + "
Linhas removidas: " + (.deletions | tostring)'

echo
echo "📁 ARQUIVOS MODIFICADOS:"
gh pr view $PR_NUMBER --json files | jq -r '.files[] | "- " + .path + " (+" + (.additions | tostring) + "/-" + (.deletions | tostring) + ")"'

echo
echo "💬 COMMITS:"
gh pr view $PR_NUMBER --json commits | jq -r '.commits[] | "- " + .messageHeadline'

echo
echo "✅ STATUS DOS CHECKS:"
gh pr checks $PR_NUMBER
```

#### Função para Busca Rápida
```bash
# Adicione ao seu ~/.bashrc ou ~/.zshrc
function pr-search() {
    local query="$1"
    if [ -z "$query" ]; then
        echo "Uso: pr-search <termo_de_busca>"
        return 1
    fi
    
    echo "🔍 Buscando PRs com: '$query'"
    gh pr list --search "$query" --json number,title,state,author,createdAt | \
    jq -r '.[] | "#" + (.number | tostring) + " - " + .title + " (" + .state + ") - " + .author.login'
}

# Exemplos de uso:
# pr-search "feature auth"
# pr-search "author:jonatasalves-hotmart"
# pr-search "label:bug"
```

#### Monitoramento de PRs Pendentes
```bash
#!/bin/bash
# Script para verificar PRs que precisam de atenção
echo "🔄 PRs AGUARDANDO SEU REVIEW:"
gh pr list --search "review-requested:@me" --json number,title,author | \
jq -r '.[] | "#" + (.number | tostring) + " - " + .title + " (por " + .author.login + ")"'

echo
echo "📝 SEUS PRs ABERTOS:"
gh pr list --author @me --state open --json number,title,state | \
jq -r '.[] | "#" + (.number | tostring) + " - " + .title + " (" + .state + ")"'

echo
echo "🎯 PRs RECÉM CRIADOS (últimas 24h):"
gh pr list --search "created:>$(date -d '1 day ago' '+%Y-%m-%d')" --json number,title,author,createdAt | \
jq -r '.[] | "#" + (.number | tostring) + " - " + .title + " (por " + .author.login + ")"'
```

### Integração com Assistentes de IA

#### Comandos Otimizados para Análise por IA
```bash
# Obter contexto completo de um PR para análise
gh pr view 1 --json title,body,state,author,additions,deletions,files,commits,reviews,comments

# Exportar informações estruturadas
gh pr view 1 --json title,body,files | jq '{
    titulo: .title,
    descricao: .body,
    arquivos: [.files[] | {
        caminho: .path,
        adicoes: .additions,
        remocoes: .deletions
    }]
}'

# Obter diff formatado para análise
gh pr diff 1 --name-only  # Apenas nomes dos arquivos
gh pr diff 1 > /tmp/pr_diff.txt  # Diff completo para arquivo
```

#### Template para Solicitação de Análise
```bash
# Gerar contexto para assistente analisar PR
function pr-context() {
    local pr_number=$1
    echo "Analise o seguinte Pull Request:"
    echo
    echo "=== INFORMAÇÕES DO PR ==="
    gh pr view $pr_number --json title,body,author,additions,deletions
    echo
    echo "=== ARQUIVOS MODIFICADOS ==="
    gh pr view $pr_number --json files | jq '.files[] | .path'
    echo
    echo "=== DIFF PRINCIPAL ==="
    gh pr diff $pr_number
}
```

## Dicas

1. PRs pequenos são mais fáceis de revisar
2. Inclua screenshots quando relevante
3. Teste todas as funcionalidades impactadas
4. Mantenha conversas construtivas nos reviews
5. Resolva conflitos antes de solicitar review

## Troubleshooting e Casos Comuns

### Problemas Frequentes

#### PR não aparece na listagem
```bash
# Verificar se está no repositório correto
gh repo view

# Listar todos os PRs (incluindo fechados)
gh pr list --state all

# Verificar se o PR existe
gh pr view <numero> 2>/dev/null || echo "PR não encontrado"
```

#### Erro de permissão ao acessar PR
```bash
# Verificar autenticação
gh auth status

# Re-autenticar se necessário
gh auth login

# Verificar permissões no repositório
gh api repos/:owner/:repo/collaborators/:username
```

#### Diff muito grande para visualizar
```bash
# Ver apenas estatísticas
gh pr view <numero> --json additions,deletions,files | jq '{
    total_adicoes: .additions,
    total_remocoes: .deletions,
    arquivos_modificados: (.files | length)
}'

# Ver apenas arquivos modificados
gh pr view <numero> --json files | jq -r '.files[].path'

# Filtrar diff por tipo de arquivo
gh pr diff <numero> -- "*.js" "*.ts"  # Apenas JS/TS
gh pr diff <numero> -- "*.md"         # Apenas Markdown
```

### Casos de Uso Específicos

#### Analisar PR de outro desenvolvedor
```bash
# 1. Ver informações básicas
gh pr view <numero>

# 2. Verificar arquivos modificados
gh pr view <numero> --json files | jq -r '.files[].path'

# 3. Fazer checkout para teste local
gh pr checkout <numero>

# 4. Testar mudanças localmente
# ... executar testes ...

# 5. Voltar para branch principal
git checkout main  # ou development

# 6. Fazer review
gh pr review <numero> --approve  # ou --request-changes
```

#### Acompanhar PR em desenvolvimento
```bash
# Verificar status dos checks
gh pr checks <numero>

# Ver comentários recentes
gh pr view <numero> --json comments | jq -r '.comments[-3:] | .[] | .author.login + ": " + .body'

# Verificar se há conflitos
gh pr view <numero> --json mergeable | jq '.mergeable'
```

#### Buscar PRs por critérios específicos
```bash
# PRs de uma task específica
gh pr list --search "HM-123 in:title"

# PRs que modificaram arquivo específico
gh pr list --search "filename:package.json"

# PRs por período
gh pr list --search "created:2024-01-01..2024-01-31"

# PRs com label específica
gh pr list --label "hotfix"

# PRs que mencionam issue
gh pr list --search "#456 in:body"
```

### Comandos de Emergência

#### PR com problemas críticos
```bash
# Fechar PR imediatamente
gh pr close <numero> --comment "Fechando devido a problema crítico"

# Reverter merge (se já foi feito)
# Primeiro, identificar o commit de merge
git log --oneline --merges -n 5
# Depois reverter
git revert -m 1 <commit_hash>

# Criar hotfix baseado em PR problemático
gh pr checkout <numero>
git checkout -b hotfix/fix-critical-issue
# ... fazer correções ...
gh pr create --title "[HOTFIX] Correção crítica" --base main
```

#### Recuperar PR perdido/deletado
```bash
# Listar PRs fechados recentemente
gh pr list --state closed --limit 20

# Buscar por autor ou título
gh pr list --state all --search "author:username"
gh pr list --state all --search "título parcial"

# Ver histórico de um PR específico
gh pr view <numero> --json timeline
```

### Automação Avançada

#### Webhook para notificações
```bash
# Monitorar PRs em tempo real (exemplo com webhook local)
#!/bin/bash
while true; do
    NEW_PRS=$(gh pr list --json number,title,createdAt | jq -r '.[] | select(.createdAt > "'$(date -d '5 minutes ago' -Iseconds)'") | "#" + (.number | tostring) + " - " + .title')
    
    if [ ! -z "$NEW_PRS" ]; then
        echo "🆕 Novos PRs:"
        echo "$NEW_PRS"
        # Aqui você pode adicionar notificação (Slack, email, etc.)
    fi
    
    sleep 300  # Verificar a cada 5 minutos
done
```

#### Dashboard de PRs
```bash
#!/bin/bash
# Script para dashboard completo de PRs
echo "📊 DASHBOARD DE PULL REQUESTS"
echo "================================"

echo "🔄 ABERTOS: $(gh pr list --state open --json number | jq length)"
echo "✅ MERGED HOJE: $(gh pr list --state merged --search "merged:$(date '+%Y-%m-%d')" --json number | jq length)"
echo "❌ FECHADOS HOJE: $(gh pr list --state closed --search "closed:$(date '+%Y-%m-%d')" --json number | jq length)"

echo
echo "👥 TOP CONTRIBUTORS (últimos 30 dias):"
gh pr list --state merged --search "merged:>$(date -d '30 days ago' '+%Y-%m-%d')" --json author | \
jq -r '.[].author.login' | sort | uniq -c | sort -nr | head -5

echo
echo "🏷️ LABELS MAIS USADAS:"
gh pr list --state all --limit 100 --json labels | \
jq -r '.[].labels[]?.name' | sort | uniq -c | sort -nr | head -5
```