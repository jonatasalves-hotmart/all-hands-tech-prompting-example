# Convenções de Commits

## Workflow de Branches

**IMPORTANTE**: Sempre criar uma nova branch antes de fazer commits.

### Regras
- **Nunca commitar diretamente** na branch principal (develop/master)
- **Sempre criar uma branch** específica para a tarefa
- **Nome da branch** deve ter como prefixo o nome da task relacionada e esta tarefa.
- **Momento**: Commitar documentação da task em commit separado da tarefa de desenvolvimento.
- **Sincronização**: Manter documentação atualizada durante desenvolvimento

## Formato de Commit

```
tipo: descrição concisa

[corpo opcional]
[rodapé opcional]
> [resumo do prompt - quando usar assistente]
```

## Regras Gerais

- **Idioma**: Português brasileiro
- **Formato**: `tipo: descrição concisa` 
- **Primeira linha**: Máximo 50 caracteres
- **Descrição**: Imperativo, sem ponto final
- **Corpo**: Separado por linha em branco, máximo 72 caracteres por linha
- **Assistente**: Adicione `> resumo do prompt` quando usar assistente de programação

## Tipos de Commit

- **feat**: Nova funcionalidade
- **fix**: Correção de bug
- **docs**: Mudanças na documentação
- **style**: Formatação, pontos e vírgulas ausentes, etc
- **refactor**: Refatoração de código
- **test**: Adiciona ou modifica testes
- **chore**: Tarefas de build, configurações, etc

## Exemplos

### Commits Simples
```bash
feat: adicionar autenticação JWT
fix: corrigir validação de email
docs: atualizar README com instalação
style: corrigir indentação no arquivo config
refactor: reorganizar estrutura de pastas
test: adicionar testes para login
chore: atualizar dependências do projeto
```

### Commits com Corpo
```bash
feat: implementar cache Redis

Adicionar sistema de cache para melhorar performance
das consultas ao banco de dados. Configuração através
de variáveis de ambiente.

Resolve: #123
```

### Commits com Assistente
```bash
feat: implementar validação de CPF

> adicionar validação de CPF no formulário de cadastro
```

```bash
refactor: reorganizar estrutura de componentes

Mover componentes para pastas por funcionalidade
e atualizar imports em toda a aplicação.

> reorganizar os componentes React em uma estrutura mais limpa
```

```bash
docs: atualizar documentação de instalação

> atualizar o README com as novas instruções de instalação
```

## Dicas

1. Use o imperativo: "adiciona" ao invés de "adicionado"
2. Seja específico sobre o que foi alterado
3. Referencie issues quando relevante
4. Evite commits muito genéricos como "fix bugs"
5. Um commit = uma mudança lógica
6. **Com assistente**: Inclua resumo do prompt para rastreabilidade