import 'package:jaspr/jaspr.dart';

/// A component that displays documentation cards in a modern grid layout.
class DocCards extends StatelessComponent {
  const DocCards({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'doc-cards-container',
      [
        h2(classes: 'doc-cards-title', [
          text('📚 Documentações Disponíveis')
        ]),
        div(
          classes: 'doc-cards-grid',
          [
            // Flutter Card 1
            _buildDocCard(
              icon: _flutterIcon(),
              title: 'FlutterBrasil.dev',
              description: 'Site oficial Flutter em PT-BR',
              features: [
                'Framework para criar aplicativos multiplataforma',
                'Documentação completa traduzida',
                'Tutoriais e guias em português',
              ],
              url: 'https://flutterbrasil.dev',
              badgeText: null,
              accentColor: '#02569B',
            ),
            // Flutter Card 2
            _buildDocCard(
              icon: _flutterIcon(),
              title: 'docs.flutterbrasil.dev',
              description: 'Documentação Flutter',
              features: [
                'Referência completa da API',
                'Guias de desenvolvimento',
                'Exemplos práticos',
              ],
              url: 'https://docs.flutterbrasil.dev',
              badgeText: null,
              accentColor: '#02569B',
            ),
            // Dart Card
            _buildDocCard(
              icon: _dartIcon(),
              title: 'DartBrasil.dev',
              description: 'Linguagem Dart e documentação',
              features: [
                'Linguagem de programação moderna',
                'Documentação oficial traduzida',
                'Recursos de aprendizado',
              ],
              url: 'https://dartbrasil.dev',
              badgeText: null,
              accentColor: '#0175C2',
            ),
            // Angular Card
            _buildDocCard(
              icon: _angularIcon(),
              title: 'Angular Brasil',
              description: 'Documentação Angular em PT-BR',
              features: [
                'Framework para aplicações web',
                'Documentação traduzida',
                'Contribuições bem-vindas',
              ],
              url: 'https://angularbrasil.web.app',
              badgeText: null,
              accentColor: '#DD0031',
            ),
            // React Native Card (In Progress)
            _buildDocCard(
              icon: _reactNativeIcon(),
              title: 'React Native Brasil',
              description: 'Documentação React Native em PT-BR',
              features: [
                'Framework para aplicativos mobile',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em processo',
              accentColor: '#61DAFB',
            ),
            // Go Card (Coming Soon)
            _buildDocCard(
              icon: _goIcon(),
              title: 'Go Brasil',
              description: 'Documentação Go em PT-BR',
              features: [
                'Linguagem de programação moderna',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#00ADD8',
            ),
            // TypeScript Card (Coming Soon)
            _buildDocCard(
              icon: _typeScriptIcon(),
              title: 'TypeScript Brasil',
              description: 'Documentação TypeScript em PT-BR',
              features: [
                'JavaScript com tipagem estática',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#3178C6',
            ),
            // Expo Card (Coming Soon)
            _buildDocCard(
              icon: _expoIcon(),
              title: 'Expo Brasil',
              description: 'Documentação Expo em PT-BR',
              features: [
                'Framework para apps React Native',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#000020',
            ),
            // Kotlin Card (Coming Soon)
            _buildDocCard(
              icon: _kotlinIcon(),
              title: 'Kotlin Brasil',
              description: 'Documentação Kotlin em PT-BR',
              features: [
                'Linguagem moderna para Android e multiplataforma',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#7F52FF',
            ),
            // Next.js Card (Coming Soon)
            _buildDocCard(
              icon: _nextJsIcon(),
              title: 'Next.js Brasil',
              description: 'Documentação Next.js em PT-BR',
              features: [
                'Framework React para aplicações web',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#000000',
            ),
            // Swift Card (Coming Soon)
            _buildDocCard(
              icon: _swiftIcon(),
              title: 'Swift Brasil',
              description: 'Documentação Swift em PT-BR',
              features: [
                'Linguagem para iOS, macOS e além',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#F05138',
            ),
            // Rust Card (Coming Soon)
            _buildDocCard(
              icon: _rustIcon(),
              title: 'Rust Brasil',
              description: 'Documentação Rust em PT-BR',
              features: [
                'Linguagem de sistemas segura e performática',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#000000',
            ),
          ],
        ),
        raw('''
<style>
.doc-cards-container {
  margin: 2rem 0;
}

.doc-cards-title {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 2rem;
  color: #2563eb;
}

.doc-cards-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
  margin: 2rem 0;
}

.doc-cards-grid > a {
  text-decoration: none;
  color: inherit;
}

.doc-card {
  position: relative;
  display: flex;
  flex-direction: column;
  background: #ffffff;
  border: 2px solid #e5e7eb;
  border-radius: 16px;
  padding: 1.5rem;
  transition: all 0.3s ease;
  text-decoration: none;
  color: inherit;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.doc-card:hover {
  transform: translateY(-4px);
  border-color: #3b82f6;
  box-shadow: 0 10px 30px rgba(59, 130, 246, 0.15);
  background: #f8faff;
}

.doc-card.disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.doc-card.disabled:hover {
  transform: none;
  border-color: #e5e7eb;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
  background: #ffffff;
}

.doc-card-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1rem;
}

.doc-card-icon {
  width: 48px;
  height: 48px;
  flex-shrink: 0;
  color: #111827;
}

.doc-card-icon svg {
  width: 100%;
  height: 100%;
}

.doc-card-title-group {
  flex: 1;
}

.doc-card-title {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 0 0 0.125rem 0;
  color: #1e40af;
}

.doc-card-description {
  font-size: 0.875rem;
  margin: 0;
  color: #6b7280;
}

.doc-card-badge {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: linear-gradient(135deg, #fbbf24, #f59e0b);
  color: #000;
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  box-shadow: 0 2px 4px rgba(251, 191, 36, 0.3);
}

.doc-card-features {
  list-style: none;
  padding: 0;
  margin: 1rem 0 0 0;
}

.doc-card-features li {
  padding: 0.5rem 0;
  padding-left: 1.5rem;
  position: relative;
  font-size: 0.9rem;
  line-height: 1.4;
  color: #374151;
}

.doc-card-features li::before {
  content: '✓';
  position: absolute;
  left: 0;
  color: #10b981;
  font-weight: bold;
  font-size: 1rem;
}

.doc-card-footer {
  margin-top: auto;
  padding-top: 1rem;
  border-top: 1px solid #e5e7eb;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.875rem;
  color: #2563eb;
  font-weight: 600;
}

.doc-card-footer svg {
  width: 16px;
  height: 16px;
}

@media (max-width: 768px) {
  .doc-cards-grid {
    grid-template-columns: 1fr;
  }

  .doc-card {
    padding: 1.25rem;
  }
}

/* Dark mode support */
@media (prefers-color-scheme: dark) {
  .doc-cards-title {
    color: #60a5fa;
  }

  .doc-card-icon {
    color: #f9fafb;
  }

  .doc-card {
    background: rgba(17, 24, 39, 0.8);
    border-color: rgba(75, 85, 99, 0.5);
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
  }

  .doc-card:hover {
    border-color: #60a5fa;
    box-shadow: 0 10px 30px rgba(96, 165, 250, 0.2);
    background: rgba(17, 24, 39, 0.95);
  }

  .doc-card.disabled:hover {
    border-color: rgba(75, 85, 99, 0.5);
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    background: rgba(17, 24, 39, 0.8);
  }

  .doc-card-title {
    color: #60a5fa;
  }

  .doc-card-description {
    color: #9ca3af;
  }

  .doc-card-features li {
    color: #d1d5db;
  }

  .doc-card-features li::before {
    color: #34d399;
  }

  .doc-card-footer {
    border-top-color: rgba(75, 85, 99, 0.3);
    color: #60a5fa;
  }
}
</style>
'''),
      ],
    );
  }

  Component _buildDocCard({
    required Component icon,
    required String title,
    required String description,
    required List<String> features,
    String? url,
    String? badgeText,
    required String accentColor,
  }) {
    final card = div(
      classes: url == null ? 'doc-card disabled' : 'doc-card',
      [
        if (badgeText != null)
          div(classes: 'doc-card-badge', [text(badgeText)]),
        div(
          classes: 'doc-card-header',
          [
            div(classes: 'doc-card-icon', [icon]),
            div(
              classes: 'doc-card-title-group',
              [
                h3(classes: 'doc-card-title', [text(title)]),
                p(classes: 'doc-card-description', [text(description)]),
              ],
            ),
          ],
        ),
        ul(
          classes: 'doc-card-features',
          features.map((feature) => li([text(feature)])).toList(),
        ),
        if (url != null)
          div(
            classes: 'doc-card-footer',
            [
              text('Acessar documentação'),
              raw('''<svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"/>
              </svg>'''),
            ],
          ),
      ],
    );

    if (url != null) {
      return a(
        href: url,
        target: Target.blank,
        [card],
      );
    }

    return card;
  }

  // Flutter icon (official logo from vectorlogo.zone)
  Component _flutterIcon() {
    return raw('''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 64 64">
  <g transform="matrix(.061615 0 0 .061615 -1.430818 -1.2754)">
    <defs><path id="A" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="B"><use xlink:href="#A"/></clipPath>
    <g clip-path="url(#B)"><path d="M360.3 779.7L520 939.5 959.4 500H639.9z" fill="#39cefd"/></g>
    <defs><path id="C" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="D"><use xlink:href="#C"/></clipPath>
    <path clip-path="url(#D)" d="M639.9 20.7h319.5l-679 679.1L120.6 540z" fill="#39cefd"/>
    <defs><path id="E" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="F"><use xlink:href="#E"/></clipPath>
    <path clip-path="url(#F)" d="M520 939.5l119.9 119.8h319.5L679.8 779.7z" fill="#03569b"/>
    <defs><path id="G" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="H"><use xlink:href="#G"/></clipPath>
    <linearGradient id="I" gradientUnits="userSpaceOnUse" x1="566.635" y1="970.339" x2="685.65" y2="851.324">
      <stop offset="0" stop-color="#1a237e" stop-opacity=".4"/>
      <stop offset="1" stop-color="#1a237e" stop-opacity="0"/>
    </linearGradient>
    <path clip-path="url(#H)" d="M757 857.4l-77.2-77.7L520 939.5z" fill="url(#I)"/>
    <defs><path id="J" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="K"><use xlink:href="#J"/></clipPath>
    <g clip-path="url(#K)"><path d="M360.282 779.645L520.086 619.84 679.9 779.645 520.086 939.45z" fill="#16b9fd"/></g>
    <radialGradient id="L" cx="7824.659" cy="-2855.979" r="5082.889" gradientTransform="matrix(0.25,0,0,-0.25,-1812,-622.5)" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#fff" stop-opacity=".1"/>
      <stop offset="1" stop-color="#fff" stop-opacity="0"/>
    </radialGradient>
    <path d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z" fill="url(#L)"/>
  </g>
</svg>
''');
  }

  // Dart icon (official logo from vectorlogo.zone)
  Component _dartIcon() {
    return raw('''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <path d="M17.582 17.424l-4.138-4.14.016 29.903.05 1.396c.02.66.145 1.4.345 2.17l32.775 11.56 8.2-3.63.007-.012L17.58 17.424z" fill="#00c4b3"/>
  <path d="M13.856 46.753h.003c-.003-.012-.008-.026-.014-.04.007.015.007.03.01.04zm40.966 7.93l-8.2 3.63-32.77-11.56c.625 2.404 2.012 5.106 3.502 6.58l10.69 10.637 23.788.03 2.98-9.317z" fill="#22d3c5"/>
  <g fill="#0075c9">
    <path d="M13.556 13.285L.813 32.53c-1.058 1.13-.53 3.462 1.173 5.18l7.356 7.416 4.624 1.63c-.2-.768-.326-1.5-.345-2.17l-.05-1.396-.015-29.903z"/>
    <path d="M46.9 13.67c-.77-.195-1.508-.318-2.173-.337l-1.478-.054-29.805.007 41.392 41.386 3.636-8.2-11.57-32.8z"/>
  </g>
  <path d="M46.862 13.663c.013.005.027.008.038.01v-.004c-.013-.003-.025-.003-.038-.008zm6.615 3.518c-1.505-1.515-4.17-2.9-6.577-3.508L58.47 46.47l-3.64 8.2 8.882-2.838.02-24.352-10.256-10.3z" fill="#00a8e1"/>
  <path d="M45.278 9.075l-7.4-7.36C36.152.018 33.82-.512 32.7.544l-19.244 12.74 29.805-.007 1.478.054c.665.02 1.404.142 2.173.337L45.28 9.073zm-31.833 4.2" fill="#00c4b3"/>
</svg>
''');
  }

  // Angular icon (official logo from vectorlogo.zone)
  Component _angularIcon() {
    return raw('''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <path d="M1 5.3L15.892 0l15.284 5.218-2.47 19.694L15.892 32 3.286 25.004 1 5.3z" fill="#e23237"/>
  <path d="M31.176 5.218L15.892 0v32l12.814-7.088 2.47-19.694z" fill="#b52e31"/>
  <path d="M15.915 3.74l-9.28 20.64 3.463-.07 1.87-4.664h8.3l2.032 4.7 3.302.07L15.915 3.74zm.023 6.626l3.14 6.557H13.2l2.747-6.557z" fill="#fff"/>
</svg>
''');
  }

  // React Native icon (official logo from vectorlogo.zone)
  Component _reactNativeIcon() {
    return raw('''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <g transform="matrix(.05696 0 0 .05696 .647744 2.43826)" fill="none" fill-rule="evenodd">
    <circle r="50.167" cy="237.628" cx="269.529" fill="#61DAFB"/>
    <g stroke="#61DAFB" stroke-width="24">
      <path d="M269.53 135.628c67.356 0 129.928 9.665 177.107 25.907 56.844 19.57 91.794 49.233 91.794 76.093 0 27.99-37.04 59.503-98.083 79.728-46.15 15.29-106.88 23.272-170.818 23.272-65.554 0-127.63-7.492-174.3-23.44-59.046-20.182-94.61-52.103-94.61-79.56 0-26.642 33.37-56.076 89.415-75.616 47.355-16.51 111.472-26.384 179.486-26.384z"/>
      <path d="M180.736 186.922c33.65-58.348 73.28-107.724 110.92-140.48C337.006 6.976 380.163-8.48 403.43 4.937c24.248 13.983 33.042 61.814 20.067 124.796-9.8 47.618-33.234 104.212-65.176 159.6-32.75 56.788-70.25 106.82-107.377 139.272-46.98 41.068-92.4 55.93-116.185 42.213-23.08-13.3-31.906-56.92-20.834-115.233 9.355-49.27 32.832-109.745 66.8-168.664z"/>
      <path d="M180.82 289.482C147.075 231.2 124.1 172.195 114.51 123.227c-11.544-59-3.382-104.11 19.864-117.566 24.224-14.024 70.055 2.244 118.14 44.94 36.356 32.28 73.688 80.837 105.723 136.173 32.844 56.733 57.46 114.21 67.036 162.582 12.117 61.213 2.31 107.984-21.453 121.74-23.057 13.348-65.25-.784-110.24-39.5-38.013-32.71-78.682-83.253-112.76-142.115z"/>
    </g>
  </g>
</svg>
''');
  }

  // Go icon (official logo from vectorlogo.zone)
  Component _goIcon() {
    return raw('''
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <style>.st0{fill:#00acd7}</style>
  <g>
    <path class="st0" d="M4.8 27.3c-.1 0-.2-.1-.1-.2l.7-.8c.1-.1.2-.2.3-.2h11.1c.1 0 .2.1.1.2l-.5.8c-.1.1-.2.2-.3.2H4.8zM.1 30.2c-.1 0-.1-.1-.1-.2l.7-.8c0-.1.2-.2.3-.2h14.2c.1 0 .2.1.2.2l-.2.7c0 .1-.2.2-.3.2l-14.8.1zM7.7 33c-.1 0-.2-.1-.1-.2l.4-.7c.1-.1.2-.2.3-.2h6.2c.1 0 .2.1.2.2l-.1.7c0 .1-.1.2-.2.2H7.7zM40 26.7l-5.2 1.4c-.5.1-.5.2-.9-.3-.5-.5-.8-.9-1.5-1.2-2-1-3.9-.7-5.6.5-2.1 1.4-3.2 3.4-3.2 5.9 0 2.5 1.7 4.5 4.2 4.9 2.1.3 3.9-.5 5.3-2.1.3-.3.5-.7.8-1.2h-6c-.7 0-.8-.4-.6-.9.4-1 1.2-2.6 1.6-3.4.1-.2.3-.5.8-.5H41c-.1.8-.1 1.7-.2 2.5-.3 2.2-1.2 4.3-2.6 6.1-2.2 3-5.2 4.8-8.9 5.3-3.1.4-5.9-.2-8.4-2.1-2.3-1.7-3.6-4.1-4-6.9-.4-3.4.6-6.4 2.6-9.1 2.2-2.9 5.1-4.7 8.7-5.4 2.9-.5 5.7-.2 8.3 1.5 1.7 1.1 2.8 2.6 3.6 4.4.4.4.3.5-.1.6z"/>
    <path class="st0" d="M50.3 44c-2.8-.1-5.4-.9-7.6-2.7-1.8-1.6-3-3.6-3.4-6-.6-3.5.4-6.6 2.5-9.4 2.3-3 5-4.5 8.7-5.2 3.2-.6 6.2-.2 8.9 1.6 2.5 1.7 4 4 4.4 6.9.5 4.2-.7 7.6-3.6 10.6-2.1 2.1-4.6 3.4-7.5 4-.7 0-1.6.1-2.4.2zm7.4-12.6c0-.4 0-.7-.1-1-.6-3.1-3.4-4.8-6.4-4.1-2.9.7-4.8 2.5-5.5 5.4-.6 2.4.6 4.9 2.9 5.9 1.7.7 3.4.7 5.1-.2 2.5-1.4 3.9-3.4 4-6z"/>
  </g>
</svg>
''');
  }

  // TypeScript icon (Simple Icons, CC0)
  Component _typeScriptIcon() {
    return raw('''
<svg fill="#3178C6" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M1.125 0C.502 0 0 .502 0 1.125v21.75C0 23.498.502 24 1.125 24h21.75c.623 0 1.125-.502 1.125-1.125V1.125C24 .502 23.498 0 22.875 0zm17.363 9.75c.612 0 1.154.037 1.627.111a6.38 6.38 0 0 1 1.306.34v2.458a3.95 3.95 0 0 0-.643-.361 5.093 5.093 0 0 0-.717-.26 5.453 5.453 0 0 0-1.426-.2c-.3 0-.573.028-.819.086a2.1 2.1 0 0 0-.623.242c-.17.104-.3.229-.393.374a.888.888 0 0 0-.14.49c0 .196.053.373.156.529.104.156.252.304.443.444s.423.276.696.41c.273.135.582.274.926.416.47.197.892.407 1.266.628.374.222.695.473.963.753.268.279.472.598.614.957.142.359.214.776.214 1.253 0 .657-.125 1.21-.373 1.656a3.033 3.033 0 0 1-1.012 1.085 4.38 4.38 0 0 1-1.487.596c-.566.12-1.163.18-1.79.18a9.916 9.916 0 0 1-1.84-.164 5.544 5.544 0 0 1-1.512-.493v-2.63a5.033 5.033 0 0 0 3.237 1.2c.333 0 .624-.03.872-.09.249-.06.456-.144.623-.25.166-.108.29-.234.373-.38a1.023 1.023 0 0 0-.074-1.089 2.12 2.12 0 0 0-.537-.5 5.597 5.597 0 0 0-.807-.444 27.72 27.72 0 0 0-1.007-.436c-.918-.383-1.602-.852-2.053-1.405-.45-.553-.676-1.222-.676-2.005 0-.614.123-1.141.369-1.582.246-.441.58-.804 1.004-1.089a4.494 4.494 0 0 1 1.47-.629 7.536 7.536 0 0 1 1.77-.201zm-15.113.188h9.563v2.166H9.506v9.646H6.789v-9.646H3.375z"/></svg>
''');
  }

  // Expo icon (Simple Icons, CC0)
  Component _expoIcon() {
    return raw('''
<svg fill="currentColor" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M0 20.084c.043.53.23 1.063.718 1.778.58.849 1.576 1.315 2.303.567.49-.505 5.794-9.776 8.35-13.29a.761.761 0 011.248 0c2.556 3.514 7.86 12.785 8.35 13.29.727.748 1.723.282 2.303-.567.57-.835.728-1.42.728-2.046 0-.426-8.26-15.798-9.092-17.078-.8-1.23-1.044-1.498-2.397-1.542h-1.032c-1.353.044-1.597.311-2.398 1.542C8.267 3.991.33 18.758 0 19.77Z"/></svg>
''');
  }

  // Kotlin icon (Simple Icons, CC0)
  Component _kotlinIcon() {
    return raw('''
<svg fill="#7F52FF" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M24 24H0V0h24L12 12Z"/></svg>
''');
  }

  // Next.js icon (Simple Icons, CC0)
  Component _nextJsIcon() {
    return raw('''
<svg fill="currentColor" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M18.665 21.978C16.758 23.255 14.465 24 12 24 5.377 24 0 18.623 0 12S5.377 0 12 0s12 5.377 12 12c0 3.583-1.574 6.801-4.067 9.001L9.219 7.2H7.2v9.596h1.615V9.251l9.85 12.727Zm-3.332-8.533 1.6 2.061V7.2h-1.6v6.245Z"/></svg>
''');
  }

  // Swift icon (Simple Icons, CC0)
  Component _swiftIcon() {
    return raw('''
<svg fill="#F05138" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M7.508 0c-.287 0-.573 0-.86.002-.241.002-.483.003-.724.01-.132.003-.263.009-.395.015A9.154 9.154 0 0 0 4.348.15 5.492 5.492 0 0 0 2.85.645 5.04 5.04 0 0 0 .645 2.848c-.245.48-.4.972-.495 1.5-.093.52-.122 1.05-.136 1.576a35.2 35.2 0 0 0-.012.724C0 6.935 0 7.221 0 7.508v8.984c0 .287 0 .575.002.862.002.24.005.481.012.722.014.526.043 1.057.136 1.576.095.528.25 1.02.495 1.5a5.03 5.03 0 0 0 2.205 2.203c.48.244.97.4 1.498.495.52.093 1.05.124 1.576.138.241.007.483.009.724.01.287.002.573.002.86.002h8.984c.287 0 .573 0 .86-.002.241-.001.483-.003.724-.01a10.523 10.523 0 0 0 1.578-.138 5.322 5.322 0 0 0 1.498-.495 5.035 5.035 0 0 0 2.203-2.203c.245-.48.4-.972.495-1.5.093-.52.124-1.05.138-1.576.007-.241.009-.481.01-.722.002-.287.002-.575.002-.862V7.508c0-.287 0-.573-.002-.86a33.662 33.662 0 0 0-.01-.724 10.5 10.5 0 0 0-.138-1.576 5.328 5.328 0 0 0-.495-1.5A5.039 5.039 0 0 0 21.152.645 5.32 5.32 0 0 0 19.654.15a10.493 10.493 0 0 0-1.578-.138 34.98 34.98 0 0 0-.722-.01C17.067 0 16.779 0 16.492 0H7.508zm6.035 3.41c4.114 2.47 6.545 7.162 5.549 11.131-.024.093-.05.181-.076.272l.002.001c2.062 2.538 1.5 5.258 1.236 4.745-1.072-2.086-3.066-1.568-4.088-1.043a6.803 6.803 0 0 1-.281.158l-.02.012-.002.002c-2.115 1.123-4.957 1.205-7.812-.022a12.568 12.568 0 0 1-5.64-4.838c.649.48 1.35.902 2.097 1.252 3.019 1.414 6.051 1.311 8.197-.002C9.651 12.73 7.101 9.67 5.146 7.191a10.628 10.628 0 0 1-1.005-1.384c2.34 2.142 6.038 4.83 7.365 5.576C8.69 8.408 6.208 4.743 6.324 4.86c4.436 4.47 8.528 6.996 8.528 6.996.154.085.27.154.36.213.085-.215.16-.437.224-.668.708-2.588-.09-5.548-1.893-7.992z"/></svg>
''');
  }

  // Rust icon (Simple Icons, CC0)
  Component _rustIcon() {
    return raw('''
<svg fill="currentColor" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M23.8346 11.7033l-1.0073-.6236a13.7268 13.7268 0 00-.0283-.2936l.8656-.8069a.3483.3483 0 00-.1154-.578l-1.1066-.414a8.4958 8.4958 0 00-.087-.2856l.6904-.9587a.3462.3462 0 00-.2257-.5446l-1.1663-.1894a9.3574 9.3574 0 00-.1407-.2622l.49-1.0761a.3437.3437 0 00-.0274-.3361.3486.3486 0 00-.3006-.154l-1.1845.0416a6.7444 6.7444 0 00-.1873-.2268l.2723-1.153a.3472.3472 0 00-.417-.4172l-1.1532.2724a14.0183 14.0183 0 00-.2278-.1873l.0415-1.1845a.3442.3442 0 00-.49-.328l-1.076.491c-.0872-.0476-.1742-.0952-.2623-.1407l-.1903-1.1673A.3483.3483 0 0016.256.955l-.9597.6905a8.4867 8.4867 0 00-.2855-.086l-.414-1.1066a.3483.3483 0 00-.5781-.1154l-.8069.8666a9.2936 9.2936 0 00-.2936-.0284L12.2946.1683a.3462.3462 0 00-.5892 0l-.6236 1.0073a13.7383 13.7383 0 00-.2936.0284L9.9803.3374a.3462.3462 0 00-.578.1154l-.4141 1.1065c-.0962.0274-.1903.0567-.2855.086L7.744.955a.3483.3483 0 00-.5447.2258L7.009 2.348a9.3574 9.3574 0 00-.2622.1407l-1.0762-.491a.3462.3462 0 00-.49.328l.0416 1.1845a7.9826 7.9826 0 00-.2278.1873L3.8413 3.425a.3472.3472 0 00-.4171.4171l.2713 1.1531c-.0628.075-.1255.1509-.1863.2268l-1.1845-.0415a.3462.3462 0 00-.328.49l.491 1.0761a9.167 9.167 0 00-.1407.2622l-1.1662.1894a.3483.3483 0 00-.2258.5446l.6904.9587a13.303 13.303 0 00-.087.2855l-1.1065.414a.3483.3483 0 00-.1155.5781l.8656.807a9.2936 9.2936 0 00-.0283.2935l-1.0073.6236a.3442.3442 0 000 .5892l1.0073.6236c.008.0982.0182.1964.0283.2936l-.8656.8079a.3462.3462 0 00.1155.578l1.1065.4141c.0273.0962.0567.1914.087.2855l-.6904.9587a.3452.3452 0 00.2268.5447l1.1662.1893c.0456.088.0922.1751.1408.2622l-.491 1.0762a.3462.3462 0 00.328.49l1.1834-.0415c.0618.0769.1235.1528.1873.2277l-.2713 1.1541a.3462.3462 0 00.4171.4161l1.153-.2713c.075.0638.151.1255.2279.1863l-.0415 1.1845a.3442.3442 0 00.49.327l1.0761-.49c.087.0486.1741.0951.2622.1407l.1903 1.1662a.3483.3483 0 00.5447.2268l.9587-.6904a9.299 9.299 0 00.2855.087l.414 1.1066a.3452.3452 0 00.5781.1154l.8079-.8656c.0972.0111.1954.0203.2936.0294l.6236 1.0073a.3472.3472 0 00.5892 0l.6236-1.0073c.0982-.0091.1964-.0183.2936-.0294l.8069.8656a.3483.3483 0 00.578-.1154l.4141-1.1066a8.4626 8.4626 0 00.2855-.087l.9587.6904a.3452.3452 0 00.5447-.2268l.1903-1.1662c.088-.0456.1751-.0931.2622-.1407l1.0762.49a.3472.3472 0 00.49-.327l-.0415-1.1845a6.7267 6.7267 0 00.2267-.1863l1.1531.2713a.3472.3472 0 00.4171-.416l-.2713-1.1542c.0628-.0749.1255-.1508.1863-.2278l1.1845.0415a.3442.3442 0 00.328-.49l-.49-1.076c.0475-.0872.0951-.1742.1407-.2623l1.1662-.1893a.3483.3483 0 00.2258-.5447l-.6904-.9587.087-.2855 1.1066-.414a.3462.3462 0 00.1154-.5781l-.8656-.8079c.0101-.0972.0202-.1954.0283-.2936l1.0073-.6236a.3442.3442 0 000-.5892zm-6.7413 8.3551a.7138.7138 0 01.2986-1.396.714.714 0 11-.2997 1.396zm-.3422-2.3142a.649.649 0 00-.7715.5l-.3573 1.6685c-1.1035.501-2.3285.7795-3.6193.7795a8.7368 8.7368 0 01-3.6951-.814l-.3574-1.6684a.648.648 0 00-.7714-.499l-1.473.3158a8.7216 8.7216 0 01-.7613-.898h7.1676c.081 0 .1356-.0141.1356-.088v-2.536c0-.074-.0536-.0881-.1356-.0881h-2.0966v-1.6077h2.2677c.2065 0 1.1065.0587 1.394 1.2088.0901.3533.2875 1.5044.4232 1.8729.1346.413.6833 1.2381 1.2685 1.2381h3.5716a.7492.7492 0 00.1296-.0131 8.7874 8.7874 0 01-.8119.9526zM6.8369 20.024a.714.714 0 11-.2997-1.396.714.714 0 01.2997 1.396zM4.1177 8.9972a.7137.7137 0 11-1.304.5791.7137.7137 0 011.304-.579zm-.8352 1.9813l1.5347-.6824a.65.65 0 00.33-.8585l-.3158-.7147h1.2432v5.6025H3.5669a8.7753 8.7753 0 01-.2834-3.348zm6.7343-.5437V8.7836h2.9601c.153 0 1.0792.1772 1.0792.8697 0 .575-.7107.7815-1.2948.7815zm10.7574 1.4862c0 .2187-.008.4363-.0243.651h-.9c-.09 0-.1265.0586-.1265.1477v.413c0 .973-.5487 1.1846-1.0296 1.2382-.4576.0517-.9648-.1913-1.0275-.4717-.2704-1.5186-.7198-1.8436-1.4305-2.4034.8817-.5599 1.799-1.386 1.799-2.4915 0-1.1936-.819-1.9458-1.3769-2.3153-.7825-.5163-1.6491-.6195-1.883-.6195H5.4682a8.7651 8.7651 0 014.907-2.7699l1.0974 1.151a.648.648 0 00.9182.0213l1.227-1.1743a8.7753 8.7753 0 016.0044 4.2762l-.8403 1.8982a.652.652 0 00.33.8585l1.6178.7188c.0283.2875.0425.577.0425.8717zm-9.3006-9.5993a.7128.7128 0 11.984 1.0316.7137.7137 0 01-.984-1.0316zm8.3389 6.71a.7107.7107 0 01.9395-.3625.7137.7137 0 11-.9405.3635z"/></svg>
''');
  }
}
