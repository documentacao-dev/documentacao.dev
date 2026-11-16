<!-- ia-translate: true -->
<div align="center">
  <img src="assets/icone/icone.png" alt="Documentação.dev" width="160">

  <h1>Documentação.dev</h1>

  <p><strong>Documentação técnica em português, sem você precisar abrir o tradutor em outra aba.</strong></p>

  [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
  [![PRs Welcome](https://img.shields.io/badge/PRs-bem--vindos-brightgreen.svg)](src/content/contribuir.md)
  ![Feito com Jaspr](https://img.shields.io/badge/Feito_com-Jaspr-3178C6?logo=dart)
</div>

---

## Bora direto ao ponto

Você já leu a mesma frase da documentação três vezes, entendeu as palavras uma por uma e mesmo assim não entendeu nada? Então você já sabe por que este projeto existe.

O **Documentação.dev** junta num lugar só as traduções da comunidade brasileira para as documentações oficiais de frameworks e linguagens. Termo técnico continua em inglês (ninguém fala "componente de estado sem estado"), o resto vira português de gente.

## O que já está no ar

| | Tradução | Site |
|---|---|---|
| ✅ | Flutter | [flutterbrasil.dev](https://flutterbrasil.dev) |
| ✅ | Dart | [dartbrasil.dev](https://dartbrasil.dev) |
| ✅ | Angular | [angularbrasil.dev](https://angularbrasil.dev) |
| 🔄 | React Native | no forno |
| ✅ | Go | [go.documentacao.dev](https://go.documentacao.dev) (tutoriais, Effective Go, Learn) |
| ✅ | TypeScript | [typescript.documentacao.dev](https://typescript.documentacao.dev) (Handbook) |
| ✅ | Rust | [rust.documentacao.dev](https://rust.documentacao.dev) (livro, capítulos 1 a 6) |
| ✅ | Swift | [swift.documentacao.dev](https://swift.documentacao.dev) (livro: Tour guiado e guia até closures) |
| 🔜 | Expo, Kotlin, Next.js | na fila, e a fila anda |

Sentiu falta de alguma? [Pede aqui](https://github.com/documentacao-dev/documentacao.dev/issues/new?assignees=&labels=tradução%2Cdocumentação&template=solicitacao-traducao.yml&title=%5BTradução%5D+). Pedido com bastante 👍 sobe na fila.

## Como a casa funciona

Cada tradução mora no próprio repositório, como fork do original, aqui na org [`documentacao-dev`](https://github.com/documentacao-dev). Assim, quando o pessoal lá de fora muda a documentação, a gente puxa com um `git merge upstream/main` e retraduz só o que mudou.

Este repositório é a sala de estar: o site que apresenta todas as traduções e, aos poucos, o que é comum a todas (glossário, prompt do agente tradutor, scripts de conferência). O plano completo está no [TODO.md](TODO.md).

## Rodando na sua máquina

Precisa do [Dart](https://dart.dev/get-dart) 3.8 a 3.10 e da [CLI do Jaspr](https://jaspr.site/).

```bash
git clone https://github.com/documentacao-dev/documentacao.dev.git
cd documentacao.dev/src
dart pub get
jaspr serve        # http://localhost:8080, com hot reload
```

Para gerar a versão de produção: `jaspr build` (sai em `src/build/jaspr/`).

Deploy você não faz: push na `main` publica no Firebase Hosting sozinho, e todo PR ganha um link de preview comentado pelo bot.

## Criando uma página nova

1. Crie um `.md` em `src/content/` com `title` e `description` no front matter.
2. Coloque o link na barra lateral em `src/lib/main.dart`:

```dart
SidebarGroup(title: 'Guias', links: [
  SidebarLink(text: 'Nova Seção', href: '/nova-secao'),
]),
```

## Quer ajudar?

- **Revisar tradução.** Achou uma frase com cara de Google Tradutor de 2012? Abre um PR no repositório daquela tradução.
- **Traduzir.** Escolhe uma página que ainda está em inglês e manda ver.
- **Reportar.** Link quebrado, página desatualizada, erro de digitação: [abre uma issue](https://github.com/documentacao-dev/documentacao.dev/issues).
- **Pagar um café.** Hospedagem e horas de tradução não saem de graça. O PIX está aqui embaixo e cada real vira página traduzida.

<div align="center">
  <img src="src/web/images/qrcode-pix.png" alt="QR Code PIX" width="240">
</div>

## Feito com

[Dart](https://dart.dev) e [Jaspr](https://jaspr.site/), um framework web em Dart com cara de Flutter. Sim, o site que divulga a tradução do Dart é feito em Dart.

## Licença

[MIT](LICENSE). Pode usar, copiar e melhorar. Só não esquece de mandar a melhoria de volta. 😉

---

<div align="center">
  Feito no Brasil por quem cansou de ler documentação com o tradutor aberto.<br>
  <a href="https://github.com/documentacao-dev">github.com/documentacao-dev</a> · <a href="https://www.linkedin.com/in/ulisseshen/">LinkedIn</a>
</div>
