# Decisões Arquiteturais (ADRs)

Documentações de Architecture Decision Records (ADRs) do projeto.

## Como Criar um ADR

Cada ADR deve ser criado em seu próprio arquivo baseado no `template.md` disponível nesta pasta.

### Estrutura de Arquivos

- **Template**: `template.md` - Modelo base para novos ADRs
- **ADRs**: Cada decisão deve ter seu próprio arquivo seguindo o padrão de nomenclatura

### Padrão de Nomenclatura

Os arquivos de ADR devem seguir o padrão:
```
YYYY-MM-DD-titulo-da-decisao.md
```

**Exemplos:**
- `2024-01-15-escolha-banco-dados.md`
- `2024-02-03-arquitetura-microservicos.md`
- `2024-03-10-padrao-autenticacao.md`

### Processo de Criação

1. **Copie o template**:
   ```bash
   cp docs/architecture/decisions/template.md docs/architecture/decisions/YYYY-MM-DD-titulo-da-decisao.md
   ```

2. **Preencha as informações**:
   - Substitua `TITLE` pelo título da decisão
   - Atualize `DATE` com a data atual
   - Defina o `STATUS` (proposto, aceito, substituído)
   - Adicione os responsáveis pela decisão
   - Complete todas as seções do template

3. **Revise e aprove**:
   - Submeta para revisão da equipe
   - Atualize o status conforme necessário
   - Mantenha o histórico de mudanças

### Status dos ADRs

- **Proposto**: Decisão em discussão
- **Aceito**: Decisão aprovada e implementada
- **Substituído**: Decisão substituída por outra mais recente

### Boas Práticas

- Use títulos descritivos e concisos
- Documente o contexto e as alternativas consideradas
- Inclua as consequências da decisão
- Mantenha os ADRs atualizados
- Referencie ADRs relacionados quando aplicável

### Estrutura do Template

O template inclui as seguintes seções:
- **Título e Data**: Identificação da decisão
- **Status**: Estado atual da decisão
- **Responsáveis**: Pessoas envolvidas na decisão
- **Contexto**: Situação que motivou a decisão
- **Decisão**: O que foi decidido
- **Alternativas**: Opções consideradas
- **Consequências**: Impactos da decisão

Para mais detalhes sobre cada seção, consulte o arquivo `template.md`.
