# GitHub CLI (gh)

Documentação para uso do GitHub CLI no desenvolvimento.

## Instalação

```bash
# macOS
brew install gh

# Linux
sudo apt install gh
```

## Autenticação

```bash
# Login interativo
gh auth login

# Verificar status da autenticação
gh auth status
```

## Comandos Principais

### Repositórios
```bash
# Ver informações do repositório atual
gh repo view

# Clonar repositório
gh repo clone OWNER/REPO

# Criar novo repositório
gh repo create
```

### Pull Requests
```bash
# Listar PRs
gh pr list

# Ver detalhes de um PR
gh pr view 123

# Criar PR
gh pr create

# Fazer checkout de um PR
gh pr checkout 123

# Mergear PR
gh pr merge 123
```

### Issues
```bash
# Listar issues
gh issue list

# Ver detalhes de uma issue
gh issue view 123

# Criar nova issue
gh issue create

# Fechar issue
gh issue close 123
```

### Releases
```bash
# Listar releases
gh release list

# Ver detalhes de um release
gh release view v1.0.0

# Criar release
gh release create v1.0.0
```

## Configuração

```bash
# Ver configurações
gh config list

# Definir editor padrão
gh config set editor vim

# Definir protocolo (https/ssh)
gh config set git_protocol ssh
```

## Dicas

1. Use `gh --help` para ver todos os comandos disponíveis
2. Muitos comandos aceitam flags como `--web` para abrir no browser
3. Configure aliases: `gh alias set pv 'pr view'`
4. Integra bem com git workflows locais