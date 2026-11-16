# TODO

## 1. Organização no GitHub

- [x] Criar a organização [`documentacao-dev`](https://github.com/documentacao-dev) (plano Free, 15/11/2026)
- [x] Antes de transferir cada repositório, revisar:
  - [x] Secrets do GitHub Actions: vão junto na transferência (todos os deploys usam `FIREBASE_SERVICE_ACCOUNT*` no próprio repositório)
  - [x] Domínios personalizados: todos ficam no Firebase Hosting, não dependem do GitHub
  - [ ] GitHub Apps instalados (ex.: Claude), que precisam ser instalados de novo na org
- [x] Transferir os repositórios. O GitHub mantém o redirecionamento das URLs antigas.
  - [x] `documentacao.dev` (era `ulisseshen/documentacao.dev`)
  - [x] `site-www`, dartbrasil.dev (era `dart2brasil/site-www`)
  - [x] `flutterbrasil`, docs.flutterbrasil.dev (era `ulisseshen/flutterbrasil`)
  - [x] `flutterbrasil_dev`, flutterbrasil.dev (era `ulisseshen/flutterbrasil_dev`)
  - [x] `angularbrasil` (era `ulisseshen/angularbrasil`)
  - [x] `react-native-brasil-website` (era `ulisseshen/react-native-brasil-website`)
  - [x] Legado: `doc-flutter-brasil` e `dart-brasil` (eram da `brasilflutter`), `flutter-website` (fork antigo)
- [ ] Decidir o destino das orgs antigas (`dart2brasil`, `brasilflutter`): manter vazias para guardar o nome ou apagar depois da migração
- [ ] Criar um time por tradução (`time-dart`, `time-typescript`…) com permissão só no seu repositório
- [x] Atualizar os links do README e do site para a nova organização
- [x] Corrigir o que dependia do nome antigo: `docs.yml` e `verificar.py` do flutterbrasil comparavam `github.repository` com `ulisseshen/flutterbrasil`

## 2. Estrutura: um repositório por tradução

Não centralizar o conteúdo num monorepo. Cada tradução continua num **fork do upstream**, para que o sync seja um `git merge upstream/main`. Cada site também usa uma ferramenta diferente (mdBook, DocC, Next.js, Gatsby, Writerside, `dash_site`).

O documentacao.dev centraliza o que é comum:

- [ ] Página "Processo de sincronização com o upstream", usando o dartbrasil como referência (PR #146 / branch `sync/upstream-2026-11`)
- [ ] Glossário único de termos técnicos
- [ ] Prompt do agente tradutor (hoje em `.claude/agents/agent-translator.md` no dartbrasil)
- [ ] Script de conferência da tradução contra o inglês (blocos de código, links, âncoras, Liquid, YAML). Hoje ele não está versionado no dartbrasil; só existe o `check-anchors.sh`.
- [ ] Workflow reutilizável de checagem do upstream (`.github/workflows/`), que cada fork chama com poucas linhas
- [ ] Painel no site com o progresso e as páginas desatualizadas de cada tradução

## 3. Processo de sync

Fluxo atual no dartbrasil:

1. Fork com `upstream` apontando para o repositório original
2. Branch `sync/upstream-AAAA-MM` com merge de `upstream/main`
3. Retradução das páginas alteradas, aproveitando a tradução anterior
4. Retradução dos dados (sidenav, quizzes, glossário, header, footer)
5. Conferência por script contra o inglês
6. PR do sync e merge

Melhorias:

- [ ] Checagem automática semanal do upstream: listar os arquivos alterados desde o último sync e abrir issue "Página desatualizada" com o diff do inglês. O último sync do dartbrasil juntou 400 commits e 260 páginas de uma vez.
- [ ] Arquivo de configuração por repositório (`.traducao.yml`), para os scripts funcionarem com upstreams e estruturas de pastas diferentes:

  ```yaml
  upstream:
    repo: dart-lang/site-www
    branch: main
  conteudo:
    - src/content/**/*.md
    - src/data/**/*.yml
  layout: in-place          # ou: pasta-paralela (en/ → pt/)
  # destino: packages/documentation/copy/pt   (só para pasta-paralela)
  ```

- [ ] Trocar o `ia-translate: true` do frontmatter por um arquivo de controle com o commit do upstream em que cada página foi traduzida:

  ```json
  // .traducao/status.json
  { "src/content/language/async.md": "a1b2c3d" }
  ```

  Funciona em formatos sem frontmatter (mdBook, Writerside), e `git diff <commit> upstream/main -- <arquivo>` mostra só o trecho a retraduzir.

## 4. Novas traduções (já em "Em Breve")

Ordem sugerida, com upstream, conteúdo e licença:

- [ ] **TypeScript**: `microsoft/TypeScript-Website` (branch `v2`), `packages/documentation/copy/en` → `pt`. Layout de pasta paralela. CC-BY 4.0. O Handbook não tem tradução em PT; o repositório `microsoft/TypeScript-Website-Localizations` tem só referência, tsconfig e playground em PT.
- [ ] **Expo**: `expo/expo`, `docs/pages/**/*.mdx`. MIT. Não existe tradução.
- [ ] **Kotlin**: `JetBrains/kotlin-web-site`, `docs/topics/`. Usa Writerside. Apache 2.0. O time do Kotlin incentiva traduções publicadas em site próprio.
- [ ] **Next.js**: `vercel/next.js`, pasta `docs/`. MIT. O repositório é enorme: criar um repo só com as docs e buscar o upstream com *sparse checkout*.
- [ ] **Swift**: `swiftlang/swift-book`, `TSPL.docc/`. Usa DocC. Apache 2.0. As traduções comunitárias anteriores estão abandonadas.
- [ ] **Rust**: `rust-lang/book`, `src/*.md`. Usa mdBook. MIT/Apache 2.0. A `rust-br/rust-book-pt-br` está parada desde 2024: propor colaboração antes de começar do zero.
- [ ] Go (já estava em "Em Breve")

Para cada uma:

- [ ] Começar pelo kit [`modelo-nova-traducao/`](modelo-nova-traducao/): fork na org, `CLAUDE.md` e agentes de tradução já em `model: haiku` (toda tradução da org roda no Haiku)
- [ ] Conferir a política de marca registrada antes de registrar o domínio (principalmente Vercel/Next.js e Apple/Swift)
- [ ] Manter o aviso de licença e a atribuição ao original no site traduzido
- [ ] Ao lançar, mover de "Em breve" para "Em processo"/"Disponíveis" no README e em `src/lib/components/doc_cards.dart`
- [ ] Validar o site com `jaspr serve` (os cards novos não foram compilados porque o Dart não estava instalado na sessão que os criou)
