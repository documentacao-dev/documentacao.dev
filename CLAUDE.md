# CLAUDE.md

Hub das traduções PT-BR da org `documentacao-dev`. Cada tradução mora no próprio repositório (fork do upstream); veja o [TODO.md](TODO.md).

## Modelo da tradução: sempre Haiku

Em qualquer repositório da org, toda tradução e retradução de página (tradução nova, sync com o upstream, revisão de trecho) roda no **Haiku** (`model: haiku`, hoje Claude Haiku 5.5), local ou na nuvem (Claude Code na web, GitHub App, rotinas agendadas).

- Os agentes de tradução em `.claude/agents/` de cada repositório declaram `model: haiku`. Não troque.
- Se um orquestrador disparar subagentes para traduzir, passe `model: "haiku"` na ferramenta Agent.
- O modelo principal da sessão fica só com a orquestração: merge do upstream, scripts de conferência, commits e PR. Ele não traduz páginas.
