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

### Processo de Review

1. **Autor**: Cria PR seguindo as convenções usando `gh cli`
2. **Reviewers**: Analisam código, lógica e testes usando `gh cli`
3. **Discussão**: Feedbacks e ajustes necessários
4. **Aprovação**: Pelo menos um reviewer aprova
5. **Merge**: Autor ou reviewer realiza o merge

## Dicas

1. PRs pequenos são mais fáceis de revisar
2. Inclua screenshots quando relevante
3. Teste todas as funcionalidades impactadas
4. Mantenha conversas construtivas nos reviews
5. Resolva conflitos antes de solicitar review