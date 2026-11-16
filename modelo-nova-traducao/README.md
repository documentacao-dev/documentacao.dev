# Modelo para uma tradução nova

Kit para começar a tradução de uma linguagem ou framework novo (Go, TypeScript, Kotlin, Swift, Rust…) já no padrão da org `documentacao-dev`.

## Checklist

1. **Fork do upstream dentro da org.** `gh repo fork <dono>/<repo> --org documentacao-dev --fork-name <nome>brasil --clone`, e confira o remote `upstream`.
2. **Copie este kit para a raiz do fork:**
   ```bash
   cp -R ~/projects/documentacaodev/modelo-nova-traducao/{CLAUDE.md,.claude} <fork>/
   ```
   Troque os `<PREENCHER>` do `CLAUDE.md` (upstream, pasta do conteúdo, ferramenta do site).
3. **Não mexa no `model: haiku`** dos agentes. Toda tradução da org roda no Haiku, inclusive nas sessões do Claude na nuvem.
4. **Registre o último sync.** Crie `tool/traducao/ultimo-sync-upstream.txt` com o commit do upstream do qual o fork partiu.
5. **Deploy.** Site no Firebase Hosting (projeto `transliteradu` ou próprio), secret `FIREBASE_SERVICE_ACCOUNT` no repositório, preview por PR.
6. **App do Claude.** Já está instalado na org para todos os repositórios, nada a fazer.
7. **Hub.** Adicione a linha na tabela do README e em `src/lib/components/doc_cards.dart`, movendo a linguagem de "Em breve" para "Em processo".
8. **Antes do domínio,** confira a política de marca registrada do projeto original e mantenha a licença e a atribuição no site traduzido.
