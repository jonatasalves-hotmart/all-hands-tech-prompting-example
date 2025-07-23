# Criação e Atualização de Tarefas

Este documento descreve o processo para criar e atualizar tarefas neste repositório.

## Pré-requisitos

- CLI do Jira configurado (consulte [docs/contributing/CLIs/jira.md](./CLIs/jira.md))
- Acesso ao Jira do projeto
- Conhecimento da estrutura de templates em `docs/tasks/TEMPLATE/`
- Informações do projeto Jira definidas em `docs/tasks/README.md`

## Processo de Criação de Nova Tarefa

### 1. Criar Task no Jira

Antes de criar qualquer documentação no repositório, a tarefa deve existir no Jira:

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

### Criar nova task rapidamente
```bash
# Substitua TASK_CODE pelo código real da task
TASK_CODE="PROJ-123"
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

### Task não aparece no Jira
- Verifique se você tem as permissões necessárias
- Confirme se está no projeto correto
- Consulte a documentação da CLI do Jira

### Problemas com templates
- Verifique se a pasta `docs/tasks/TEMPLATE/` existe
- Confirme se todos os arquivos template estão presentes
- Verifique permissões de leitura nos arquivos template

### Sincronização com Jira
- Use a CLI do Jira para verificar status atual
- Mantenha consistência entre documentação e Jira
- Em caso de conflito, o Jira é a fonte da verdade
