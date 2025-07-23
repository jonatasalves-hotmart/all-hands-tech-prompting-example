# Jira CLI

Documentação para uso do Jira CLI no desenvolvimento.

## Instalação

```bash
# macOS
brew install go-jira
```

## Configuração

Para conectar com o Jira da Hotmart:

```bash
# Login inicial
jira login --endpoint=https://hotmart.atlassian.net --user=seu-email@hotmart.com
```

**Nota**: Use sua conta de email da Hotmart e gere um API token em:
https://id.atlassian.com/manage-profile/security/api-tokens

## Comandos Principais

### Listar Issues
```bash
# Suas issues
jira ls

# Issues de um projeto específico
jira ls --project GDV

# Issues com filtro personalizado
jira ls --query "assignee = currentUser() AND status != Done"
```

### Visualizar Issues
```bash
# Ver detalhes de uma issue
jira view HM-123

# Ver comentários (incluídos por padrão no view)
jira view HM-123
```

### Criar e Editar Issues
```bash
# Criar nova issue
jira create

# Adicionar comentário (recomendado - evita abrir editor)
jira comment HM-123 --noedit -m "Seu comentário aqui"

# Adicionar comentário (abre editor - pode travar terminal)
jira comment HM-123

# Mover status da issue
jira trans HM-123
```

**⚠️ IMPORTANTE**: Use sempre `--noedit -m` para comentários para evitar que o Vim abra e trave o terminal.

### Configuração
```bash
# Ver configurações atuais
jira config

# Editar configurações
jira config --edit
```

## Arquivo de Configuração

Você pode criar o arquivo `~/.jira.d/config.yml` para configurações persistentes:

```yaml
endpoint: https://hotmart.atlassian.net
user: seu-email@hotmart.com
password-source: keyring
authentication-method: api-token
```

## Dicas

1. Use `jira ls --help` para ver todas as opções de filtro
2. Configure aliases no seu shell para comandos frequentes
3. O CLI suporta templates personalizados para criação de issues
4. Integra com editores como vim/nano para descrições longas

## Problemas Comuns

### Editor Travando Terminal
Se o Vim abrir e travar o terminal ao usar comandos como `jira comment`:

**Solução Recomendada**: Use sempre `--noedit -m` para comentários:
```bash
# ✅ Correto - não abre editor
jira comment HM-123 --noedit -m "Mensagem do comentário"

# ❌ Evitar - pode abrir Vim e travar
jira comment HM-123
```

**Solução Alternativa**: Configure um editor mais simples:
```bash
export EDITOR=nano
# ou
export EDITOR="echo"
```

**Se já estiver travado no Vim**:
- Pressione `ESC`
- Digite `:q!` para sair sem salvar
- Ou `:wq` para salvar e sair