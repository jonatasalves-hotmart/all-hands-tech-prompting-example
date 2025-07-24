# Criação e Atualização de Tarefas

Este documento descreve o processo para criar e atualizar tarefas neste repositório.

## Pré-requisitos

- CLI do Jira configurado (consulte [docs/contributing/CLIs/jira.md](./CLIs/jira.md))
- Acesso ao Jira do projeto
- Conhecimento da estrutura de templates em `docs/tasks/TEMPLATE/`
- Informações do projeto Jira definidas em `docs/tasks/README.md`

## Processo de Criação de Nova Tarefa

### 1. Criar Task no Jira

Antes de criar qualquer documentação no repositório, a tarefa deve existir no Jira. Você pode criar via CLI:

#### Via CLI do Jira (Recomendado)
```bash
jira create --project=HM --issuetype=Task --noedit \
  --override="summary=Título da sua tarefa" \
  --override="description=Descrição detalhada da tarefa, incluindo contexto, objetivos e justificativa."
```

**Exemplo prático:**
```bash
jira create --project=HM --issuetype=Task --noedit \
  --override="summary=Criação de repositório exemplo para o All Hands Tech" \
  --override="description=Criar um repositório exemplo que demonstre as melhores práticas e padrões de desenvolvimento para o All Hands Tech, incluindo estrutura de projeto, documentação, testes e CI/CD."
```

**Saída esperada:**
```
OK HM-983 https://hotmart.atlassian.net/browse/HM-983
```

**Importante**: 
- Use sempre `--noedit` para evitar que o editor abra e trave o terminal
- O projeto é `HM` conforme definido em `docs/tasks/README.md`
- Anote o código da task retornado (ex: `HM-983`)

#### Opção B: Via Interface Web
1. Consulte `docs/tasks/README.md` para informações do projeto Jira
2. Acesse o Jira do projeto
3. Crie uma nova task com todas as informações necessárias
4. Anote o código da task (ex: `PROJ-123`)

### 2. Criar Estrutura de Documentação

Com o código da task do Jira em mãos, crie a estrutura de documentação:

#### 2.1. Criar Pasta da Task
```bash
mkdir docs/tasks/[TASK_CODE]
```

#### 2.2. Copiar Templates
Copie todos os arquivos do template para a nova pasta:

```bash
cp docs/tasks/TEMPLATE/* docs/tasks/[TASK_CODE]/
```

#### 2.3. Personalizar Arquivos
Edite cada arquivo copiado substituindo os placeholders:

**Arquivos a personalizar:**
- `README.md` - Informações gerais da task
- `technical-analysis.md` - Análise técnica detalhada
- `requirements.md` - Requisitos funcionais e não funcionais
- `implementation-notes.md` - Notas de implementação

**Placeholders a substituir:**
- `[TASK_CODE]` → Código real da task (ex: `PROJ-123`)
- `[TASK_TITLE]` → Título da task do Jira
- `{TASK_CODE}` → Código da task (usado em alguns contextos)
- Outros placeholders específicos de cada template

### 3. Preenchimento Inicial

#### 3.1. README.md
- Preencha as informações básicas da task
- Atualize o status para `TODO`
- Adicione a data de criação
- Inclua o link para a task no Jira
- Defina os critérios de aceitação iniciais

#### 3.2. requirements.md
- Documente os requisitos funcionais
- Defina requisitos não funcionais
- Estabeleça regras de negócio
- Liste dependências conhecidas

#### 3.3. technical-analysis.md
- Faça análise técnica inicial (pode ser preenchida posteriormente)
- Identifique sistemas impactados
- Liste possíveis abordagens

#### 3.4. implementation-notes.md
- Pode ser preenchido durante o desenvolvimento
- Documente decisões técnicas conforme implementação

## Processo de Atualização de Tarefa

### 1. Atualização Regular

Durante o desenvolvimento da task:

1. **README.md**: Atualize o progresso atual e status
2. **technical-analysis.md**: Refine a análise conforme necessário
3. **requirements.md**: Ajuste requisitos se houver mudanças
4. **implementation-notes.md**: Documente decisões e progresso

### 2. Sincronização com Jira

Mantenha a documentação sincronizada com o Jira:

- Status da task deve refletir o status no Jira
- Atualizações importantes devem ser refletidas em ambos os locais
- Use a CLI do Jira para consultas rápidas (veja [docs/contributing/CLIs/jira.md](./CLIs/jira.md))

### 3. Finalização da Task

Quando a task for concluída:

1. Atualize o status para `DONE`
2. Adicione a data de conclusão
3. Complete as notas de implementação
4. Documente lições aprendidas
5. Atualize links para PRs relacionados

## Estrutura Final Esperada

```
docs/tasks/[TASK_CODE]/
├── README.md                 # Informações gerais e progresso
├── technical-analysis.md     # Análise técnica detalhada
├── requirements.md           # Requisitos e critérios
└── implementation-notes.md   # Notas de implementação
```

## Comandos Úteis

### Processo Completo Automatizado
Para criar uma nova tarefa do zero (Jira + documentação):

```bash
# 1. Criar tarefa no Jira
jira create --project=HM --issuetype=Task --noedit \
  --override="summary=Seu título aqui" \
  --override="description=Sua descrição detalhada aqui"

# 2. Anotar o código da task retornado (ex: HM-983)
TASK_CODE="HM-983"  # Substitua pelo código real

# 3. Criar estrutura de documentação
mkdir docs/tasks/$TASK_CODE
cp docs/tasks/TEMPLATE/* docs/tasks/$TASK_CODE/

# 4. Substituir placeholders básicos
cd docs/tasks/$TASK_CODE
sed -i '' "s/\[TASK_CODE\]/$TASK_CODE/g" *.md
sed -i '' "s/{TASK_CODE}/$TASK_CODE/g" *.md

# 5. Editar arquivos para personalizar conteúdo específico
# (README.md, requirements.md, technical-analysis.md, implementation-notes.md)
```

### Criar nova task rapidamente (método manual)
```bash
# Substitua TASK_CODE pelo código real da task
TASK_CODE="HM-123"
mkdir docs/tasks/$TASK_CODE
cp docs/tasks/TEMPLATE/* docs/tasks/$TASK_CODE/

# Substituir placeholders básicos
sed -i '' "s/\[TASK_CODE\]/$TASK_CODE/g" docs/tasks/$TASK_CODE/*.md
sed -i '' "s/{TASK_CODE}/$TASK_CODE/g" docs/tasks/$TASK_CODE/*.md
```

### Verificar status de tasks
```bash
# Listar todas as tasks
ls docs/tasks/ | grep -v TEMPLATE

# Verificar status de uma task específica
grep "Status" docs/tasks/[TASK_CODE]/README.md
```

## Integração com Jira CLI

Para facilitar o trabalho com o Jira, consulte a documentação específica:
- [Configuração e uso da CLI do Jira](./CLIs/jira.md)

## Boas Práticas

1. **Sempre crie a task no Jira primeiro** antes da documentação
2. **Mantenha a documentação atualizada** durante todo o ciclo de vida da task
3. **Use nomes descritivos** nos commits relacionados à task
4. **Referencie o código da task** em PRs e commits
5. **Documente decisões técnicas** conforme são tomadas
6. **Atualize o progresso regularmente** no README.md

## Troubleshooting

### Problemas com CLI do Jira

#### Erro "unknown long flag '--type'"
**Problema**: Usar `--type` em vez de `--issuetype`
**Solução**: Use sempre `--issuetype=Task`

```bash
# ❌ Incorreto
jira create --project=HM --type=Task

# ✅ Correto  
jira create --project=HM --issuetype=Task
```

#### CLI do Jira não configurada
**Problema**: Comando `jira` não encontrado ou não autenticado
**Solução**: Consulte [docs/contributing/CLIs/jira.md](./CLIs/jira.md) para configuração

#### Editor abrindo e travando terminal
**Problema**: CLI abre editor (vim) para descrição
**Solução**: Use sempre `--noedit` com `--override` para descrição

```bash
# ✅ Recomendado - não abre editor
jira create --project=HM --issuetype=Task --noedit \
  --override="summary=Título" \
  --override="description=Descrição"

# ❌ Evitar - pode abrir editor
jira create --project=HM --issuetype=Task
```

### Task não aparece no Jira
- Verifique se você tem as permissões necessárias
- Confirme se está no projeto correto (HM)
- Consulte a documentação da CLI do Jira

### Problemas com templates
- Verifique se a pasta `docs/tasks/TEMPLATE/` existe
- Confirme se todos os arquivos template estão presentes
- Verifique permissões de leitura nos arquivos template

### Sincronização com Jira
- Use a CLI do Jira para verificar status atual
- Mantenha consistência entre documentação e Jira
- Em caso de conflito, o Jira é a fonte da verdade
