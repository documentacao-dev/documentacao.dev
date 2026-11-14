# 📚 Documentação.dev

> Plataforma de documentação técnica de alta qualidade em Português do Brasil

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
![Feito com Jaspr](https://img.shields.io/badge/Feito_com-Jaspr-3178C6?logo=dart)

## 📋 Status das Traduções

### ✅ Disponíveis
[![Flutter](https://img.shields.io/badge/Flutter-Disponível-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutterbrasil.dev)
[![Dart](https://img.shields.io/badge/Dart-Disponível-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dartbrasil.dev)
[![Angular](https://img.shields.io/badge/Angular-Disponível-DD0031?style=for-the-badge&logo=angular&logoColor=white)](https://angularbrasil.dev)

### 🔄 Em Processo
![React Native](https://img.shields.io/badge/React_Native-Em_Processo-61DAFB?style=for-the-badge&logo=react&logoColor=black)

### 🔜 Em Breve
![Go](https://img.shields.io/badge/Go-Em_Breve-00ADD8?style=for-the-badge&logo=go&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-Em_Breve-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![Expo](https://img.shields.io/badge/Expo-Em_Breve-000020?style=for-the-badge&logo=expo&logoColor=white)
![Kotlin](https://img.shields.io/badge/Kotlin-Em_Breve-7F52FF?style=for-the-badge&logo=kotlin&logoColor=white)
![Next.js](https://img.shields.io/badge/Next.js-Em_Breve-000000?style=for-the-badge&logo=nextdotjs&logoColor=white)
![Swift](https://img.shields.io/badge/Swift-Em_Breve-F05138?style=for-the-badge&logo=swift&logoColor=white)
![Rust](https://img.shields.io/badge/Rust-Em_Breve-000000?style=for-the-badge&logo=rust&logoColor=white)

## 🌟 Sobre o Projeto

O **Documentação.dev** é uma iniciativa da comunidade brasileira para traduzir documentações técnicas de frameworks e tecnologias para o Português do Brasil. Acreditamos que quebrar a barreira do idioma é essencial para democratizar o acesso ao conhecimento em tecnologia.

## 🚀 Como Usar

### Pré-requisitos

- [Dart SDK](https://dart.dev/get-dart) (3.8.0 ou superior)
- [Jaspr CLI](https://jaspr.site/) (instalado globalmente)

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/ulisseshen/documentacao.dev.git
cd documentacao.dev
```

2. Navegue até a pasta `src` e instale as dependências:
```bash
cd src
dart pub get
```

### Desenvolvimento Local

Para iniciar o servidor de desenvolvimento com hot-reload:

```bash
cd src
jaspr serve
```

O site estará disponível em `http://localhost:8080`

### Build para Produção

Para criar uma versão otimizada para produção:

```bash
cd src
jaspr build
```

Os arquivos compilados estarão em `src/build/jaspr/`

### Deploy para Firebase Hosting

Deploy automático configurado via GitHub Actions! 🚀

```bash
# Push para a branch main deploya automaticamente
git push origin main
```

**PR Previews**: Ao abrir um Pull Request, um deploy de preview é criado automaticamente e o bot comenta no PR com a URL. O comentário é atualizado em cada novo commit (sem duplicatas)!

Veja o [Guia de Deploy](DEPLOYMENT.md) para instruções completas de configuração.

## 📁 Estrutura do Projeto

```
documentacao.dev/
├── src/                    # Aplicação Jaspr
│   ├── content/           # Conteúdo markdown em PT-BR
│   │   ├── _data/         # Configurações (site.yaml, links.yaml)
│   │   ├── index.md       # Página inicial
│   │   ├── instalacao.md  # Guia de instalação
│   │   ├── conceitos.md   # Conceitos básicos
│   │   ├── componentes.md # Guia de componentes
│   │   ├── contribuir.md  # Como contribuir
│   │   └── about.md       # Sobre o projeto
│   ├── lib/               # Código Dart
│   │   ├── components/    # Componentes customizados
│   │   │   ├── donation_buttons.dart
│   │   │   └── clicker.dart
│   │   ├── main.dart      # Aplicação principal
│   │   └── jaspr_options.dart
│   ├── web/               # Assets estáticos
│   │   ├── favicon.ico
│   │   └── images/
│   ├── pubspec.yaml       # Dependências
│   └── analysis_options.yaml
├── .github/
│   └── workflows/
│       └── deploy-firebase.yml  # GitHub Actions para deploy
├── README.md              # Este arquivo
├── DEPLOYMENT.md          # Guia de deploy Firebase
└── LICENSE               # Licença MIT
```

## 📝 Adicionando Conteúdo

Para adicionar novas páginas de documentação:

1. Crie um novo arquivo markdown em `src/content/`:
```markdown
---
title: Nova Seção
description: Descrição da nova seção
---

# Nova Seção

Conteúdo aqui...
```

2. Adicione o link na navegação em `src/lib/main.dart`:
```dart
SidebarGroup(title: 'Guias', links: [
  SidebarLink(text: "Nova Seção", href: '/nova-secao'),
]),
```

## 💝 Como Apoiar

Este projeto é mantido pela comunidade e depende de doações para:

- ✅ Manter traduções atualizadas
- ✅ Adicionar documentação de novas tecnologias
- ✅ Melhorar a qualidade das traduções existentes
- ✅ Cobrir custos de hospedagem e infraestrutura

### Formas de Contribuir

- 💳 **PIX**: Escaneie o QR Code abaixo para doar

<div align="center">
  <img src="src/web/images/qrcode-pix.png" alt="QR Code PIX" width="300">
  <p><em>Sua doação ajuda a manter este projeto vivo! 💚</em></p>
</div>

- 🔧 **Contribua com código**: Envie Pull Requests!
- 📝 **Melhore traduções**: Ajude a revisar e melhorar
- 🐛 **Reporte bugs**: Abra issues com sugestões

## 🤝 Como Contribuir

Contribuições são muito bem-vindas! Veja como você pode ajudar:

### 🌐 Solicitar Tradução de Documentação

Precisa de uma documentação traduzida? [**Clique aqui para solicitar uma tradução**](https://github.com/ulisseshen/documentacao.dev/issues/new?assignees=&labels=tradução%2Cdocumentação&template=solicitacao-traducao.yml&title=%5BTradução%5D+)

### 💻 Contribuir com Código

1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Diretrizes

- Use português claro e objetivo
- Siga o guia de estilo existente
- Teste suas alterações em diferentes navegadores
- Mantenha o código limpo e bem documentado

## 🛠️ Tecnologias Utilizadas

- **Dart** - Linguagem de programação
- **[Jaspr](https://jaspr.site/)** - Framework Dart para web (similar ao Flutter)
- **Jaspr Content** - Sistema de documentação baseado em markdown
- **Markdown** - Para escrita de conteúdo
- **YAML** - Para configurações

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🌍 Comunidade

- **GitHub**: [github.com/ulisseshen/documentacao.dev](https://github.com/ulisseshen/documentacao.dev)
- **LinkedIn**: [linkedin.com/in/ulisseshen](https://www.linkedin.com/in/ulisseshen/)

## 🙏 Agradecimentos

Agradecemos a todos os contribuidores que ajudam a manter este projeto vivo e atualizado!

---

Feito com ❤️ pela comunidade brasileira de desenvolvedores

<div align="center">
  <a href="https://jaspr.site/" target="_blank">
    <img src="src/web/images/jaspr-logo.svg" alt="Feito com Jaspr" width="106" height="40">
  </a>
</div>