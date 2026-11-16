import 'package:jaspr/server.dart';
import 'package:jaspr_content/jaspr_content.dart';

/// Payload "PIX copia e cola" (BR Code estático) da chave CNPJ do projeto.
const pixCopiaECola =
    '00020126360014BR.GOV.BCB.PIX0114279014000001245204000053039865802BR5901N6001C62190515documentacaodev6304076A';

/// Layout das páginas institucionais (início e sobre): topo azul-marinho,
/// conteúdo em largura total e rodapé. As demais páginas seguem no DocsLayout.
class HubLayout extends PageLayoutBase {
  const HubLayout();

  @override
  String get name => 'hub';

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield meta(name: 'viewport', content: 'width=device-width, initial-scale=1');
    yield link(rel: 'preconnect', href: 'https://fonts.googleapis.com');
    yield link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''});
    yield link(
      rel: 'stylesheet',
      href: 'https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700'
          '&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@500&display=swap',
    );
    yield raw('<style>$_css</style>');
  }

  @override
  Component buildBody(Page page, Component child) {
    final url = page.url;
    String atual(String href) => url == href ? ' aria-current="page"' : '';
    return div(classes: 'hub', [
      raw('''
<header class="hub-topo">
  <div class="hub-wrap hub-nav">
    <a class="hub-marca" href="/">
      <img src="/images/icone.png" alt="" width="40" height="40">
      <span>documentação<span class="hub-amarelo">.dev</span></span>
    </a>
    <nav aria-label="Principal" class="hub-links">
      <a href="/#docs">Documentações</a>
      <a href="/#como">Como traduzimos</a>
      <a href="/about"${atual('/about')}>Sobre</a>
      <a class="hub-github" href="https://github.com/documentacao-dev">$_iconeGithub GitHub</a>
    </nav>
  </div>
</header>'''),
      main_([child]),
      raw('''
<footer class="hub-rodape">
  <div class="hub-wrap hub-rodape-linha">
    <div class="hub-rodape-marca">
      <img src="/images/icone.png" alt="" width="28" height="28">
      <span>Feito pela comunidade brasileira · MIT</span>
    </div>
    <nav aria-label="Rodapé" class="hub-rodape-links">
      <a href="/about">Sobre</a>
      <a href="/contribuir">Contribuir</a>
      <a href="https://github.com/documentacao-dev">GitHub</a>
    </nav>
  </div>
</footer>
<script>$_js</script>'''),
    ]);
  }
}

class _Doc {
  const _Doc(this.nome, this.icone, this.tipo, this.status, this.desc, [this.links = const []]);
  final String nome, icone, tipo, status, desc;
  final List<(String, String)> links;
}

const _docs = [
  _Doc('Flutter', 'flutter', 'Framework multiplataforma', 'ar',
      'Site, documentação completa, receitas do cookbook e notas de lançamento.', [
    ('flutterbrasil.dev', 'https://flutterbrasil.dev'),
    ('docs.flutterbrasil.dev', 'https://docs.flutterbrasil.dev'),
  ]),
  _Doc('Dart', 'dart', 'Linguagem', 'ar', 'Tour da linguagem, Effective Dart, ferramentas e bibliotecas do SDK.', [
    ('dartbrasil.dev', 'https://dartbrasil.dev'),
  ]),
  _Doc('Angular', 'angular', 'Framework web', 'ar', 'Guias, tutoriais e referência do framework web do Google.', [
    ('angularbrasil.dev', 'https://angularbrasil.dev'),
  ]),
  _Doc('React Native', 'reactNative', 'Framework mobile', 'processo',
      'Tradução em andamento. Dá para ajudar revisando as páginas já traduzidas.'),
  _Doc('Go', 'go', 'Linguagem', 'ar',
      'Tutoriais, Effective Go, instalação, Por que Go e o Learn. O que falta abre no go.dev.', [
    ('go.documentacao.dev', 'https://go.documentacao.dev'),
  ]),
  _Doc('TypeScript', 'typeScript', 'Linguagem', 'ar',
      'O Handbook inteiro traduzido, do básico à manipulação de tipos.', [
    ('typescript.documentacao.dev', 'https://typescript.documentacao.dev/docs/handbook/intro.html'),
  ]),
  _Doc('Swift', 'swift', 'Linguagem', 'ar',
      'O livro do Swift inteiro: Tour guiado, Guia da linguagem e Referência.', [
    ('swift.documentacao.dev', 'https://swift.documentacao.dev'),
  ]),
  _Doc('Expo', 'expo', 'Plataforma React Native', 'ar',
      'Primeiros passos, Tutorial completo, Develop e Workflow. O resto entra toda semana.', [
    ('expo.documentacao.dev', 'https://expo.documentacao.dev'),
  ]),
  _Doc('Kotlin', 'kotlin', 'Linguagem', 'fila', 'Linguagem para Android e multiplataforma.'),
  _Doc('Next.js', 'nextJs', 'Framework web', 'fila', 'Framework React para aplicações web.'),
  _Doc('Rust', 'rust', 'Linguagem', 'ar',
      'O livro do Rust: capítulos 1 a 6 traduzidos, de primeiros passos a enums e match.', [
    ('rust.documentacao.dev', 'https://rust.documentacao.dev'),
  ]),
];

const _badges = {'ar': 'No ar', 'processo': 'Em tradução', 'fila': 'Na fila'};

int _conta(String s) => _docs.where((d) => d.status == s).length;

String _card(_Doc d) {
  final links = d.links.isEmpty
      ? '<a class="hub-ajude" href="/contribuir">Ajude a tirar da fila →</a>'
      : '<div class="hub-card-links">${d.links.map((l) => '<a href="${l.$2}"><span>${l.$1}</span>$_iconeSeta</a>').join()}</div>';
  return '''
<article class="hub-card" data-status="${d.status}">
  <div class="hub-card-topo">
    <div class="hub-card-id">
      <div class="hub-icone"><img src="/images/icones/${d.icone}.svg" alt="" width="30" height="30"></div>
      <div><h3>${d.nome}</h3><span class="hub-tipo">${d.tipo}</span></div>
    </div>
    <span class="hub-badge hub-badge-${d.status}">${_badges[d.status]}</span>
  </div>
  <p>${d.desc}</p>
  $links
</article>''';
}

/// Conteúdo da página inicial. Uso no markdown: `<HomePage/>`.
class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    final filtros = [('todas', 'Todas', _docs.length), for (final e in _badges.entries) (e.key, e.value, _conta(e.key))];
    return raw('''
<section class="hub-hero">
  <div class="hub-wrap hub-hero-grade">
    <div class="hub-hero-texto">
      <p class="hub-mono hub-amarelo">// docs oficiais, em pt-BR, feitas pela comunidade</p>
      <h1>Documentação técnica em português, sem abrir o tradutor em outra aba.</h1>
      <p class="hub-lead">Flutter, Dart, Angular, Go, TypeScript e Rust já estão no ar, sincronizados com o inglês. Termo técnico continua em inglês; o resto vira português de gente.</p>
      <div class="hub-botoes">
        <a class="hub-btn hub-btn-amarelo" href="#docs">Ver as documentações</a>
        <a class="hub-btn hub-btn-contorno" href="/contribuir">Quero ajudar a traduzir</a>
      </div>
    </div>
    <div class="hub-hero-lado">
      <div class="hub-terminal" aria-hidden="true">
        <div class="hub-t-cinza">\$ diff en.md pt-br.md</div>
        <div class="hub-t-menos">- Widgets are the building blocks of a Flutter app.</div>
        <div class="hub-t-mais">+ Widgets são os blocos de construção de um app Flutter.</div>
        <div class="hub-t-cinza" style="padding-top:8px">\$ verificar.py</div>
        <div><span class="hub-t-mais">✓</span> 768 páginas · 0 erros</div>
      </div>
      <div class="hub-numeros">
        <div><strong>${_conta('ar')}</strong><span>no ar</span></div>
        <div><strong>${_conta('processo')}</strong><span>em tradução</span></div>
        <div><strong>${_conta('fila')}</strong><span>na fila</span></div>
      </div>
    </div>
  </div>
  <div class="hub-faixa" aria-hidden="true"><div></div><div></div></div>
</section>

<section id="docs" class="hub-wrap hub-secao">
  <div class="hub-secao-topo">
    <div>
      <h2>Documentações</h2>
      <p class="hub-sub">Cada uma é um fork da documentação oficial, traduzido e mantido em dia.</p>
    </div>
    <div class="hub-filtros" role="group" aria-label="Filtrar por status">
      ${filtros.map((f) => '<button type="button" data-filtro="${f.$1}" aria-pressed="${f.$1 == 'todas'}">${f.$2} · ${f.$3}</button>').join()}
    </div>
  </div>
  <div class="hub-grade">
    ${_docs.map(_card).join()}
  </div>
</section>

<section id="como" class="hub-wrap hub-secao">
  <div class="hub-como">
    <div class="hub-como-texto">
      <p class="hub-mono hub-verde">COMO TRADUZIMOS</p>
      <h2>O inglês mudou? Na segunda-feira o português muda junto.</h2>
      <p class="hub-sub">Um ciclo automático acompanha o repositório oficial. Gente da comunidade revisa e decide o que entra.</p>
    </div>
    <ol class="hub-passos">
      <li><span class="hub-mono">01 · sync</span><h3>Puxa o upstream</h3><p>Toda semana o fork compara com a documentação oficial e separa só as páginas que mudaram.</p></li>
      <li><span class="hub-mono">02 · tradução</span><h3>Traduz o que mudou</h3><p>Código, links e âncoras ficam idênticos ao original. Só a prosa vira português.</p></li>
      <li><span class="hub-mono">03 · verificação</span><h3>Confere linha a linha</h3><p>Um verificador compara as duas versões e barra página defasada, link quebrado ou trecho esquecido.</p></li>
      <li><span class="hub-mono">04 · revisão</span><h3>Revisa e publica</h3><p>Tudo chega num pull request revisado. Só entra no site com os checks verdes.</p></li>
    </ol>
  </div>
</section>

<section id="contribuir" class="hub-wrap hub-secao hub-fim">
  <div class="hub-duo">
    <div class="hub-bloco hub-bloco-escuro">
      <h2>Achou uma frase estranha? Corrige com a gente.</h2>
      <p>Cada página tem um link para o arquivo no GitHub. Abre o PR, alguém revisa, e a correção vai pro ar no próximo deploy.</p>
      <div class="hub-botoes">
        <a class="hub-btn hub-btn-amarelo" href="https://github.com/documentacao-dev">Ver os repositórios</a>
        <a class="hub-btn hub-btn-contorno" href="https://github.com/documentacao-dev/documentacao.dev/issues">Sugerir uma tradução</a>
      </div>
    </div>
    <div class="hub-bloco hub-pix" id="apoie">
      <div class="hub-pix-texto">
        <div class="hub-pix-titulo">
          <div class="hub-moeda" aria-hidden="true">&lt;/&gt;</div>
          <h2>Buy me a token</h2>
        </div>
        <p>Cada página traduzida custa alguns tokens. Um PIX de qualquer valor paga a próxima leva e mantém as traduções em dia.</p>
        <span class="hub-mono hub-rotulo">PIX COPIA E COLA</span>
        <code class="hub-pix-codigo">$pixCopiaECola</code>
        <button type="button" class="hub-btn hub-btn-verde" data-copiar="$pixCopiaECola">Copiar código PIX</button>
      </div>
      <figure class="hub-qr">
        <img src="/images/pix-qr.svg" alt="QR code PIX para doar ao Documentação.dev" width="180" height="180">
        <figcaption>Aponte a câmera do app do banco</figcaption>
      </figure>
    </div>
  </div>
</section>''');
  }
}

/// Conteúdo da página Sobre. Uso no markdown: `<SobrePage/>`.
class SobrePage extends StatelessComponent {
  const SobrePage({super.key});

  @override
  Component build(BuildContext context) {
    const motivos = [
      ('Aprender mais rápido', 'Entender o conceito na sua língua primeiro deixa o resto da documentação muito mais leve.'),
      ('Menos barreira de entrada', 'Quem está começando já tem programação para aprender. Não precisa ser inglês e programação ao mesmo tempo.'),
      ('Comunidade mais forte', 'Cada revisão feita aqui vira conhecimento compartilhado entre desenvolvedores brasileiros.'),
      ('Inglês técnico de brinde', 'Os termos técnicos ficam em inglês. Lendo aqui, você aprende o vocabulário que vai usar no original.'),
    ];
    const criterios = [
      ('Tradução da documentação oficial', ', não um material paralelo.'),
      ('Mantida em dia', ' com o repositório original.'),
      ('Código aberto', ', com o fonte no GitHub e aberta a contribuições.'),
      ('Gratuita', ' para quem lê, sem cadastro.'),
    ];
    return raw('''
<section class="hub-hero">
  <div class="hub-wrap hub-hero-sobre">
    <p class="hub-mono hub-amarelo">// sobre o projeto</p>
    <h1>A tradução é a ponte. O destino continua sendo o inglês.</h1>
    <p class="hub-lead">O Documentação.dev reúne as traduções da comunidade brasileira para as documentações oficiais. A ideia é tirar a barreira do idioma de quem está começando, não substituir o original.</p>
  </div>
  <div class="hub-faixa" aria-hidden="true"><div></div><div></div></div>
</section>
<div class="hub-wrap hub-secao hub-fim hub-sobre">
  <section class="hub-como">
    <div class="hub-como-texto"><h2>Por que existe</h2></div>
    <div class="hub-passos hub-motivos">
      ${motivos.map((m) => '<div><h3>${m.$1}</h3><p>${m.$2}</p></div>').join()}
    </div>
  </section>
  <section class="hub-bloco hub-catalogo">
    <div class="hub-como-texto">
      <h2>O que entra no catálogo</h2>
      <p class="hub-sub">Conhece ou mantém uma tradução que cabe aqui? Abra uma issue no GitHub com o link.</p>
      <a class="hub-btn hub-btn-escuro" href="https://github.com/documentacao-dev/documentacao.dev/issues">Sugerir uma tradução</a>
    </div>
    <ul class="hub-criterios">
      ${criterios.map((c) => '<li>$_iconeCheck<span><strong>${c.$1}</strong>${c.$2}</span></li>').join()}
    </ul>
  </section>
</div>''');
  }
}

const _iconeGithub =
    '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"/></svg>';
const _iconeSeta =
    '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M7 17 17 7M7 7h10v10"/></svg>';
const _iconeCheck =
    '<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#007A30" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 6 9 17l-5-5"/></svg>';

const _js = r'''
document.querySelectorAll('[data-filtro]').forEach(function (b) {
  b.addEventListener('click', function () {
    var f = b.dataset.filtro;
    document.querySelectorAll('[data-filtro]').forEach(function (o) { o.setAttribute('aria-pressed', o === b); });
    document.querySelectorAll('.hub-card').forEach(function (c) { c.hidden = f !== 'todas' && c.dataset.status !== f; });
  });
});
document.querySelectorAll('[data-copiar]').forEach(function (b) {
  b.addEventListener('click', function () {
    var t = b.textContent;
    navigator.clipboard.writeText(b.dataset.copiar).then(function () {
      b.textContent = 'Código copiado';
      setTimeout(function () { b.textContent = t; }, 2000);
    });
  });
});
''';

const _css = r'''
:root{--navy:#0B1E3F;--navy2:#12294F;--borda-n:#23406D;--verde:#007A30;--amarelo:#FFD400;--fundo:#F6F7F9;--linha:#E2E8F0;--texto:#0F172A;--suave:#475569;--mudo:#64748B}
html{scroll-behavior:smooth}
body{margin:0;background:var(--fundo)}
.hub{font-family:Inter,system-ui,sans-serif;color:var(--texto);background:var(--fundo);min-height:100vh;-webkit-font-smoothing:antialiased}
.hub *{box-sizing:border-box}
.hub h1,.hub h2,.hub h3{font-family:'Space Grotesk',sans-serif;margin:0;color:inherit}
.hub p{margin:0}
.hub a{color:var(--navy)}
.hub-wrap{max-width:1200px;margin:0 auto;padding-left:24px;padding-right:24px}
.hub-mono{font-family:'JetBrains Mono',monospace;font-size:14px;letter-spacing:.04em}
.hub-amarelo{color:var(--amarelo)}
.hub-verde{color:var(--verde)}
.hub-topo{background:var(--navy);color:#fff}
.hub-nav{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:16px;padding-top:20px;padding-bottom:20px}
.hub .hub-marca{display:flex;align-items:center;gap:12px;color:#fff;text-decoration:none;font-family:'Space Grotesk',sans-serif;font-weight:700;font-size:20px;letter-spacing:-.01em}
.hub-marca img{border-radius:10px}
.hub-links{display:flex;flex-wrap:wrap;align-items:center;gap:4px}
.hub .hub-links a{color:#CBD5E1;text-decoration:none;font-size:15px;padding:12px 14px;border-radius:10px}
.hub .hub-links a:hover,.hub .hub-links a[aria-current]{color:#fff}
.hub .hub-links a[aria-current]{font-weight:600}
.hub .hub-links .hub-github{color:var(--navy);background:#fff;font-weight:600;padding:12px 16px;display:flex;align-items:center;gap:8px}
.hub .hub-links .hub-github:hover{color:var(--navy);filter:brightness(.95)}
.hub-hero{background:var(--navy);color:#fff}
.hub-hero-grade{display:flex;flex-wrap:wrap;align-items:center;gap:56px;padding-top:56px;padding-bottom:96px}
.hub-hero-texto{flex:999 1 560px;min-width:0;display:flex;flex-direction:column;gap:24px}
.hub-hero h1{font-weight:700;font-size:clamp(38px,6vw,68px);line-height:1.02;letter-spacing:-.03em}
.hub-lead{font-size:19px;line-height:1.6;color:#CBD5E1;max-width:640px}
.hub-botoes{display:flex;flex-wrap:wrap;gap:12px;padding-top:8px}
.hub .hub-btn{display:inline-block;text-decoration:none;font:600 16px Inter,sans-serif;padding:14px 22px;border-radius:12px;border:0;cursor:pointer;line-height:1.2}
.hub .hub-btn:hover{filter:brightness(1.06)}
.hub .hub-btn-amarelo{background:var(--amarelo);color:var(--navy)}
.hub .hub-btn-contorno{background:transparent;color:#fff;border:1px solid #3B4F73;padding:13px 21px}
.hub .hub-btn-verde{background:var(--verde);color:#fff;align-self:flex-start;margin-top:4px}
.hub .hub-btn-escuro{background:var(--navy);color:#fff;align-self:flex-start;margin-top:8px}
.hub-hero-lado{flex:1 1 320px;min-width:0;display:flex;flex-direction:column;gap:12px}
.hub-terminal{background:var(--navy2);border:1px solid var(--borda-n);border-radius:16px;padding:20px 22px;font:500 14px/1.75 'JetBrains Mono',monospace;color:#CBD5E1;overflow-x:auto}
.hub-t-cinza{color:#7D8FB0}.hub-t-menos{color:#FCA5A5}.hub-t-mais{color:#86EFAC}
.hub-numeros{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:12px}
.hub-numeros div{background:var(--navy2);border:1px solid var(--borda-n);border-radius:14px;padding:16px;display:flex;flex-direction:column}
.hub-numeros strong{font:700 32px 'Space Grotesk',sans-serif;color:#fff}
.hub-numeros span{font-size:13px;color:#A9B8D3}
.hub-faixa{display:flex;height:6px}.hub-faixa div{flex:1;background:#009C3B}.hub-faixa div+div{background:var(--amarelo)}
.hub-secao{padding-top:80px;padding-bottom:40px}
.hub-fim{padding-bottom:96px}
.hub-secao h2{font-size:40px;font-weight:700;letter-spacing:-.02em;line-height:1.1;color:var(--navy)}
.hub-sub{font-size:17px;line-height:1.6;color:var(--suave);margin-top:8px}
.hub-secao-topo{display:flex;flex-wrap:wrap;align-items:flex-end;justify-content:space-between;gap:20px;margin-bottom:32px}
.hub-filtros{display:flex;flex-wrap:wrap;gap:6px;background:#E8ECF2;padding:4px;border-radius:12px}
.hub-filtros button{border:0;cursor:pointer;font:600 14px Inter,sans-serif;padding:12px 14px;border-radius:9px;background:transparent;color:var(--suave)}
.hub-filtros button[aria-pressed=true]{background:#fff;color:var(--navy);box-shadow:0 1px 2px rgba(11,30,63,.12)}
.hub-grade{display:grid;grid-template-columns:repeat(auto-fill,minmax(min(100%,340px),1fr));gap:16px}
.hub-card{background:#fff;border:1px solid var(--linha);border-radius:18px;padding:24px;display:flex;flex-direction:column;gap:16px;transition:transform .15s ease,box-shadow .15s ease}
.hub-card[hidden]{display:none}
.hub-card:hover{transform:translateY(-2px);box-shadow:0 10px 28px rgba(11,30,63,.10)}
.hub-card-topo{display:flex;align-items:center;justify-content:space-between;gap:12px}
.hub-card-id{display:flex;align-items:center;gap:14px}
.hub-icone{width:52px;height:52px;flex:none;border-radius:14px;background:#F1F5F9;border:1px solid var(--linha);display:flex;align-items:center;justify-content:center}
.hub-card h3{font-size:22px;font-weight:700;color:var(--navy)}
.hub-tipo{font-size:14px;color:var(--mudo)}
.hub-card p{font-size:15px;line-height:1.6;color:var(--suave)}
.hub-badge{font-size:13px;font-weight:600;padding:6px 10px;border-radius:999px;white-space:nowrap}
.hub-badge-ar{background:#DCFCE7;color:#14532D}.hub-badge-processo{background:#FEF3C7;color:#78350F}.hub-badge-fila{background:var(--linha);color:#334155}
.hub-card-links{display:flex;flex-direction:column;gap:8px;margin-top:auto}
.hub .hub-card-links a{display:flex;align-items:center;justify-content:space-between;gap:8px;text-decoration:none;background:#F1F5F9;border-radius:10px;padding:12px 14px;font:500 14px 'JetBrains Mono',monospace;color:var(--navy)}
.hub .hub-card-links a:hover{background:#E2E8F0}
.hub .hub-ajude{margin-top:auto;font-size:14px;font-weight:600;color:var(--verde);text-decoration:none;padding:12px 0}
.hub-como{display:flex;flex-wrap:wrap;gap:48px}
.hub-como-texto{flex:1 1 320px;min-width:0;display:flex;flex-direction:column;gap:14px}
.hub-como-texto .hub-sub{margin-top:0}
.hub-passos{flex:999 1 560px;min-width:0;list-style:none;margin:0;padding:0;display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,190px),1fr));gap:16px}
.hub-passos>*{background:#fff;border:1px solid var(--linha);border-radius:16px;padding:22px;display:flex;flex-direction:column;gap:10px}
.hub-passos .hub-mono{font-size:13px;color:var(--mudo);letter-spacing:0}
.hub-passos h3{font-size:20px;color:var(--navy)}
.hub-passos p{font-size:15px;line-height:1.55;color:var(--suave)}
.hub-duo{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,420px),1fr));gap:16px}
.hub-bloco{background:#fff;border:1px solid var(--linha);border-radius:22px;padding:36px;display:flex;flex-direction:column;gap:16px}
.hub-bloco h2{font-size:30px}
.hub-bloco p{font-size:16px;line-height:1.6;color:var(--suave)}
.hub-bloco-escuro{background:var(--navy);border-color:var(--navy);color:#fff}
.hub-bloco-escuro h2{color:#fff}.hub-bloco-escuro p{color:#CBD5E1}
.hub-bloco-escuro .hub-botoes{margin-top:auto}
.hub-bloco-escuro .hub-btn{font-size:15px}
.hub-pix{flex-direction:row;flex-wrap:wrap;align-items:center;gap:28px}
.hub-pix-texto{flex:999 1 240px;min-width:0;display:flex;flex-direction:column;gap:12px}
.hub-pix-titulo{display:flex;align-items:center;gap:12px}
.hub-moeda{width:44px;height:44px;flex:none;border-radius:50%;background:var(--amarelo);border:3px solid #E0B800;display:flex;align-items:center;justify-content:center;font:500 15px 'JetBrains Mono',monospace;color:var(--navy)}
.hub-rotulo{font-size:12px;color:var(--mudo);padding-top:4px}
.hub-pix-codigo{display:block;font:500 12px/1.5 'JetBrains Mono',monospace;color:#334155;background:#F1F5F9;border:1px solid var(--linha);border-radius:10px;padding:10px 12px;word-break:break-all}
.hub .hub-pix .hub-btn{font-size:15px}
.hub-qr{flex:1 1 180px;margin:0;display:flex;flex-direction:column;align-items:center;gap:8px}
.hub-qr img{border-radius:12px;border:1px solid var(--linha);background:#fff}
.hub-qr figcaption{font-size:13px;color:var(--mudo)}
.hub-hero-sobre{display:flex;flex-direction:column;gap:18px;padding-top:40px;padding-bottom:72px}
.hub-hero-sobre h1{font-size:clamp(34px,5vw,56px);max-width:880px}
.hub-sobre{display:flex;flex-direction:column;gap:72px}
.hub-motivos{grid-template-columns:repeat(auto-fit,minmax(min(100%,260px),1fr))}
.hub-motivos h3{font-size:19px}
.hub-catalogo{flex-direction:row;flex-wrap:wrap;gap:40px;padding:40px}
.hub-catalogo h2{font-size:34px}
.hub-criterios{flex:999 1 480px;min-width:0;list-style:none;margin:0;padding:0;display:flex;flex-direction:column}
.hub-criterios li{display:flex;gap:14px;align-items:flex-start;padding:14px 0;border-bottom:1px solid var(--linha);font-size:16px;line-height:1.5}
.hub-criterios li:last-child{border-bottom:0}
.hub-criterios svg{flex:none;margin-top:2px}
.hub-criterios strong{color:var(--navy)}
.hub-rodape{border-top:1px solid var(--linha);background:#fff}
.hub-rodape-linha{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:16px;padding-top:32px;padding-bottom:32px}
.hub-rodape-marca{display:flex;align-items:center;gap:10px;font-size:14px;color:var(--suave)}
.hub-rodape-marca img{border-radius:7px}
.hub-rodape-links{display:flex;flex-wrap:wrap;gap:4px}
.hub .hub-rodape-links a{font-size:14px;color:var(--suave);text-decoration:none;padding:12px}
.hub .hub-rodape-links a:hover{color:var(--verde)}
@media (max-width:640px){.hub-secao h2{font-size:32px}.hub-bloco,.hub-catalogo{padding:24px}.hub-hero-grade{padding-bottom:64px}}
''';
