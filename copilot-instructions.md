## Sobre o elemento

<!-- image -->

### Guidelines

- Componente de navegação que pode agrupar vários TabBarItem

### Funções / Modificadores

| Atributo                                | Parametro       | Default   | Descrição                                                |
|-----------------------------------------|-----------------|-----------|----------------------------------------------------------|
| func setItems(_ items: [TabBarItemDTO]) | [TabBarItemDTO] | undefined | Define os itens do TabBa                                 |
| func didSelect(at index: Int)           | Int             | undefined | Ação a ser tomada quando um item do TabBar é selecionado |

### Exemplos

```
enum RootFactory {
    static func makeController(delegate: UITabBarControllerDelegate) -> UIViewController {
        let tabBarController = UITabBarController()
        ThemeManager.shared.setupGold()
		let tabBar = ArtemisConverter().toTabBar()
        tabBarController.delegate = delegate
        tabBarController.setValue(tabBar, forKey: "tabBar")
        let dtos = [
            TabBarItemDTO(title: "Comp", icon: ImageName.icHome, isSelected: true),
            TabBarItemDTO(title: "Module", icon: ImageName.icWallet, isSelected: false),
            TabBarItemDTO(title: "Template", icon: ImageName.icCreditCard, isSelected: false),
            TabBarItemDTO(title: "Chassi", icon: ImageName.icBag, isSelected: false),
            TabBarItemDTO(title: "Lib", icon: ImageName.icMenu, isSelected: false)
        ]
        tabBarController.viewControllers = dtos.enumerated().map { _, dto in
            tabGenerate(tabBar: tabBar, item: dto.title)
        }
        tabBar.setItems(dtos)
        return tabBarController
    }
}
```

## Acessibilidade

- O que deve ser lido pelo Voice Over :
- O que deve ser lido pelo Voice Over:
    - Rótulo ou texto alternativo do item + semântica: Tab + estado: selecionado para o item ativo.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

### Guidelines

- Possui a opção com e sem Identifier.

- Podendo apresentar Tag, sendo por padrão desativado.

### Funções / Modificadores

| Atributo                                   | Parametro              | Default   | Descrição                                                |
|--------------------------------------------|------------------------|-----------|----------------------------------------------------------|
| func setDTO(_ dto: ShapeListActionItemDTO) | ShapeListActionItemDTO | undefined | Método de injeção de conteúdo através de um DTO próprio. |

### ShapeListActionItemDTO

| Atributo               | Tipo                               | Default   | Descrição                                                    |
|------------------------|------------------------------------|-----------|--------------------------------------------------------------|
| listContentAreaDTO     | ListContentAreaDTO                 | undefined | DTO para o ListContentAreaDTO                                |
| elementActionImageName | ElementActionImageName             | undefined | DTO para o ElementActionImageName                            |
| identifierDTO          | IdentifierDTO?                     | nil       | DTO opcional para o IdentifierDTO                            |
| tagDTO                 | TagDTO?                            | nil       | DTO opcional para o TagDTO                                   |
| isMoreOptions          | Bool                               | false     | Indica se é uma opção de "Mais opções"                       |
| appleWalletActionType  | ShapeListItemAppleWalletTypeAction | nil       | Indica o status do componente em relação a carteira da apple |

### Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    lazy var shapeListActionItem0 = dependencies
            .artemisBaseComponents
            .toShapeListActionItemAppleWallet()
            .setDTO(
                  ShapeListActionItemDTO(
                      listContentAreaDTO: .init(label: "Celular"),
                      elementActionImageName: .icArrowRight,
                      identifierDTO: .normalIcon(image: .icPhone, accessibilityValue: ""),
                      appleWalletActionType: .addToWallet
                  )
              )
              
    lazy var shapeListActionItem1 = dependencies
            .artemisBaseComponents
            .toShapeListActionItemAppleWallet()
            .setDTO(
                  ShapeListActionItemDTO(
                      listContentAreaDTO: .init(label: "Celular"),
                      elementActionImageName: .icArrowRight,
                      identifierDTO: .normalIcon(image: .icPhone, accessibilityValue: ""),
                      appleWalletActionType: .validateCard
                  )
              )
              
      lazy var shapeListActionItem2 = dependencies
            .artemisBaseComponents
            .toShapeListActionItemAppleWallet()
            .setDTO(
                  ShapeListActionItemDTO(
                      listContentAreaDTO: .init(label: "Relógio"),
                      elementActionImageName: .icArrowRight,
                      identifierDTO: .normalIcon(image: .icSmartWatch, accessibilityValue: ""),
                      appleWalletActionType: .added
                  )
              )
    
    lazy var shapeListActionItem3 = dependencies
            .artemisBaseComponents
            .toShapeListActionItemAppleWallet()
            .setDTO(
                  ShapeListActionItemDTO(
                      listContentAreaDTO: .init(label: "Relógio"),
                      elementActionImageName: .icArrowRight,
                      identifierDTO: .normalIcon(image: .icSmartWatch, accessibilityValue: ""),
                      appleWalletActionType: .custom("Verificando", shouldHideIcon: true)
                  )
              )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser lido pelo Voice Over :
- O que deve ser lido pelo Voice Over:
    - Text &gt; tag ou badge (Se houver) &gt; semântica "button" (caso seja interativo).

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any ShapeListActionItemInterface = {
        let converter = ArtemisConverter()
        return toSkeletonShapeListActionItemDigitalWallet()
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - MenuListItemDTO
    - Exemplos
    - Acessibilidade
- Skeleton
    - Exemplo

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

### Guidelines

- Componente usado para montar o Gavetão/Menu
- Possui limite máximo de 1 linha e deve truncar o texto caso ultrapasse a area do mesmo.
- Componente possui tapstate

| Atributo                                                 | Parametro           | Default   | Descrição                            |
|----------------------------------------------------------|---------------------|-----------|--------------------------------------|
| func setDefaultStyle(_ style: MenuListItemStyle) -> Self | .default .highlight | undefined | Define o estilo padrão do componente |
| func setStyle(_ style: MenuListItemDTO) -> Self          | MenuListItemDTO     | undefined | Define o estilo do componente        |

### MenuListItemDTO

| Atributo        | Tipo              | Default   | Descrição                                         |
|-----------------|-------------------|-----------|---------------------------------------------------|
| title           | String?           | undefined | Título do item de lista de menu                   |
| animatedTextDTO | AnimatedTextDTO?  | undefined |                                                   |
| tagTitle        | String?           | undefined | Título da tag do item de lista de menu (opcional) |
| icon            | ImageName         | undefined | Ícone do item de lista de menu                    |
| style           | MenuListItemStyle | undefined | Estilo do item de lista de menu.                  |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var menuListItem = dependencies
        .artemisComponents
        .toMenuListItem()
        .setDTO( 
              .staticTitle(
                  "Title",
                  icon: .icAddCard,
                  tagTitle: "Tag",
                  style: .highlight
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Todo conteúdo de texto existente
    - Semântica: button.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonMenuListItem()
    }()
    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
    required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.remakeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
        }
        customView.startShimmer()
     }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ] [  ] [  ] [  ]

Os componentes do tipo MenuCardListItem se tratam de cards a serem implementados dentro de uma MenuCardList. A lista será implementada em um grid com 2 elementos, e em caso de número ímpar de itens, o último item ocupará a largura total da lista.

A classe MenuCardListItem é a responsável por criar nosso componente customizado. Ela herda da classe UIView.

#### Guidelines

- Possui comportamento em grid de 2 itens ou individual, em caso de número ímpar de itens;
- Contém um ícone do DS e um texto de até 2 linhas;
- Preferencialmente deve ser utilizado dentro de um MenuCardList

### Funções / Modificadores

| Função                                                | Parâmetro          | Descrição                                                 |
|-------------------------------------------------------|--------------------|-----------------------------------------------------------|
| func setStyle(_ style: MenuCardListItemStyle) -> Self | .default           | Define o estilo do componente                             |
| func setDTO(_ dto: MenuCardListItemDTO) -> Self       | MenuCarListItemDTO | Define os dados configuráveis do componente. Veja abaixo. |

### MenuCardListItemDTO

| Atributo   | Tipo                  | Default   | Descrição             |
|------------|-----------------------|-----------|-----------------------|
| title      | String                | undefined | Título do item        |
| icon       | String                | undefined | Nome do ícone do item |
| style      | MenuCardListItemStyle | .default  | Estilo do componente  |

### Variações

| Grid   | Individual   |
|--------|--------------|
|        |              |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()

    var customViews: [any MenuCardListItemInterface] = []

    private let dto: [MenuCardListItemDTO]

    init(dto: [MenuCardListItemDTO]) {
        self.dto = dto
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        for itemDTO in dto {
            let view = dependencies.artemisBaseComponents.toMenuCardListItem(initialConfiguration: .config(self))
            view.setDTO(itemDTO)
            customViews.append(view)
            stackView.addArrangedSubview(view)
        }

        for view in customViews {
            view
                .onLoad { dto in
                    print(">>>> MenuCardListItem on load \(dto)")
                }
                .onAppear { dto in
                    print(">>>> MenuCardListItem on appear \(dto)")
                }
                .onClick { dto in
                    print(">>>> Clicou no card com o seguinte dto: \n \(dto)")
                }

            view.onAppear()
        }
    }
}
```

## Acessibilidade

O item terá a trait de botão, e o label informado para o item será equivalente ao título informado no DTO.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!- Carousel View
- Text / iOS
- Margin Toggle
- SkeletonView
- Spinner / iOS
- NavProgressBar
- Animated Image## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
- Exemplos
- Acessibilidade

<!-- image -->

#### Guidelines

O componente Tab Bar é uma barra de navegação que deve ser usada na parte inferior da tela.

### Funções / Modificadores

| Atributo                                | Parametro       | Default   | Descrição                            |
|-----------------------------------------|-----------------|-----------|--------------------------------------|
| func setItems(_ items: [TabBarItemDTO]) | [TabBarItemDTO] | undefined | Define o array de itens da TabBar.   |
| func didSelect(at index: Int)           | Int             | undefined | Define o índice do item selecionado. |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    let items = [
      TabBarItemDTO(title: "Home", icon: .icHome)
    ]
    
    lazy var tabBarView = dependencies
        .artemisComponents
        .toTabBarView()
		.setItems(
			items
		)
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

a) Programaticamente deve ser construído como um agrupamento de itens (region/container) que são navegáveis de forma individual;
b) O item ativo deve se distinguir dos demais visual e verbalmente;
c) A distinção visual entre o item ativo e os demais não deve se limitar apenas a diferenciação por cores;
d) Os itens que possuirem apenas ícone, precisam ter um texto alternativo que descreva de forma clara e objetiva seu propósito.
e) O que deve ser lido:
rótulo ou texto alternativo do item + semântica: Tab + estado: selecionado (para o item ativo, os demais não anunciam seu estado).

Comportamento e interação:

a) Um toque: em qualquer item pela primeira vez deve anunciar "Barra de abas &gt; rótulo &gt; tab/guia &gt; estado (somente quando ativo)";
b) Um toque: depois da primeira interação deve anunciar "rótulo &gt; tab/guia &gt; estado (somente quando ativo)";
c) Dois toques: ativa o item e anuncia o estado (selecionado).
d) Ao ativar um item o foco se mantém no button da Tabbar (é familiar para o usuário navegar até o conteúdo).

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!# Helpers

## Internamente

Dentro do NavBarDTO temos alguns fixtures Padroes para reuso de forma externa ao DS

- public static func backAndCloseLocalizableDTO() -&gt; Self
- public static func backAndCloseLocalizableDTO() -&gt; Self
    - Adicionar ambos os buttons padroes de Voltar e Fechar do lado direito
- static func backLocalizableDTO() -&gt; Self
- static func backLocalizableDTO() -&gt; Self
    - Adiciona somente o botao de Voltar
- static func closeLocalizableDTO() -&gt; Self
- static func closeLocalizableDTO() -&gt; Self
    - Adiciona somente o botão de Fechar do lado direito

## Externamente

Dentro do NavBarDTO temos alguns fixtures Padroes para reuso de forma externa ao DS

- public static func backAndCloseDTO() -&gt; Self
- public static func backAndCloseDTO() -&gt; Self
    - Adicionar ambos os buttons padroes de Voltar e Fechar do lado direito
- static func backDTO() -&gt; Self
- static func backDTO() -&gt; Self
    - Adiciona somente o botao de Voltar
- static func closeDTO() -&gt; Self
- static func closeDTO() -&gt; Self
    - Adiciona somente o botão de Fechar do lado direito
- static func backAndCloseWithNavProgressBarDTO(totalSteps: Int, currentStep: Int, style: NavProgressBarStyle) → Self
- static func backAndCloseWithNavProgressBarDTO(totalSteps: Int, currentStep: Int, style: NavProgressBarStyle) → Self
    - Adicionar ambos os buttons padroes de Voltar e Fechar do lado direito e o progresso no centro

# Sobre o Componente

Criamos uma inversao de dependencia onde internamente implementamos a navBar e com isso qualquer mudanca nela irá refletir para todos automaticamente.

### Variações Gold

| Standard   | Inverse   | Clear   | ClearInverse   |
|------------|-----------|---------|----------------|
|            |           |         |                |

### Variações Epic

| Standard   | Inverse   | Clear   | ClearInverse   |
|------------|-----------|---------|----------------|
|            |           |         |                |

### Funções / Modificadores

| Atributo                                                                                                                                                                                                                 | Parametros                                                                                                                                                                                                                                                                         | Descrição                                       |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| func toNavBar<T: UIViewController>( _ viewController: T, dto: NavBarDTO,  style: NavBarStyle,  onBackClick: (() -> Void)? = nil, onFirstRightClick: (() -> Void)? = nil,  onSecondRightClick: (() -> Void)? = nil ) -> T | ViewController que necessita configurar a NavBardto onde podem configurar items da navBar alem do seu titleStyle que define aparencia da Navbar, como nos exemplo acima.Callback do click do botão de voltarCallback do primeiro item da direitaCallback do segund item da direita | Metodo que configura a navBar da ViewController |

### NavBarDTO

| Atributo        | Tipo        | Default   | Descrição                         |
|-----------------|-------------|-----------|-----------------------------------|
| backItem        | NavBarItem? | nil       | Item de volta do NavBar           |
| title           | String?     | nil       | Título do NavBar                  |
| rightFirstItem  | NavBarItem? | nil       | Primeiro item à direita do NavBar |
| secondFirstItem | NavBarItem? | nil       | Segundo item à direita do NavBar  |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomViewController: ArtemisViewController<Interactor> {
    let dependencies: Dependencies
    ...
    
    func setupNavigation(_ themeName: ThemeName, _ style: NavBarStyle) {
        let dto = NavBarDTO(
            backItem: .init(
                image: .icArrowLeft,
                accessibilityLabel: "Voltar"
            ),
            rightFirstItem: .init(
                image: .icSettings,
                accessibilityLabel: "Mudar tema"
            ),
            rightSecondItem: .init(
                image: .icEdit,
                accessibilityLabel: "Mudar configurações"
            )
        )

        dependencies.artemisComponents.toNavBar(
            self,
            dto: dto,
            style: style,
            onBackClick: {
                [weak self] in
                guard let self else { return }
            },
            onFirstRightClick: { [weak self] in
                guard let self else { return }
            },
            onSecondRightClick: { [weak self] in
                guard let self else { return }
            }
        )
    }
}
```

## Acessibilidade

a) Os itens devem ser focados e anunciados pelo LT individualmente;
b) Cada circular button deve ter um texto alternativo que contextualize seu propósito;
c) O title deve conter semântica "Heading";
d) O Progressbar deve ter um texto alternativo que represente a mesma proporção visual em percentual: ex.: um progressbar preenchido numa proporção de 3/4, teria como texto alternativo "75%";
e) O que deve ser lido:
Texto alternativo do circular button + Semântica "button";
Texto do title + Semântica "headind" / Texto alternativo do progressbar;
Texto alternativo do circular button + Semântica "button".

Comportamento e interação:

a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques no circular button ativa o CTA.

### Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonCarouselInterface = dependencies.artemisComponents.toSkeletonNavBar(
        accessibilityAnnouncement: String()
    )


    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

Carrossel de banners utilizado para apresentar ofertas.

### Guidelines

- Swipe do Carousel Offer Banner é Paginado.
- Suporta até 7 Offer Banners.

### Funções / Modificadores

| Atributo                                 | Parametro            | Default   | Descrição                                                   |
|------------------------------------------|----------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: [BannerOfferItemDTO]) | [BannerOfferItemDTO] | undefined | Define os dados configuráreis do componente. Veja a abaixo. |

### Atributos

| Atributo   | Tipo                 | Default   | Descrição                       |
|------------|----------------------|-----------|---------------------------------|
| items      | [BannerOfferItemDTO] | undefined | Define os banners do componente |

## Exemplos

```
import ArtemisComponentsInterface
final class CustomView: UIView {
    let dependencies: Dependencies
    lazy var bannerOfferCarousel = dependencies
        .artemisComponents
        .toBannerOfferCarousel()
        .setDTO(
            [BannerOfferItemDTO(title: "Empréstimos",
             description: "Pegue agora um empréstimo de até R$ 4.000,00.",
             buttonTitle: "Simular agora",
             imageURL: ""]) //Substituir por uma url valida
        )
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildLayout() {
      view.addSubview(bannerOfferCarousel)
          
      bannerOfferCarousel.snp.makeConstraints {
            $0.edges.equalToSuperview()
      }

      bannerOfferCarousel
              .setDTO(dto)
              .onLoad { [weak self] dto in
                  print(">>>> BannerOfferCarousel on load \(dto)")
              }
              .onAppear { [weak self] dto in
                  print(">>>> BannerOfferCarousel on appear \(dto)")
              }
              .onClickChild { [weak self] index, _ in
                  print(">>>> BannerOfferCarousel on click \(index)")
              }
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Elemento permite criar uma animação em tela através de um arquivo Lottie

## Funções / Modificadores

| Atributo                                                                                    | Parametro                                  | Default       | Descrição                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|---------------------------------------------------------------------------------------------|--------------------------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| func setStyle(_ style: AnimatedImageStyle) -> Self                                          | AnimatedImageStyle                         |               | Método de configuração de estilo da imagem animada                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| func setDTO(_ dto: AnimatedImageDTO) -> Self                                                | AnimatedImageDTO                           |               | Método de injeção de conteúdo através de um Data Transfer Object próprio                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| func play(reversed: Bool, _ animationSpeed: CGFloat?) -> Self                               | reversed: Bool, _ animationSpeed: CGFloat? |               | Método para iniciar a reprodução da animação                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| func pause() -> Self                                                                        |                                            |               | Método para pausar a animação                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| func stop() -> Self                                                                         |                                            |               | Método para parar a animação                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| func setCurrentProgress(_ progress: CGFloat) -> Self                                        | _ progress: CGFloat                        |               | Método para definir o progresso atual da animação                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| func setForegroundColor(_ color: NotTokenableColorName, _ keypath: [String]? = nil) -> Self | NotTokenableColorName                      | keypath = nil | Método para a cor de contorno da animação. É possível também definir o caminho customizado da camada dentro do arquivo JSON que se deseja trocar de cor, esse valor altera de acordo com o arquivo Lottie utilizado.   Valor default escolhido:["**", "Shape", "**", "Fill 1", "**", "Color"]FUNCIONA nos arquivos:AnimatedEnum.lottieCheckEpic2024AnimatedEnum.lottieCheckGold2024AnimatedEnum.lottieCheckPJ2024AnimatedEnum.lottieRadioEpic2024AnimatedEnum.lottieRadioGold202AnimatedEnum.lottieRadioPJ2024 |
| func setBackgroundBehavior(_ behavior: AnimatedBackgroundBehavior) -> Self                  | behavior: AnimatedBackgroundBehavior       | stop          | AnimatedBackgroundBehavior.stopAnimatedBackgroundBehavior.pauseAnimatedBackgroundBehavior.pauseAndRestoreAnimatedBackgroundBehavior.forceFinish                                                                                                                                                                                                                                                                                                                                                                |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    typealias Dependencies = HasThemeTokensInterface & HasArtemisBaseComponentsInterface
    let dependencies: Dependencies

    lazy var animatedImage = dependencies.artemisBaseComponents
        .toAnimatedImage(initialConfiguration: initialConfiguration)
        .setStyle(
            anatomyProperties.animatedStyle
        )
        .setDTO(
            anatomyProperties.animatedDTO
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Atributos
    - Funções / Modificadores
    - Variações
- Como utilizar
- Acessibilidade

O Spinner é um componente animado usado para informar carregamento sem tempo determinado.

A classe SpinnerView é responsável por criar o componente na aplicação, herda apenas de uma UIView comum do UIKit.

Um exemplo de uso do componente Spinner pode ser encontrado na classe SpinnerFactory

#### Guidelines

- Componente possui versão Default (verde) e versão On-Color (branco)
- Componente possui 3 tamanhos
- Utilizado no componente Button Item Primary

### Atributos

| Atributo         | Tipo             | Default   | Descrição                    |
|------------------|------------------|-----------|------------------------------|
| animatedImageDTO | AnimatedImageDTO | N/A       | Define a animação do spinner |

### Funções / Modificadores

| Função                   | Descrição                                                   |
|--------------------------|-------------------------------------------------------------|
| smallDefault() -> Self   | Cria um spinner do tamanho pequeno com a cor padrão (verde) |
| smallOnColor() -> Self   | Cria um spinner do tamanho pequeno com a cor branca         |
| smallCritical() -> Self  | Cria um spinner do tamanho pequeno com a cor vermelha       |
| smallBlack() -> Self     | Cria um spinner do tamanho pequeno com a cor preta          |
| mediumDefault() -> Self  | Cria um spinner do tamanho médio com a cor padrão (verde)   |
| mediumOnColor() -> Self  | Cria um spinner do tamanho médio com a cor branca           |
| mediumCritical() -> Self | Cria um spinner do tamanho médio com a cor vermelha         |
| mediumBlack() -> Self    | Cria um spinner do tamanho médio com a cor preta            |
| largeDefault() -> Self   | Cria um spinner do tamanho grande com a cor padrão (verde)  |
| largeOnColor() -> Self   | Cria um spinner do tamanho grande com a cor branca          |
| largeCritical() -> Self  | Cria um spinner do tamanho grande com a cor vermelha        |
| largeBlack() -> Self     | Cria um spinner do tamanho grande com a cor preta           |

### Variações

- Tamanhos disponíveis:

| Small   | Medium   | Large   |
|---------|----------|---------|
|         |          |         |
| 24dp    | 40dp     | 56dp    |

## Como utilizar

#### Implementação via código

```
final class SpinnerCell: UITableViewCell {
    lazy var customView: any SpinnerInterface = {
        let converter = ArtemisConverter()
        return converter.toSpinner()
    }()

    private let dto: SpinnerDTO
    private let spinnerBackgroundColor: UIColor
    init(
        dto: SpinnerDTO,
        spinnerBackgroundColor: UIColor
    ) {
        self.dto = dto
        self.spinnerBackgroundColor = spinnerBackgroundColor
        super.init(
            style: .default,
            reuseIdentifier: "custom"
        )
        buildLayout()
    }

    required init?(
        coder: NSCoder
    ) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp
            .makeConstraints {
                $0.edges
                    .equalToSuperview()
                    .inset(16)
            }

        customView
            .setDTO(dto)
            .setBackgroundColor(spinnerBackgroundColor)
            .onLoad { [weak self] dto in
                print(">>>> Spinner on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> Spinner on appear \(dto)")
            }
            .onChange { [weak self] dto in
                print(">>>> Spinner on change \(dto)")
            }

            customView.onAppear()
    }

    static func make(
        dto: SpinnerDTO,
        spinnerBackgroundColor: UIColor = .clear
    ) -> SpinnerCell {
        return SpinnerCell(
            dto: dto,
            spinnerBackgroundColor: spinnerBackgroundColor
        )
    }
}
```

<!-- image -->

## Acessibilidade

Ao iniciar o loading anuncia "Carregando" apenas uma vez, ao finalizar, anuncia"Informações atualizadas". Um arrasto vertical 3 dedos inicia o loading e as mensagens são anunciadas.## Sobre o elemento

- Sobre o elemento
    - Variações de estilo e tamanho
    - Funções / Modificadores
    - SolutionCardDTO
- Skeleton
- Exemplos
- Acessibilidade

Implementa os protocolos:

ComponentProtocol

ComponentEventProtocol

OnSecondaryClickEventProtocol

ScrollableCardInterface

IsScrollingInterface

#### Guidelines

- Possui versão highlightOn, highlightOff
- Possui variações de tamanho small, medium, large
- description possui limite de 3 linhas
- description possui limite de 3 linhas
    - Exceção: tamanho medium possui limite de somente 2 linhas
- Para que seja possível apresentar markdown, utilizar da função setDTO por último como na sessão Exemplo abaixo.

### Variações de estilo e tamanho

| Small   | Medium   | Large   |
|---------|----------|---------|
|         |          |         |

### Funções / Modificadores

| Atributo                                                                   | Parametro                        | Default       | Descrição                                                                              |
|----------------------------------------------------------------------------|----------------------------------|---------------|----------------------------------------------------------------------------------------|
| func setStyle(_ style: SolutionCardStyle)                                  | '.highlightOn' | '.highlightOff' | .highlightOff | Define o estilo do componente                                                          |
| func setSize(_ size: SolutionCardSize)                                     | '.small' | '.medium' | '.large'  | .large        | Define o tamanho do componente                                                         |
| func setDTO(_ dto: SolutionCardDTO)                                        | SolutionCardDTO                  | undefined     | Define os dados configuraveis do componente. Veja a abaixo.                            |
| func fadeHighlightedStyleToDefaultStyleAnimation(with percentage: CGFloat) | none                             | undefined     | Usado pelo SolutionCardCarousel para fazer animação do Style Highlight para o Default. |

### SolutionCardDTO

| Atributo          | Tipo         | Default   | Descrição                                                                                                                                                                               |
|-------------------|--------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| titleText         | String       | undefined | Valor do title do card                                                                                                                                                                  |
| descriptionsTexts | [String]     | undefined | Pode ser passado N descriptions, ao passar mais de 1 description ele tera animação. descriptions possuem limites de 3 linhas para tamanhos small e large e 2 linhas para tamanho medium |
| buttonText        | String       | undefined | Valor do title do button                                                                                                                                                                |
| iconName          | ImageName    | undefined | Imagem utilizando assets do DS                                                                                                                                                          |
| animationDelay    | TimeInterval | undefined | Tempo de troca para um description para outro animado                                                                                                                                   |

## Skeleton

<!-- image -->

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var solutionCard = dependencies
        .artemisComponents
        .toSolutionCard()
        .setStyle(.default)
        .setDTO(
                .init(
                    cardDTOs: [
                        SolutionCardDTO(
                            titleText: "Title",
                            descriptionsTexts: [
                                "Short \ndescription \nabout...",
                                "Short \ndescription",
                                "Short"
                            ],
                            buttonText: "Label",
                            iconName: .apolloPlaceholder,
                            animationDelay: 4.0
                        ),
                        SolutionCardDTO(
                            titleText: "Title1",
                            descriptionsTexts: [
                                "Short \ndescription \nabout...",
                                "Short \ndescription",
                                "Short"
                            ],
                            buttonText: "Label",
                            iconName: .apolloPlaceholder,
                            animationDelay: 4.0
                        ),
                        SolutionCardDTO(
                            titleText: "Title1",
                            descriptionsTexts: [
                                "Short \ndescription \nabout...",
                                "Short \ndescription",
                                "Short"
                            ],
                            buttonText: "Label",
                            iconName: .apolloPlaceholder,
                            animationDelay: 4.0
                        )
                    ]
                )
            )
            .didTap {
              print(style)
             }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func didTap() {}
}
```

Skeleton

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonSolutionCard()
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
        customView.startShimmer()
    }
```

## Acessibilidade

a) Cada card deve ser lido individualmente pelo LT;
b) Os itens do card devem ser agrupados para uma leitura única pelo LT;
c) O ícone deve ser decorativo;
d) Quando houver mais de um texto para o "description", ambos devem ser concatenados para a o anúncio do LT;
e) O que deve ser lido:Title + description + button flex + semântica button.

Comportamento e interação

a) Um toque: foca cada card individualmente e o LT anuncia todo conteúdo textual;
b) Dois toques: aciona o CTA.

```
extension SolutionCardEpicDTO {
    var accessibilityValue: String {
        var values: [String] = [titleText]
        values.append(contentsOf: descriptionsTexts)
        values.append(buttonText)
        return makeAccessibilityValue(values)
    }
    
    private func makeAccessibilityValue(_ strings: [String]) -> String {
        strings.joined(separator: ", ")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - ShapeListActionDTO
- Exemplos

<!-- image -->

#### Guidelines

- Componente utilizado para listar itens .

### Funções / Modificadores

| Atributo                                       | Parametro                                                                                                                                      | Default   | Descrição                                                |
|------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------|
| func setDTO(_ dto: ShapeListActionDTO) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/4081942759?draftShareId=cdc2b020-1c5b-4fac-8b36-c1ee1d073641#ShapeListActionDTO | undefined | Define dados configuráveis do componente. Veja a abaixo. |

### ShapeListActionDTO

| Atributo                                        | Tipo                            | Default   | Descrição              |
|-------------------------------------------------|---------------------------------|-----------|------------------------|
| items                                           | [Shape List Action Item / iOS ] | undefined | Define itens da lista. |
| ShapeListActionItemDTO ShapeListActionItemStyle | [ShapeListActionDTOsAndStyles]  |           |                        |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    let dto = [
      (
        listContentAreaDTO: .init(label: "Top label"),
        elementActionImageName: .icArrowRight,
        identifierDTO: .normalIcon(image: .icPlaceholder, accessibilityValue: ""),
        tagDTO: .init(title: "Ativo")
      )
    ]
    
    lazy var shapeList = dependencies
        .artemisComponents
        .toShapeListAction(
            isScrollable: false
        )
		.setDTO(
			dto
		)
		
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - PersonaCarouselItemDTO
- Exemplos
- Acessibilidade

<!-- image -->

<!-- image -->

<!-- image -->

#### Guidelines

- Componente totalmente voltado para apresentação de pessoas utilizando avatar e identifiers.

### Funções / Modificadores

| Atributo                                   | Parametro              | Default   | Descrição                                                   |
|--------------------------------------------|------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: PersonaCarouselItemDTO) | PersonaCarouselItemDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo. |

### PersonaCarouselItemDTO

| Atributo   | Tipo                 | Default   | Descrição                                                                 |
|------------|----------------------|-----------|---------------------------------------------------------------------------|
| label      | String               | undefined | Rótulo do item de carrossel de pessoa                                     |
| initials   | String               | undefined | Iniciais do item de carrossel de pessoa                                   |
| subLabel   | String?              | nil       | Texto abaixo do rótulo do carrossel de pessoa (opcional)                  |
| image      | ImageDTO?            | nil       | Imagem do item de carrossel de pessoa (opcional)                          |
| tag        | TagArgumentativeDTO? | nil       | Tag do item de carrossel de pessoa (opcional)                             |
| badge      | BadgeDTO?            | nil       | Badge do canto superior direito do item de carrossel de pessoa (opcional) |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var personaCarouselItem = dependencies
        .artemisComponents
        .toPersonaCarouselItemDTO()
        .setDTO(
            PersonaCarouselItemDTO(
                label: "Antônio Ricardo", 
                initials: "AR", 
                subLabel: "2 Contas", 
                tag: .init(title: "tag"), 
                badge: .heartFilledIcon(
                    content: .icHeartFilled, 
                    accessibilityValue: "contato favorito"
                )
            )
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser lido pelo Voice Over:
- O que deve ser lido pelo Voice Over:
    - caso tenha foto: “Foto de”; caso não tenha foto: “Avatar de “
    - texto da label;
    - texto da subLabel, caso tenha;
    - title da Tag;
    - accessibilityValue, do Badge;
    - com semântica de botão;
- O LT deve possuir somente 1 único foco no componente

#### Comportamento e interação:

- Um toque: aplica o foco visível no Person Carousel Iten e o LT anuncia seu respectivo conteúdo;
- Dois toques: aciona o CTA.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

Utilizado para a construção do Módulo Header Container Value/Title. Depende dos componentes ElementAction / iOS e Divider / iOS

### Funções / Modificadores

| Atributo                                        | Parametro          | Default   | Descrição                                    |
|-------------------------------------------------|--------------------|-----------|----------------------------------------------|
| func setDTO(_ dto: ActionItemDTO) -> Self       | ActionItemDTO      | undefined | Define os dados configuraveis do componente. |
| func setStyle(_ style: ActionItemStyle) -> Self | .custom .`default` | undefined | Define o estilo do componente.               |

### ActionItemDTO

| Atributo           | Tipo               | Default   | Descrição                  |
|--------------------|--------------------|-----------|----------------------------|
| contentColor       | UIColor            | undefined | Cor do conteúdo do item    |
| overlayColor       | UIColor            | undefined | Cor do overlay do item     |
| dividerStyle       | DividerStyles      | undefined | Estilo do divisor do item  |
| elementActionStyle | ElementActionStyle | undefined | Estilo da ação do elemento |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var actionItem = dependencies
            .artemisBaseComponents
            .toActionItem()
            .setDTO(
                .init(
                    text: "Action",
                    elementAction: ElementActionDTO(
                        image: .icChevronRight
                      )
                )
            )
            .setStyle(
                style: .default
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- O que sera transcrito pelo Voice Over:
- O que sera transcrito pelo Voice Over:
    - Herdará do componente 'pai' a semântica, o estado, as formas de interação e comportamentos;

## Skeleton

```
lazy var customView: any SkeletonComponent = {
        let converter = ArtemisConverter()
        return converter.toSkeletonActionItem()
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(16)
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - ButtonItemDTO
- Exemplos
- Acessibilidade

<!-- image -->

#### Guidelines

- Propósito deste componente é mudar o conteúdo do botão conforme a seleção;
- Texto tem limite de 29 characters;
- Possui Tapstate;
- Possui estado disabled e enable

### Funções / Modificadores

| Atributo                                                              | Parametro                                                                                        | Default   | Descrição                                                                                    |
|-----------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------------------------------------------|
| func animateState(dto: ButtonItemDTO, isFromTop: Bool, enabled: Bool) | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/4056088773#ButtonItemDTO BoolBool | undefined | Define dados configuráveis no botão, o ponto de início da animação e estado disabled/enable. |

### ButtonItemDTO

| Atributo   | Tipo   | Default   | Descrição                                    |
|------------|--------|-----------|----------------------------------------------|
| title      | String | undefined | Valor do texto do botao                      |
| hasArrow   | Bool   | false     | Flag indicativa de exibição de ícone de seta |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    lazy var buttonDynamicBySelect = dependencies
        .artemisComponents
        .toButtonDynamicBySelect()
        .animateState(
            dto: ButtonItemDTO(
                "Continuar"
            ),
            isFromTop: true,
            enabled: true
        )
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Requisitos de conformidade WCAG

- a) O rótulo deve descrever com clareza a finalidade de cada Dynamic Button By Selection;
- b) Quando o rótulo do Dynamic Button By Selection for alterado o Leitor de Telas deve anunciá-lo, sem alteração de foco, ou seja, anuncia, porém permanece no componente em que está;
- c) Deve ser aplicada a semântica de “Button";
- d) O que deve ser lido: Conteúdo textual + Semântica: button.

Comportamento e interação

- a) Quando o conteúdo textual é alterado: o leitor de telas deve anunciá-lo;
- b) Um toque: aplica o foco visível e o LT anuncia conteúdo textual + semântica;
- c) Dois toques: ativa o CTA.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ] [  ] [  ]

<!-- image -->

Os componentes do tipo ContainerImageFull se trata de uma imagem que vai ser adicionada como a view de fundo de uma viewController, ela preencherá toda a tela.

A classe ContainerImageFullView é a responsável por criar nosso componente customizado, nessa classe contém a criação da camada de gradiente que pode ou não ser aplicada ao componente.

Um exemplo de uso do componente ContainerImageFull pode ser encontrado no nosso UISample.

#### Guidelines

Descreva as diretrizes/regras do componente.. Por exemplo:

- Possui 2 formas de ser apresentado, com camada de overlay gradiente ou sem;
- Recebe uma imagem a ser preenchida em toda a tela, mantendo a proporção;
- Não possui uma ação.

### Funções / Modificadores

| Função                               | Descrição                                                           |
|--------------------------------------|---------------------------------------------------------------------|
| setDTO(_ dto: ContainerImageFullDTO) | Método para atribuir o parâmetro necessário para usar o componente. |

#### ContainerImageFullDTO

| Atributo   | Tipo     | Default   | Descrição                                                             |
|------------|----------|-----------|-----------------------------------------------------------------------|
| imageDTO   | ImageDTO | undefined | Define o objeto da imagem que será usada para preencher o componente. |
| hasOverlay | Bool     | undefined | Define a aparição da camada de gradiente overlay.                     |

## Como utilizar

1. Criando a referência para usar o componente:

<!-- image -->

```
final class ContainerImageFullView: UIView {
    lazy var customView: any ContainerImageFullInterface = {
        let converter = ArtemisConverter()
        return converter.toContainerImageFull()
    }()

    private let dto: ContainerImageFullDTO
    init(dto: ContainerImageFullDTO) {
        self.dto = dto
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        customView
            .setDTO(dto)
            .onLoad { [weak self] dto in
                print(">>>> ContainerImageFull on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> ContainerImageFull on appear \(dto)")
            }

            customView.onAppear()
    }

    static func make(dto: ContainerImageFullDTO) -> ContainerImageFullView {
        return ContainerImageFullView(dto: dto)
    }
}
```

1. Utilização:
Após, basta atribuir a viewController que vc desejar utilizar o componente.
let imageDTO = .init(image: "apl3\_illu\_person\_desk\_green\_card")
viewController.view = ContainerImageFullView.make(
  dto: .init(imageDTO: imageDTO,
             hasOverlay: true)
)

## Exemplos

## Acessibilidade

Sem especificação de acessibilidade na spec do componente.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
    - Atributos
    - Exemplos

Sobre o elemento

Shape List Single Select Bundle é um componente para atender listagens de seleção simples.

Só é possível aplicar Radio Button (seleção single) em cada item.

### Guidelines

- Recebe uma lista de de items do tipo ShapeListSingleSelectItemDTO.
- Componente pode ter o item de mais opções no final da lista.
- Se seu produto refaz o dto do componente a cada nova seleção é necessário implementar o método  onClickChild e para que a animação ocorra corretamente a chamada para seu interactor deve ficar dentro do itemSelectedAfterAnimation, caso contrário é apenas necessário implementar o método onClickChild.
- Caso receba uma lista com somente um item marcado esse manterá seu estado de inicialização.
- Caso receba uma lista com nenhum item  no estado selecionado, nenhum elemento será atribuído como selecionado.
- Caso receba mais de um item com o estado selecionado, somente o item com o atributo de selecionado true e mais ao final da lista estará habilitado.
- É possível adicionar/remover margens no top e bottom da lista, default é ambas habilitadas

### Funções / Modificadores

| Atributo                                                                          | Parametro                                      | Default   | Descrição                                                                                       |
|-----------------------------------------------------------------------------------|------------------------------------------------|-----------|-------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ShapeListSingleSelectBundleDTO)                                | ShapeListSingleSelectBundleDTO                 | undefined | Define os dados configuráveis do componente. Veja abaixo.                                       |
| func itemSelectedAfterAnimation(_ callback: @escaping (Int, DTOProtocol) -> Void) | callback: @escaping (Int, DTOProtocol) -> Void | undefined | Método utilizado para setar a callback que será executada no final das animações do componente. |
| func getSelectedItem() -> Int?                                                    | N/A                                            | nil       | Método utilizado para retornar o index que está atualmente selecionado na lista.                |
| enableTopMargin                                                                   | Bool                                           | true      | Toggle de margem de topo do componente                                                          |
| enableBottomMargin                                                                | Bool                                           | true      | Toggle de margem de baixo do componente                                                         |

### Atributos

| Atributo                   | Tipo                           | Default   | Descrição                                                |
|----------------------------|--------------------------------|-----------|----------------------------------------------------------|
| items                      | [ShapeListSingleSelectItemDTO] | undefined | Define os itens que serão apresentados na lista.         |
| shapeListMoreOptionItemDTO | ShapeListMoreOptionItemDTO?    | nil       | Define o componente de mais opções no final da listagem. |

### Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    let dto = ShapeListSingleSelectBundleDTO(items: [ShapeListSingleSelectItemDTO(listContentAreaDTO: ListContentAreaDTO(label: "Top Label"),
                                                                                  isSelected: true,
                                                                                  identifierDTO: .highlightIcon(image: .icPix, accessibilityValue: "")),
                                                     ShapeListSingleSelectItemDTO(listContentAreaDTO: ListContentAreaDTO(label: "Top Label"),
                                                                                  isSelected: false,
                                                                                  identifierDTO: .highlightIcon(image: .icPix, accessibilityValue: "")),
                                                     ShapeListSingleSelectItemDTO(listContentAreaDTO: ListContentAreaDTO(label: "Top Label"),
                                                                                  isSelected: false,
                                                                                  identifierDTO: .highlightIcon(image: .icPix, accessibilityValue: ""))])
    //Caso necessite do componente MoreOptions, basta passar na inicialização do ShapeListSingleSelectBundleDTO                                                           
    lazy var shapeListSingleSelectBundle = dependencies
             .artemisComponents
             .toShapeListSingleSelectBundle()
             .setDTO(dto)
          
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        setupComponent()
    }
    
    func setupComponent() {
          customView
          .onClickChild { [weak self] index, dto  in
              print(">>>> ShapeListSingleSelectItem on ClickChild \(dto)")
          }.onChangeChild { [weak self] _, dto  in
              print(">>>> ShapeListSingleSelectItem on ChangeChild \(dto)")
          }.itemSelectedAfterAnimation { [weak self] index, dto in
              print(">>>> ShapeListSingleSelectItem itemSelectedAfterAnimation \(index) \(dto)")
          }
          //Caso tenha o moreOptions pode capturar o click através do método:
          .onMoreOptionsClick { [weak self] _, dto  in
                print(">>>> ShapeListSingleSelectItem on MoreOptionsClick \(dto)")
          }      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
    - TitleDTO
    - Protocolos usados
    - Variações
- Exemplos
- Acessibilidade
- Skeleton
    - Exemplo

Os componentes do tipo Title se tratam de containers de textos bastante usados no inicio das telas para indicar o contexto atual e uma descrição. Também há a possibilidade de adicionar um botão ao container.

A classe TitleView é a responsável por criar o componente. Os arquivos com a custom view e suas demais configurações estão no pacote UIComponents, dentro do módulo ArtemisComponents

Um exemplo de uso do componente ApolloAvatar pode ser encontrado no nosso ArtemisComponentsSample que pode ser acessado no projeto ou via TestFlight.

### Guidelines

- Title possui 10 Variantes, Título; Título + Botão; Título + Descrição; Título + Botão + Descrição + Ícone; Título + Subtítulo; Título + Botão + Subtítulo + Ícone; Título (largura fixa em 290px); Título + Botão (largura fixa em 290px); Título + Descrição (largura fixa em 290px); Título + Descrição + Botão (largura fixa em 290px);

Atributos do componente:

- Listados a baixo

### Funções / Modificadores

Caso faça sentido, preencha a tabela abaixo com as funções criadas especificamente para configurar o componente:

| Atributo                                   | Parametro                         | Default   | Descrição                                                   |
|--------------------------------------------|-----------------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: AvatarDTO) -> Self      | TitleDTO                          | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: TitleStyle) -> Self | .normal .inverse.critical .custom | undefined | Define o estilo da imagem do componente.                    |

### TitleDTO

| Atributo                 | Tipo                | Default   | Descrição                                                                                  |
|--------------------------|---------------------|-----------|--------------------------------------------------------------------------------------------|
| titleText                | String              | N/A       | Este atributo contém o texto principal do título. É um valor obrigatório                   |
| titleAccessibilityValue  | String?             | nil       | Texto opcional que fornece um valor de acessibilidade para o título                        |
| titleAccessibilityHint   | String?             | nil       | Texto do valor de dica da acessibilidade ao Título                                         |
| iconDTO                  | ImageDTO?           | nil       | Data Transfer Object para o ImageDTO                                                       |
| descriptionText          | String?             | nil       | Texto da descrição                                                                         |
| subtitleText             | String?             | nil       | Texto de subtítulo                                                                         |
| descriptionLineBreakMode | TitleLineBreakMode? | nil       | Define como será a quebra de texto, caso necessário.                                       |
| subtitleLineBreakMode    | TitleLineBreakMode? | nil       | Define como será a quebra de texto, caso necessário.                                       |
| buttonDTO                | ButtonFlexDTO?      | nil       | Data Transfer Object para o ButtonDTO                                                      |
| toFlow()                 | TitleDTO            | N/A       | Método que retorna uma instância configurada para a variação flow                          |
| formatter                | FormatterType       | .markdown | Altera o tipo de formatação utilizada para interpretar o texto. Poder ser HTML ou Markdown |

### Protocolos usados

ComponentProtocol;

BaseEventsProtocol;

OnSecondaryClickEventProtocol;

### Variações

- Styles disponíveis:

| Normal   | Inverse   |                                                                                                                               |                                                                                                                                |
|----------|-----------|-------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
|          |           | Listado em sequencia de cima para baixo o componente nas variações de:Título + Botão + Subtítulo + Ícone; Título + Subtítulo; | Listado em sequencia de cima para baixo o componente nas variações de: Título + Botão + Subtítulo + Ícone; Título + Subtítulo; |
| Critical | Custom    |                                                                                                                               |                                                                                                                                |
|          |           | Título + Botão + Subtítulo + Ícone; Título + Subtítulo                                                                        |                                                                                                                                |
| Brand    |           |                                                                                                                               |                                                                                                                                |
|          |           |                                                                                                                               |                                                                                                                                |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    // init do DTO com descrição:
    lazy var title = dependencies
        .artemisComponents
        .toTitle()
        .setDTO(
            .init(
            titleText: "Título de seção",
            descriptionText: "Descrição da seção",
            buttonDTO: ButtonFlexDTO(title: "Botão"),
            iconDTO: .icon(
                image: .icShieldFilled,
                isClickable: true)
            )
        )
        .setStyle(.normal)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    // init do DTO com subtítulo:
    lazy var title = dependencies
        .artemisComponents
        .toTitle()
        .setDTO(
            .init(
            titleText: "Título de seção",
            subtitleText: "Subtítulo da seção",
            buttonDTO: ButtonFlexDTO(title: "Botão"),
            iconDTO: .icon(
                image: .icShieldFilled,
                isClickable: true)
            )
        )
        .setStyle(.normal)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Title (Sem description e button flex)
a) Cada title deve ser focado e anunciado pelo LT individualmente;
b) Deve ser aplicada a semãntica de "Heading";
c) O que deve ser lido:
Conteúdo do title + Semântica: "Heading";

Comportamento e interação:
a) Um toque: aplica o foco visível e o LT anuncia o conteúdo do title + semântica;
b) Arrasto vertical: navega individualmente pelos titles ("rotor &gt; Headings" em iOS e "Controles de leitura &gt; Títulos" em android).

Title (com description)
a) Title e description devem ser focados e anunciado pelo LT individualmente;
b) Title: Deve ser aplicada a semãntica de "Heading";
c) Description deve ser considerada apenas text;
d) O que deve ser lido:
title + semãntica "Heading";
Description.

Comportamento e interação:
a) Um toque no Title: aplica o foco visível e o LT anuncia o conteúdo do title + semântica;
b) Um toque na description: aplica o foco visível e o LT anuncia o conteúdo da description;
c) Arrasto vertical: navega individualmente pelos titles ("rotor &gt; Headings" em iOS e "Controles de leitura &gt; Títulos" em android).

Title (com description e button flex)
a) Title, description e button devem ser agrupados para o foco vísível e anuncio do LT;
b) Deve ser aplicada a semântica de "Button";
c) O que deve ser lido:
title + description + button flex + semãntica "Button".

Comportamento e interação:
a) Um toque: aplica o foco visível e o LT anuncia o conteúdo do title + description + button flex + semântica "Button";
b) Dois toques: ativa o CTA.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any LoadableInterface = dependencies.artemisComponents.toLoadableTitle(
    style: .default,
    accessibilityAnnouncement: "Carregando"
).loadable

// Ou Caso queira usar apenas o skeleton sem o ComponentLoadable
// lazy var customView: any SkeletonCarouselInterface = dependencies.artemisComponents.toSkeletonTitle(
//     style: .default,
//     accessibilityAnnouncement: "Carregando"
// )

private let style: SkeletonStyle
init(style: SkeletonStyle) {
    self.style = style
    super.init(style: .default, reuseIdentifier: "custom")
    buildLayout()
}

required init?(coder: NSCoder) {
    nil
}

func buildLayout() {
    view.addSubview(customView)
    let color = style == .onColor ? UIColor(hex: "#1BA285") : .white
    view.backgroundColor = color

    customView.snp.makeConstraints {
        $0.edges.equalToSuperview().inset(20)
    }
    customView.startShimmer()
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - MerchantCarouselDTO
    - MerchantCarouselItemStyle
    - MerchantCarouselItemDTO
    - MerchantDTOsAndStyles
- Exemplos
- Acessibilidade

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionEventProtocol
- OnMoreOptionsClickEventProtocol
- ScrollNotifiable
- MarginToggle

<!-- image -->

#### Guidelines

- Carrossel horizontal de MerchantCarouselItemViews
- Não paginado por padrão

### Funções / Modificadores

| Atributo                                                        | Parametro                    | Default   | Descrição                                                                           |
|-----------------------------------------------------------------|------------------------------|-----------|-------------------------------------------------------------------------------------|
| func setDTO(_ dto: MerchantCarouselDTO)                         | MerchantCarouselDTO          | undefined | Define os dados configuráveis do componente. Veja a abaixo.                         |
| func update(dto: MerchantCarouselItemDTO, at index: Int)-> Self | MerchantCarouselItemDTO, Int | undefined | Atualiza item referente ao índex passado com os dados de item de Merchant injetados |

### MerchantCarouselDTO

| Atributo                | Tipo                                        | Default   | Descrição                                                                                                          |
|-------------------------|---------------------------------------------|-----------|--------------------------------------------------------------------------------------------------------------------|
| items                   | [MerchantCarouselDTO.MerchantDTOsAndStyles] | undefined | Recebe um array de DTOs de MerchantCarouselItem e style de MerchantCarouselItemStyle a serem exibidos no carrossel |
| moreOptionsDTO          | MoreOptionsCarouselItemDTO?                 | nil       | DTO de componente de MoreOptions adicionado ao final do carrossel                                                  |
| childViewVisibilityRate | CGFloat                                     | 1         | Percentual do item visível necessária para ativar disparo de métodos de tracking                                   |

### MerchantCarouselItemStyle

| Atributo   | Tipo                      | Default   | Descrição                                                                                                                         |
|------------|---------------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------|
| normal     | MerchantCarouselItemStyle |           | Estilo default do componente com a tag logo após a imagem com background preto                                                    |
| shop       | MerchantCarouselItemStyle |           | Estilo que será utilizado nas vitrines de shop, com a tag posicionada após o label, com o background branco e cor do texto verde. |

### MerchantCarouselItemDTO

| Atributo                 | Tipo                 | Default   | Descrição                                                                                                                                                                                                                |
|--------------------------|----------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| initials                 | String               | undefined | Recebe valor que será exibido caso a imagem seja nula.                                                                                                                                                                   |
| image                    | ImageDTO?            | undefined | Imagem do item                                                                                                                                                                                                           |
| tag                      | TagArgumentativeDTO? | undefined | Texto destacado do item                                                                                                                                                                                                  |
| label                    | String               | undefined | Texto exibido como rótulo ou legenda do item                                                                                                                                                                             |
| applyInitialAbbreviation | Bool                 | false     | Caso setado como true, o campo initials, utiliza uma função para extrair apenas as iniciais da(s) palavra(s) informada(s) no atributo.  Ex:  Entrada: “Personal Information" Saída: “PI"  Entrada: “Netflix" Saída: “NE" |

### MerchantDTOsAndStyles

| Atributo   | Tipo                      | Default   | Descrição                                |
|------------|---------------------------|-----------|------------------------------------------|
| dto        | MerchantCarouselItemDTO   | undefined | Recebe um DTO de MerchantCarouselItem    |
| style      | MerchantCarouselItemStyle | undefined | Recebe um estilo de MerchantCarouselItem |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let items = [
        MerchantCarouselDTO.MerchantDTOsAndStyles(
                dto: MerchantCarouselItemDTO(
                    initials: "IF",
                    image: .downloadedImage(
                      image: "https://cdn.ppay.me/assets/images/brands/swift.svg"
                    ),
                    tag: .init(
                      title: "Parcele em até 12x"
                    ),
                    label: "iFood"
                ),
                style: .shop
        ),
        MerchantCarouselDTO.MerchantDTOsAndStyles(
                dto: MerchantCarouselItemDTO(
                    initials: "IN",
                    image: .downloadedImage(
                        image: "https://cdn.ppay.me/assets/images/brands/swift.svg"
                    ),
                    tag: .init(
                        title: "Parcele em até 12x"
                    ),
                    label: "iFood"
                ),
                style: .normal
        ),
        MerchantCarouselDTO.MerchantDTOsAndStyles(
                dto: MerchantCarouselItemDTO(
                    initials: "NE",
                    image: .downloadedImage(
                        image: "https://cdn.ppay.me/assets/images/brands/tim.svg"
                    ),
                    tag: .init(
                        title: "9% desconto"
                    ),
                    label: "Netflix"
                ),
                style: .normal
        )
    ]
    
    lazy var carousel = dependencies
        .artemisComponents
        .toMerchantCarousel()
        .setDTO(
            dto
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .onMoreOptionsClick { index, _ in
            print("Carousel more options \(index) click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        carouselupdate(
            dto: MerchantCarouselItemDTO(
                image: nil,
                tag: .init(
                    title: "3% cashback"
                ),
                label: "Olympikus"
            ),
            at: 1
        )
    }
}
```

## Acessibilidade

a) Cada item (Merchant carousel item e more options) do Merchant Carousel deve ser focado e anunciado pelo LT individualmente;
b) Cada item deve obedecer a semântica "Button" herdada do "Merchant carousel item" ou do "More Options".
c) O que deve ser lido: Cada um dos Merchants Carousel Itens e o "More options", respeitando a spec destes componentes.

Comportamento e interação:

a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques em cada item: ativa o CTA;
c) Um arrasto da esquerda para a direita: foca o próximo item do merchant carousel e o LT anuncia todo conteúdo textual (quando na última posição, foca o componente posterior ao Merchant Carousel;
d) Um arrasto da direita para a esquerda: foca o item anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o componente anterior ao Merchant Carousel.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o protocolo

- Sobre o protocolo
    - Guidelines
    - Funções / Modificadores

### Guidelines

- Protocolo de interface de componentes com margens desativáveis

### Funções / Modificadores

| Atributo                                         | Parametro   | Default   | Descrição                                         |
|--------------------------------------------------|-------------|-----------|---------------------------------------------------|
| func enableTopMargin(_ enabled: Bool) -> Self    | Bool        | true      | Método de ativação/desativação de margem de topo  |
| func enableBottomMargin(_ enabled: Bool) -> Self | Bool        | true      | Método de ativação/desativação de margem de baixo |

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ] [  ] [  ]

O componente do tipo MenuCardList se trata de uma lista vertical composta por itens do tipo MenuCardListItem. Os cards ficam dispostos em um grid de 2 itens, e caso haja número ímpar de elementos, o último preenche completamente a largura da lista.

A classe MenuCardList é a responsável por criar nosso componente customizado. Ela herda da classe CarouselView, e é composta por uma sequência de carrosséis que montam o grid de cada linha, que podem possuir uma ou duas subviews do tipo MenuCardListItem. Implementa a interface CollectionBaseEventsProtocol.

#### Guidelines

- A lista já possui bordar horizontais internas, devendo ser implementada na totalidade da largura da tela.
- Pode possuir número par ou ímpar de itens; no segundo caso, o último componente ocupa toda a largura da lista.
- Não possui scroll próprio. Se a lista for grande, ou parte de um componente vertical com mais dados, deve ser inserida dentro de uma ScrollView.

### Funções / Modificadores

| Função                                      | Descrição                                                               |
|---------------------------------------------|-------------------------------------------------------------------------|
| func setDTO(_ dto: MenuCardListDTO) -> Self | Define os dados configuráveis para os itens do componente. Veja abaixo. |

### MenuCardListDTO

| Atributo   | Tipo                  | Descrição      |
|------------|-----------------------|----------------|
| items      | [MenuCardListItemDTO] | DTOs dos items |

## Exemplos

```
final class CustomView: UIView {
    lazy var customView = dependencies.artemisComponents.toMenuCardList(initialConfiguration: .config(self))

    private let dto: MenuCardListDTO
    private let topEnabled: Bool
    private let bottomEnabled: Bool
    init(
        dto: MenuCardListDTO,
        topEnabled: Bool,
        bottomEnabled: Bool
    ) {
        self.dto = dto
        self.topEnabled = topEnabled
        self.bottomEnabled = bottomEnabled
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(
        coder: NSCoder
    ) {
        nil
    }

    func buildLayout() {
        addSubview(
            customView
        )
        customView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
        }

        customView.backgroundColor = .white

        customView
            .setDTO(
                dto
            )
            .onLoad { [weak self] dto in
                print(">>>> MenuCardList on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> MenuCardList on appear \(dto)")
            }
            .onLoadChild { index, _ in
                print(">>>> MenuCardList item loaded index: \(index)")
            }
            .onAppearChild { index, _ in
                print(">>>> MenuCardList item appeared index: \(index)")
            }
            .onClickChild{ index, _ in
                print(">>> MenuCardList item clicked index \(index)")
            }
            .enableTopMargin(
                topEnabled
            )
            .enableBottomMargin(
                bottomEnabled
            )

        customView.onAppear()
    }
}
```

## Acessibilidade

Cada card deve ser lido individualmente pelo VoiceOver. A acessibilidade dos cards está disponível nesse link.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - SolutionCardGridDTO
- Exemplos

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionBaseEventsProtocol
- MarginToggle

<!-- image -->

#### Guidelines

- Grid de SolutionCards

### Funções / Modificadores

| Atributo                                        | Parametro   | Default   | Descrição                                                   |
|-------------------------------------------------|-------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: SolutionCardGridDTO) -> Self |             | undefined | Define os dados configuráveis do componente. Veja a abaixo. |

### SolutionCardGridDTO

| Atributo      | Tipo                  | Default   | Descrição                                                                 |
|---------------|-----------------------|-----------|---------------------------------------------------------------------------|
| dtosAndStyles | [SolutionCardGridDTO] | undefined | Recebe um array de solution cards e seus estilos a serem exibidos no grid |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let items = [
        .init(
            dto: .init(
                titleText: String(),
                descriptionsTexts: ["Teste"],
                buttonText: String(),
                iconName: .icAddCard,
                animationDelay: 0.0
            ),
            style: .highlightOn
            ),
            .init(
                titleText: String(),
                descriptionsTexts: ["Teste"],
                buttonText: String(),
                iconName: .icAddCard,
                animationDelay: 0.0
            ),
            style: .highlightOn
            ),
            .init(
                titleText: String(),
                descriptionsTexts: ["Teste"],
                buttonText: String(),
                iconName: .icAddCard,
                animationDelay: 0.0
            ),
            style: .highlightOff
            )
    ]
    
    lazy var solutionCardGrid = dependencies
        .artemisComponents
        .toSolutionCardGrid(initialConfiguration: .config(self))
            .setDTO(
                SolutionCardGridDTO.init(
                    dtosAndStyles: [items]
                )
            )
            .onLoad { [weak self] dto in
                print(">>>> SolutionCardGrid on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> SolutionCardGrid on appear \(dto)")
            }
            .onLoadChild { index, _ in
                print(">>>> SolutionCardGrid item loaded index: \(index)")
            }
            .onAppearChild { index, _ in
                print(">>>> SolutionCardGrid item appeared index: \(index)")
            }
            .onClickChild { index, _ in
                print(">>>> SolutionCardGrid item tapped index: \(index)")
            }
            .onClickChild { row, index, _ in
                print(">>>> SolutionCardGrid item tapped at row: \(row) and index: \(index)")
            }
            .enableTopMargin(
                topEnabled
            )
            .enableBottomMargin(
                bottomEnabled
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Exemplos
- Acessibilidade

#### Guidelines

- O componente Input será utilizado para construção dos Templates de inserção do dados do Picpay.

<!-- image -->

<!-- image -->

<!-- image -->

| Atributo                                                                         | Parametro             | Default   | Descrição                                                               |
|----------------------------------------------------------------------------------|-----------------------|-----------|-------------------------------------------------------------------------|
| func setDTO(_ dto: InputTextDTO) -> Self                                         | InputTextDTO          | undefined | Atualiza o componente, inserindo as informações que serão apresentadas. |
| func onLastCharacterEntered(_ callback: @escaping (DTOProtocol) -> Void) -> Self | Retorno InputTokenDTO |           | Função chamada quando o ultimo caractere é inserido                     |
| func displayError(_ errorMessage: String) -> Self                                | errorMessage: String  | undefined | Exibe a mensagem de erro abaixo                                         |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self                | Retorno InputTokenDTO |           | Chama a função quando clica no Reenviar                                 |
| func onCountdown() -> Self                                                       |                       | undefined | Inicia a contagem do timer                                              |
| func unfocus() -> Self                                                           |                       | undefined | Fecha o foco do campo                                                   |
| func focus() -> Self                                                             |                       | undefined | Chamada quando o foco o campo de texto está em foco                     |
| func textFieldOnChange(_ callback: @escaping (String, Int) -> Void) -> Self      | String, Int           |           | Chamado quando o textField escondido recebe uma nova entrada            |

## InputTokenDTO

| Atributo         | Tipo   | Default   | Descrição                                                                   |
|------------------|--------|-----------|-----------------------------------------------------------------------------|
| slotNumber       | Int    | undefined | Quantidade de caixas de texto para inserir a quantidade de numeros no token |
| tokenText        | String | ""        | Texto do token                                                              |
| messageErrorText | String | Nil       | Texto apresentado abaixo do campo de texto quando existe um erro            |
| remainingSeconds | Int    | 60        | Tempo para o timer terminar e exibir a opção para reenviar o token          |

## Exemplos

#### Primary

```
import ArtemisComponents

inal class InputTokenCell: UITableViewCell {
    lazy var customView: any InputTokenInterface = {
        let converter = ArtemisConverter()
        return converter.toInputToken()
    }()

    private let dto: InputTokenDTO
    init(dto: InputTokenDTO) {
        self.dto = dto
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)

        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        customView
            .setDTO(dto)
            .onLoad { [weak self] dto in
                print(">>>> InputToken on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> InputToken on appear \(dto)")
            }

            .onClick { [weak self] dto in
                print(">>>> InputToken on click \(dto)")
            }

            .onLastCharacterEntered { [weak self] dto in
                guard let self = self else { return }
                let tokenDTO = dto as? InputTokenDTO
                print(">>>> InputToken on last character entered \(tokenDTO?.tokenText)")
                if let token = tokenDTO?.tokenText {
                    if token != "123456" {
                        self.customView.displayError("Código inválido. Tente novamente!")
                    }
                }
            }
        customView.focus()
        customView.onCountdown()
        customView.onAppear()
    }

    static func make(dto: InputTokenDTO) -> InputTokenCell {
        return InputTokenCell(dto: dto)
    }
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- A semântica: de cada slot do input deve ser "campo de texto" em iOS;
- Ao focar cada slot do iput o Lt deve anunciar sua respectiva posição ("1º dígito", "2º digito", "3º dígito", etc);
- A posição do slot e a semântica devem ser anunciados no mesmo gesto de navegação do LT;
- Ao inserir um dígito o foco do LT se posiciona automaticamente no slot seguinte do input token;
- Quando o supporting message surgir em tela, deve ser anunciado imediatamente sem deslocar o foco do input token;
- Nos estados "active" e "filled" o LT deve anunciar "editando" em android e "está editando" em iOS;
- No estado "filled" cada caractere inserido ou apagado deve ser anunciado pello LT;## Sobre o elemento

Default

<!-- image -->

Selected

<!-- image -->

Loading

<!-- image -->

Esse cards são componentes compactos para representar imagens, além disso, eles possuem um mecanismo padrão para alteração de estado(default, selected e loading)

### Funções / Modificadores

| Atributo                                          | Parametro             | Default   | Descrição                                    |
|---------------------------------------------------|-----------------------|-----------|----------------------------------------------|
| func setDTO(_ dto: CardImageSelectionDTO) -> Self | CardImageSelectionDTO | undefined | Define os dados configuráveis do componente. |

### CardImageSelectionDTO

| Atributo           | Tipo     | Default   | Descrição                                                         |
|--------------------|----------|-----------|-------------------------------------------------------------------|
| imageDto           | ImageDTO | undefined | Define a imagem do componente.                                    |
| image              | UIImage  | undefined | Define a imagem do componente.                                    |
| isSelected         | Bool     | undefined | Define se o componente está selecionado.                          |
| accessibilityLabel | String   | undefined | Define o texto a ser apresentado na acessibilidade do componente. |

### Exemplos

#### Primary

```
import ArtemisComponents
import ArtemisComponentsInterface
import UIKit

// MARK: CardImageSelectionFactory
final class CardImageSelectionFactory: MakeController {
    static func makeController() -> UIViewController {
        let controller = SampleController()
        controller.cellControllersLoad = {
            [
                CardImageSelectionCell(dto: CardImageSelectionDTO(
                    image: .downloadedImage(image: "https://cdn.ppay.me/assets/images/woman_holding_green_card_outdoors.png"),
                    isSelected: false, accessibilityLabel: "accessibilityLabel"), isLoading: false),
                CardImageSelectionCell(dto: CardImageSelectionDTO(
                    image: .downloadedImage(image: "https://cdn.ppay.me/assets/images/man_checking_card_details_with_laptop.png"),
                    isSelected: true, accessibilityLabel: "accessibilityLabel"), isLoading: false),
                CardImageSelectionCell(dto: CardImageSelectionDTO(
                    image: .downloadedImage(image: "https://cdn.ppay.me/assets/images/woman_holding_black_card.png"),
                    isSelected: true, accessibilityLabel: "accessibilityLabel"), isLoading: true)
            ]
        }
        return controller
    }
}

// MARK: - CardImageSelectionCell
final class CardImageSelectionCell: UITableViewCell {
    private let dto: CardImageSelectionDTO
    private let isLoading: Bool

    lazy var customView: any LoadableInterface = {
        let converter = ArtemisConverter()
        let (loadable, component) = converter.toLoadableCardImageSelection(initialConfiguration: .config(self))
        component
            .setDTO(dto)
            .onChange { [weak self] dto in
                print(">>>> CardImageSelection on onChange \(dto)")
            }
            .onClick { [weak self] dto in
                print(">>>> CardImageSelection on onClick \(dto)")
            }
            .onLoad { [weak self] dto in
                print(">>>> CardImageSelection on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> CardImageSelection on appear \(dto)")
            }
        loadable.setDTO(.init(isShimmering: isLoading, automaticUpdateContentSizeInTableView: true))
        return loadable
    }()

    init(dto: CardImageSelectionDTO, isLoading: Bool) {
        self.dto = dto
        self.isLoading = isLoading
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)

        customView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(15)
            $0.width.equalTo(150)
            $0.height.equalTo(180)
        }
        customView.onAppear()
    }
}
```

#### Sample

<!-- image -->

### Acessibilidade

a) Cada item do Template Container Image deve ser focado e lido individualmente pelo LT, respeitando a semântica originalmente especificada em cada componente;
b) A ordem de leitura é de cima para baixo e da esquerda para a direita;
c) As imagens devem conter a descrição no atributo "accessibilityLabel" (iOS);
d) Sempre que uma imagem for atualizada, a respectiva descrição também deve ser;
e) A semântica determinada programaticamente para cada imagem deve ser "button";
f) Ao selecionar uma imagem o LT deve anunciar "Selecionada";
g) Quando a imagem não estiver selecionada o int deve ser "Toque duas vezes para selecionar";
h) Quando a imagem estiver selecionada o int deve ser "Toque duas vezes para desfazer a seleção".
i) Quando a imagem não estiver selecionada o accessibilityValue deve ser "Não selecionado";
j) Quando a imagem estiver selecionada o accessibilityValue deve ser "Selecionado".

## Skeleton

<!-- image -->

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - ToDoCarouselDTO
- Exemplos
- Acessibilidade

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionEventProtocol
- MarginToggle

<!-- image -->

#### Guidelines

- Carrossel horizontal de ToDoView paginado por padrão

### Funções / Modificadores

| Atributo                                    | Parametro   | Default   | Descrição                                                   |
|---------------------------------------------|-------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ToDoCarouselDTO) -> Self |             | undefined | Define os dados configuraveis do componente. Veja a abaixo. |

### ToDoCarouselDTO

| Atributo   | Tipo      | Default   | Descrição                                              |
|------------|-----------|-----------|--------------------------------------------------------|
| items      | [ToDoDTO] | undefined | Recebe um array de itens a serem exibidos no carrossel |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let items = [
        ToDoDTO(
            label: "Encontre seus amigos que também usam o PicPay. É só habilitar sua agenda!",
            button: "Habilitar a agenda"
        ),
        ToDoDTO(
            label: "Encontre seus contatos que também usam o PicPay. É só habilitar no seu telefone!",
            button: "Habilitar no telefone"
        ),
        ToDoDTO(
            label: "Encontre seus seguidores que também usam o PicPay. É só habilitar seu Twitter!",
            button: "Habilitar seu Twitter"
        )
    ]
    
    lazy var todoCardCarousel = dependencies
        .artemisComponents
        .toToDoCarousel()
        .setDTO(
            ToDoCarouselDTO(
                items: items
            )
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

a) Cada card deve ser focado e anunciado pelo LT individualmente;
b) Cada card deve obedecer a semântica "Button" herdada do  to do item.
c) O que deve ser lido:
individualmente  cada um dos cards to do itens respeitando a spec destes componentes.
Comportamento e interação:
a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques em cada item: ativa o CTA;
c) Um arrasto da esquerda para a direita: foca o próximo card to do item e o LT anuncia todo conteúdo textual (quando na última posição, foca o componente posterior ao Carousel;
d) Um arrasto da direita para a esquerda: foca o card to do item anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o componente anterior ao Carousel.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Exibição componente:
- Implementa os seguintes protocolos:
    - Funções / Modificadores
    - ValueItemDTO
- Exemplos
- Acessibilidade

## Exibição componente:

<!-- image -->

## Implementa os seguintes protocolos:

- ComponentProtocol
- ComponentEventProtocol
- OnChangeEventProtocol
- OnSecondaryClickEventProtocol

### Funções / Modificadores

| Atributo                                                                                            | Parametro             | Default            | Descrição                                                                                                                                                                                                  |
|-----------------------------------------------------------------------------------------------------|-----------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| @discardableResult func setStyle(_ style: ValueItemStyle) -> Self                                   | style: ValueItemStyle | undefinedundefined | Atualizado o componente, inserindo um novo style pré definido a ele                                                                                                                                        |
| @discardableResult func setDTO(_ dto: ValueItemDTO) -> Self                                         | dto: ValueItemDTO     | undefined          | Atualiza o componente, inserindo as informações que serão apresentadas.                                                                                                                                    |
| @discardableResult func hideSensitiveInfo( _ hide: Bool) -> Self                                    | hide: Bool            | undefined          | Atualiza o componente, escondendo os valores sensíveis dele.                                                                                                                                               |
| @discardableResult func onClick(dto: ValueItemDTO) -> Self                                          | undefined             | undefined          | Reconhece o clique no botão que fica a baixo do componente.                                                                                                                                                |
| @discardableResult func onSecondaryButtonClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self | undefined             | undefined          | Reconhece o clique do botão secundário do Callback  OBS: Não é o mesmo que onSecondaryClick que reconhece o clique na label,  valor e descrição do componente                                              |
| @discardableResult func onSecondaryClick(dto: ValueItemDTO) -> Self                                 | dto: ValueItemDTO     | undefined          | Reconhece o clique na label valor e descrição que fica no centro do componente.                                                                                                                            |
| @discardableResult func onAppear(dto: ValueItemDTO) -> Self                                         | dto: ValueItemDTO     | undefined          | Função chamada quando o componente aparece.                                                                                                                                                                |
| @discardableResult func onStateChange(dto: ValueItemDTO) -> Self                                    | dto: ValueItemDTO     | undefined          | Função chamada quando algum update é feito no componente, ex: hideSensitiveInfo é chamado, então essa função é chamado na sequencia, caso queira atualizar alguma informação na tela que usa o componente. |
| @discardableResult func setType(_ type: ValueItemType) -> Self                                      | type: ValueItemType   | undefined          | Função chamada para alterar o tipo do item.                                                                                                                                                                |

### ValueItemDTO

| Atributo              | Tipo                     | Default   | Descrição                                                                                                                                      |
|-----------------------|--------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------|
| headerDescription     | String?                  | undefined | Descrição do cabeçalho do item de valor                                                                                                        |
| title                 | String                   | undefined | Título do item de valor                                                                                                                        |
| value                 | String                   | undefined | Valor do item de valor                                                                                                                         |
| subtitle              | String?                  | undefined | Subtítulo do item de valor                                                                                                                     |
| subtitleValue         | String?                  | undefined | Valor do subtítulo do item de valor                                                                                                            |
| action                | ButtonFlexDTOsAndStyles? | undefined | Ação associada ao botão primário                                                                                                               |
| secondAction          | ButtonFlexDTOsAndStyles? | undefined | Ação associada ao botão secundário                                                                                                             |
| isObfuscated          | Bool                     | undefined | Indica se o conteúdo sensível está oculto                                                                                                      |
| isSubtitleSensitive   | Bool                     | undefined | Indica se o conteúdo do subtítulo é sensível(caso não seja, não ofusca o subtítulo)                                                            |
| isLocked              | Bool                     | undefined | Indica se o conteúdo sensível está oculto e travado                                                                                            |
| hasError(deprecado)   | Bool                     | undefined | Indica se há um erro associado ao item de valor                                                                                                |
| hasTitleError         | Bool                     | false     | Indica se o componente está em um cenario de erro no title.                                                                                    |
| elementActionIsHidden | Bool                     | false     | Indica se o componente elementActionestá visível ou não, propriedade só é considerada se o componente estiver com o atributo hasTitleErrortrue |

## Exemplos

```
//DTO Componente:
ValueItemDTO(
  headerDescription: "Top description",
  title: "Title",
  value: "R$ 1.200.000,00",
  subtitle: "Descrição:",
  subtitleValue: "R$ 940.000,00",
  action: ButtonFlexDTOsAndStyles(
    dto: .init(
      title: "Label"
    ),
  style: buttonFlexStyle
    ),
  isObfuscated: false,
  isLocked: false
)
```

```
final class ValueItemCell: UITableViewCell {
    lazy var customView: any ValueItemInterface = {
        let converter = ArtemisConverter()
        return converter.toValueItem()
    }()

    private let dto: ValueItemDTO
    private let style: ValueItemStyle
    init(dto: ValueItemDTO, style: ValueItemStyle) {
        self.dto = dto
        self.style = style
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
        customView.setStyle(style)
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        customView
            .setDTO(dto)
            .onLoad { [weak self] dto in
                print(">>>> ValueItem on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> ValueItem on appear \(dto)")
            }
            .onClick { [weak self] dto in
                print(">>>> ValueItem on click \(dto)")
            }
            .onStateChange { [weak self] dto in
                print(">>>> ValueItem on change \(dto)")
            }
     }

    static func make(dto: ValueItemDTO, style: ValueItemStyle) -> ValueItemCell {
        return ValueItemCell(dto: dto, style: style)
    }
}
```

## Acessibilidade

a) Todos os itens do Base Element Value devem ser agrupados para o foco visível e do LT;
b) Apenas os conteúdos do title, value e description devem ser anunciados pelo LT;
c) As ações do Element Action e do Button Flex devem ser vinculadas ao "UIAccessibilityCustomAction" em iOS
d) O que deve ser lido:
Description + title + Value + Description + Semântica "button" (apenas em android);
Quando o Value está oculto o LT deve anunciar "Informação oculta";
No rotor do iOS e no menu de ações do talkback devem constar: "Exibir informação" (Quando o Value estiver oculto), "Ocultar informação" (Quando o saldo estiver visível) e a ação indicada no button flex.
Comportamento e interação:

a) Dois toques: dispara a ação do Button Flex;
b) Arrasto vertical (Rotor &gt; Actions): navega pela ação do Button Flex e "Exibir informação" ou "Ocultar informação".

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

| Styles   | On   | Off   |
|----------|------|-------|
| .default |      |       |
| .custom  |      |       |

Descreva brevemente a finalidade de uso do componente. Por exemplo:

Componente visual de marcação de seleção de item.

### Funções / Modificadores

| Atributo                                    | Parametro   | Default   | Descrição                                                   |
|---------------------------------------------|-------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ToggleDTO) -> Self       | ToggleDTO   | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setDisabled(_ disabled: Bool) -> Self  | Bool        | true      | Define se o componente está desabilitado                    |
| func setStyle(_ style: ToggleStyle) -> Self | ToggleStyle | .default  | Define o estilo do componente, em relação a cores.          |

### RadioButtonDTO

| Atributo   | Tipo   | Default   | Descrição                                    |
|------------|--------|-----------|----------------------------------------------|
| selected   | Bool   | undefined | Indicativo se o componente está selecionado  |
| disabled   | Bool   | undefined | Indicativo se o componente esta desabilitado |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var toggle = dependencies
        .artemisComponents
        .toToggle()
        .setDTO(.init(selected: true, disabled: false))
        .setStyle(.default)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

Uso: ligar ou desligar algo no app
Exemplo: Habilitar ou desabilitar "Pagamento por aproximação".

a) O item relacionado ao toogle deve ser associado a ele;
b) O que deve ser lido ao focar nesse item:
Text + interruptor (em android) / botão alternar (iOS) + Ativado/desativado

Comportamento e Interação:
a) Um toque: Direciona o foco visível para o togle;
b) Dois toques: ativa ou desativa e anuncia apenas o respectivo estado.
c) Ao ativar: O foco se mantém no toogle.

O Toggle deve ser utilizado somente por outros componentes do Apollo.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

#### Guidelines

- O componente floating payment button menu (FABMenu) executa a ação de mostrar uma ou mais botões de possibilidades de pagamento, sendo ela por QRCode, WhatsApp e Assistente PicPay a frente de qualquer tela do SuperApp.

### Funções / Modificadores

| Atributo                           | Parametro      | Default   | Descrição                                    |
|------------------------------------|----------------|-----------|----------------------------------------------|
| func setDTO(_ dto: FABMenuItemDTO) | FABMenuItemDTO | undefined | Define os dados configuráveis do componente. |

### FABMenuItemDTO

| Atributo   | Tipo      | Default   | Descrição                         |
|------------|-----------|-----------|-----------------------------------|
| icon       | ImageName | undefined | Ícone do componente               |
| title      | String    | undefined | Texto a ser exibido do componente |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var fabMenuItem = dependencies
        .artemisComponents
        .toFABMenuItem()
        .setDTO(FABMenuItemDTO(icon: .icQrcode,
                               title: dto.title))
          )
        .setDelegate(self)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

O que sera transcrito pelo Voice Over:

- Rótulo do FAB Menu Item + semântica: button

```
private extension FABMenuView {
	func fillAccessibility(
		with dto: DTO
	) {
        accessibilityValue = dto.accessibilityValue
    }
}

extension FABMenuItemDTO {
    var accessibilityValue: String {
        title
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - MerchantCarouselItemDTO
    - Exemplos
    - Acessibilidade

<!-- image -->

### Guidelines

- Componente utilizado no final de items de um carousel.

| Atributo                                               | Parametro                  | Default   | Descrição                                                               |
|--------------------------------------------------------|----------------------------|-----------|-------------------------------------------------------------------------|
| contentAccessibilityValue                              | String?                    | undefined | Valor de acessibilidade do conteúdo do item de carrossel de mais opções |
| func setDTO(_ dto: MoreOptionsCarouselItemDTO) -> Self | MoreOptionsCarouselItemDTO | undefined | Define os dados configuráveis do componente. Veja a abaixo.             |

### MerchantCarouselItemDTO

| Atributo             | Tipo       | Default   | Descrição                                                      |
|----------------------|------------|-----------|----------------------------------------------------------------|
| title                | String     | undefined | Título do item de carrossel de mais opções                     |
| backgroundColor      | ColorName? | nil       | Cor de fundo do item de carrossel de mais opções (opcional)    |
| accessibilityContext | String     | undefined | Contexto de acessibilidade do item de carrossel de mais opções |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var moreOptionsCarouselItem = dependencies
        .artemisComponents
        .toMoreOptionsCarouselItem()
        .setDTO(
          .init(
              content: .init(
                  title: "Ver mais opções",
                  accessibilityContext: "Ver mais Ofertas e cashback"
              )
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Texto + semântica "button".

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - ShapeListActionItemDTO
- Exemplos
- Acessibilidade

#### Guidelines

- Componente utilizado para criação do List Action Bundle (grupo de itens de lista)
- Não deve ser permitido utilizar somente o item isolado.
- Componente não possuí margens apenas paddings internos, as margens ficam no List Action Bundle (grupo de itens de lista).
- Componente possui opção com e sem Identifier
- Identifier é um base element que pode receber IF, Merchant, Avatar e Icon.
- Element Action é um base element que pode receber Toggle, Check e Icon porém nesse componente é liberado para receber apenas Icon.
- Componente pode apresentar Tag (opcional, padrão desativado)
- Limitações de linhas estão especificadas no Content Area.
- Tap/pressed state (overlay) aplica em todo o elemento.
- Conformidade ao Protocolo MarginToggle para controle das margens externas.

### Funções / Modificadores

| Atributo                                           | Parametro                                                                                                                                          | Default   | Descrição                                                |
|----------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------|
| func setDTO(_ dto: ShapeListActionItemDTO) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/4082630823?draftShareId=f5381041-2838-4009-8806-c157aca760e9#ShapeListActionItemDTO | undefined | Define dados configuráveis do componente. Veja a abaixo. |
| func setStyle(_ style: Style) -> Self              | Style                                                                                                                                              | undefined | Define o estilo do componente.                           |

### ShapeListActionItemDTO

| Atributo               | Tipo                   | Default   | Descrição                                           |
|------------------------|------------------------|-----------|-----------------------------------------------------|
| listContentAreaDTO     | ListContentAreaDTO     | undefined | Define dados configuráveis do List Content Area.    |
| elementActionImageName | ElementActionImageName | undefined | Define dados configuráveis do Element Action Image. |
| elementActionDTO       | ElementActionDTO       | undefined | Define dados configuráveis da Element Action.       |
| identifierDTO          | IdentifierDTO?         | undefined | Define dados configuráveis do Identifier.           |
| tagDTOsAndStyles       | TagDTOsAndStyles?      | undefined | Define dados configuráveis da Tag.                  |
| isMoreOptions          | Bool                   | undefined | Indica se é uma opção de "Mais opções"              |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface
final class CustomView: UIView {
    let dependencies: Dependencies
    
    let dto = ShapeListActionItemCell.make(
      dto: ShapeListActionItemDTO(
        elementActionImageName: .icArrowRight,
        listContentAreaDTO: .init(label: "Top label"),
        isMoreOptions: true,
        identifierDTO: .normalCircle(image: .init(image: ImageName.icPicPay.rawValue), accessibilityValue: ""),
        tagDTOsAndStyles: .init(title: "Ativo", style: .critical)
      )
    )
    
    lazy var shapeListActionItem = dependencies
        .artemisComponents
        .toShapeListActionItem()
		.setDTO(
			dto
		)
		
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser lido pelo Voice Over :
- O que deve ser lido pelo Voice Over:
    - Text &gt; tag ou badge (Se houver) &gt; semântica "button" (caso seja interativo).

## Skeleton

<!-- image -->

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

### Guidelines

- Componente utilizado na TabBar

### Funções / Modificadores

| Atributo                          | Parametro     | Default   | Descrição                                                |
|-----------------------------------|---------------|-----------|----------------------------------------------------------|
| func setDTO(_ dto: TabBarItemDTO) | TabBarItemDTO | undefined | Método de injeção de conteúdo através de um DTO próprio. |

### TabBarItemDTO

| Atributo   | Tipo      | Default   | Descrição                                   |
|------------|-----------|-----------|---------------------------------------------|
| title      | String    | undefined | Título do item de TabBar                    |
| icon       | ImageName | undefined | Ícone do item de TabBar                     |
| isSelected | Bool      | undefined | Indica se o item de TabBar está selecionado |

### Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    lazy var tabBarItem = dependencies
            .artemisBaseComponents
            .toTabBarItem()
            .setDTO(
                   TabBarItemDTO(
                   title: "Home",
                    icon: .icHome
                  )
              )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser lido pelo Voice Over :
- O que deve ser lido pelo Voice Over:
    - Rótulo ou texto alternativo do item + semântica: Tab + estado: selecionado para o item ativo.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - InputTextDTO
- Exemplos
- Acessibilidade

#### Guidelines

- O componente InputText será utilizado para construção dos Templates de inserção do dados do Picpay.

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

| Atributo                                                                                                        | Parametro           | Default   | Descrição                                                                                                               |
|-----------------------------------------------------------------------------------------------------------------|---------------------|-----------|-------------------------------------------------------------------------------------------------------------------------|
| func setStyle(_ style: InputTextStyle) -> Self                                                                  | .normal ou .inverse | .normal   | Define o estilo padrão do componente                                                                                    |
| func setDTO(_ dto: InputTextDTO) -> Self                                                                        | InputTextDTO        | undefined | Define o estilo do componente                                                                                           |
| func setMask(_ mask: InputTextMaskType)                                                                         | InputTextMaskType   | normal    | Define a máscara do componente com base no enum InputTextMaskType                                                       |
| func setReturnKeyType(_ keyType: UIReturnKeyType) -> Self                                                       | keyType             | undefined | Define o tipo de return key para o teclado                                                                              |
| func didClearTextView(_ callback: @escaping (UITextView) -> Void) -> Self                                       | callback            | undefined | Callback chamado quando o botão de limpar foi clicado                                                                   |
| func unfocus() -> Self                                                                                          |                     | undefined | Chamada quando o foco o campo de texto não está em foco                                                                 |
| func focus() -> Self                                                                                            |                     | undefined | Chamada quando o foco o campo de texto está em foco                                                                     |
| func shouldReturn(_ callback: @escaping (UITextView) -> Bool) -> Self                                           | callback            | undefined | Callback chamado quando a tecla return é pressionada                                                                    |
| func shouldClear(_ callback: @escaping (UITextView) -> Bool) -> Self                                            | callback            | undefined | Callback chamado quando o campo de texto é limpo                                                                        |
| func didEndEditing(_ callback: @escaping (UITextView) -> Void) -> Self                                          | callback            | undefined | Callback chamado quando o campo de texto terminou de ser editado                                                        |
| func didChangeSelection(_ callback: @escaping (UITextView) -> Void) -> Self                                     | callback            | undefined | Callback chamado quando o campo de texto foi alterado                                                                   |
| func didChange( _ callback: @escaping (UITextView) -> Bool) -> Self                                             | callback            | undefined | Callback chamado quando o campo de texto foi editado                                                                    |
| func shouldBeginEditing(_ callback: @escaping (UITextView) -> Bool) -> Self                                     | callback            | undefined | Callback chamado quando o campo de texto começar a ser editado                                                          |
| func shouldChangeTextIn(_ callback: @escaping (UITextView, NSRange, String) -> Bool) -> Self                    | callback            | undefined | Callback chamado quando o campo de texto começar a ser alterado                                                         |
| func displayError(_ errorMessage: String)                                                                       | errorMessage        | undefined | Chamada para mostrar uma mensagem de erro abaixo do campo de texto                                                      |
| func displaySupportingMessage(_ message: String)                                                                | message             | undefined | Chamada para mostrar uma mensagem abaixo do campo de texto                                                              |
| func removeAccessoryItems()                                                                                     |                     | undefined | Remove todos os itens do AccessoryView                                                                                  |
| func addLeftAccessoryItem(_ title: String, style: UIBarButtonItem.Style, action: @escaping () -> Void) -> Self  |                     | undefined | Adiciona um item no AccessoryView à esquerda                                                                            |
| func addRightAccessoryItem(_ title: String, style: UIBarButtonItem.Style, action: @escaping () -> Void) -> Self |                     | undefined | Adiciona um item no AccessoryView à direita                                                                             |
| func setMaxDigits(_ digits: Int) -> Self                                                                        |                     | 0         | Determina a quantidade máxima de caracteres aceitos no campo. Se 0, ilimitado                                           |
| func setLocalization(_ countryCode: String) -> Self                                                             |                     | pt_BR     | Determina a localização a ser aplicada no texto inserido no campo                                                       |
| func monetaryValue() -> Monetary                                                                                |                     |           | Resgata o valor do campo no formato monetário, se falha 0obs. o valor máximo respeita o MaxDigits                       |
| func setMonetaryValue(_ value: Monetary)                                                                        |                     | undefined | Atribui valor para o campo a partir do formato monetárioobs. o valor máximo respeita o MaxDigits                        |
| func addMonetaryValue(_ value: Monetary)                                                                        |                     | undefined | Adiciona valor para o campo a partir do formato monetário ao valor já existenteobs. o valor máximo respeita o MaxDigits |
| func subtractMonetaryValue(_ value: Monetary)                                                                   |                     | undefined | Subtrai valor para o campo a partir do formato monetário ao valor já existenteobs. o valor máximo respeita o MaxDigits  |
| func onTapInputText(_ callback: @escaping () -> Void) -> Self                                                   |                     | undefined | Método para callback do textViewDidBeginEditing do delegate                                                             |

### InputTextDTO

| Atributo        | Tipo                  | Default       | Descrição                                    |
|-----------------|-----------------------|---------------|----------------------------------------------|
| type            | InputTextType         | undefined     | Tipo interno relacionado ao número de linhas |
| text            | String                | ""            | Texto do campo de texto                      |
| placeholderText | String                | ""            | Texto do placeholder do campo de texto       |
| supportingText  | String                | ""            | Texto apresentado abaixo do campo de texto   |
| keyboardType    | InputTextKeyboardType | .alphaNumeric | Tipo de teclado usado no campo de texto      |

InputTextMaskType

| Atributo    | Tipo                       |
|-------------|----------------------------|
| phoneNumber | Número de telefone         |
| cpf         | CPF                        |
| value       | Valor número (ex: 500,00)  |
| email       | Email                      |
| normal      | Sem nenhuma máscara        |
| date        | Data                       |
| zipCode     | CEP                        |
| currency    | Valor em reais (R$ 200,00) |

## Exemplos

#### Primary

```
import ArtemisComponents

final class CustomView: UIView {
    typealias Dependencies = HasArtemisComponentsInterface
    let dependencies: Dependencies
    let converter = ArtemisConverter()
    
    lazy var inputText = converter
        .toInputText()
        .setDTO(
            InputTextDTO(
                type: .singleLine,
                placeholderText: "Placeholder",
                supportingText: "Supporting text",
                keyboardType: .alphaNumeric
            )
        )
        .setStyle(.normal)
        
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Todo o conteúdo de texto disponível no componente
    - A semântica deverá ser seguir as ações disponíveis.## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - ContactCardDTO
- Exemplos
- Acessibilidade
- Skeleton
    - Exemplo

<!-- image -->

#### Guidelines

- Componente usado para exibir informações de contato de pessoas de interesse.

### Funções / Modificadores

| Atributo                                   | Parametro                                                                                                                                  | Default   | Descrição                                                   |
|--------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ContactCardDTO) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3762225156?draftShareId=a11845d1-d231-4588-b60d-fe85413ace48#ContactCardDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo. |

### ContactCardDTO

| Atributo     | Tipo                 | Default    | Descrição                                               |
|--------------|----------------------|------------|---------------------------------------------------------|
| plusText     | String               | undefined  | Texto a ser apresentando pelo componente                |
| bigLabelText | String               | undefined  | Texto a ser apresentado pelo componente                 |
| avatar       | AvatarDTO?           | nil        | Define componente de imagem de avatar/label de iniciais |
| imageIcon    | ContactCardImageName | icWhatsApp | Ícone auxiliar exibido no canto direito do componente   |
| showIcon     | Bool                 | true       | Toggle para mostrar ícone                               |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    let dto = ContactCardDTO(
        plusText: "Fale com seu(sua) gerente",
        bigLabelText: "Nome do gerente",
        avatar: AvatarDTO.image(
        initials: "GR",
            image: "https://templates.joomla-monster.com/joomla30/jm-news-portal/components/com_djclassifieds/assets/images/default_profile.png"
        )
    )
    let card = dependencies.artemisComponents
        .toContactCard()
        .setDTO(
            dto
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Conforme a especificação, são considerados requisitos essenciais de qualidade da entrega seguindo os critérios padrões do time de Design Foundation. Estes serão os critérios utilizados para definição de ”pronto” das entregas:
Critérios de Aceite (Desenvolvimento)

Orientações para validação:
Formatos e Resoluções
Prints e/ou vídeos nos tamanhos especificados conforme Critérios de Aceite (Desenvolvimento) em Formatos e Resoluções para cada plataforma (não é necessário todas as variações apenas a variação mais completa).
Variações do componente
Evidências com todas as variações e estilos implementados.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonContactCard(
          height: 108
        )
    }()
    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
    required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - BannerAdItemDTO
    - Exemplos
    - Acessibilidade
- Skeleton
    - Exemplo

<!-- image -->

#### Guidelines

- Devido a requisitos de cores de marcas, o hex da cor de background do componente é passada via DTO
- Componente possui toque primário em toda sua área
- Componente possui toque secundário para LinkArrow

### Funções / Modificadores

| Atributo                                                           | Parametro              | Default   | Descrição                                                                      |
|--------------------------------------------------------------------|------------------------|-----------|--------------------------------------------------------------------------------|
| func setStyle(_ style: BannerAdItemStyle)                          | '.normal' | '.inverse' | .normal   | Define o estilo do componente                                                  |
| func setDTO(_ dto: BannerAdItemDTO)                                | BannerAdItemDTO        | undefined | Define os dados configuraveis do componente. Veja a abaixo.                    |
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void)           | completion de ação     | undefined | Configurar callback para receber informação de carregamento do componente      |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void)         | completion de ação     | undefined | Configurar callback para receber informação de aparição do componente          |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void)          | completion de ação     | undefined | Configurar callback para receber informação de clique primário no componente   |
| func onSecondaryClick(_ callback: @escaping (DTOProtocol) -> Void) | completion de ação     | undefined | Configurar callback para receber informação de clique secundário no componente |

### BannerAdItemDTO

| Atributo        | Tipo         | Default   | Descrição                                                    |
|-----------------|--------------|-----------|--------------------------------------------------------------|
| title           | String       | undefined | Valor do título do banner                                    |
| imageDTO        | ImageDTO     | undefined | DTO para componente interno de Image                         |
| description     | String?      | nil       | Valor da descrição do banner                                 |
| backgroundColor | String       | undefined | Cor do background do banner, em formato hex (e.g. "#FFFFFF") |
| linkArrowDTO    | LinkArrowDTO | undefined | DTO para componente interno de LinkArrow                     |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var backgroudColor = "#141414"
    lazy var linkArrowDTO = LinkArrowDTO(
        title: "Link"
    )
    lazy var imageDTO = ImageDTO.icon(
        image: ImageName.illuSample
    )
    
    lazy var buttonFlex = dependencies
        .artemisComponents
        .toBannerAdItem()
        .setDTO(
            BannerAdItemDTO(
                title: "Titulo do banner",
                imageDTO: imageDTO,
                backgroundColor: backgroudColor,
                linkArrowDTO: linkArrowDTO,
                description: "Descrição do banner"
            )
        )
        .setStyle(
            .normal
        )
        .onLoad { _ in
            print("Banner loaded")
        }
        .onAppear{ _ in
            print("Banner appeared")
        }
        .onClick { _ in
          print("Banner primary click")
        }
        .onSecondaryClick { _ in
          print("Banner link arrow click")
        }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

Banner Ad

a) A ilustração deve ser tratada como decorativa, ou seja, sem acessibilidade;
b) O foco vísível do LT deve compreender todos os componentes do card;
c) A semântica atribuída ao card deve ser "Button";
d) O que deve ser lido::
Description + Button + semântica "Button".

Comportamento e interação:
a) Um toque: aplica o foco visível no Banner Ad e o LT anuncia seu respectivo conteúdo;
b) Dois toques: aciona o CTA.

```
private extension BannerAdItemView {
    func fillAccessibility(with dto: DTO) {
        accessibilityTraits = .button
        isAccessibilityElement = true
        accessibilityValue = dto.accessibilityValue
    }
}

extension BannerAdItemDTO {
    var accessibilityValue: String {
        [
            title,
            description,
            linkArrowDTO.accessibilityValue
        ].joined(
            separator: ". "
        )
    }
}
```

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonBannerAdItem()
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.remakeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
        }
        customView.startShimmer()
     }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
    - Atributos

Sobre o elemento

Shape List Single Select Item é um componente exclusivamente voltado atender listagens de seleção simples.

Só é possível aplicar Radio Button (seleção single).

### Guidelines

- O elemento não pode ser utilizado sozinho, deve ser utilizado o componente ShapeListSingleSelectBundle contendo 1 item;
- Pode receber identifier;
- Pode receber tag;
- ListContentArea obrigatório;
- Item pode iniciar selecionado ou não;
- Tap/pressed state (overlay) aplica em todo componente, que inclusive muda seu background e borda quando selecionado;
- Uma vez selecionado não pode mais ser desmarcado.

### Funções / Modificadores

| Atributo                                         | Parametro                    | Default   | Descrição                                                   |
|--------------------------------------------------|------------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ShapeListSingleSelectItemDTO) | ShapeListSingleSelectItemDTO | undefined | Define os dados configuráveis do componente. Veja a abaixo. |

### Atributos

| Atributo           | Tipo                   | Default   | Descrição                                                           |
|--------------------|------------------------|-----------|---------------------------------------------------------------------|
| listContentAreaDTO | ListContentAreaDTO     |           | Define o texto pertencente ao componente                            |
| isSelected         | Bool                   |           | Estado do item atual, o item se altera visualmente                  |
| identifierDTO?     | IdentifierDTO          | nil       | Define o identifier que fica na esquerda do componente              |
| tagDTO?            | TagDTO                 | nil       | Define a tag que fica ACIMA do listContentArea                      |
| subTag1DTO?        | TagDTO?                | nil       | Primeira tag de abaixo do texto da esquerda para direita            |
| subTag2DTO?        | TagDTO?                | nil       | Segunda tag de abaixo do texto da esquerda para direita             |
| foregroundColor?   | NotTokenableColorName? | nil       | Cor do contorno e do RadioButton, quando selecionado                |
| disabled           | Bool                   | false     | Desabilita o item escondendo o radioButton e não permitindo seleção |

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
- Exemplos
- Acessibilidade

<!-- image -->

#### Guidelines

- Subclasse de ButtonItem adicionando método de animação de conteúdo de texto

### Funções / Modificadores

| Atributo                                              | Parametro         | Default            | Descrição                                                                                            |
|-------------------------------------------------------|-------------------|--------------------|------------------------------------------------------------------------------------------------------|
| func animateText(dto: ButtonItemDTO, isFromTop: Bool) | ButtonItemDTOBool | undefinedundefined | Atualiza o componente com um novo DTO e anima a transição dependente da direção passada via booleano |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var buttonBundle = dependencies.artemisComponents
        .toButtonBundle()
        .setDTO(buttonBundleDTO().first!)
        .onClick { _ in
            print("Tapped Button Animation Component")
        }
        
    lazy var carousel = dependencies.artemisComponents
        .toCreditCardCarousel()
        .setDTO(creditCardCarouselDTO())
        .onAppearChild { [weak self] index, _ in
            guard let self else {
                return
            }
            let isFromTop = index > oldIndex
            if index != oldIndex {
                buttonBundle.startAnimation(dto: buttonBundleDTO()[index], isFromTop: isFromTop)
                oldIndex = index
            }
        }
    
    var oldIndex = 0

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creditCardCarouselDTO() -> CreditCardCarouselDTO {
        ...
    }
    
    func buttonBundleDTO() -> [ButtonBundleDTO] {
        [ButtonBundleDTO(primary: ButtonAnimationDTOsAndStyles(ButtonItemDTO("Faça Pix parcelado com cartão"), style: .primaryNeutral),
                        secondary: ButtonItemDTOsAndStyles(ButtonItemDTO("Item Button 1"),
                                                           style: .tertiaryNeutral)),
        ButtonBundleDTO(primary: ButtonAnimationDTOsAndStyles(ButtonItemDTO("Ver movimentações"), style: .primaryNeutral),
                        secondary: ButtonItemDTOsAndStyles(ButtonItemDTO("Item Button 2"),
                                                           style: .tertiaryNeutralInverse))

    }
}
```

## Acessibilidade

a) O rótulo deve descrever com clareza a finalidade de cada Button Item.
b) O estado do button item precisa ser condizente com sua situação e deve ser anunciado corretamente pelo LT quando alterado.
c) O que deve ser lido:

- Rótulo + Semântica: button + estado: (somente quando "Disabled" ou "Pressed").

*Comportamento e Interação:*
a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques no Button Item ativa o CTA ou altera o estado.
Ao marcar: a. O foco se mantem no agrupamento e o LT deve anunciar a alteração de estado "marcado";
Ao desmarcar: O foco se mantem no Button Item e o LT deve anunciar a alteração de estado desmarcado.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ]

O componente Menu List Item representa um item de menu que é usado pelo componente Menu List para compor sua lista.

#### Guidelines

- Componente utilizado para construir o componente de item do Menu List

### Funções / Modificadores

| Função                                                             | Descrição                                                                      | Parametro                 | Default    |
|--------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------|------------|
| func setStyle(_ style: BannerAdItemStyle)                          | Define o estilo do componente                                                  | '.default' | '.highlight' | '.default' |
| func setDTO(_ dto: MenuListItemDTO)                                | Define os dados configuráveis do componente. Veja a abaixo.                    | MenuListItemDTO           | undefined  |
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void)           | Configurar callback para receber informação de carregamento do componente      | completion de ação        | undefined  |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void)         | Configurar callback para receber informação de aparição do componente          | completion de ação        | undefined  |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void)          | Configurar callback para receber informação de clique primário no componente   | completion de ação        | undefined  |
| func onSecondaryClick(_ callback: @escaping (DTOProtocol) -> Void) | Configurar callback para receber informação de clique secundário no componente | completion de ação        | undefined  |

### MenuListItemDTO

| Atributo        | Tipo              | Default   | Descrição                                   |
|-----------------|-------------------|-----------|---------------------------------------------|
| title           | String?           | undefined | Título do item de lista de menu             |
| animatedTextDTO | AnimatedTextDTO?  | nil       | Data Transfer Object para o AnimatedTextDTO |
| tagTitle        | String?           | nil       | Título da tag do item de lista de menu      |
| icon            | ImageName         | undefined | Ícone do item de lista de menu              |
| style           | MenuListItemStyle | .default  | Estilo do item de lista de menu             |

## Como utilizar

### BaseModule + MenuList

```
import ArtemisComponentsInterface
import Foundation
import UIKit

final class MenuListItemClient {
    typealias Dependencies = HasArtemisModulesInterface & HasArtemisComponentsInterface
    private let dependencies: Dependencies
    
    private lazy var module: (module: any BaseModuleInterface, component: any MenuListInterface) = dependencies.artemisModules.toMenuList()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func setupMenuList() -> UIView {
        module
            .module
            .setDTO(.init(sectionTitleDTO: .init(title: "Title")))
        
        module
            .component
            .setDTO(
            .init(
                items: [
                    .staticTitle("Title", icon: .icAddCard),
                    .halfAnimatedTitle(
                        title: "Title Title",
                        animatedTextDTO: .init(
                            firstText: "First",
                            secondText: "Second"
                        ),
                        icon: .icAddCard,
                        style: .highlight
                    ),
                    .fullAnimatedTitle(
                        .init(
                            firstText: "First",
                            secondText: "Second"
                        ),
                        icon: .icAddCard
                    )
                ]
            )
        )
        
        return module.module
    }
}
```

<!-- image -->

### BaseModule + MenuList + Loading

```
import ArtemisComponentsInterface
import Foundation
import UIKit

final class MenuListItemClient {
    typealias Dependencies = HasArtemisModulesInterface & HasArtemisComponentsInterface
    private let dependencies: Dependencies
    
    private lazy var module: (loadable: (loadable: any LoadableInterface, module: any BaseModuleInterface), component: any MenuListInterface) = dependencies.artemisComponents.toLoadableMenuList()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func setupMenuList() -> UIView {
        module
            .loadable
            .module
            .setDTO(.init(sectionTitleDTO: .init(title: "Title")))

        let items: [MenuListItemDTO] = [
            .halfAnimatedTitle(
                title: "Title Title",
                animatedTextDTO: .init(
                    firstText: "First",
                    secondText: "Second"
                ),
                icon: .icAddCard,
                style: .highlight
            )
        ]

        module
            .component
            .setDTO(.init(items: items))
        
        module.loadable.loadable.stopShimmer()
        return module.loadable.loadable
    }
    
    func setupMenuListLoading() -> UIView {
        module.loadable.loadable
    }
}
```

<!-- image -->

<!-- image -->

## Exemplos

## Acessibilidade

- A acessibilidade do componente é como um todo, as labels, tag e ícone não possuem acessibilidades separadas
- O ícone deve ser ignorado pelo LT;
- O que deve ser lido: Text &gt; Tag &gt; Semântica: button.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Variações
    - Funções / Modificadores
    - ButtonFlexDTO
- Exemploslt: PRIMARY
- Acessibilidade
- Skeleton
    - Exemplos

### Guidelines

- Possui versão primaryNormal, primaryCustom, primaryCritical, secondaryNormal, secondaryCustom.
- Não deve ultrapassar 20 characteres.

### Variações

<!-- image -->

<!-- image -->

### Funções / Modificadores

| Método                                                                                                              | Parametro                                                                                                  | Default        | Descrição                                                                                                 |
|---------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|----------------|-----------------------------------------------------------------------------------------------------------|
| func setStyle(_ style: ButtonFlexStyle)                                                                             | '.primaryNormal' | '.primaryCustom' | '.primaryCritical' | '.secondaryNormal' | .secondaryCustom'| 'brand' | .primaryNormal | Define o estilo do componente                                                                             |
| func setDTO(_ dto: ButtonFlexDTO)                                                                                   | ButtonFlexDTO                                                                                              | undefined      | Define os dados configuraveis do componente. Veja a abaixo.                                               |
| func changeStyleAnimated(from fromStyle: ButtonFlexStyle, to toStyle: ButtonFlexStyle, percentage: CGFloat) -> Self | ButtonFlexStyle, ButtonFlexStyle, percentage                                                               | undefined      | Método utilizado para fazer a transição entre dois estilos segundo a porcentagem de transição entre 0 e 1 |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self                                                   |                                                                                                            |                | Método de injeção de callback para ação de toque primário no componente                                   |
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void) -> Self                                                    |                                                                                                            |                | Método de injeção de callback para momento de carregamento do componente em memória                       |
| func onAppear() -> Self                                                                                             |                                                                                                            |                | Método para forçar chamada do callback de onAppear                                                        |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void) -> Self                                                  |                                                                                                            |                | Método de injeção de callback para quando o componente aparece em tela                                    |
| func onTap()                                                                                                        |                                                                                                            |                | Método forçar chamada do callback de toque primário no componente                                         |

### ButtonFlexDTO

| Atributo   | Tipo   | Default   | Descrição               |
|------------|--------|-----------|-------------------------|
| title      | string | undefined | Valor do texto do botao |

## Exemploslt: PRIMARY

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var buttonFlex = dependencies
        .artemisComponents
        .toButtonFlex()
        .setDTO(.init(title: "Title"))
        .setStyle(.primary)
        .onLoad{ dto in
            print("ButtonFlex On load \(dto)")
        }
        .onAppear { dto in
            print("ButtonFlex On appear \(dto)")
        }
        .onClick { dto in
            print("ButtonFlex was clicked \(dto)")
        }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

a) Se houver mais de um, cada button Flex deve ser focado e anunciado pelo LT individualmente;
b) O rótulo deve descrever com clareza a finalidade de cada Button Flex.
c) O que deve ser lido:

- Rótulo + Semântica: button.

Comportamento e Interação:
a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques no Button Flex ativa o CTA.

```
private extension ButtonFlexView {
    func setupAccessibility() {
        isAccessibilityElement = true
        accessibilityTraits = .button
    }

    func fillAccessibility(with dto: DTO) {
        accessibilityValue = dto.accessibilityValue
    }
}

extension ButtonFlexDTO {
    var accessibilityValue: String {
        title
    }
}
```

## Skeleton

<!-- image -->

### Exemplos

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonButtonFlex(
            width: width,
            margin: margin
        )
    }()

    private let width: CGFloat?
    private let margin: Margin
    init(
        width: CGFloat? = nil,
        margin: Margin = .none
    ) {
        self.width = width
        self.margin = margin
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

   required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - ShareWalletCarouselDTO
    - CardDTOsAndStyles
- Exemplos
- Acessibilidade

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionAllEventProtocol
- MarginToggle

<!-- image -->

<!-- image -->

#### Guidelines

- Carrossel horizontal de ShareWallerItem paginado por padrão

### Funções / Modificadores

| Atributo                                            | Parametro               | Default   | Descrição                                                          |
|-----------------------------------------------------|-------------------------|-----------|--------------------------------------------------------------------|
| func setDTO(_ dto: ShareWalletCarouselDTO)          | ShareWalletCarouselDTO  | undefined | Define os dados configuraveis do componente. Veja a abaixo.        |
| func update(dto: ShareWalletItemDTO, at index: Int) | ShareWalletItemDTO, Int | undefined | Define o dado e index do item a ser modificado no carrossel        |
| func hideAllSensitiveInfo(_ hide: Bool) -> Self     | Bool                    | undefined | Toggle para esconder/exibir valores sensíveis do item de carrossel |

### ShareWalletCarouselDTO

| Atributo               | Tipo                | Default   | Descrição                                                                                 |
|------------------------|---------------------|-----------|-------------------------------------------------------------------------------------------|
| cardDTOsAndStyles      | [CardDTOsAndStyles] | undefined | Recebe um array de itens e estilos a serem exibidos no carrossel                          |
| scrollAnimationEnabled | Bool                | undefined | Habilita/Desabilita animação de transição de estilos para o segundo elemento do carrossel |

### CardDTOsAndStyles

| Atributo   | Tipo                 | Default   | Descrição                           |
|------------|----------------------|-----------|-------------------------------------|
| dto        | ShareWalletItemDTO   | undefined | Recebe um DTO de ShareWalletItem    |
| style      | ShareWalletItemStyle | undefined | Recebe um estilo de ShareWalletItem |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let itemDefault: ShareWalletItemDTO = .defaultItem(
        type: .item,
        title: "PicPay Default",
        subtitle: "Saldo em conta",
        description: "R$ 1.000.000,00",
        image: .initials(
            "PD"
        ),
        isObfuscated: false
    )
    let itemHighlight: ShareWalletItemDTO = .defaultItem(
        type: .item,
        title: "PicPay Highlight",
        subtitle: "Saldo em conta",
        description: "R$ 1.000,00",
        image: .initials(
            "PH"
        ),
        isObfuscated: false
    )
                            
    let dto = ShareWalletCarouselDTO(
        cardDTOsAndStyles:
            [
                .init(
                    dto: itemDefault
                ),
                .init(
                    dto: itemHighlight
                )
            ],
        scrollAnimationEnabled: true
    )

    lazy var carousel = dependencies
        .artemisComponents
        .toShareWalletCarousel()
        .setDTO(
            dto
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        solutionCardCarousel.update(
            dto: .defaultItem(
                type: .item,
                title: "PicPay Default Atualizado",
                subtitle: "Saldo em conta atualizado",
                description: "R$ 100.000,00",
                image: .image(
                    initials: "PD",
                    image: "https://templates.joomla-monster.com/joomla30/jm-news-portal/components/com_djclassifieds/assets/images/default_profile.png"
                ),
                isObfuscated: true
            ),
            at: 1
        )
    }
}
```

## Acessibilidade

a) Cada Share Wallet Item deve ser lido individualmente pelo LT;
b) Todos os itens do Share Wallet Item devem ser agrupados para o foco visível e anúncio do LT;
c) O avatar deve ser tratado como decorativo;
d) O que deve ser lido:Title + Description + semântica: "Button".

Comportamento e interação:
a) Um toque: aplica o foco visível no share Wallet Item e o LT anuncia seu respectivo conteúdo;
b) Dois toques: Ativa o CTA.
c) Um arrasto da esquerda para a direita: foca o próximo Share Wallet Item e o LT anuncia todo conteúdo textual (quando na última posição, foca o próximo componente da tela);
d) Um arrasto da direita para a esquerda: foca o Share Wallet Item anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o componente que antecede o Share Wallet Carousel.

Share Wallet Item - Cenário de erro
a) A mensagem de erro e o Ícone devem ser agrupados para o foco visível e anúncio do LT;
b) O ícone deve ser tratado como decorativo;
c) O que deve ser lido:
Text da mensagem de erro
Comportamento e interação:
a) Um toque: aplica o foco visível no share Wallet Item e o LT anuncia o text da mensagem de erro.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - ContainerImageMediumDTO
- Exemplos
- Acessibilidade
- Skeleton
- Skeleton
    - Exemplos

<!-- image -->

#### Guidelines

- Componente usado para exibir imagem.

### Funções / Modificadores

| Atributo                                            | Parametro                                                                                         | Default   | Descrição                                    |
|-----------------------------------------------------|---------------------------------------------------------------------------------------------------|-----------|----------------------------------------------|
| func setDTO(_ dto: ContainerImageMediumDTO) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3962831223#ContainerImageMediumDTO | undefined | Define os dados configuráveis do componente. |

### ContainerImageMediumDTO

| Atributo   | Tipo                                                                                 | Default   | Descrição                               |
|------------|--------------------------------------------------------------------------------------|-----------|-----------------------------------------|
| imageDTO   | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/4268556397/Image+iOS#ImageDTO | undefined | Define os dados configuráveis da imagem |

## Exemplos

#### Primary

```
lazy var customView: any ContainerImageMediumInterface = {
        let converter = ArtemisConverter()
        return converter.toContainerImageMedium()
    }()

    private let dto: ContainerImageMediumDTO
    init(dto: ContainerImageMediumDTO) {
        self.dto = dto
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        customView
            .setDTO(dto)
            .onLoad { [weak self] dto in
                print(">>>> ContainerImageMedium on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> ContainerImageMedium on appear \(dto)")
            }

            customView.onAppear()
    }
```

## Acessibilidade

Sem especificação de acessibilidade do componente.

## Skeleton

<!-- image -->

### Exemplos

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonContainerImageMedium(height: height)
    }()

    private let height: CGFloat
    init(
        height: CGFloat
    ) {
        self.height = height
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(
        coder: NSCoder
    ) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
- Exemplos
- Acessibilidade
- Skeleton
    - Exemplo

#### 

<!-- image -->

<!-- image -->

### Guidelines

- Componente específico para alertar tarefas que o usuário pode executar
- A interação da barra verde aumentando ocorre em 400ms com a curva de animação Custom cubic-bezier (0.25, 0.1, 0.25,1)

### Funções / Modificadores

| Atributo                                                           | Parametro          | Default   | Descrição                                                          |
|--------------------------------------------------------------------|--------------------|-----------|--------------------------------------------------------------------|
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void) -> Self   | Método de callback | undefined | Injeção de método de comportamento ao carregar item                |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void) -> Self | Método de callback | undefined | Injeção de método de comportamento ao componente aparecer em tela  |
| func onAppear() -> Self                                            | undefined          | undefined | Chamada de método de callback injetado via onAppear(callback:)     |
| func start() -> Self                                               | undefined          | undefined | Invoca método de animação do preenchimento do visual do componente |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var chartProgressBar = dependencies
        .artemisComponents
        .toChartProgressBar()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate() {
        chartProgressBar.start()
    }
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Conteúdo textual do item 'pai' (se houver) + Texto alternativo do Chart Progressbar + semântica herdada do item 'pai' (se houver).

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonChartProgressBar()
    }()
    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
    required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - ToastDTO
- Exemplo
- Solução de problemas
    - Toast Flickering (Piscando ao aparecer ou desaparecer)
    - Toast não sendo exibido ou com problemas na animação
- Acessibilidade

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

#### Guidelines

- Ícone a esquerda do componente é customizável e opcional
- Texto de conteúdo pode ser em formato HTML, com limite de exibição de 2 linhas
- Componente começa fora do frame estabelecido e executa uma animação de deslize para baixo após invocar onAppear
- Animação de LinearTimer começa imediatamente junto com animação de deslize. Ao final do tempo de animação, o componente desliza para fora da tela novamente
- Animação pode ser encerrado prematuramente ao tocar no ícone fixo de fechar no lado direito do componente

### Funções / Modificadores

| Atributo                                                   | Parametro                   | Default   | Descrição                                                                                                                                                  |
|------------------------------------------------------------|-----------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ToastDTO)                               | ToastDTO                    | undefined | Define os dados configuraveis do componente. Veja a abaixo.                                                                                                |
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void)   | completion de ação          | undefined | Configurar callback para receber informação de carregamento do componente                                                                                  |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void) | completion de ação          | undefined | Configurar callback para receber informação de aparição do componente                                                                                      |
| func onAppear()                                            | undefined                   | undefined | Método de invocação do callback de onAppear                                                                                                                |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void)  | completion de ação de toque | undefined | Configurar callback para receber informação de toque do componente. Método também é invocado ao finalizar a animação e prosseguir com o dismiss automático |

### ToastDTO

| Atributo   | Tipo           | Default   | Descrição                                                               |
|------------|----------------|-----------|-------------------------------------------------------------------------|
| text       | String         | undefined | Conteúdo de texto do componente. Pode ser passado valores com tags HTML |
| identifier | IdentifierDTO? | nil       | DTO para o componente de ícone customizável, parâmetro opcional         |

## Exemplo

```
import ArtemisComponentsInterface

final class ExampleView: ArtemisViewController<ExampleInteracting> {
    // HasApplication é necessário para obter uma instância da KeyWindow
    typealias Dependencies = HasArtemisComponentsInterface & HasApplication
    let dependencies: Dependencies
    
    // criação do View do toast
    private lazy var toastView = dependencies
        .artemisComponents
        .toToast(initialConfiguration: .config(self))
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // adiciona o Toast como filho da KeyWindow no
    // ciclo de vida ViewDidAppear 
    // para funcionar adequadamente as animações e 
    // sempre ser visível
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        if let keyWindow = dependencies.application.keyWindow {
            keyWindow.addSubview(
                toastView
            )
            toastView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.trailing.leading.equalToSuperview()
            }
        }
    }
    
    // para exibir o toast, sempre utilize o setDTO
    // com o onAppear, não há necessidade de remover o toast
    // da view mãe
    func displayToast(dto: ToastDTO) {
        toastView
            .setDTO(dto)
            .onAppear()
            .onClick { dto in
                // aqui pode der usado para capturar evendo de tracking
                print("Timer da animação concluiu ou Close Icon tocado")
            }
    }
}
```

## Solução de problemas

### Toast Flickering (Piscando ao aparecer ou desaparecer)

Em alguns casos, ao chamar o método onAppear() do toast, a animação pode não aparecer de maneira correta corretamente, fazendo com que o componente “pisque” e suma da tela mostrando somente a animação de esconder. Nesse caso, o ideal é dar um Dispatch na main thread ao chamar esse método:

```
func displayToast(with dto: ToastDTO) {
   toast.setDto(dto)
   
   dependencies.mainQueue.async { [weak self] in
       self?.toast.onAppear()
   }
}
```

### Toast não sendo exibido ou com problemas na animação

Verifique a lista abaixo para ver se não está faltando algum passo:

- Crie o toast na como propriedade da sua ViewController:

```
private lazy var toastView = dependencies
        .artemisComponents
        .toToast(initialConfiguration: .config(self))
```

- Obtenha a instância da KeyWindow através da injeção de dependência HasApplication na sua ViewController:

```
// ...
typealias Dependencies = HasArtemisComponentsInterface & HasApplication
// ...

override func viewDidAppear(_ animated: Bool) {
  super.viewDidAppear(animated)

  if let keyWindow = dependencies.application.keyWindow {
    // sua instância da KeyWindow
  }
}
```

- Adicione o toast como filho da KeyWindow no ciclo de vida ViewDidAppear da sua ViewController:

```
// ...
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    if let keyWindow = dependencies.application.keyWindow {
        keyWindow.addSubview(
            toastView
        )
        toastView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
        }
    }
}
// ...
```

- Ao mostrar o toast, somente faça o setDTO, não há necessidade de criar outra instância do componente, também não há necessidade de remover o toast da view mãe:

```
func displayToast(dto: ToastDTO) {
    toastView
        .setDTO(dto)
        .onAppear()
}
```

## Acessibilidade

O seguintes pontos foram definidos para a acessibilidade:

- O leitor de tela (LT) deve anunciar o texto do toast sem alterar o seu foco original;
- Somente o botão do toast pode ser detectado pelo LT;
- O botão de fechar pode se focado somente se houver toque do usuário sobre ele;

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ]

O componente MilestoneProgressChart é utilizado para representar a porcentagem de conclusão de progresso do usuário em missões como forma de gamificação.

Implementa os seguintes protocolos

MarginToggle

ComponentProtocol

LifeCycleEventsProtocol

### Variações

Margin Toggle

### Estilos

O componente possui dois estilos mostrados abaixo onde os dois primeiros é utilizado o standard e os dois últimos inverse.

<!-- image -->

### Guidelines

- A barra de progresso estamos utilizando o ChartProgressBar para fazer sua construção

### Funções / Modificadores

| Atributo                                              | Parametro                 | Descrição                                                                               |
|-------------------------------------------------------|---------------------------|-----------------------------------------------------------------------------------------|
| func setStyle(_ style: MilestoneProgressChartStyle)   | '.standard' | '.inverse'  | Define o estilo do componente                                                           |
| func setDTO(_ dto: MilestoneProgressChartDTO)         | MilestoneProgressChartDTO | Define os dados configuráveis do componente. Veja abaixo.                               |
| func animate()                                        | None                      | Após passar o DTO, essa função inicia a animação de preenchimento da barra de progresso |
| func updateProgress(_ dto: MilestoneProgressChartDTO) | MilestoneProgressChartDTO | Atualiza o progresso da barra                                                           |
| func hideSensitiveInfo(_ hide: Bool) -> Self          | Bool                      | Esconde campos marcados como sensíveis no componente                                    |

### MilestoneProgressChartDTO

| Atributo             | Tipo                    | Descrição                                                                                                                                           |
|----------------------|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| leftLabel            | String                  | Label que fica na parte de cima da barra de progresso no lado esquerdo.                                                                             |
| rightLabel           | String (Opcional)       | Label que fica na parte de cima da barra de progresso no lado direito.                                                                              |
| leftLabelIsSensible  | Bool                    | Marca a label a esquerda como sensível(irá ofuscar ao ser chamado o hideSensitiveInfo no componente)                                                |
| rightLabelIsSensible | Bool                    | Marca a label a direita como sensível(irá ofuscar ao ser chamado o hideSensitiveInfo no componente)                                                 |
| progressBar          | [ ChartProgressBarDTO ] | Componente da barra de progresso que como parametro aceita um float para o seu preenchimento.Para mais detalhes olhar o componente ChartProgressBar |

### Exemplo

```
private lazy var progressChart: any MilestoneProgressChartInterface = {
    dependencies.artemisComponents.toMilestoneProgressChart(initialConfiguration: .config(self))
}()

progressChart
  .setDTO(
    MilestoneProgressChartDTO(
      leftLabel: "example",
      rightLabel: "example 2",
      rightLabelIsSensible: true,
      progressBar: ChartProgressBarDTO(...)
    )
  )
```## Sobre o elemento

- Componente de Skeleton é o nosso componente de Shimmer para serem mostrados em carregamentos de telas

Temos doc de criação de Skeletons para criação de novos skeletons:
Skeleton/Shimmer

### Guidelines

- Documentações de criação de componentes de apoio
- Documentações de criação de componentes de apoio
    - Skeleton/Shimmer
    - DSResultBuilder
    - Loadable
    - Margin

## Funções / Modificadores

| Atributo                                      | Parametro     | Default   | Descrição                                                   |
|-----------------------------------------------|---------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: SkeletonDTO)               | SkeletonDTO   | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: SkeletonStyle) -> Self | SkeletonStyle | undefined | Configura estilo do skeleton. Veja abaixo                   |

## SkeletonDTO

| Atributo     | Tipo             | Default   | Descrição                                                                                       |
|--------------|------------------|-----------|-------------------------------------------------------------------------------------------------|
| radius       | BorderRadiusName | undefined | Corner radius que sera aplicado no skeleton.                                                    |
| height       | CGFloat?         | nil       | Tamanho da altura do componente, se não passado irá se adaptar ao pai baseado nas constraints.  |
| width        | CGFloat?         | nil       | Tamanho da largura do componente, se não passado irá se adaptar ao pai baseado nas constraints. |
| margin       | Margin           | none      | Margin aplicada no componente para consegui aplicar um espaço extra no componente               |
| isShimmering | Bool             | undefined | Configurar se o Skeleton ira comecar mostrando shimmer ou não                                   |

## SkeletonStyle

- default
- default
    - color: BackgroundB
- onColor
- onColor
    - color: overlayBright

## SkeletonEventProtocol

- protocol base é que usado para todos os componentes que usam Shimmer, como por exemplo:
- protocol base é que usado para todos os componentes que usam Shimmer, como por exemplo:
    - Loadables
    - Skeletons
    - CarouselSkeleton
    - SkeletonBuilder

| Atributo                    | Parametro   | Default   | Descrição                                      |
|-----------------------------|-------------|-----------|------------------------------------------------|
| func startShimmer() -> Self | undefined   | undefined | Faz o shimmer do Skeleton ficar visivel        |
| func stopShimmer() -> Self  | undefined   | undefined | Faz o shimmer do Skeleton ficar escondido      |
| func isShimmering() -> Bool | undefined   | undefined | retorna se o skeleton esta com shimmer ativado |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeleton()
    }()

    private let style: SkeletonStyle
    private let dto: SkeletonDTO
    init(style: SkeletonStyle, dto: SkeletonDTO) {
        self.style = style
        self.dto = dto
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
		customView.snp.remakeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.greaterThanOrEqualToSuperview().inset(16)
            make.bottom.trailing.lessThanOrEqualToSuperview().inset(16)
            make.centerY.equalToSuperview()
		}

        customView
            .setStyle(style)
            .setDTO(dto)
            .onLoad { [weak self] dto in
                print(">>>> Skeleton on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> Skeleton on appear \(dto)")
            }
            .onChange { [weak self] dto in
                print(">>>> Skeleton on change \(dto)")
            }

        backgroundColor = style == .onColor ? .purple : .clear

        customView.onAppear()

        DispatchQueue.main.asyncAfter(after: .now() + 2) {
            self.customView.stopShimmer()
            DispatchQueue.main.asyncAfter(after: .now() + 2) {
                self.customView.startShimmer()
            }
        }
     }

    func willDisplay() {
        if dto.isShimmering {
            customView.startShimmer()
        } else {
            customView.stopShimmer()
        }
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## ColorName

Definições de cores baseadas em tokens e variáveis de acordo com o tema (VEJA AS CORES):

- accent
- globalTabBackground
- globalNavBackground
- globalNavActiveBG
- globalNavActiveText
- globalNavColor
- borderA
- borderB
- borderBrand
- backgroundA
- backgroundB
- backgroundC
- backgroundD
- backgroundBrandA
- backgroundBrandB
- backgroundBrandC
- contentA
- contentB
- contentC
- contentD
- contentBrandA
- contentBrandB
- contentBrandC
- overlayNormalBright
- overlayBright
- overlayBrighter
- overlayNormalDark
- overlayDark
- overlayDarker
- overlayBrand
- supportSuccessA
- supportSuccessB
- supportCautionA
- supportCautionB
- supportCriticalA
- supportCriticalB
- supportObfuscated
- supportShimmer
- supportShimmerOnColor
- themeEpicColor
- themeGoldColor

## UnderageColors

- themeGreenDefault
- themeGreenDark
- themeGreenDarkest
- themeYellowDefault
- themeYellowDark
- themeYellowDarkest
- themeGrayDefault
- themeGrayDark
- themeGrayDarkest

## NotTokenableColorName

Definições de cores invariáveis com relação a tema ou tokens

- ifBb
- ifBradesco
- ifCaixa
- ifItau
- ifMercadoPago
- ifNubank
- ifOriginal
- ifSantander
- ifNeutral
- ifBmg
- ifBtg
- ifIti
- ifPan
- ifSicobi
- ifXp
- ifNext
- ifC6
- ifOther

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ] [  ] [  ] [  ]

A classe ReceiptHeaderView é a responsável por criar o componente em questão. É utilizado dois componentes ja existentes no módulo ArtemisComponents na sua construção, como no caso o Identifier e o Title.

Um exemplo de uso do componente pode ser encontrado no nosso ArtermisComponentsSample que pode ser acessado no projeto ou via TestFlight.

#### Guidelines

- Possuir um identifier;
- Possuir um título e subtítulo;

### Funções / Modificadores

| Atributo                                     | Parametro        | Default   | Descrição                                                   |
|----------------------------------------------|------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ReceiptHeaderDTO) -> Self | ReceiptHeaderDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: TitleStyle) -> Self   | .normal .clear   | undefined | Define o estilo da imagem do componente.                    |

### ReceiptHeaderDTO

| Atributo      | Tipo          | Default   | Descrição                                 |
|---------------|---------------|-----------|-------------------------------------------|
| titleDTO      | TitleDTO      | N/A       | Data Transfer Object para o TitleDTO      |
| identifierDTO | IdentifierDTO | N/A       | Data Transfer Object para o IdentifierDTO |

### Variações

Caso faça sentido, descreva nessa seção as possíveis variações do componente, como tamanhos, cores, estilos etc. Por exemplo:

- Estilos disponíveis:

| clear   | normal   |
|---------|----------|
|         |          |

## Como utilizar

#### Implementação via código

```
import ArtemisComponentsInterface
final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var header = dependencies
        .artemisComponents
        .toReceiptHeader()
        .setDTO(
            .init(
                titleDTO: .init(titleText: "Título de seção", subtitleText: "Subtítulo da seção"),
                identifierDTO: .neutralDarkIcon(image: .icCheck, accessibilityValue: "Check")
            )
        .setStyle(.normal)
```

## Acessibilidade

A acessibilidade deve ser lida conforme ja foi definido nos componentes que compõem o Receipt Header. No caso deve-se ler apenas o Título e a Descrição, ignorando o Identificador.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
    - Atributos
    - Exemplos

Sobre o elemento

Shape List Multi Select Bundle é um componente para atender listagens de seleção múltipla.

É possível utilizar itens com Checkbox ou Toggle.

|    |    |     |
|----|----|-----|
|    |    |     |

### Guidelines

- Recebe uma lista de de items do tipo ShapeListMultiSelectItemDTO.
- Pode receber inicialmente 0…N itens marcado ou não.
- Componente pode ter o item de mais opções no final da lista.
- É possível adicionar/remover margens no top e bottom da lista, default é ambas habilitadas

### Funções / Modificadores

| Atributo                                          | Parametro                     | Default   | Descrição                                                                |
|---------------------------------------------------|-------------------------------|-----------|--------------------------------------------------------------------------|
| func setDTO(_ dto: ShapeListMultiSelectBundleDTO) | ShapeListMultiSelectBundleDTO | undefined | Define os dados configuráveis do componente. Veja abaixo.                |
| func getSelectedItems()                           | N/A                           | N/A       | Método utilizado para retornar os itens da lista que estão selecionados. |
| enableTopMargin                                   | Bool                          | true      | Toggle de margem de topo do componente                                   |
| enableBottomMargin                                | Bool                          | true      | Toggle de margem de baixo do componente                                  |

### Atributos

| Atributo                         | Tipo                        | Default   | Descrição                                                |
|----------------------------------|-----------------------------|-----------|----------------------------------------------------------|
| items                            | [ShapeMultiSelectDTO]       |           | Define os itens que serão apresentados na lista.         |
| type                             | ShapeListMultiSelecType     |           | Define o tipo dos itens: checkbox ou toggle.             |
| shapeListMoreOptionItemDTO       | ShapeListMoreOptionItemDTO? | nil       | Define o componente de mais opções no final da listagem. |
| shouldChangeElementActionOnClick | Bool                        | true      | Define se o toggle será realizado no clique              |

| ShapeMultiSelectDTO   | Tipo               | Default   | Descrição                                                            |
|-----------------------|--------------------|-----------|----------------------------------------------------------------------|
| listContentAreaDTO    | ListContentAreaDTO |           | Define os textos do item.                                            |
| isSelect              | Bool               |           | Item selecionado ou não.                                             |
| tagDTO                | TagDTO?            | nil       | Tag superior de informação.                                          |
| identifierDTO         | IdentifierDTO      | nil       | Identificador, ou menor, ícone, imagem, etc.                         |
| disabled              | Bool               | false     | Permite habilitar ou desabilitar a interação com o click do usuário. |

### Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    let dto = ShapeListMultiSelectBundleDTO(items: [ShapeMultiSelectItemDTO(listContentAreaDTO: ListContentAreaDTO(label: "Top Label"),
                                                                            checkboxSelected: true,
                                                                            identifierDTO: .highlightIcon(image: .icPix, accessibilityValue: "")),
                                                    ShapeMultiSelectItemDTO(listContentAreaDTO: ListContentAreaDTO(label: "Top Label"),
                                                                            checkboxSelected: false,
                                                                            identifierDTO: .highlightIcon(image: .icPix, accessibilityValue: "")),
                                                    ShapeMultiSelectItemDTO(listContentAreaDTO: ListContentAreaDTO(label: "Top Label"),
                                                                            checkboxSelected: true)])
    //Caso necessite do componente MoreOptions, basta passar na inicialização do ShapeListMultiSelectBundleDTO 
    lazy var shapeListMultiSelectBundle = dependencies
            .artemisComponents
            .toShapeListMultiSelectBundle(isScrollable: true)
            .setDTO(dto)
          
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        setupComponent()
    }
    
    func setupComponent() {
          customView
          .onChangeChild { [weak self] _, dto  in
              print(">>>> ShapeListSingleSelect on ChangeChild \(dto)")
          }
          //Caso tenha o moreOptions pode capturar o click através do método:
          .onMoreOptionsClick { [weak self] _, dto  in
             print(">>>> ShapeListMultiSelect on MoreOptionsClick \(dto)")
          }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - HeroCardItemDTO
- Exemplos
- Acessibilidade

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

#### Guidelines

- Componente em formato de cartão responsável por exibir informações agrupadas de diversas formas, tais como: ofuscar informações, links, barras de progresso, imagens e botões.

| Atributo                                                 | Parametro                                                                                                                                                                 | Default   | Descrição                                                   |
|----------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------|
| func setDefaultStyle(_ style: HeroCardItemStyle) -> Self | .defaultNormal  .defaultCritical .defaultError                                                                                                                            | undefined | Define o estilo padrão do componente                        |
| func setStyle(_ style: HeroCardItemStyle) -> Self        | .defaultNormal  .defaultCritical.defaultInverted .highlightNormal .highlightCritical .defaultError .highlightError.picPayFI .highlightPicPayFI .otherFI .highlightOtherFI | undefined | Define o estilo do componente                               |
| func setDTO(_ dto: ButtonFlexDTO) -> Self                | HeroCardItemDTO                                                                                                                                                           | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func hideSensitiveInfo( _ hide: Bool ) -> Self           | hide                                                                                                                                                                      | undefined | Define a visibilidade de informações no componente.         |

### HeroCardItemDTO

| Atributo            | Tipo             | Default   | Descrição                                                   |
|---------------------|------------------|-----------|-------------------------------------------------------------|
| title               | String           | undefined | Texto a ser representando o titulo do componente            |
| link                | LinkArrowDTO     | undefined | Texto representando o link                                  |
| subtitle            | String           | undefined | Texto representando o subtitulo do componente.              |
| subtitleDescription | String           | undefined | Texto representando a descrição do subtítulo do componente. |
| description         | String           | undefined | Texto representando a descrição do componente.              |
| descriptionValue    | String           | undefined | Texto representando a descrição do componente.              |
| buttonDTO           | ButtonItemDTO    | undefined | Representa o botão do componente.                           |
| hasImage            | Bool             | undefined | Representa se co componente tem imagem.                     |
| type                | HeroCardItemType | undefined | Representa o tipo de componente HeroCardItem                |
| isObfuscated        | Bool             | undefined | Representa se terá informações ofuscadas.                   |
| hideEyeButton       | Bool             | undefined | Representa a visibilidade do botão com a imagem de olho.    |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var heroCardItem = dependencies
        .artemisComponents
        .toHeroCardItem()
        .setDTO( 
              .item(
                title: "Title",
                link: .init(
                    title: "Link"
            ),
            subtitle: "Saldo",
            subtitleDescription: "R$ 0,00",
            description: "Limite especial",
            descriptionValue: "R$ 700,00",
            buttonDTO: ButtonItemDTO(
                "Button",
                hasArrow: false
            ),
            isObfuscated: false
        )
        .setStyle(.default)
        .setDelegate(self)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Todo o conteúdo de texto disponível no componente
    - A semântica deverá ser seguir as ações disponíveis.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - ListItemDTO
- Exemplos
- Acessibilidade

|      |      |    |
|------|------|----|
|      |      |    |
|      |      |    |
|      |      |    |
|      |      |    |
|      |      |    |
|      |      |    |
|      |      |    |

#### Guidelines

List Item é um componente exclusivamente voltado para construção de listas cujo propósito é atender listagens de parâmetro, navegação entre seções e lista com múltiplas seleções.

Só é possível aplicar ícone, toggle ou checkbox com esta lista, não é permitido para radio.

- Componente possui opção com e sem divider.
- Componente possui opção com e sem divider.
    - A opção sem o elemento divider será utilizada quando o item for o último das listas.
- Componente possui opção com e sem Identifier;
- Componente possui opção com e sem Element Action;
- Identifier é um base element que pode receber IF, Merchant, Avatar e Icon;
- Componente pode apresentar Tag (opcional, padrão desativado);
- Limitações de linhas estão especificadas no Content Area;
- Tap/pressed state (overlay) aplica em todo o elemento.

### Funções / Modificadores

| Atributo                                                                                | Parametro                                                                             | Default   | Descrição                                                                                                              |
|-----------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|-----------|------------------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ListItemDTO) -> Self                                                 | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3584655516#ListItemDTO | undefined | Define dados configuráveis do componente. Veja a abaixo.                                                               |
| func hideDivider() -> Self                                                              | -                                                                                     | -         | Esconde divider.                                                                                                       |
| func hideSensitiveInfo(_ hide: Bool)                                                    | Bool                                                                                  | undefined | Esconde/mostra informações sensíveis.                                                                                  |
| func change() -> Self                                                                   | -                                                                                     | -         | Pode ser usado em casos que seja necessária a alteração do status o Toggle ou Checkbox, por exemplo.                   |
| func setStyle(_ style: ListItemStyle) → Self                                            | ListItemStyle                                                                         |           | Seta o style do ListItem. Isso impacta em como o background e as áreas content, identifier e action irão se comportar. |
| func setIdentifierContentMode( _ mode: UIView.ContentMode, with size: CGSize? ) -> Self | UIView.ContentModeCGSize?                                                             | -         | Alterar o UIView.ContentMode, do IdentifierInterface, possibilitando alterar o modo que a imagem é renderizada         |

### ListItemDTO

| Atributo                         | Tipo                    | Default   | Descrição                                                                                                                                                                                                                     |
|----------------------------------|-------------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| contentAreaDTO                   | ListContentAreaDTO      | undefined | Define dados configuráveis do content area.                                                                                                                                                                                   |
| identifierDTO                    | IdentifierDTO           | undefined | Define dados configuráveis do identifier.                                                                                                                                                                                     |
| tagDTO                           | TagDTO                  | undefined | Define dados configuráveis da tag.                                                                                                                                                                                            |
| elementActionDTO                 | ElementActionDTO        | undefined | Define dados configuráveis do Element Action.                                                                                                                                                                                 |
| isSelectionStyleNone             | Bool                    | undefined | Indica se o estilo de seleção está desativado.                                                                                                                                                                                |
| isInteractionEnabled             | Bool                    | undefined | Indica se a interação está habilitada.                                                                                                                                                                                        |
| shouldChangeElementActionOnClick | Bool                    | true      | Define se o `ElementAction` do item será alterado no clique. Essa propriedade é útil em casos que existe um `Toggle` ou `Checkbox` no item, e no clique o status dessas views não deve ser alterado.O valor default é `true`. |
| buttonFlexDTO                    | ButtonFlexDTOsAndStyles | nil       | Define o buttonFlex do componente.                                                                                                                                                                                            |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    let dto = ListItemDTO(
      contentAreaDTO: ListContentAreaDTO(
        label: "Top Plus Label com texto grande para forçar quebra de texto em mais de uma linha e em telas menoreres Medium Bottom Label Bottom Plus"
      ),
      identifierDTO: IdentifierDTO(
        style: .highlight,
        accessibilityValue: "",
        icon: ImageDTO.icon(image: .icWallet)
      )
      tagDTO: TagDTO(title: "Teste Tag")
    )
	
    lazy var listItem = dependencies
        .artemisComponents
        .toListItem()
		.setDTO(
			dto
		)
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

a) Todos os itens devem ser agrupados para o foco visível e anuncio do LT;
b) O identifier e o Element Action Icon devem ser marcados como decorativos para o LT;
c) em android os Element Action Toggle e Checkbox devem ser identificados semanticamente como "Interruptor" e "Caixa de seleção", respectivamente;
d) em iOS os Element Action Toggle e Checkbox devem ser identificados semanticamente como "Botão alternar" e "Botão", respectivamente;
e) O que deve ser lido:
. Em android: Description + semântica + estado;
. Em iOS: Toggle: Description + semântica + estado / Checkbox: Estado (somente quando selecionado) &gt; Description &gt; Semântica.

Comportamento e interação:
a) Um toque: aplica o foco visível no List e o LT anuncia seu respectivo conteúdo;
b) Dois toques: aciona o CTA.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!- FontStyleName / iOS
- ColorName / iOS
- Elevations / iOS## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - InputPasswordDTO
- Exemplos
- Acessibilidade

#### Guidelines

- O componente InputPassword será utilizado para construção dos Templates de inserção de senhas.

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

| Atributo                                                                                      | Parametro          | Default   | Descrição                                                                                        |
|-----------------------------------------------------------------------------------------------|--------------------|-----------|--------------------------------------------------------------------------------------------------|
| func setStyle(_ style: InputPasswordStyle) -> Self                                            | .normal            | undefined | Define o estilo padrão do componente                                                             |
| func setDTO(_ dto: InputPasswordDTO) -> Self                                                  | InputPasswordDTO   | undefined | Define o estilo do componente                                                                    |
| func unfocus() -> Self                                                                        |                    | undefined | Chamada quando o foco o campo de texto não está em foco                                          |
| func focus() -> Self                                                                          |                    | undefined | Chamada quando o foco o campo de texto está em foco                                              |
| func didEndEditing(_ callback: @escaping (UITextField) -> Void) -> Self                       | callback           | undefined | Callback chamado quando o campo de texto terminou de ser editado                                 |
| func didChangeSelection(_ callback: @escaping (UITextField) -> Void) -> Self                  | callback           | undefined | Callback chamado quando o campo de texto foi alterado                                            |
| func didChange( _ callback: @escaping (UITextField) -> Bool) -> Self                          | callback           | undefined | Callback chamado quando o campo de texto foi editado                                             |
| func shouldBeginEditing(_ callback: @escaping (UITextField) -> Bool) -> Self                  | callback           | undefined | Callback chamado quando o campo de texto começar a ser editado                                   |
| func shouldChangeTextIn(_ callback: @escaping (UITextField, NSRange, String) -> Bool) -> Self | callback           | undefined | Callback chamado quando o campo de texto começar a ser alterado                                  |
| func displayError(_ errorMessage: String)                                                     | errorMessage       | undefined | Chamada para mostrar uma mensagem de erro abaixo do campo de texto                               |
| func displaySupportingMessage(_ message: String)                                              | message            | undefined | Chamada para mostrar uma mensagem abaixo do campo de texto                                       |
| func setCheck(_ isSatisfied: Bool, at index: Int)                                             | isSatisfied, index | undefined | Função que altera o estado de alguma regra dado se está satisfeita ou não e o índice dessa regra |
| func ruleStateDidChange(_ callback: @escaping (InputPasswordRule) -> Void) -> Self            | callback           | undefined | Função chamada quando o estado de alguma regra é alterado                                        |

### InputPasswordDTO

| Atributo       | Tipo                 | Default   | Descrição                                  |
|----------------|----------------------|-----------|--------------------------------------------|
| passwordLength | Int                  | 6         | Tamanho mínimo da senha                    |
| text           | String               | ""        | Texto do campo de texto                    |
| supportingText | String?              | nil       | Texto apresentado abaixo do campo de texto |
| rules          | [InputPasswordRule]? | nil       | Regras para a senha ser válida             |

## Exemplos

#### Primary

```
import ArtemisComponents

final class CustomView: UIView {
    typealias Dependencies = HasArtemisComponentsInterface
    let dependencies: Dependencies
    let converter = ArtemisConverter()
    
    lazy var inputPassword = converter
        .toInputPassword()
        .setDTO(
            InputPasswordDTO(
              passwordLength: 8, rules: [
              InputPasswordRule(title: "A senha deve ter 8 números", isSatisfied: false),
              InputPasswordRule(title: "Não pode ter números sequencias, como 123", isSatisfied: false),
              InputPasswordRule(title: "Não pode ter números repetidos, como 111", isSatisfied: false)
              ]
          )
        )
        .setStyle(.normal)
        
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Todo o conteúdo de texto disponível no componente
    - A semântica deverá ser seguir as ações disponíveis.## Sobre o elemento

<!-- image -->

<!-- image -->

<!-- image -->

Descreva brevemente a finalidade de uso do componente. Por exemplo:

Componente Base utilizado exclusivamente para criação de Listas.

### Funções / Modificadores

| Atributo                                           | Parametro            | Default   | Descrição                                                   |
|----------------------------------------------------|----------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ElementActionDTO) -> Self       | ElementActionDTO     | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: ElementActionStyle) -> Self | .neutral | .inverser | .neutral  | Define o estilo da imagem do componente.                    |

### ElementActionDTO

| Atributo                | Tipo                   | Default   | Descrição                                                                                        |
|-------------------------|------------------------|-----------|--------------------------------------------------------------------------------------------------|
| image                   | ElementActionImageName | undefined | Define a imagem dentro do conjunto de assets permitidos pra esse componente através do ImageName |
| imageAccessibilityValue | String                 | undefined | Define o texto para identificar a imagem na acessibilidade.                                      |
| toggle                  | ToggleDTO              | undefined | Define o Toggle dentro do componente                                                             |
| checkbox                | CheckboxDTO            | undefined | Define o Checkbox dentro do componente                                                           |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var elementActionWithImage = dependencies
            .artemisBaseComponents
            .toElementAction()
            .setDTO(
                .init(
                    image: .icChevronRight,
                    accessibilityValue: "Imagem de Seta"
                )
            )

    lazy var elementActionWithToggle = dependencies
            .artemisBaseComponents
            .toElementAction()
            .setDTO(
                .init(
                    toggle: .init(selected: false, disabled: false)
                )
            )
            
    lazy var elementActionWithCheckbox = dependencies
                .artemisBaseComponents
                .toElementAction()
                .setDTO(
                    .init(
                        checkbox: .init(selected: false, disabled: false)
                    )
                )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

a) Herdará do componente 'pai' a semântica, o estado, as formas de interação e comportamentos.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonElementAction()
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

O Checkbox deve ser utilizado somente por outros componentes do Apollo.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

### Guidelines

- Componente pode receber qualquer ícone no tamanho de 24x24, sendo utilizado em componentes de lista.
- Para utilizar imagens que extrapolam o tamanho do componente, você pode utilizar o método setContentMode(\_ mode: ,with size:). Desse jeito uma imagem de tamanho 80x80 centralizada terá o conteúdo “extra” cortado para fora das extremidades, mantendo a proporção de logo como nos exemplos mostrados acima.

### Funções / Modificadores

| Atributo                                                                       | Parametro                    | Default   | Descrição                                                                                                                                                               |
|--------------------------------------------------------------------------------|------------------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: IdentifierDTO)                                              | IdentifierDTO                | undefined | Define os dados configuraveis do componente. Veja a abaixo.                                                                                                             |
| func setContentMode(_ mode: UIView.ContentMode,   with size: CGSize?) -> Self} | UIView.ContentMode | CGSize? | undefined | Define o modo de conteúdo e o tamanho da imagem. Veja a abaixo.                                                                                                         |
| func onDidSetImage(_ callback: @escaping (_ downloaded: Bool) -> Void) -> Self | callback                     | undefined | Callback para ser chamado após executar o download da imagem do atributo brandContainer. Retorna um bool para verificar se o download foi concluído com sucesso ou não. |

### IdentifierDTO

| Atributo              | Tipo                   | Default   | Descrição                                                                                                                                                                                |
|-----------------------|------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| icon                  | ImageDTO?              | undefined | Icone opcional da componente                                                                                                                                                             |
| image                 | ImageDTO?              | undefined | Nome da imagem opcional do componente                                                                                                                                                    |
| initials              | String?                | undefined | Texto opcional do componente                                                                                                                                                             |
| style                 | IdentifierStyle        | undefined | Estilo a ser apresentando do componente                                                                                                                                                  |
| accessibilityValue    | String                 | undefined | Valor de acessibilidade para o ícone                                                                                                                                                     |
| identifierFallbackDTO | IdentifierFallbackDTO? | nil       | Estrutura para enviar um ImageDTO e um IdentifierStyle em cenários que utilizamos downloadImage ao ocorrer uma falha para buscar a imagem, esse identifier de fallback será apresentado. |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    lazy var identifierWithNormal = dependencies
            .artemisBaseComponents
            .toIdentifier()
            .setDTO(
                .normal(
                  image: .icon(image: .illuSample),
                  accessibilityValue: "Normal")
            )
            
    lazy var identifierWithNormalCircle = dependencies
            .artemisBaseComponents
            .toIdentifier()
            .setDTO(
                .normalCircle(
                  image: .icon(image: .illuSample),
                  accessibilityValue: "Normal Circle")
            )

    lazy var identifierWithNormalIcon = dependencies
            .artemisBaseComponents
            .toIdentifier()
            .setDTO(
                .normalIcon(
                  image: .icPlaceholder,
                  accessibilityValue: "Normal Icon")
            )
            
    lazy var identifierWithLargeNormalIcon = dependencies
            .artemisBaseComponents
            .toIdentifier()
            .setDTO(
                .largeNormalIcon(
                  image: .icPlaceholder,
                  accessibilityValue: "Large Normal Icon")
            )
            
    lazy var identifierWithMediumNormalIcon = dependencies
            .artemisBaseComponents
            .toIdentifier()
            .setDTO(
                .mediumNormalIcon(
                  image: .icPlaceholder,
                  accessibilityValue: "Medium Normal Icon")
            )

    lazy var identifierWithSmallNormal = dependencies
            .artemisBaseComponents
            .toIdentifier()
            .setDTO(
                .smallNormal(
                  image: .icon(image: .illuSample),
                  accessibilityValue: "Small Normal")
            )
            
    lazy var identifierWithCustomContentMode = dependencies
            .artemisBaseComponents
            .toIdentifier()
            .setDTO(
                .normal(
                  image: .downloadedImage(image: "https://raichu-uploads.s3.amazonaws.com/logo_picpay_fZMpLE.png"),
                  accessibilityValue: "Normal"))
            .setContentMode(UIView.ContentMode.center, with: .init(width: 24, height: 24))

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser lido pelo Voice Over :
- O que deve ser lido pelo Voice Over:
    - Nome do produto + texto da tag ou texto alternativo da tag + semântica "button"

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonIdentifier(
            skeletonIdentifierStyle: skeletonIdentifierStyle
        )
    }()
   
    private let skeletonIdentifierStyle: SkeletonIdentifierStyle
    init(
        skeletonIdentifierStyle: SkeletonIdentifierStyle 
    ) {
        self.skeletonIdentifierStyle = SkeletonIdentifierStyle
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

#### Guidelines

- O componente floating payment button menu (FABMenu) executa a ação de mostrar uma ou mais botões de possibilidades de pagamento, sendo ela por QRCode, WhatsApp e Assistente PicPay a frente de qualquer tela do SuperApp.

### Funções / Modificadores

| Atributo                                                         | Parametro            | Default   | Descrição                                                |
|------------------------------------------------------------------|----------------------|-----------|----------------------------------------------------------|
| func setParentViewController(_ viewController: UIViewController) | UIViewController     | undefined | Define em qual ViewController o componente será mostrado |
| func changeSize(_ size: FABMenuSize)                             | .expanded .collapsed | undefined | Define o estado do componente                            |
| func setDTO(_ dto: FABMenuDTO)                                   | FABMenuDTO           | undefined | Define os dados configuráveis do componente.             |

### FABMenuDTO

| Atributo   | Tipo         | Default   | Descrição                          |
|------------|--------------|-----------|------------------------------------|
| title      | String       | undefined | Texto a ser exibido do componente  |
| animation  | AnimatedEnum | undefined | Animação a ser usada no componente |
| size       | FABMenuSize  | undefined | Tamanho do componente              |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    guard let rootViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController else { return }

    lazy var fabMenu = dependencies
        .artemisComponents
        .toFABMenu()
        .setParentViewController(rootViewController)
        .setDTO(FABMenuDTO(title: Strings.pay,
                             animation: .bubbleLoopGreen3232,
                             size: FABMenuSize.expanded)
          )
        .setDelegate(self)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

O que sera transcrito pelo Voice Over:

- Rótulo do FAB Menu + semântica: button

```
private extension FABMenuView {
	func fillAccessibility(
		with dto: DTO
	) {
        accessibilityValue = dto.accessibilityValue
    }
}

extension FABMenuDTO {
    var accessibilityValue: String {
        title
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

#### Guidelines

- O componente floating payment button menu (FABMenu) executa a ação de mostrar uma ou mais botões de possibilidades de pagamento, sendo ela por QRCode, WhatsApp e Assistente PicPay a frente de qualquer tela do SuperApp.

### Funções / Modificadores

| Atributo                            | Parametro            | Default   | Descrição                                    |
|-------------------------------------|----------------------|-----------|----------------------------------------------|
| func changeSize(_ size: FPBSize)    | .expanded .collapsed | undefined | Define o estado do componente                |
| func setDTO(_ dto: FPBDTO)          | FPBDTO               | undefined | Define os dados configuráveis do componente. |
| func changeStyle(_ style: FPBStyle) | FPBStyle             | undefined | Estilo do componente                         |

### FABMenuItemDTO

| Atributo   | Tipo         | Default   | Descrição                          |
|------------|--------------|-----------|------------------------------------|
| title      | String       | undefined | Texto a ser exibido do componente  |
| animation  | AnimatedEnum | undefined | Animação a ser usada no componente |
| size       | FABMenuSize  | undefined | Tamanho do componente              |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var fpb = dependencies
        .artemisComponents
        .toFPB()
        .setDTO(FPBDTO(title: Strings.pay,
                       animation: .bubbleLoopGreen3232,
                       size: FPBSize.expanded)
          )
        .setDelegate(self)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

O que sera transcrito pelo Voice Over:

- Rótulo do FPB + semântica: button

```
private extension FPBView {
	func fillAccessibility(
		with dto: DTO
	) {
        accessibilityValue = dto.accessibilityValue
    }
}

extension FPBDTO {
    var accessibilityValue: String {
        title
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
    - CarouselDTO

### Guidelines

- View base de carrosséis. Ao fazer um carrossel novo fazer uma subclasse de CarouselView e realizar os ajustes e overrides necessários
- Configuração de layout de carrossel se dá através da variável carouselDTO: CarouselDTO
- Configuração do conteúdo se dá através da variável contentDTO: DTOProtocol que aceita qualquer tipo de conteúdo conformando com o protocolo de DTO base do DS

### Funções / Modificadores

| Atributo                                                                            | Parametro             | Default   | Descrição                                                                                                                                                                                                            |
|-------------------------------------------------------------------------------------|-----------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| func subviews() -> [UIView]                                                         | undefined             | undefined | Método utilizado para retornar as views dos items                                                                                                                                                                    |
| func addArrangedSubview(_ view: UIView) -> Self                                     | UIView                | undefined | Wrapper de inserção de subview ao fim do carrossel. Método normalmente utilizado internamente para adicionar item de MoreOptions após o setup dos outros itens                                                       |
| func addArrangedSubview(_ view: UIView, space: CGFloat?) -> Self                    | UIView, space         | undefined | Wrapper de inserção de subview com espaçamento customizado. Método normalmente utilizado internamente em DSBuilder para facilitar a criação de Skeletons específicos                                                 |
| func addArrangedSubviews(_ views: [UIView]) -> Self                                 | UIView                | undefined | Wrapper de inserção de múlitplas subviews. Método normalmente utilizado internamente para adicionar diversos itens de uma única vez. Geralmente utilizado no setup de Data Transfer Objects de conteúdo do carrossel |
| func addCustomSpace(spacing: CGFloat, afterView: UIView) -> Self                    | CGFloat, UIView       | undefined | Wrapper de inserção de espaçamento customizado. Método normalmente utilizado internamente em DSBuilder para facilitar a criação de Skeletons específicos                                                             |
| func removeAllArrangedSubviews() -> Self                                            | undefined             | undefined | Wrapper de remoção de todo conteúdo do carrossel. Método normalmente utilizado internamente no setup de Data Transfer Objects de conteúdo para fazer a limpeza de itens anteriormente injetados                      |
| func scrollToStart(animated: Bool) -> Self                                          | undefined             | undefined | Força o `contentOffset` da `ScrollView` interna para o início da view                                                                                                                                                |
| func isPaged() -> Self                                                              | undefined             | undefined | Configura carrossel como paginado                                                                                                                                                                                    |
| func disableScroll() -> Self                                                        | undefined             | undefined | Desabilita scroll interno do carrossel. Normalmente utilizado para evitar a configuração de scroll dentro de scroll quando utilizando carrossel vertical/listas                                                      |
| func setDecelerationRate(value: CGFloat) -> Self                                    | CGFloat               | undefined | Injeção de valor de desaceleração de scroll view                                                                                                                                                                     |
| func setStackAlignment(_ alignment: UIStackView.Alignment) -> Self                  | UIStackView.Alignment | undefined | Injeção de valor de alinhamento de conteúdo                                                                                                                                                                          |
| func setPage(pageIndex: Int, shouldScroll: Bool, scrollToEnd: Bool, animated: Bool) | Int, Bool, Bool, Bool | undefined | Define a página atual do carrossel, podendo realizar ou não o comportamento de scroll até a posição                                                                                                                  |

### CarouselDTO

| Atributo           | Tipo    | Default   | Descrição                                                                                                                    |
|--------------------|---------|-----------|------------------------------------------------------------------------------------------------------------------------------|
| grid               | CGFloat | zero      | Quantidade de items exibidos em tela ao mesmo tempo                                                                          |
| spacing            | CGFloat | zero      | Espaçamento entre items                                                                                                      |
| margin             | CGFloat | zero      | Margens laterais do conteúdo exibido                                                                                         |
| axis               | Axis    | undefined | Eixo de orientação. Existem métodos estáticos de conveniência para criação de carrosséis dependendo do eixo necessário       |
| useChildWidth      | Bool    | false     | Toggle para forçar uso do tamanho intrínseco de items ao invés de permitir redimendionamento                                 |
| isScrollable       | Bool    | true      | Toggle de adição de `ScrollView` ao componente.Utilizado em listas verticais para evitar `ScrollView` dentro de `ScrollView` |
| enableTopMargin    | Bool    | false     | Toggle de margem de topo do componente                                                                                       |
| enableBottomMargin | Bool    | false     | Toggle de margem de baixo do componente                                                                                      |

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - FinantialStatementFullDTO
- Exemplos
- Acessibilidade

#### Guidelines

- Não tem mínimo de itens apresentados;
- Não havendo transações, deve-se exibir o módulo de empty state;

### Funções / Modificadores

| Atributo                                              | Parametro                 | Default   | Descrição                                                 |
|-------------------------------------------------------|---------------------------|-----------|-----------------------------------------------------------|
| func setDTO(_ dto: FinantialStatementFullDTO) -> Self | FinantialStatementFullDTO | undefined | Define os dados configuráveis do componente. Veja abaixo. |
| func hideSensitiveInfo(_ hide: Bool) -> Self          | Bool                      | false     | Método utilizado para esconder ou não dados sensíveis.    |

### FinantialStatementFullDTO

| Atributo   | Tipo                      | Default   | Descrição                                        |
|------------|---------------------------|-----------|--------------------------------------------------|
| sections   | [BankStatementSectionDTO] | undefined | Define os itens que serão apresentados na lista. |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    let bankStatementItemDTOAndStyle = BankStatementItemDTOAndStyle(
        financeEvent: "Finance Event",
        value: "+R$ 1.000,00",
        isObfuscated: false,
        shouldShowDivider: true,
        shouldShowChevron: true,
        secondIdentifier: nil,
        fromToPrepositionAccessibility: nil,
        fromTo: "From/To",
        sourceOfFunding: "Source of Funding",
        time: "00h00",
        buttonDTO: nil
    )
    
    let arrayBankStatementSectionDTO = [
      BankStatementSectionDTO(
      date: "Hoje", 
      items: [
        bankStatementItemDTOAndStyle
      ], 
      isObfuscated: false, 
      balance: "R$ 24,90"),
    ]
    
    lazy var finantialStatementFull = dependencies
        .artemisComponents
        .toFinantialStatementFull()
        .setDTO(
          dto: arrayBankStatementSectionDTO
        )
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Ordem de leitura

- Selection title
- Selection title
    - Exemplo de leitura: Extrato PicPay
- Separador de Dias
- Separador de Dias
    - Exemplo de leitura: Hoje; Ontem; Domingo 23 de Dezembro
- Transações
- Transações
    - Seguir pardrão de leitura estipulado para módulos
- Botão
- Botão
    - Formato: {Label} + {TIpo do Componente}
    - Exemplo de leitura: {Ver extrado completo} + {Botão}

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

Descreva brevemente a finalidade de uso do componente. Por exemplo:

Componente textual animado dentro de container para utilizar em telas de loading.

### Funções / Modificadores

| Atributo                                                       | Parametro                    | Default   | Descrição                                                                                                                         |
|----------------------------------------------------------------|------------------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ContainerLoadAnimatedTextDTO) -> Self       | ContainerLoadAnimatedTextDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo.                                                                       |
| func finishLoad() -> Self                                      | empty                        | empty     | Sinaliza ao componente que deve encerrar para a animação final.                                                                   |
| func onLoadFinish(_ callback: @escaping () -> Void) -> Self    | callback                     | undefined | Define bloco de execução a ser executado após encerrar a animação final.                                                          |
| func setStyle(_ style: ContainerLoadAnimatedTextStyle) -> Self | style                        | normal    | Define o style do componente, podendo ser normal com a coloração de texto contentA ou inverse, com a coloração de texto contentD. |

### ContainerLoadAnimatedTextDTO

| Atributo                      | Tipo     | Default   | Descrição                                                                                                                     |
|-------------------------------|----------|-----------|-------------------------------------------------------------------------------------------------------------------------------|
| loadingTexts                  | [String] | undefined | Define as strings que estarão sendo animadas durante o loading.                                                               |
| isAnimationAlignedToTop       | Bool     | false     | Define se a animação de “esmaecer” dos textos animados será sempre para cima.                                                 |
| shouldAnimationStopOnLastText | Bool     | false     | Define se a animação deve parar no último texto ou não, caso true chama, func onLoadFinish(_ callback: @escaping () -> Void). |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var containerLoadAnimatedText = dependencies
            .artemisBaseComponents
            .toContainerLoadAnimatedText()
            .setDTO(
                .init(
                    loadingTexts: [
                        "Primeira mensagem",
                        "Segunda mensagem",
                        "Terceira mensagem"
                    ],
                    shouldAnimationStopOnLastText: true // opcional
                )
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

Sem especificação de acessibilidade na spec do componente.

## Skeleton

<!-- image -->

### Exemplos

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonContainerLoadAnimatedText()
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(
        coder: NSCoder
    ) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

Shape List Multi More Option Item é utilizado para criação do List Action/Single Select e Multi Select Bundle (grupo de itens de lista).

### Guidelines

- O elemento não pode ser utilizado sozinho, deve ser utilizado o componente ShapeListSingleSelectBundle ou ShapeListMultiSelectBundle com o elemento ao final da lista.
- Recece um listContentAreaDTO e um ImageName.
- Pode receber identifier.

### Funções / Modificadores

| Atributo                                       | Parametro                  | Default   | Descrição                                                   |
|------------------------------------------------|----------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ShapeListMoreOptionItemDTO) | ShapeListMoreOptionItemDTO | undefined | Define os dados configuráreis do componente. Veja a abaixo. |

### Atributos

| Atributo           | Tipo               | Default   | Descrição                                              |
|--------------------|--------------------|-----------|--------------------------------------------------------|
| listContentAreaDTO | ListContentAreaDTO | undefined | Define o texto pertencente ao componente               |
| iconName           | ImageName          | nil       | Define o ícone que ficará a direita no componente      |
| identifierDTO?     | IdentifierDTO      | nil       | Define o identifier que fica na esquerda do componente |

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

Componente em formato de cartão que representa bandeiras e logotipos de instituições financeiras.

### Funções / Modificadores

| Atributo                                      | Parametro                                                    | Default   | Descrição                                                         |
|-----------------------------------------------|--------------------------------------------------------------|-----------|-------------------------------------------------------------------|
| func setDTO(_ dto: ClipItemDTO) -> Self       | ClipItemDTO                                                  | undefined | Define os dados configuraveis do componente.                      |
| func setStyle(_ style: ClipItemStyle) -> Self | .picpay .whiteLabel .empty .notFound .erro .add .placeholder | undefined | Define o estilo do componente.                                    |
| func hideSensitiveInfo(_ hide: Bool) -> Self  | Bool                                                         | undefined | Define se determinadas informações do componente serão ofuscadas. |

### CreditCardItemDTO

| Atributo      | Tipo                          | Default   | Descrição                                                     |
|---------------|-------------------------------|-----------|---------------------------------------------------------------|
| type          | CreditCardItemType            | undefined | Define o tipo do componente.                                  |
| customActions | [UIAccessibilityCustomAction] | undefined | Define as ações customizadas de acessibilidade do componente. |

### CreditCardItemType

| Atributo   | Tipo                   | Default   | Descrição                                |
|------------|------------------------|-----------|------------------------------------------|
| data       | CreditCardItemDataDTO  | undefined | Define o tipo de componente para data.   |
| error      | CreditCardItemErrorDTO | undefined | Define  o tipo de componente para error. |
| add        |                        |           | Define  o tipo de componente para add.   |

### CreditCardItemErrorDTO

| Atributo   | Tipo   | Default   | Descrição                  |
|------------|--------|-----------|----------------------------|
| message    | String | undefined | Define a mensagem de erro. |

### CreditCardItemDataDTO

| Atributo        | Tipo                    | Default   | Descrição                                            |
|-----------------|-------------------------|-----------|------------------------------------------------------|
| header          | CreditCardHeaderItemDTO | undefined | Define o header do componente.                       |
| body            | CreditCardItemBodyDTO   | undefined | Define o body do componente.                         |
| backgroundColor | String                  | undefined | Define a cor de fundo do componente.                 |
| borderColor     | NotTokenableColorName   | undefined | Define a cor da borda do componente.                 |
| isObfuscated    | Bool                    | undefined | Define a visibilidade das informações do componente. |

### CreditCardBodyItemDTO

| Atributo   | Tipo     | Default   | Descrição                                                                        |
|------------|----------|-----------|----------------------------------------------------------------------------------|
| title      | String   | undefined | Define o título do body.                                                         |
| subtitle   | String   | undefined | Define o subtítulo do body.                                                      |
| tag        | String   | undefined | Define a tag do body.                                                            |
| style      | TagStyle | nil       | Define o estilo do tag que fica no body, se for nil, terá o estilo padrão normal |

### CreditCardHeaderItemDTO

| Atributo               | Tipo   | Default   | Descrição                                                          |
|------------------------|--------|-----------|--------------------------------------------------------------------|
| leftUrl                | String | undefined | Define o endereço da imagem do lado esquerdo.                      |
| leftPlaceholderIcon    | String | undefined | Define o placeholder do ícone do lado esquerdo.                    |
| rightUrl               | String | undefined | Define o endereço da imagem do lado direito.                       |
| rightPlaceholderIcon   | String | undefined | Define o placeholder do ícone do lado direito.                     |
| rightIconAccessibility | String | undefined | Define o texto a ser transcrito referente o ícone do lado direito. |
| titlePrefix            | String | undefined | Define o prefixo do título.                                        |
| titleSuffix            | String | undefined | Define o sufixo do título.                                         |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var creditCardItemData = dependencies
            .artemisBaseComponents
            .toCreditCardItem()
            .setDTO(
                .init(
                    type: .data(
						CreditCardItemDataDTO(
							header: .init(
								leftUrl: "https://play-lh.googleusercontent.com/pTvc9kCumx_24eJDwGUpvcBwljcIBkrsL3qHwhBW2NalMQ-XxTtHRV9YAJanBxkV0Rw",
								leftPlaceholderIcon: nil,
								rightUrl: "https://logosmarcas.net/wp-content/uploads/2020/09/Mastercard-Logo.png",
								rightPlaceholderIcon: nil,
								rightIconAccessibility: "master card",
								titlePrefix: "PicPay",
								titleSuffix: "1234"
							),
							body: .init(
								title: "Limite Disponível",
								subtitle: "R$ 800,00",
								tag: "PRINCIPAL"
							)
						)
					)
                )
            )
            .setStyle(
                style: .normal
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- O que sera transcrito pelo Voice Over:
- O que sera transcrito pelo Voice Over:
    - CreditCard: Nome do cartão + tag "Principal" (se houver) + "com final" + 4 dígitos finais + bandeira do cartão + limite disponível + valor + semântica: "Button".
    - CreditCardEmpty: Nome do cartão + "com final" + 4 dígitos finais + bandeira do cartão + limite disponível + valor + semântica: "Button".

```
extension CreditCardItemView {
    func fillAccessibilityAction(with dto: DTO) {
        if dto.customActions.isNotEmpty {
            contentView.accessibilityHint = Strings.Accessibility.availableActions
            contentView.accessibilityCustomActions = []
            for actions in dto.customActions {
                contentView.accessibilityCustomActions?.append(actions)
            }
        }
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadore
    - ButtonBundleDTO
- Exemplos
- Acessibilidade
- Skeleton
    - Exemplo

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

- Esse componente é um agrupamento dos botões Primary, Secondary, Tertiary, CustomBackgroundBrandA.
- Pode ser usado com 1 botão, 2 botões ou até 3 botões.
- Pode ser aplicado loading no botão primary.

### Funções / Modificadore

| Atributo                                                                | Parametro                 | Default   | Descrição                                                                                           |
|-------------------------------------------------------------------------|---------------------------|-----------|-----------------------------------------------------------------------------------------------------|
| func setStyle(_ style: ButtonBundleStyle)                               | .default  .inverse .clear | .default  | Define o estilo do componente                                                                       |
| func setDTO(_ dto: ButtonBundleDTO)                                     | ButtonBundleDTO           | undefined | Define os dados configuraveis do componente. Veja a abaixo.                                         |
| func startAnimation(dto: ButtonBundleDTO, isFromTop: Bool)              | ButtonBundleDTO, Bool     | undefined | Define a animação do botão                                                                          |
| func setEnabled(_ enabled: Bool)                                        | Bool                      | undefined | Habilita ou desabilita todos os botões do bundle                                                    |
| func startLoading()                                                     | N/A                       | undefined | Habilita o loading no botão primário.                                                               |
| func stopLoading()                                                      | N/A                       | undefined | Desabilita o loading no botão primário.                                                             |
| func enabledPrimaryButton(_ isEnabled: Bool) -> Self                    | Bool                      |           | Habilita ou desabilita o botão primário                                                             |
| func enabledSecondaryButton(_ isEnabled: Bool) -> Self                  | Bool                      |           | Habilita ou desabilita o botão secundário                                                           |
| func enabledTertiaryButton(_ isEnabled: Bool) -> Self                   | Bool                      |           | Habilita ou desabilita o botão terciário                                                            |
| func styleForPrimaryButton(_ style: ButtonItemStyle) -> Self            | ButtonItemStyle           |           | Define o estilo do botão primário                                                                   |
| func styleForSecondaryButton(_ style: ButtonItemStyle) -> Self          | ButtonItemStyle           |           | Define o estilo do botão secundário                                                                 |
| func styleForTertiaryButton(_ style: ButtonItemStyle) -> Self           | ButtonItemStyle           |           | Define o estilo do botão terciário                                                                  |
| func getItem(at index: ButtonBundleIndex) -> (any ButtonItemInterface)? | ButtonBundleIndex         |           | Retorna se existir a interface do buttonitemInterface baseado nos indexes disponiveis que é 0, 1, 2 |

### ButtonBundleDTO

| Atributo            | Tipo                      | Default   | Descrição                                                      |
|---------------------|---------------------------|-----------|----------------------------------------------------------------|
| button              | [ButtonBundleDTOProtocol] | undefined | Coleção de botões a serem definidos a partir do seu background |
| hasTopMargin        | Bool                      | True      | Indica se há margem superior                                   |
| accessibilityEnable | Bool                      | True      | Indica se a acessibilidade está habilitada                     |

#### ButtonBundleDTOProtocol

Protocolo responsável por identificar os diversos tipos de DTOs de botões permitidos para injeção dentro de um ButtonBundle.

Os componentes de botões permitidos no momento são:

- ButtonSwipeDynamicDTOsAndStyles Button Swipe Dynamic / iOS
- ButtonDynamicByInputValueDTOsAndStyles Button Dynamic By Input Value / iOS
- ButtonDynamicBySelectDTOsAndStyles Button Dynamic By Select / iOS
- ButtonFlexDTOsAndStyles Button Flex / iOS
- ButtonItemDTOsAndStyles Button Item / iOS

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var oneButtonBundle = dependencies
        .artemisComponents
        .toButtonBundle()
        .setDTO( 
              .init(
                    primary: ButtonItemDTOsAndStyles(
                        ButtonItemDTO(
                            "Item Button",
                            hasArrow: true
                        ),
                        style: buttonItemStyles.0
                    )
                )
        .setStyle(.default)
        .setDelegate(self)

    lazy var twoButtonBundle = dependencies
        .artemisComponents
        .toButtonBundle()
        .setDTO( 
              .init(
                    primary: ButtonItemDTOsAndStyles(
                        .init(
                            "Item Button",
                            hasArrow: true
                        ),
                        style: buttonItemStyles.0
                    ),
                    secondary: ButtonItemDTOsAndStyles(
                        .init(
                            "Item Button"
                        ),
                        style: buttonItemStyles.2
                    )
                )
        .setStyle(.default)
        .setDelegate(self)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func didTap() {}
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Rótulo + Semântica: botão + estado: (somente quando "Disabled" ou "Pressed").

## Skeleton

<!-- image -->

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonButtonBundle(
          style: .double,
          accessibilityAnnouncement: "Teste de Skeleton Duplo"
        )
    }()
    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
    required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Para alterar o SkeletonStyle Color

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonButtonBundle(
          style: .double(.onColor),
          accessibilityAnnouncement: "Teste de Skeleton Duplo onColor"
        )
    }()
    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
    required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

Componente Acionável utilizado para ações especiais dentro de componentes.

Implementa os protocolos:

- ComponentProtocol
- ComponentEventProtocol

### Funções / Modificadores

| Atributo                                       | Parametro                                                                                                                                | Default   | Descrição                                                   |
|------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: LinkArrowDTO) -> Self       | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3779002681?draftShareId=46709723-f2f3-470d-942d-a8a909093223#LinkArrowDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: LinkArrowStyle) -> Self | .normal | .neutral | .inverse | .critical                                                                                                | .normal   | Define o estilo da imagem do componente.                    |

### LinkArrowDTO

| Atributo   | Tipo   | Default   | Descrição                                 |
|------------|--------|-----------|-------------------------------------------|
| title      | String | undefined | Define o texto de exibição do componente. |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var linkArrow = dependencies
            .artemisComponents
            .toLinkArrow()
            .setDTO(
                .init(
                    title: "Link Arrow"
                )
            )
            .setStyle(
                .critical
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
}
```

## Acessibilidade

a) cada avatar dentro do card deve ser lido individualmente;
b) Texto alternativo do avatar: iniciais = iniciais; foto = empresa;
c) O que deve ser lido:
Texto alternativo do avatar + semântica "imagem".

Comportamento e interação:
a) Um toque: aplica o foco visível no avatar e o LT anuncia seu respectivo conteúdo.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonLinkArrow(
            width: width,
            margin: margin
        )
    }()
    private let width: CGFloat?
    private let margin: Margin
    init(
        width: CGFloat? = nil,
        margin: Margin = .none
    ) {
        self.width = width
        self.margin = margin
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ]

<!-- image -->

Os componentes do tipo TimelineStories tratam-se de uma progress view que realiza uma animação de enchimento dessa progressView. Este componente é composto de uma lista de TimelineItem. Não possui possibilidade de mudança de atributos (cores, altura e outros).

### Funções / Modificadores

| Função                                             | Descrição                                                                                |
|----------------------------------------------------|------------------------------------------------------------------------------------------|
| setDTO(_ dto: TimelineStoriesDTO)                  | Injeção do conteúdo.                                                                     |
| startAnimating()                                   | Método que inicia a animação de enchimento da barra do primeiro elemento.                |
| nextStory(forced: Bool)                            | Método que finaliza a animação atual e inicia a animação do TimelineItem seguinte.       |
| previousStory()                                    | Método que reseta o TimelineItem e realiza a animação do TimelineItem anterior da lista. |
| stopCurrentAnimating()                             | Método que pausa a animação de enchimento da barra do TimelineItem.                      |
| resumeAnimating()                                  | Método para retomar animação pausada de enchimento da barra.                             |
| didFinishItem(_ callback: @escaping (Int) -> Void) | Método de notificação de término de animação de um TimelineItem e seu respectivo index   |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var timelineStories = dependencies
        .artemisComponents
        .toTimelineStories()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        func configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        let itemsDTO: [TimelineItemDTO] = [
            .init(timeInterval: 4),
            .init(timeInterval: 4)
        ]
        let dto = TimelineStoriesDTO(items: itemsDTO)
        timelineStories.setDTO(dto)
    }

    func animate() {
        timelineStories.startAnimating()
    }
}
```## Sobre o elemento

[  ] [  ] [  ] [  ] [  ]

| normal   | custom   |
|----------|----------|
|          |          |

O componente PartnershipItem possui o objetivo de sinalizar que determinada etapa da jornada é vinculada a alguma empresa parceira.

A classe PartnershipItemView é a responsável por criar nosso componente customizado.

Um exemplo de uso do componente PartnershipItem pode ser encontrado no nosso ArtemisComponentsSample.

#### Guidelines

- Possui 2 estilos: normal | custom;
- Recebe obrigatoriamente uma imagem que terá uma altura fixa de 24;
- Não pode ser usado como botão, não possui uma handler de action.
- Normalmente deve ser usado no rodapé de uma tela.
- Acessibilidade realiza a leitura do texto fixo “Em parceria com” + “[nome da empresa]".

### Funções / Modificadores

| Função                            | Descrição                                                           |
|-----------------------------------|---------------------------------------------------------------------|
| setDTO(_ dto: PartnershipItemDTO) | Método para atribuir o parâmetro necessário para usar o componente. |

#### PartnershipItemDTO

| Atributo                 | Tipo     | Descrição                                                                                                                         |
|--------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------|
| imageDTO                 | ImageDTO | Define o objeto da imagem que será usada para preencher o componente.                                                             |
| accessibilityCompanyName | String   | Define o texto a ser lido pelo voice over como nome da empresa, a leitura será:  "Em parceria com" + "(accessibilityCompanyName)" |

## Como utilizar

#### Implementação via código

<!-- image -->

```
final class ExampleViewController: UIViewController {
    typealias Dependencies = HasArtemisComponentsInterface & HasThemeTokensInterface
    private let dependencies: Dependencies
    init(dependencies: Dependencies = DependencyContainer()) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var partnershipItemView = dependencies.artemisComponents.toPartnershipItem()
        .setDTO(.init(imageUrl: "https://cdn.ppay.me/assets/images/partners/astropay-normal.svg",
                      accessibilityCompanyName: "Astropay"))
        .setStyle(.normal)
}
```

## Exemplos

## Acessibilidade

Por padrão, o componente PartnershipItem realiza sempre aplica o foco para o Text + imageLogo, realizando a seguinte leitura

"Em parceria com" + "(accessibilityCompanyName)"

Spec de acessibilidade Partnership Item

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - BulletPointListDTO

## Guidelines

- Componente utilizado para listar itens

## Funções / Modificadores

| Atributo                               | Parâmetro          | Default   | Descrição                                                |
|----------------------------------------|--------------------|-----------|----------------------------------------------------------|
| func setDTO(_ dto: BulletPointListDTO) | BulletPointListDTO | undefined | Define dados configuráveis do componente. Veja a abaixo. |

## BulletPointListDTO

| Atributo   | Tipo     | Default   | Descrição                                     |
|------------|----------|-----------|-----------------------------------------------|
| tips       | [String] | undefined | Lista de dicas a serem apresentadas na lista. |
| firstTip   | String   | undefined | Primeira dica do array.                       |
| secondTip  | String   | undefined | Segunda dica do array.                        |
| thirdTip   | String   | undefined | Terceira dica do array.                       |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    let dto = BulletPointListDTO(tips: [
        "Acesso rápido e centralizado pra \nfacilitar a gestão das suas contas.",
        "Avisos sobre novas faturas pra \nnão perder vencimentos."
    ])
	
    lazy var bulletPointList = dependencies
        .artemisComponents
        .toBulletPointList(initialConfiguration: .config(self))
		.setDTO(dto)
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Inits do DTO

```
let stringsDTO = BulletPointListDTO(
    firstTip: "Primeira", 
    secondTip: "Segunda", 
    thirdTip: "Terceira"
)

let arrayDTO = BulletPointListDTO(
    tips: [
        "Dica um",
        "Dica dois",
        "Dica três",
        "Dica quatro"
    ]
)
```## Sobre o elemento

### Guidelines

Divider se caracteriza por ser uma simples linha que separa itens de uma lista.

### Variações

<!-- image -->

<!-- image -->

### Funções / Modificadores

| Atributo                                      | Parametro        | Default   | Descrição                      |
|-----------------------------------------------|------------------|-----------|--------------------------------|
| func setStyle(_ style: DividerStyles) -> Self | .neutral .custom | neutral   | Define o estilo do componente. |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var divider = dependencies
            .artemisBaseComponents
            .toDivider()
            .setStyle(
                style: .neutral
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - HeaderDTO
- Exemplos
- Acessibilidade

#### Guidelines

- O Header é o elemento principal da Global Navigation do Design System;
- Deve ser apresentado em toda home que é apresentada no primeiro nível de navegação: Home Carteira Cartões e Shop;
- A regra acima não se aplica em Hubs, pois os mesmos entram em navegação e precisam de ações na Navbar;
- O header pode apresentar até 3 ícones que possuem missões fixas: Ajuda, DM e Notificações;
- O ícone de ajuda é opcional e pode ser desativado para alguns contextos de negócio (ver especificação de negócio);
- O Header possui a versão com token $global\_nav\_background (branco). Na versão Custom o componente herda a cor do elemento em que é apresentado sobreposto, exemplo: se o elemento tiver a cor Verde, o Header deve assumir o mesmo token acrescentando o token de opacity padrão (conforme especificação);
- O Header não é um componente distribuído e é restrito para uso nas homes principais do PJ.

### Funções / Modificadores

| Atributo                                                                         | Parametro                                                                                                                             | Default   | Descrição                                                        |
|----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|-----------|------------------------------------------------------------------|
| func setDTO(_ dto: HeaderDTO) -> Self                                            | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/4065689661?draftShareId=14e132b2-162a-4bfa-b63a-186240cc5427#HeaderDTO | undefined | Define dados configuráveis do componente. Veja a abaixo.         |
| func setStyle(_ style: HeaderStyle) -> Self                                      | HeaderStyle                                                                                                                           | undefined | Define o estilo do header.                                       |
| func setCustomBackground(_ notTokenableColorName: NotTokenableColorName) -> Self | NotTokenableColorName                                                                                                                 | undefined | Define a cor de background customizada.                          |
| func updateProfileImage(_ dto: ImageDTO) -> Self                                 | ImageDTO                                                                                                                              | undefined | Atualiza a imagem (avatar).                                      |
| func setSearchBarUserInteractionEnabledStatus(_ enabled: Bool) -> Self           | Bool                                                                                                                                  | undefined | Habilita/desabilita a interação do usuário da barra de pesquisa. |
| func setAvatarBadge(_ badgeDTO: BadgeDTO) -> Self                                | BadgeDTO                                                                                                                              | undefined | Define o badge da imagem.                                        |
| func setDirectMessagesCount(_ value: Int) -> Self                                | Int                                                                                                                                   | undefined | Define o valor da quantidade de mensagens não lidas.             |
| func setNotificationsCount(_ value: Int) -> Self                                 | Int                                                                                                                                   | undefined | Define o valor da quantidade de notificações não lidas.          |
| func removeAvatarBadge() -> Self                                                 | -                                                                                                                                     | -         | Remove o badge da imagem.                                        |
| func hideNotificationBadge(_ hide: Bool) -> Self                                 | Bool                                                                                                                                  | undefined | Esconde/mostra o badge de notificação.                           |
| func hideDirectMessagesBadge(_ hide: Bool) -> Self                               | Bool                                                                                                                                  | undefined | Esconde/mostra o badge de mensagem.                              |
| func setKeyboardReturnType(_ returnType: UIReturnKeyType) -> Self                | UIReturnKeyType                                                                                                                       | undefined | Define o tipo de retorno do teclado.                             |
| func setAnimationsEnabled(_ enabled: Bool) -> Self                               | Bool                                                                                                                                  | undefined | Habilita/desabilita a animação da barra de navegação.            |
| func setBackground(_ colorName: ColorName) -> Self                               | ColorName                                                                                                                             | undefined | Adiciona cor de fundo no header a partir do ColorName            |
| func setCustomBackground(_ color: UIColor?) -> Self                              | UIColor?                                                                                                                              | undefined | Adiciona cor de fundo no header com uma UIColor                  |

### HeaderDTO

| Atributo              | Tipo                   | Default   | Descrição                                           |
|-----------------------|------------------------|-----------|-----------------------------------------------------|
| avatarDTO             | AvatarDTO              | undefined | Define dados configuráveis da imagem.               |
| searchBarDTO          | SearchBarDTO           | undefined | Define dados configuráveis da barra de pesquisa.    |
| directMessageDTO      | IconButtonDTO          | undefined | Define dados configuráveis do botão de mensagem.    |
| notificationDTO       | IconButtonDTO          | undefined | Define dados configuráveis do botão de notificação. |
| extraButtonDTO        | IconButtonDTO?         | undefined | Define dados configuráveis do botão extra.          |
| customBackgroundColor | NotTokenableColorName? | undefined | Define a cor de background.                         |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
     
    let dto = HeaderDTO(
		avatarDTO: .initials(
			"DS",
			badge: BadgeDTO.notificationIcon(
				content: .icHeart,
				accessibilityValue: "Favorito"
			),
			searchBarDTO: .init(
				placeholder: "Buscar"
			),
			directMessageDTO: .init(
				image: .icChat,
				accessibilityValue: "Mensagens diretas",
				badge: BadgeDTO.notificationText(
					content: 9,
					accessibilityValue: "\(9) mensagens não lidas"
				)
			),
			notificationDTO: .init(
				image: .icBell,
				accessibilityValue: "Notificações",
				badge: BadgeDTO.notificationText(
					content: 7,
					accessibilityValue: "\(7) notificações"
				)
			),
            extraButtonDTO: .init(
              image: .icHelp,
                accessibilityValue: "Central de Ajuda"
            )
        )
	)
    
    lazy var header = dependencies
        .artemisComponents
        .toHeader()
        .setSearchBarUserInteractionEnabledStatus(true)
		.setDTO(
			dto
		)
        .setKeyboardReturnType(
          .search
        )
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Requisitos de conformidade WCAG

a) Cada item do header deve ser focado e anunciado pelo LT individualmente;

b) O avatar deve ter como texto alternativo o @User + semântica de button (se for interativo);

c) Os icons buttons devem conter um texto alternativo que descreva suas finalidade de forma clara e objetiva (Ex: lápis=Editar);

d) O ícone e o placholder do search bar devem estar agrupados num único foco visível para o LT e o ícone deve ser marcado como decorativo;

e) O que dever lido:

1. Avatar: {@User} + semântica button (se for interativo);
2. Icon button: Texto alternativo + semântica button;
3. Search bar: Placeholder + semântica campo de busca.

Comportamento e interação:

a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;

b) Dois toques em cada item: ativa o CTA (quando houver).

c) Um arrasto da esquerda para direita: foca o próximo item do header e o LT anuncia todo conteúdo textual (quando na última posição, foca o próximo componente da tela);

d) Um arrasto da direita para a esquerda: foca o item anterior e o LT anuncia todo conteúdo textual (quando na primeira posição trava a navegação)

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - ButtonDynamicByInputValueDTOsAndStyles
- Exemplos
- Acessibilidade

<!-- image -->

#### Guidelines

- Especialização do componente ButtonItem
- Identifica dentro do grupo de ButtonBundle através do tipo concreto ButtonDynamicByInputValueDTOsAndStyles injetado
- Somente aceita textos no formato de cotação. Usa o parâmetro lenient para formatação então possível utilizar somente números, precedido por R$ ou ainda conter espaços no meio do conteúdo, porém aceita somente uma vírgula, não aceita pontos nem outras letras se não as delimitadas para indicação de cotação. E.g.:
- Somente aceita textos no formato de cotação. Usa o parâmetro lenient para formatação então possível utilizar somente números, precedido por R$ ou ainda conter espaços no meio do conteúdo, porém aceita somente uma vírgula, não aceita pontos nem outras letras se não as delimitadas para indicação de cotação. E.g.:
    - 5
    - 5,98
    - R$5,98
    - R$ 5,98

### ButtonDynamicByInputValueDTOsAndStyles

| Atributo   | Tipo            | Default   | Descrição             |
|------------|-----------------|-----------|-----------------------|
| dto        | ButtonItemDTO   | undefined | DTO de ButtonItem     |
| style      | ButtonItemStyle | undefined | Style para ButtonItem |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var buttonBundle = dependencies
        .artemisComponents
        .toButtonBundle()
        .setDTO( 
              .init(
                  // Estado inicial do botão primário
                  primary: ButtonDynamicByInputValueDTOsAndStyles(
                      ButtonItemDTO(
                          ""
                      ),
                      style: .primaryNeutralDisabled
                  )
              )
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Outro componente recebe algum tipo de update
    // e.g. UITextField recebeu conteúdo
    func textFieldDidChange() {
        buttonBundle
            .setDTO(
                // Novo conteúdo para o botão primário e novo estilo
                .init(
                    primary: ButtonDynamicByInputValueDTOsAndStyles(
                        ButtonItemDTO(
                            "R$5,00"
                        ),
                        style: .primaryNeutral
                    )
                )
            )
            .setEnabled(
                true // Necessário habilitar o botão
            )
    }
}
```

## Acessibilidade

a) O rótulo deve descrever com clareza a finalidade de cada Dynamic Button By Input;
b) Quando o rótulo do Dynamic Button By Input for alterado o Leitor de Telas deve anunciá-lo, sem alteração de foco, ou seja, anuncia, porém permanece no componente em que está;
c) Deve ser aplicada a semântica de "Button";
d) O que deve ser lido:
Conteúdo textual + Semântica: button.
Comportamento e Interação:
a) Quando o conteúdo textual é alterado: o leitor de telas deve anunciá-lo;
b) Um toque: aplica o foco visível e o LT anuncia conteúdo textual + semãntica;
c) Dois toques: ativa o CTA.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Variações
    - Funções / Modificadores
    - BankStatementItemDTO
    - BankStatementIdentifierType
- Exemplos
- Acessibilidade

### Guidelines

- Possui versão positive, negative, neutral, canceled.

### Variações

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

### Funções / Modificadores

| Método                                                                     | Parametro                                            | Default   | Descrição                                                                                                                 |
|----------------------------------------------------------------------------|------------------------------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------|
| func setStyle(_ style: BankStatementItemStyle) -> Self                     | '.positive' | '.negative' | '.neutral' | '.canceled' | .neutral  | Determina a cor e estilo do valor da transação.                                                                           |
| func setDTO(_ dto: BankStatementItemDTO) -> Self                           | BankStatementItemDTO                                 | undefined | Define os dados do componente. Veja a abaixo.                                                                             |
| func hideSensitiveInfo(_ hide: Bool) -> Self                               | 'true' | 'false'                                     | undefined | Permite ocultar o valor da transação.                                                                                     |
| func onChange(_ callback: @escaping (DTOProtocol) -> Void) -> Self         |                                                      |           | Método de injeção de callback para quando o componente sofre uma alteração. Ex: quando o valor é ocultado (isObfuscated). |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self          |                                                      |           | Método de injeção de callback para ação de toque primário no componente.                                                  |
| func onSecondaryClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self |                                                      |           | Método de injeção de callback para ação de toque secundário (botão) no componente.                                        |
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void) -> Self           |                                                      |           | Método de injeção de callback para momento de carregamento do componente em memória.                                      |
| func onAppear() -> Self                                                    |                                                      |           | Método para forçar chamada do callback de onAppear.                                                                       |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void) -> Self         |                                                      |           | Método de injeção de callback para quando o componente aparecer em tela.                                                  |

### BankStatementItemDTO

| Atributo                       | Tipo                        | Default   | Obrigatório   | Descrição                                                                                                             |
|--------------------------------|-----------------------------|-----------|---------------|-----------------------------------------------------------------------------------------------------------------------|
| financeEvent                   | string                      | undefined | Sim           | Valor para o evento financeiro                                                                                        |
| value                          | string                      | undefined | Sim           | Valor monetário da transação,                                                                                         |
| isObfuscated                   | bool                        | undefined | Sim           | Inicia o componente com o valor sensível ocultado.                                                                    |
| shouldShowDivider              | bool                        | undefined | Sim           | Permite exibir ou não o Divider na parte inferior do componente.                                                      |
| shouldShowChevron              | bool                        | undefined | Sim           | Exibe o ícone icChevronRight para indicar que possui uma ação onClick.                                                |
| firstIdentifier                | BankStatementIdentifierType | undefined | Não           | Atributo para indicar o ícone/imagem da transação. Representa estilos pré-definidos do componente Identifier.         |
| secondIdentifier               | BankStatementIdentifierType | undefined | Não           | Atributo para indicar o ícone/imagem adicional da transação. Ficará ao lado direito do firstIdentifier.               |
| fromToPrepositionAccessibility | string                      | undefined | Não           | Valor opcional, que pode ser utilizado para adicionar uma preposição, com a finalidade de melhorar a semântica do LT. |
| fromTo                         | string                      | undefined | Não           | Valor para informar a origem/destino da transação.                                                                    |
| sourceOfFunding                | string                      | undefined | Não           | Valor para informar o meio de pagamento.                                                                              |
| time                           | string                      | undefined | Não           | Valor para a hora em que foi realizada a transação.                                                                   |
| buttonDTO                      | string                      | undefined | Não           | Valor do texto do botão secundário.                                                                                   |

### BankStatementIdentifierType

|    | Estilo          | Tipo               | Descrição                                                                                                                                                                     |
|----|-----------------|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|    | .personInitials | string             | IdentifierDTO.neutralCircle com as iniciais do usuário.                                                                                                                       |
|    | .personImage    | String, ImageName? | IdentifierDTO.normalCircle url para foto do usuário. É possível passar um ícone ImageName opcional que será utilizado como um placeholder quando o download da imagem falhar. |
|    | .brandIcon      | ImageName          | IdentifierDTO.neutralIcon com o ícone que representa o tipo de transação.                                                                                                     |
|    | .brandImage     | String, ImageName? | IdentifierDTO.normal url para imagem das IFs. É possível passar um ícone ImageName opcional que será utilizado como um placeholder quando o download da imagem falhar.        |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var dto = BankStatementItemDTO(financeEvent: "Compra realizada",
                                       value: "−R$ 899,00",
                                       isObfuscated: false,
                                       shouldShowDivider: true,
                                       shouldShowChevron: true,
                                       firstIdentifier: .brandIcon(.icBag),
                                       fromTo: "Adidas Store",
                                       sourceOfFunding: "Com saldo PicPay",
                                       time: "18h32")

    lazy var bankStatementItem = dependencies
        .setDTO(dto)
        .setStyle(.negative)
        .onLoad { [weak self] dto in
              print(">>>> BankStatementItem on load \(dto)")
         }.onAppear { [weak self] dto in
              print(">>>> BankStatementItem on appear \(dto)")
         }.onClick { [weak self] dto in
              print(">>>> BankStatementItem on click \(dto)")
         }.onChange { [weak self] dto in
              print(">>>> BankStatementItem on change \(dto)")
         }.onSecondaryClick { [weak self] dto in
              print(">>>> BankStatementItem on secondary click \(dto)")
         }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func hide(_ hide: Bool) {
        bankStatementItem.hideSensitiveInfo(hide)
    }
}
```

## Acessibilidade

- Identifier 1 e 2 são apenas decorativos, não sendo lidos pelo LT;
- O restante dos elementos não são lidos separadamente, seguindo uma ordem de leitura pré-definida. Exemplo: "Pix enviado, adidas iguatemi, com saldo PicPay, às 8h32, −R$ 10,00";
- O botão secundário não é lido com o restante das informações, sendo anunciado separadamente após o LT informar que existem ações disponíveis;
- No atributo financeEvent, para informar transações parceladas devemos utilizar o unicode U+00D7. Ex: “Pagamento enviado em 12×”
- Nos valores, precisamos garantir que os símbolos usem caracteres unicode. Ex: não usar um hífen no lugar do sinal de menos, utilizar o unicode U+2212.
- O atributo shouldShowChevron determina a semântica button para todo o componente. Caso seja passado o valor false , a ação onClick é removida e a semântica é definida para none.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!- ShapeListActionItem / iOS
- ShapeListMoreOptionItem / iOS
- ShapeListMultiSelectBundle / iOS
- ShapeListMultiSelectItem / iOS
- ShapeListSingleSelectBundle / iOS
- ShapeListSingleSelectItem / iOS## Sobre o elemento

[  ] [  ] [  ] [  ] [  ] [  ] [  ]

# Sobre o Componente

<!-- image -->

O LocalCheckoutTitle é um componente local para ser utilizado no ReviewTemplate.

### LocalCheckoutTitleDTO

| Atributo       | Tipo                    | Default   | Descrição        |
|----------------|-------------------------|-----------|------------------|
| firstLineText  | String                  |           | Item da listagem |
| secondLineText | CheckoutAndContentText? | nil       | Item da listagem |
| thirdLineText  | CheckoutAndContentText? | nil       | Item da listagem |
| forthLineText  | CheckoutAndContentText? | nil       | Item da listagem |

### CheckoutAndContentText

| Atributo          | Tipo    | Default   | Descrição        |
|-------------------|---------|-----------|------------------|
| checkoutTitleText | String? |           | Texto a esquerda |
| valueText         | String? |           | Texto a direita  |

## Exemplos

```
LocalCheckoutTitleDTO.init(
                    firstLineText: "Confirm action",
                    secondLineText: .init(
                        checkoutTitleText: "Transaction",
                        valueText: nil
                    ),
                    thirdLineText: .init(
                        checkoutTitleText: "Recipient action",
                        valueText: nil
                    ),
                    forthLineText: .init(
                        checkoutTitleText: "Complement action",
                        valueText: "value"
                    )
                )
```

## Acessibilidade (in progress)

## Skeleton

<!-- image -->

<!-- image -->

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
    - FloatingTimerDTO
    - Protocolos usados
- Exemplos
    - Acessibilidade
    - Animações

<!-- image -->

Os componentes do tipo Floating Timer se tratam de containers de textos e timer garantindo visibilidade da oferta com animações contínuas até o término do tempo configurado.

A classe FloatingTimerView é a responsável por criar o componente. Os arquivos com a custom view e suas demais configurações estão no pacote UIComponents, dentro do módulo ArtemisComponents.

### Guidelines

- Floating Timer  possui 1 Variantes, labelText  + startTimer + remainingTimer.

### Funções / Modificadores

| Atributo                                                                        | Parametro                     | Default   | Descrição                                                                    |
|---------------------------------------------------------------------------------|-------------------------------|-----------|------------------------------------------------------------------------------|
| func setDTO(_ dto: FloatingTimerDTO) -> Self                                    | FloatingTimerDTO              | undefined | Define os dados configuráveis do componente. Veja a abaixo.                  |
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void)                        | completion de ação            | undefined | Configurar callback para receber informação de carregamento do componente    |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void)                      | ao aparecer na tela           | undefined | Configurar callback para receber informação de aparição do componente        |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void)                       | ao clickar no componente      | undefined | Configurar callback para receber informação de clique primário no componente |
| func onFinished(_ callback: @escaping (DTOProtocol, _ completed: Bool) -> Void) | ao acabar timer no componente | undefined | Configurar callback para receber informação de clique primário no componente |

### FloatingTimerDTO

| Atributo      | Tipo   | Default   | Descrição                                                      |
|---------------|--------|-----------|----------------------------------------------------------------|
| labelText     | String | N/A       | Este atributo contém o texto principal. É um valor obrigatório |
| startTimer    | Int64  |           | Tempo inicial da oferta (em milissegundos).                    |
| remainingTime | Int64  | 0         | Tempo restante da oferta (em milissegundos).                   |

### Protocolos usados

ComponentProtocol;

BaseEventsProtocol;

## Exemplos

```
import ArtemisComponentsInterface
final class CustomView: UIView {
    let dependencies: Dependencies
    let dto = FloatingTimerDTO(
          labelText: "Title Short",
          startTimer: 60 * 60 * 1000,
          remainingTime: 10 * 1000
    )
    
    lazy var floatingTimer = dependencies
        .artemisComponents
        .setDTO(
            dto
        )            
        .onLoad { _ in
           print(">>>> FloatingTimer on load")
        }
        .onAppear {  _ in
            print(">>>> FloatingTimer on appear")
        }
        .onClick { _ in
           print(">>>>clicked")
        }
        .onFinished { _, _ in
           print(">>>> Time is Finished")
        }
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

a) O texto do floating timer, mesmo quando tiver transição, deve ser anunciado na íntegra pelo LT, apenas na primeira vez que o foco do LT se posicionar nele;
b) O timer deve ser anunciado tal como estiver visível, precedido da palavra "restantes";
c) Enquanto o foco do LT permanecer sobre o floating timer, o LT seguirá anunciando o tempo restante atualizado;
d) Deve ser aplicada a semântica de "Button";
e) O que deve ser lido:
Texto + Timer + "restante" + Semântica: button.

Comportamento e Interação:
a) Um toque: aplica o foco visível e o LT anuncia o texto + o timer + semãntica 'Button';
b) Dois toques: ativa o CTA.

### Animações

O componente FloatingTimer conta com animações que aprimoram a experiência do usuário ao visualizar ofertas com tempo limitado. As animações incluem os seguintes elementos:

1. Animação de Finalização do Cronômetro: Quando o tempo da oferta se esgota, ocorre uma transição suave e tempo volta para inicial.## Sobre o elemento

<!-- image -->

Descreva brevemente a finalidade de uso do componente. Por exemplo:

Componente base utilizado com Icon Button ou Avatar.

### Funções / Modificadores

| Atributo                               | Parametro   | Default   | Descrição                                                    |
|----------------------------------------|-------------|-----------|--------------------------------------------------------------|
| func setDTO(_ dto: BadgeDTO) -> Self   | BadgeDTO    | undefined | Define os dados configuráveis do componente.                 |
| func setBadgeValue(value: Int) -> Self | Int         | undefined | Define um valor numérico para ser apresentado no componente. |

### BadgeDTO

| Atributo           | Tipo       | Default   | Descrição                                                                                                                                                          |
|--------------------|------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| style              | BadgeStyle | undefined | Define a variação do componente: .editNone .editIcon .notificationNone .notificationIcon .notificationText.heartFilledIcon (Fundo com tom de verde e ícone branco) |
| content            | String     | undefined | Define o texto do conteúdo do componente a ser narrado pelo Voice Over.                                                                                            |
| accessibilityValue | String     | undefined | Define o texto a ser narrado pelo Voice Over.                                                                                                                      |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    lazy var badgeWithIcon = dependencies
            .artemisBaseComponents
            .toBadge()
            .setDTO(
                .editIcon(
                      content: .icCamera,
                      accessibilityValue: ""
                 )
            )

    lazy var badgeWithNotificationText = dependencies
            .artemisBaseComponents
            .toBadge()
            .setDTO(
                .notificationText(
                      content: 9,
                      accessibilityValue: ""
                 )
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- Será narrado o conteúdo de texto do componente 'pai' + texto alternativo do badge + semântica herdada do componente 'pai' (se houver)

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

Objetos de efeito de elevação, identificados por tokens semânticos. Objetos, variáveis e métodos relacionados definidos no Protocolo de Interface ElevationsProtocol

Um exemplos de efeitos pode ser encontrado no nosso ArtemisCoreSample. Para realizar a instalação do ArtemisCoreSample, baixe o projeto do PicPay e rode o módulo ArtemisCore.

### Guidelines

- Deve ser aplicado através do método presente na extensão de UIView
- Deve ser aplicado através do método presente na extensão de UIView
    - func elevation(\_ name: ElevationName, tokens: ThemeTokensInterface)

### ElevationName

- elevationBottom1
- elevationBottom2
- elevationBottom3
- elevationTop1
- elevationTop2
- elevationTop3
- elevationNone

### Atributos

| Atributo       | Tipo                               | Default   | Descrição                                                                               |
|----------------|------------------------------------|-----------|-----------------------------------------------------------------------------------------|
| elevationsDict | [ElevationName: ElevationProtocol] | undefined | Define um dicionário de objetos de Elevation chaveados pelo seu nome de token semântico |

### Funções / Modificadores

| Função                                                              | Descrição                                                                                                                     |
|---------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| func elevation(by name: ElevationName) -> ElevationProtocol         | Retorna uma elevação baseada no nome semântico provido.                                                                       |
| func elevation(_ name: ElevationName, tokens: ThemeTokensInterface) | Método interno de ArtemisComponents em extensão de UIView utilizada para aplicar tokens de elevação ao componente necessário. |

## Como utilizar

```
let dependencies: ArtemisComponentsInterface

let component = dependencies.artemisComponents.toComponent()
component.elevatons(
    .elevationBottom1
)
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - IconCarouselItemDTO
    - Exemplos
    - Acessibilidade
- Skeleton
    - Exemplo

### Funções / Modificadores

| Atributo                                | Parametro                     | Default       | Descrição                                                   |
|-----------------------------------------|-------------------------------|---------------|-------------------------------------------------------------|
| IconCarouselItemStyle                   | .defaultColor .highlightColor | .defaultColor | Define o estilo do componente                               |
| func setDTO(_ dto: IconCarouselItemDTO) | IconCarouselItemDTO           | undefined     | Define os dados configuraveis do componente. Veja a abaixo. |

### IconCarouselItemDTO

| Atributo    | Tipo                  | Default   | Descrição                                                         |
|-------------|-----------------------|-----------|-------------------------------------------------------------------|
| icon        | ImageDTO              | undefined | DTO para componente interno de Image                              |
| title       | String                | undefined | Valor do título imagem do item do carousel icon                   |
| tag         | TagArgumentativeDTO?  | nil       | Valor da tag (opcional)                                           |
| ifColorName | NotTokenableColorName | nil       | Cor do item a partir da cor da instituições financeira (opcional) |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    lazy var iconCarouselitem = dependencies
        .artemisComponents
        .toIconCarouselItem()
        .setDTO(
            IconCarouselItemDTO(
                  icon: .icon(
                      image: .icAddCard,
                      color: .accent
                  ),
                  title: "Adicionar cartão",
                  tag: $0.tag != nil ? .init(
                      title: $0.tag ?? ""
                  ) : nil
              )
        )
        .setStyle(
            .defaultColor
        )
        .onLoad { _ in
            print("Banner loaded")
        }
        .onAppear{ _ in
            print("Banner appeared")
        }
        .onClick { _ in
          print("Banner primary click")
        }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

#### Customização com IfColorName

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    lazy var iconCarouselitem = dependencies
        .artemisComponents
        .toIconCarouselItem()
        .setDTO(
            IconCarouselItemDTO(
                  icon: .icon(
                      image: .icAddCard,
                      color: .accent
                  ),
                  title: "Adicionar cartão",
                  tag: $0.tag != nil ? .init(
                      title: $0.tag ?? ""
                  ) : nil,
                  ifColorName: .ifNubank
              )
        )
        .setStyle(
            .defaultColor
        )
        .onLoad { _ in
            print("Banner loaded")
        }
        .onAppear{ _ in
            print("Banner appeared")
        }
        .onClick { _ in
          print("Banner primary click")
        }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

O que deve ser lido pelo Voice Over:
Nome do produto + texto da  tag ou texto alternativo da tag + semântica "button".

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonIconCarouselItem()
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.remakeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
        }
        customView.startShimmer()
     }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - ListDTO
- Exemplos

<!-- image -->

#### Guidelines

- Componente utilizado para listar itens.

### Funções / Modificadores

| Atributo                                                                                       | Parametro                                                                                                                           | Default   | Descrição                                                                                                                                                                                                                  |
|------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ListDTO) -> Self                                                            | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/4069950072?draftShareId=7461f28e-a085-4604-84a6-1c5630fa34a1#ListDTO | undefined | Define dados configuráveis do componente. Veja a abaixo.                                                                                                                                                                   |
| func checkItemAsDone(at index: Int, shouldRemoveItem: Bool, completion: (() -> Void)?) -> Self | Int, Bool, () -> Void)                                                                                                              | undefined | Marca um item da lista como concluído, exibindo um ícone de check e removendo da lista de forma animada apenas se o parâmetro shouldRemoveItem for true. Após a conclusão do item, é chamado um completion, que é opcional |
| func hideDivider()                                                                             | -                                                                                                                                   | -         | Esconde divisores.                                                                                                                                                                                                         |
| func hideSensitiveInfo(_ hide: Bool)                                                           | Bool                                                                                                                                | undefined | Esconde/Mostra informações sensíveis.                                                                                                                                                                                      |

### ListDTO

| Atributo                | Tipo                | Default   | Descrição                                                   |
|-------------------------|---------------------|-----------|-------------------------------------------------------------|
| dtosAndStyles           | [ListDTOsAndStyles] | undefined | Define itens e estilos da lista.                            |
| childViewVisibilityRate | CGFloat             | 1.0       | Taxa de visibilidade de item mínima para disparo de eventos |

## Exemplos

```
import ArtemisComponentsInterface
final class CustomView: UIView {
    let dependencies: Dependencies
    
    let dto = [
      ListItemDTO(
        contentAreaDTO: ListContentAreaDTO(
          label: "Saldo em conta",
          bigLabel: "R$ 1234,56",
          plus: "Rendeu esse mês <b><span color=\"supportSuccessA\">R$ 1234,56</span></b>"
        ),
        identifierDTO: IdentifierDTO(
          style: .neutral,
          accessibilityValue: "",
          icon: ImageDTO.icon(
            image: .icWallet
          )
        ),
        elementActionDTO: ElementActionDTO(
          image: .icChevronRight
        )
      )
    ]
    
    lazy var list = dependencies
        .artemisComponents
        .toList(
            isScrollable: false
        )
		.setDTO(
			dto
		)
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

Componente para facilitar a busca e a localização de informações.

### Funções / Modificadores

| Atributo                                                                                                           | Parametro                                                | Default   | Descrição                                                                |
|--------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|-----------|--------------------------------------------------------------------------|
| var text: String? { get set }                                                                                      | String?                                                  | undefined | Texto da barra de busca                                                  |
| var placeholder: String? { get set }                                                                               | String?                                                  | undefined | Placeholder da barra de busca                                            |
| var keyboardReturnType: UIReturnKeyType { get }                                                                    | UIReturnKeyType                                          | undefined | Tipo de retorno do teclado                                               |
| func shouldBeginEditing(_ callback: @escaping (UITextField) -> Bool) -> Self                                       | @escaping (UITextField)                                  | undefined | Define um callback para o evento shouldBeginEditing do UITextField       |
| func didBeginEditing(_ callback: @escaping (UITextField) -> Void) -> Self                                          | @escaping (UITextField)                                  | undefined | Define um callback para o evento didBeginEditing do UITextField          |
| func shouldEndEditing(_ callback: @escaping (UITextField) -> Void) -> Self                                         | @escaping (UITextField)                                  | undefined | Define um callback para o evento shouldEndEditing do UITextField         |
| func didEndEditing(_ callback: @escaping (UITextField) -> Void) -> Self                                            | @escaping (UITextField)                                  | undefined | Define um callback para o evento didEndEditing do UITextField            |
| func didEndEditingWithReason(_ callback: @escaping (UITextField, UITextField.DidEndEditingReason) -> Void) -> Self | @escaping (UITextField, UITextField.DidEndEditingReason) | undefined | Define um callback para o evento didEndEditingWithReason do UITextField  |
| func shouldChangeCharactersIn(_ callback: @escaping (UITextField, NSRange, String) -> Bool) -> Self                | @escaping (UITextField, NSRange, String)                 | undefined | Define um callback para o evento shouldChangeCharactersIn do UITextField |
| func didChangeSelection(_ callback: @escaping (UITextField) -> Void) -> Self                                       | @escaping (UITextField)                                  | undefined | Define um callback para o evento didChangeSelection do UITextField       |
| func shouldClear(_ callback: @escaping (UITextField) -> Bool) -> Self                                              | @escaping (UITextField)                                  | undefined | Define um callback para o evento shouldClear do UITextField              |
| func shouldReturn(_ callback: @escaping (UITextField) -> Bool) -> Self                                             | @escaping (UITextField)                                  | undefined | Define um callback para o evento shouldReturn do UITextField             |
| func focus() -> Self                                                                                               |                                                          | undefined | Define o foco na barra de busca                                          |
| func unfocus() -> Self                                                                                             |                                                          | undefined | Remove o foco na barra de busca                                          |
| func didCancelSearch(_ callback: @escaping (UIButton) -> Void) -> Self                                             | @escaping(UIButton)                                      | undefined | Define um callback para o evento de cancelamento da busca                |
| func didClearSearchField(_ callback: @escaping (UITextField) -> Void) -> Self                                      | @escaping (UITextField)                                  | undefined | Define um callback para o evento de limpeza do campo de busca            |
| func setStyle(_ style: SearchBarStyle) -> Self                                                                     | SearchBarStyle                                           | undefined | Define o estilo da barra de busca                                        |
| func setDTO(_ dto: SearchBarDTO) -> Self                                                                           | SearchBarDTO                                             | undefined | Define o DTO para a barra de busca                                       |
| func setInteractionEnabledStatus(_ enabled: Bool) -> Self                                                          | Bool                                                     | undefined | Define o status de interação da barra de busca                           |
| func setReturnKeyType(_ keyType: UIReturnKeyType) -> Self                                                          | UIReturnKeyType                                          | undefined | Define o tipo de tecla de retorno do teclado                             |
| func setAnimationsEnabled(_ enabled: Bool) -> Self                                                                 | Bool                                                     | undefined | Define se as animações estão habilitadas na barra de busca               |

### SearchBarDTO

| Atributo    | Tipo       | Default   | Descrição                             |
|-------------|------------|-----------|---------------------------------------|
| text        | String     | undefined | Texto da barra de busca               |
| placeholder | String     | undefined | Placeholder da barra de busca         |
| image       | ImageName? | undefined | Imagem opcional para a barra de busca |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var searchBar = dependencies
        .artemisComponents
        .toSearchBar()
        .setDTO(
          .init(
            style: .normal,
            dto: SearchBarDTO(
                placeholder: "Buscar",
                text: "Filled"
            )
          )
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## FontStyleName

| Name          | Size   | Line Height   | Letter Spacing   | Font    | Bold Style   | Decoration   | Case      |
|---------------|--------|---------------|------------------|---------|--------------|--------------|-----------|
| tinyMedium    | tiny   | tiny          | tiny             | medium  | X            | X            | uppercase |
| smallRegular  | small  | small         | X                | regular | smallValue   | X            | X         |
| smallMedium   | small  | small         | X                | medium  | smallValue   | X            | X         |
| smallValue    | small  | small         | X                | bold    | X            | X            | X         |
| link          | small  | small         | X                | medium  | X            | underscore   | X         |
| mediumRegular | medium | medium        | medium           | regular | mediumValue  | X            | X         |
| mediumMedium  | medium | medium        | medium           | medium  | mediumValue  | X            | X         |
| mediumValue   | medium | medium        | medium           | bold    | X            | X            | X         |
| largeRegular  | large  | large         | large            | regular | X            | X            | X         |
| largeMedium   | large  | large         | large            | medium  | X            | X            | X         |

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

<!-- image -->

Descreva brevemente a finalidade de uso do componente. Por exemplo:

Componente visual de marcação de seleção de item.

### Funções / Modificadores

| Atributo                                | Parametro   | Default   | Descrição                                                   |
|-----------------------------------------|-------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: CheckboxDTO) -> Self | CheckboxDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo. |

### CheckboxDTO

| Atributo   | Tipo   | Default   | Descrição                                   |
|------------|--------|-----------|---------------------------------------------|
| selected   | Bool   | undefined | Indicativo se o componente está selecionado |
| disabled   | Bool   | undefined | Indicativo se o componente esta desativado  |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var checkbox = dependencies
        .artemisComponents
        .toCheckbox()
        .setDTO(.init(selected: true, disabled: false))

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

a) O checkbox e seu respectivo rótulo devem estar agrupados num único foco visível para o LT.
b) O rótulo deve descrever com clareza a finalidade de cada checkbox.
c) O estado do checkbox precisa ser condizente com sua situação e deve ser anunciado corretamente pelo LT quando alterado.
d) O que deve ser lido ao focar nesse item:
Conteúdo textual relacionado + Semântica: caixa de seleção + Estado: Marcado/desmarcado

Comportamento e Interação:
a) 1 toque: Direciona o foco visível para o checkbox e seu respectivo rótulo.
b) Dois toques: marca ou desmarca.
Ao marcar: a. O foco se mantem no agrupamento e o LT deve anunciar a alteração de estado "marcado".
Ao desmarcar: O foco se mantem no agrupamento e o LT deve anunciar a alteração de estado desmarcado.

O Checkbox deve ser utilizado somente por outros componentes do Apollo.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonCheckbox()
    }()

    init() {
        super.init(
            style: .default,
            reuseIdentifier: "custom"
        )
        buildLayout()
    }

    required init?(
        coder: NSCoder
    ) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(16)
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - CardProfileDTO
- Exemplos
- Acessibilidade
    - O que deve ser transcrito pelo Voice Over:
- Skeleton
    - Exemplos

<!-- image -->

#### Guidelines

- Componente usado para exibir informações do usuário.

### Funções / Modificadores

| Atributo                                   | Parametro                                                                                         | Default   | Descrição                                                   |
|--------------------------------------------|---------------------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: CardProfileDTO) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3835920835/Card+Profile+iOS#CardProfileDTO | undefined | Define os dados configuráveis do componente. Veja a abaixo. |

### CardProfileDTO

| Atributo     | Tipo                                                                                           | Default   | Descrição                                                                            |
|--------------|------------------------------------------------------------------------------------------------|-----------|--------------------------------------------------------------------------------------|
| name         | String                                                                                         | undefined | Texto a ser apresentado pelo componente                                              |
| username     | String                                                                                         | undefined | Texto a ser apresentado pelo componente                                              |
| avatarDTO    | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3582492674/Avatar+iOS#AvatarDTO         | undefined | Define componente de imagem de avatar/label de iniciais                              |
| linkArrowDTO | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3779002681/Link+Arrow+iOS#LinkArrowDTO? | nil       | Define componente de informações bancárias                                           |
| errorMessage | String                                                                                         | undefined | Texto a ser apresentado pelo componente caso a requisição dos dados bancários falhe. |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let dto = CardProfileDTO(
            name: "Sophia",
            username: "@lima.sophia",
            avatarDTO: AvatarDTO.initials(
                "SL",
                badge: .editIcon(
                    content: .icCamera,
                    accessibilityValue: String()
                )
            ),
            linkArrowDTO: LinkArrowDTO(title: "Ag. 0001 Cc. 8660157-0")
        )
    
    let (loadable, component) = dependencies.productCrossComponents.toLoadableCardProfile()
    component
        .setDTO(
            dto
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

### O que deve ser transcrito pelo Voice Over:

- Avatar - Requisitos de Conformidade WCAG Comportamento e Interação a) Um toque: aplica o foco visível e o LT anuncia seu conteúdo;b) Dois toques: ativa o CTA.
- Avatar - Requisitos de Conformidade WCAG
    - a) A semântica do avatar deve ser "Button";
    - b) Quando o avatar conter as iniciais, deve ter como rótulo ("accessibilityLabel" em iOS e "contentDescription" em android) "Avatar [iniciais] (coloquei entre colchetes pra representar que este valor é uma variável) e o Hint deve ser "acesse para inserir uma foto de perfil";
    - c) Quando o avatar conter foto deve ter como rótulo ("accessibilityLabel" em iOS e "contentDescription" em android) ="sua foto [nome-do-usuário]" (coloquei entre colchetes pra representar que este valor é uma variável) e Hint = acesse para alterar sua foto de perfil;
- Comportamento e Interação
a) Um toque: aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques: ativa o CTA.
- Title - Requisitos de Conformidade WCAG Comportamento e Interação a) Um toque: aplica o foco visível e o LT anuncia seu conteúdo;b) Navegação por títulos no rotor: encontra este title e outros que existam em tela.
- Title - Requisitos de Conformidade WCAG
    - a) Deve apresentar semântica de "Title";
    - b) Deve ser lido o nome do usuário, conforme visível em tela.
- Comportamento e Interação
a) Um toque: aplica o foco visível e o LT anuncia seu conteúdo;
b) Navegação por títulos no rotor: encontra este title e outros que existam em tela.
- Button flex - Requisitos de Conformidade WCAG Comportamento e Interação UsernameRequisitos de Conformidade WCAG Comportamento e Interação
- Button flex - Requisitos de Conformidade WCAG
    - a) Todas as informações devem receber foco visível único e serem anunciadas pelo LT:
    - b) Concatenar a leitura da agência e conta ("accessibilityLabel" em iOS e "contentDescription" em android) separando-as por uma "," (vírgula) apenas na experiência com o LT (Visualmente não há alteração);
    - c) A semântica deve ser "button".
    - d) Usar o Hint "Acessar as informações da sua conta".
- Comportamento e Interação
    - a) Um toque: aplica o foco visível e o LT anuncia seu conteúdo;
    - b) Dois toques: ativa o CTA.
- UsernameRequisitos de Conformidade WCAG
    - a) Deve ser identificado apenas como texto;
    - b) Deve ser lido o Username conforme visível em tela.
- Comportamento e Interação
    - a) Um toque: aplica o foco visível e o LT anuncia seu conteúdo.

## Skeleton

<!-- image -->

### Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    let skeletonCardProfile = dependencies.productCrossComponents
        .toSkeletonCardProfile()
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

#### Variações:

Descreva brevemente a finalidade de uso do componente. Por exemplo:

O componente Tag é usado para itens que precisam ser rotulados, categorizados ou organizados usando palavras-chaves que os descrevem.

#### Guidelines

Descreva as diretrizes/regras do componente.. Por exemplo:

- São etiquetas curtas com objetivo de destacar e diferenciar elementos de uma lista.
- Não devem ultrapassar 26 caracteres.
- Usar apenas textos em caixa alta.

### Funções / Modificadores

| Atributo                                 | Parametro                                       | Default   | Descrição                                                   |
|------------------------------------------|-------------------------------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ButtonFlexDTO)        | TagDTO                                          | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: TagStyle) -> Self | .normal.neutralDark.neutralBright.shop.critical | .normal   | Define um estilo do componente.                             |

### TagDTO

| Atributo   | Tipo   | Default   | Descrição             |
|------------|--------|-----------|-----------------------|
| title      | string | undefined | Valor do texto da tag |

### TagStyle

| Atributo        | Tipo    | Default   | Descrição                                        |
|-----------------|---------|-----------|--------------------------------------------------|
| backgroundColor | UIColor | undefined | cor do background da tag para o style informado. |
| foregroundColor | UIColor | undefined | cor do texto da tag para o style informado.      |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var tag = dependencies
        .artemisComponents
        .toTag()
        .setDTO(.init(title: "Title"))
        .setStyle(.neutralDark)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

a) herdará do componente 'pai' a semântica, o estado, as formas de interação e comportamentos;
b) A informação apresentada pela Tag deve ser um complemento ao rótulo do componente 'pai';
c) O que deve ser lido:

- Conteúdo textual do item 'pai' \_+ Texto da Tag + semântica herdada do item 'pai' (se houver);

Comportamento e Interação:
a) 1 toque: habilita o foco visível em torno da Tag incluindo o componente 'pai' (se houver).
b) 2 toques: executa a ação (se houver).
c) Ao receber foco: o LT deve anunciar o conteúdo do componente 'pai' (se houver) e da Tag na sequência.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonTag(width: 80)
    }()
    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
    required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

O Tag deve ser utilizado somente por outros componentes do Apollo.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
    - MainTitleDTO
    - Protocolos usados
    - Variações
- Exemplos
- Acessibilidade
- Skeleton
    - Exemplo

<!-- image -->

Os componentes do tipo Main Title se tratam de containers de textos bastante usados no inicio das telas para indicar o contexto atual e uma descrição. Também há a possibilidade de adicionar um botão ao container.

A classe TitleView é a responsável por criar o componente. Os arquivos com a custom view e suas demais configurações estão no pacote UIComponents, dentro do módulo ArtemisComponents

### Guidelines

- Main Title possui 4 Variantes, Título; Título + Sub Título; Título  + Sub Título + Botão; Título  + Sub Título + Ícone + Botão;

### Funções / Modificadores

Caso faça sentido, preencha a tabela abaixo com as funções criadas especificamente para configurar o componente:

| Atributo                                       | Parametro           | Default   | Descrição                                                   |
|------------------------------------------------|---------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: AvatarDTO) -> Self          | MainTitleDTO        | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: MainTitleStyle) -> Self | .normal .contextual | undefined | Define o estilo da imagem do componente.                    |

### MainTitleDTO

| Atributo                | Tipo                    | Default   | Descrição                                                                                  |
|-------------------------|-------------------------|-----------|--------------------------------------------------------------------------------------------|
| titleText               | String                  | N/A       | Este atributo contém o texto principal do título. É um valor obrigatório                   |
| titleAccessibilityValue | String?                 | nil       | Texto opcional que fornece um valor de acessibilidade para o título                        |
| titleAccessibilityHint  | String?                 | nil       | Texto do valor de dica da acessibilidade ao Título                                         |
| iconDTO                 | ImageDTO?               | nil       | Data Transfer Object para o ImageDTO                                                       |
| subtitleText            | String?                 | nil       | Texto de subtítulo                                                                         |
| subtitleLineBreakMode   | MainTitleLineBreakMode? | nil       | Define como será a quebra de texto, caso necessário.                                       |
| buttonDTO               | ButtonFlexDTO?          | nil       | Data Transfer Object para o ButtonDTO                                                      |
| formatter               | FormatterType           | .markdown | Altera o tipo de formatação utilizada para interpretar o texto. Poder ser HTML ou Markdown |

### Protocolos usados

ComponentProtocol;

BaseEventsProtocol;

### Variações

- Styles disponíveis:

| Normal   | Contextual   |
|----------|--------------|
|          |              |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    // init do DTO com descrição:
    lazy var title = dependencies
        .artemisComponents
        .toMainTitle()
        .setDTO(
            .init(
            titleText: "Título de seção",
            subtitleText: "Descrição da seção",
            buttonDTO: ButtonFlexDTO(title: "Botão"),
            iconDTO: .icon(
                image: .icShieldFilled,
                isClickable: true)
            )
        )
        .setStyle(.contextual)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    // init do DTO com descrição:
    lazy var title = dependencies
        .artemisComponents
        .toMainTitle()
        .setDTO(
            .init(
            titleText: "Título de seção",
            subtitleText: "Descrição da seção",
            buttonDTO: ButtonFlexDTO(title: "Botão"),
            iconDTO: .icon(
                image: .icShieldFilled,
                isClickable: true)
            )
        )
        .setStyle(.normal)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Title (Sem subtitle e button flex)
a) Cada title deve ser focado e anunciado pelo LT individualmente;
b) Deve ser aplicada a semãntica de "Heading";
c) O que deve ser lido:
Conteúdo do title + Semântica: "Heading";

Comportamento e interação:
a) Um toque: aplica o foco visível e o LT anuncia o conteúdo do title + semântica;
b) Arrasto vertical: navega individualmente pelos titles ("rotor &gt; Headings" em iOS e "Controles de leitura &gt; Títulos" em android).

Title (com subtitle)
a) Title e description devem ser focados e anunciado pelo LT individualmente;
b) Title: Deve ser aplicada a semãntica de "Heading";
c) SubTitle deve ser considerada apenas text;
d) O que deve ser lido:
title + semãntica "Heading";

Comportamento e interação:
a) Um toque no Title: aplica o foco visível e o LT anuncia o conteúdo do title + semântica;
b) Um toque na subtitle: aplica o foco visível e o LT anuncia o conteúdo da description;
c) Arrasto vertical: navega individualmente pelos titles ("rotor &gt; Headings" em iOS e "Controles de leitura &gt; Títulos" em android).

Title (com subtitle e button flex)
a) Title, description e button devem ser agrupados para o foco vísível e anuncio do LT;
b) Deve ser aplicada a semântica de "Button";
c) O que deve ser lido:
title + subtitle + button flex + semãntica "Button".

Comportamento e interação:
a) Um toque: aplica o foco visível e o LT anuncia o conteúdo do title + subtitle + button flex + semântica "Button";
b) Dois toques: ativa o CTA.

## Skeleton

<!-- image -->

<!-- image -->

### Exemplo

```
lazy var customView: any LoadableInterface = {
  let converter = ArtemisConverter()
    return converter.toLoadableMainTitle(
      dto: dto,
      style: style,
      accessibilityAnnouncement: String(),
      initialConfiguration: .config(self)
    ).loadable
}()
    
private let dto: SkeletonMainTitleDTO
private let style: SkeletonStyle
init(dto: SkeletonMainTitleDTO, style: SkeletonStyle) {
  self.dto = dto
  self.style = style
  super.init(style: .default, reuseIdentifier: "custom")
  buildLayout()
}

required init?(coder: NSCoder) {
  nil
}

func buildLayout() {
  contentView.addSubview(customView)
  let color = style == .onColor ? UIColor(hex: "#1BA285") : .white
  contentView.backgroundColor = color

  customView.snp.makeConstraints {
    $0.edges.equalToSuperview().inset(20)
  }

  customView.startShimmer()
}
```# Sobre o Componente

### Variações Gold e Epic

Tanto na variação Gold quanto Epic os componentes possuem o mesmo estilo

<!-- image -->

<!-- image -->

<!-- image -->

### SupportTextReviewDTO

| Atributo    | Tipo                   | Default   | Descrição                                   |
|-------------|------------------------|-----------|---------------------------------------------|
| firstLine   | SupportAndContentText  |           | Item da listagem                            |
| secondLine  | SupportAndContentText? | nil       | Item da listagem                            |
| thirdLine   | SupportAndContentText? | nil       | Item da listagem                            |
| forthLine   | SupportAndContentText? | nil       | Item da listagem                            |
| fifthLine   | SupportAndContentText? | nil       | Item da listagem                            |
| sixthLine   | SupportAndContentText? | nil       | Item da listagem                            |
| showDivider | Bool                   | false     | Mostrar ou não o divider ao fim da listagem |

### SupportTextReviewDTO.SupportAndContentText

| Atributo         | Tipo                   | Default   | Descrição              |
|------------------|------------------------|-----------|------------------------|
| supportText      | String?                |           | Texto a esquerda       |
| supportTextColor | SupportTextReviewStyle |           | Cor do texto a direita |
| contentText      | String?                |           | Texto a direita        |

Tanto supportText quanto contentText podem ser nulos.

<!-- image -->

### SupportTextReviewStyle

| Case            | Descrição   |
|-----------------|-------------|
| contentDColor   |             |
| alternateAColor |             |

## Exemplos

```
SupportTextReviewDTO(
    firstLine: .init(
        supportText: "first",
        supportTextColor: .contentDColor,
        contentText: nil
    ),
    secondLine: .init(
        supportText: "second", 
        supportTextColor: .alternateAColor,
        contentText: "second"
    ),
    thirdLine: .init(
        supportText: "third",
        supportTextColor: .contentDColor,
        contentText: "third"
    ),
    forthLine: .init(
        supportText: nil,
        supportTextColor: .contentDColor,
        contentText: "forth"
    ),
    fifthLine: .init(
        supportText: "fifth",
        supportTextColor: .contentDColor,
        contentText: "fifth"
    ),
    sixthLine: .init(
        supportText: "sixth",
        supportTextColor: .contentDColor,
        contentText: "sixth"
    )
)
```

## Acessibilidade

A leitura é feita dos items da listagem em ordem com separação entre as linhas, por exemplo caso o componente possua um firstLine.supportText: "CPF", firstLine.ContentText: "000.000.000-00" e um secondLine.supportText: "Valor promocional"

Será feita a leitura: “CPF 000.000.000-00, Valor promocional"

### Skeleton

<!-- image -->

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - ButtonItemDTO
- Exemplos
- Acessibilidade

<!-- image -->

#### Guidelines

O componente Button Swipe Dynamic é um botão que possui um texto que pode ser alterado para outro com uma animação de swipe.

- Propósito deste componente é mudar o conteúdo do botão conforme o conteúdo da View;
- Texto tem limite de 29 characters;
- Possui Tapstate

### Funções / Modificadores

| Atributo                                              | Parametro                                                                                                                                      | Default   | Descrição                                                            |
|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------------------|
| func animateText(dto: ButtonItemDTO, isFromTop: Bool) | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/4053270883?draftShareId=a9ad09b0-dd85-41af-81dc-b6e0a09ef59d#ButtonItemDTO Bool | undefined | Define dados configuráveis no botão e o ponto de início da animação. |

### ButtonItemDTO

| Atributo   | Tipo   | Default   | Descrição                                    |
|------------|--------|-----------|----------------------------------------------|
| title      | String | undefined | Valor do texto do botao                      |
| hasArrow   | Bool   | false     | Flag indicativa de exibição de ícone de seta |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    lazy var buttonSwipeDynamic = dependencies
        .artemisComponents
        .toButtonSwipeDynamic()
        .animateText(
            dto: ButtonItemDTO(
                "Faça Pix parcelado com cartão"
            ),
            isFromTop: true
        )
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Requisitos de conformidade WCAG

- a) O rótulo deve descrever com clareza a finalidade de cada Dynamic Button By Swipe;
- b) As ações do Dynamic Button By Swipe devem ser vinculadas ao “UIAccessibiltyCustomAction";
- As ações do Dynamic Button By Swipe serão exibidas nas "ações do rotor".

Comportamento e interação

- a) Arrasto vertical (Rotor &gt; Actions): navega pelas ações do Dynamic Button By Swipe.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
- Exemplos
- Acessibilidade
- Skeleton
- Skeleton
    - Exemplo

#### 

<!-- image -->

### Guidelines

- Componente gráfico de linha horizontal.

### Funções / Modificadores

| Atributo                                           | Parametro                                                                                                        | Default   | Descrição                                                       |
|----------------------------------------------------|------------------------------------------------------------------------------------------------------------------|-----------|-----------------------------------------------------------------|
| func setDTO(_ dto: HorizontalLineChartDTO) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3889791233/HorizontalLineChart+iOS#HorizontalLineChartDTO | undefined | Método de injeção de conteúdo                                   |
| func update(_ dto: HorizontalLineChartDTO) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3889791233/HorizontalLineChart+iOS#HorizontalLineChartDTO | undefined | Método de atualização de conteúdo                               |
| func hideSensitiveInfo(_ hide: Bool)               | undefined                                                                                                        | undefined | Método para ocultar ou exibir informações sensíveis do gráfico. |

### HorizontalLineChartDTO

| Atributo   | Tipo                                                                                                                  | Default   | Descrição                        |
|------------|-----------------------------------------------------------------------------------------------------------------------|-----------|----------------------------------|
| items      | [ https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3889791233/HorizontalLineChart+iOS#HorizontalLineChartItem ] | undefined | Lista de HorizontalLineChartItem |

### HorizontalLineChartItem

| Atributo   | Tipo   | Default   | Descrição           |
|------------|--------|-----------|---------------------|
| colorName  | String | undefined | Nome da cor do item |
| value      | Double | undefined | Valor do item       |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    lazy var horizontalLineChart = dependencies.artemisComponents.toHorizontalLineChart()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Deve ser ignorado pelo LT, pois serve apenas como apoio visual das informações contidas.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonButtonFlex(
            width: width,
            margin: margin
        )
    }()

    private let width: CGFloat?
    private let margin: Margin
    init(
        width: CGFloat? = nil,
        margin: Margin = .none
    ) {
        self.width = width
        self.margin = margin
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - IconCarouselDTO
    - IconCarouselItemDTOsAndStyles
- Exemplos
- Acessibilidade
- Skeleton
    - Exemplo

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionEventProtocol
- OnMoreOptionsClickEventProtocol
- ScrollNotifiable
- MarginToggle

<!-- image -->

<!-- image -->

#### Guidelines

- Carrossel horizontal de IconCarouselItemViews
- Não paginado por padrão

### Funções / Modificadores

| Atributo                                                                                  | Parametro                                       | Default   | Descrição                                                                                |
|-------------------------------------------------------------------------------------------|-------------------------------------------------|-----------|------------------------------------------------------------------------------------------|
| func setDTO(_ dto: IconCarouselDTO)                                                       | IconCarouselDTO                                 | undefined | Define os dados configuraveis do componente. Veja a abaixo.                              |
| func update(dto: IconCarouselItemDTO, style: IconCarouselItemStyle, at index: Int)-> Self | IconCarouselItemDTO, IconCarouselItemStyle, Int | undefined | Atualiza item referente ao índex passado com os dados e estilo de item de Icon injetados |

### IconCarouselDTO

| Atributo                | Tipo                            | Default   | Descrição                                                                                                                                      |
|-------------------------|---------------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------|
| itemDTOsAndStyles       | [IconCarouselItemDTOsAndStyles] | undefined | Recebe um array de DTOs e estilos de IconCarouselItem a serem exibidos no carrossel                                                            |
| moreOptionsDTO          | MoreOptionsCarouselItemDTO?     | nil       | DTO de componente de MoreOptions adicionado ao final do carrossel                                                                              |
| childViewVisibilityRate | CGFloat                         | 1         | Percentual do item visível necessária para ativar disparo de métodos de tracking                                                               |
| ifColorName             | NotTokenableColorName           | nil       | Cor customizada para os itens marcados como highlighted. Caso não seja inserida nenhuma cor, seguirá o padrão de cor da segmentação do usuário |

### IconCarouselItemDTOsAndStyles

| Atributo   | Tipo                  | Default       | Descrição                                  |
|------------|-----------------------|---------------|--------------------------------------------|
| dto        | IconCarouselItemDTO   | undefined     | Data Transfer Object para IconCarouselItem |
| style      | IconCarouselItemStyle | .defaultColor | Estilo de IconCarouseltem                  |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let dto = IconCarouselDTO(
        itemDTOsAndStyles: [
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                     icon: .icon(
                        image: .icAddCard,
                         color: .accent
                    ),
                    title: "Adicionar Cartão"
                ),
                style: .highlightColor
            ),
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                    icon: .icon(
                        image: .icPix,
                        color: .accent
                    ),
                    title: "Pix"
                )
            ),
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                    icon: .icon(
                        image: .icExtract,
                        color: .accent
                    ),
                    title: "Extrato da conta"
                ),
                style: .defaultColor
            ),
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                    icon: .icon(
                        image: .icBarChart,
                        color: .accent
                    ),
                    title: "Boletos"
                )
            )
        ],
        moreOptions: .init(
            title: "moreOptionTitle",
            accessibilityContext: "moreOptionTitle"
        )
    )
    
    lazy var carousel = dependencies
        .artemisComponents
        .toIconCarousel()
        .setDTO(
            dto
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .onMoreOptionsClick { index, _ in
            print("Carousel more options \(index) click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        carousel.update(
            dto: IconCarouselItemDTO(
                icon: .icon(
                    image: .icBag,
                    color: .accent
                ),
                title: "Updated"
            ),
            style: .highlightColor,
            at: 1
        )
    }
}
```

#### ifColorName

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let dto = IconCarouselDTO(
        itemDTOsAndStyles: [
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                     icon: .icon(
                        image: .icAddCard,
                         color: .accent
                    ),
                    title: "Adicionar Cartão"
                ),
                style: .highlightColor
            ),
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                    icon: .icon(
                        image: .icPix,
                        color: .accent
                    ),
                    title: "Pix"
                )
            ),
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                    icon: .icon(
                        image: .icExtract,
                        color: .accent
                    ),
                    title: "Extrato da conta"
                ),
                style: .defaultColor
            ),
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                    icon: .icon(
                        image: .icBarChart,
                        color: .accent
                    ),
                    title: "Boletos"
                )
            )
        ],
        moreOptions: .init(
            title: "moreOptionTitle",
            accessibilityContext: "moreOptionTitle"
        ),
        ifColorName: .ifNubank
    )
    
    lazy var carousel = dependencies
        .artemisComponents
        .toIconCarousel()
        .setDTO(
            dto
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .onMoreOptionsClick { index, _ in
            print("Carousel more options \(index) click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        carousel.update(
            dto: IconCarouselItemDTO(
                icon: .icon(
                    image: .icBag,
                    color: .accent
                ),
                title: "Updated"
            ),
            style: .highlightColor,
            at: 1
        )
    }
}
```

## Acessibilidade

a) Cada item (icon carousel item, merchant carousel item, persona carousel item e more options) do Merchant Carousel deve ser focado e anunciado pelo LT individualmente;
b) Cada item deve obedecer a semântica "Button" herdada do icon carousel item, merchant carousel item, persona carousel item e more options ou do "More Options".
c) O que deve ser lido:Individualmente cada um dos Merchants Carousel Itens e o "More options", respeitando a spec destes componentes.

Comportamento e interação:

a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques em cada item: ativa o CTA;
c) Um arrasto da esquerda para a direita: foca o próximo item do Shortcut carousel e o LT anuncia todo conteúdo textual (quando na última posição, foca o componente posterior ao Shortcut Carousel;
d) Um arrasto da direita para a esquerda: foca o item anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o componente anterior ao Shortcut Carousel.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: (
    loadable: (
        loadable: any LoadableInterface,
        module: any BaseModuleInterface
    ),
    component: any IconCarouselInterface
) = {
    let converter = ArtemisConverter()
    return converter.toLoadableIconCarousel()
}()

// cria o shimmer para o componente
func makeLoading() -> UIView {
    customView.loadable.loadable.startShimmer()
}

// para configuração de DTO, o processo é identico ao componente padrão
func make() -> UIView {
    let dto = IconCarouselDTO(
        itemDTOsAndStyles: [
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                     icon: .icon(
                        image: .icAddCard,
                         color: .accent
                    ),
                    title: "Adicionar Cartão"
                ),
                style: .highlightColor
            ),
            ItemDTOStyle(
                dto: IconCarouselItemDTO(
                    icon: .icon(
                        image: .icPix,
                        color: .accent
                    ),
                    title: "Pix"
                )
            ),
        ],
        moreOptions: .init(
            title: "moreOptionTitle",
            accessibilityContext: "moreOptionTitle"
        )
    )
    customView.component.setDTO(
        dto
    )

    // por padrão o shimmer vem no estado Start, é preciso pará-lo para
    // poder se ter o comportamento padrão de um persona carousel
    customView.loadable.loadable.stopShimmer()
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[ Sobre o elemento ] [ Sobre o Componente ] [ LocalCheckoutTitleDTO ] [ CheckoutAndContentText ] [ Exemplos ] [ Acessibilidade (in progress) ] [ Skeleton ]

# Sobre o Componente

<!-- image -->

O LocalCheckoutRecipient é um componente local para ser utilizado no ReviewTemplate

### LocalCheckoutRecipientDTO

| Atributo          | Tipo                          | Default   | Descrição        |
|-------------------|-------------------------------|-----------|------------------|
| supportTextReview | RecepientSupportTextReviewDTO |           | Item da listagem |
| hasDivider        | Bool                          |           | Item da listagem |
| identifierDTO     | IdentifierDTO?                | nil       | Item da listagem |

### RecepientSupportTextReviewDTO

| Atributo    | Tipo                   | Default   | Descrição                                   |
|-------------|------------------------|-----------|---------------------------------------------|
| firstLine   | SupportAndContentText  |           | Item da listagem                            |
| secondLine  | SupportAndContentText? | nil       | Item da listagem                            |
| thirdLine   | SupportAndContentText? | nil       | Item da listagem                            |
| forthLine   | SupportAndContentText? | nil       | Item da listagem                            |
| showDivider | Bool                   | false     | Mostrar ou não o divider ao fim da listagem |

## Exemplos

```
LocalCheckoutRecipientDTO(
  supportTextReview: .init(
          firstLine: .init(
            supportText: "first",
            supportTextColor: .contentDColor,
            contentText: nil
          ),
          secondLine: .init(
            supportText: "second", 
            supportTextColor: .alternateAColor,
            contentText: "second"
          ),
          thirdLine: .init(
            supportText: "third",
            supportTextColor: .alternateAColor,
            contentText: nil
          ),
          forthLine: .init(
              supportText: "forth",
              supportTextColor: .alternateAColor,
              contentText: nil
          ),
          showDivider: false
        ),
          hasDivider: true,
          identifierDTO: .init(style: .mediumNeutral, accessibilityValue: "button", icon: .icon(image: .icMoney))
```

## Acessibilidade (in progress)

## Skeleton

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - SolutionCardCarouselDTO
- Skeleton
- Exemplos
- Acessibilidade

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionAllEventProtocol
- OnMoreOptionsClickEventProtocol
- MarginToggle
- ScrollNotifiable

<!-- image -->

<!-- image -->

#### Guidelines

- Carrossel horizontal de SolutionCardItem paginado por padrão
- Grid de carrossel ajustado para 2 quando setSize(.small) para SolutionCardItem

### Funções / Modificadores

| Atributo                                                                   | Parametro                                  | Default   | Descrição                                                            |
|----------------------------------------------------------------------------|--------------------------------------------|-----------|----------------------------------------------------------------------|
| func setDTO(_ dto: SolutionCardCarouselDTO)                                | SolutionCardCarouselDTO                    | undefined | Define os dados configuraveis do componente. Veja a abaixo.          |
| func update(dto: SolutionCardDTO, style: SolutionCardStyle, at index: Int) | SolutionCardCarouselDTO, SolutionCardStyle | undefined | Definie o dado, estilo e index do item a ser modificado no carrossel |

### SolutionCardCarouselDTO

| Atributo                        | Tipo              | Default   | Descrição                                                                                                                                 |
|---------------------------------|-------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------|
| cardDTOs                        | [SolutionCardDTO] | undefined | Recebe um array de itens a serem exibidos no carrossel                                                                                    |
| cardSize                        | SolutionCardSize  | .large    | Recebe o tamanho dos cards a serem adicionados. Somente um tamanho de card por carrossel, invés de configurações individualmente por card |
| scrollAnimationEnabled          | Bool              | true      | Habilita/Desabilita animação de transição de estilos para o segundo elemento do carrossel. Não possui efeito quando size == .small        |
| moreOptionsAccessibilityContext | String?           | nil       | Contexto de acessibilidade para card de MoreOptions                                                                                       |
| childViewVisibilityRate         | CGFloat           | 1         | Percentual do item visível necessária para ativar disparo de métodos de tracking                                                          |

## Skeleton

<!-- image -->

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let card1 = SolutionCardDTO(
        titleText: "Título1",
        descriptionsTexts: [
            "Primeira descrição",
            "Segunda descrição",
            "Terceira descrição"
        ],
        buttonText: "Botão1",
        iconName: .icPlaceholder,
        animationDelay: 4.0
    )
    
    let card2 = SolutionCardDTO(
        titleText: "Título2",
        descriptionsTexts: [
            "Primeira descrição",
            "Segunda descrição",
            "Terceira descrição"
        ],
        buttonText: "Botão2",
        iconName: .icPlaceholder,
        animationDelay: 4.0
    )
                            
    let cardDTOs = [
        card1,
        card2
    ]
    let size: SolutionCardSize = .large
    let moreOptionsAccessibilityContext = "Ofertas e cashback"
    
    lazy var solutionCardCarousel = dependencies
        .artemisComponents
        .toSolutionCardCarousel()
        .setDTO(
            SolutionCardCarouselDTO(
                cardDTOs: cardDTOs,
                size: size,
                moreOptionsAccessibilityContext: moreOptionsAccessibilityContext
            )
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .onSecondaryClickChild { _ in
          print("Carousel index \(index) link arrow click")
        }
        .onChangeChild { index, _ in
            print("Carousel item \(index) changed")
        }
        .onMoreOptionsClick { index, _ in
            print("Carousel more options \(index) click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        solutionCardCarousel.update(
            dto: SolutionCardDTO(
                titleText: "Title1 Updated",
                descriptionsTexts: [
                    "Primeira descrição",
                    "Segunda descrição",
                    "Terceira descrição"
                ],
                buttonText: "Label1 Updated",
                iconName: .icPlaceholder,
                animationDelay: 4.0
            ),
            style: .highlightOn,
            at: 0
        )
    }
}
```

Skeleton

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonSolutionCardCarousel(accessibilityAnnouncement: "Carregando")
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(20)
            $0.top.bottom.equalToSuperview()
        }
        customView.startShimmer()
    }
```

## Acessibilidade

a) Cada card deve ser lido individualmente pelo LT;
b) Os itens do card devem ser agrupados para uma leitura única pelo LT;
c) O ícone deve ser decorativo;
d) Quando houver mais de um texto para o "description", ambos devem ser concatenados para a o anúncio do LT;
e) O que deve ser lido: Title + description + button flex + semântica button;Comportamento e interação
a) Um toque: foca cada card individualmente e o LT anuncia todo conteúdo textual;
b) Dois toques: aciona o CTA.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

Descreva brevemente a finalidade de uso do componente. Por exemplo:

Componente usado para representar um usuário. Pode ter as iniciais do nome ou foto do user, além disso, o componente também pode possuir um badge numerico ou ícone.

### Funções / Modificadores

| Atributo                                           | Parametro                                                                            | Default   | Descrição                                                   |
|----------------------------------------------------|--------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: AvatarDTO) -> Self              | AvatarDTO                                                                            | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: ElementActionStyle) -> Self | .smallNeutralDark .largeNeutralDark .smallNeutralBright .largeNeutralBright          | undefined | Define o estilo da imagem do componente.                    |
| func updateProfileImage(_ dto: ImageDTO) -> Self   | ImageDTO                                                                             | undefined | Define a atualização da imagem do avatar.                   |
| func enableOnClick(_ enabled: Bool) -> Self        | Bool                                                                                 | undefined | Define se o avatar é possui interação de clique             |
| func setBadge(_ badgeDTO: BadgeDTO) -> Self        | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3581607976/Badge+iOS#BadgeDTO | undefined | Define a exibição de badge do avatar.                       |
| func removeBadge() -> Self                         | N/A                                                                                  | undefined | Define remoção de badge do avatar.                          |

### AvatarDTO

| Atributo   | Tipo     | Default   | Descrição                                           |
|------------|----------|-----------|-----------------------------------------------------|
| initials   | String   | undefined | Define as iniciais do texto a ser usado como avatar |
| image      | ImageDTO | undefined | Define a imagem do avatar.                          |
| badge      | BadgeDTO | undefined | Define o badge do avatar.                           |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    let imageURL = "https://www.webpage.com/default_profile.png"
    
    lazy var avatarWithInitials = dependencies
            .artemisBaseComponents
            .toAvatar()
            .setDTO(
                .initials(
                        "PP",
                        badge: .notificationText(
                            content: 7,
                            accessibilityValue: "\(7) novas notificações"
                        )
                  )
            )

    lazy var avatarWithImage = dependencies
            .artemisBaseComponents
            .toElementAction()
            .setDTO(
                .image(
                        initials: "PP",
                        image: imageURL,
                        badge: .editIcon(
                            content: .icCamera,
                            accessibilityValue: "Clique para editar")
                    )
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- Avatar com imagem será narrado apenas com o texto “User” seguido do texto do badge.
- Avatar sem imagem será narrado as inicias do texto seguido do texto do badge.
- Quando o clique do avatar estiver ativo o traits  da acessibilidade será identificado como botão.
- Quando o clique do avatar estiver inativo o traits  da acessibilidade será identificado como imagem.

### Skeleton

<!-- image -->

### Exemplos

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonAvatar(
            style: style
        )
    }()

    private let style: AvatarStyle
    init(style: AvatarStyle) {
        self.style = style
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.remakeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
        }

        customView.startShimmer()
     }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - SectionTitleDTO
- Exemplos
- Acessibilidade

#### Guidelines

Section Title é um componente totalmente voltado para guardar as seções da interface. Diferente do Title, o Section Title tem a possibilidade de guardar ações que interferem somente na seção onde esta disposta.

- Section Title possui limite de uma linha.
- Description possui limite de até 3 linhas.
- Atributos do componente:
- Atributos do componente:
    - Style: Normal, Custom
    - Size: Large, Small

### Funções / Modificadores

| Atributo                                                                   | Parametro                                                                                                                                   | Default   | Descrição                                                |
|----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|-----------|----------------------------------------------------------|
| func setDTO(_ dto: SectionTitleDTO) -> Self                                | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/4079484976?draftShareId=e316410c-836e-49c7-955e-d56d3ea67fd2#SectionTitleDTO | undefined | Define dados configuráveis do componente. Veja a abaixo. |
| func setStyle(_ style: Style) -> Self                                      | Style                                                                                                                                       | undefined | Define o estilo do Section Title.                        |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self          | @escaping (DTOProtocol) -> Void                                                                                                             | undefined | Define a ação do primeiro botão.                         |
| func onSecondaryClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self | @escaping (DTOProtocol) -> Void                                                                                                             | undefined | Define a ação do segundo botão.                          |
| func onTertiaryClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self  | @escaping (DTOProtocol) -> Void                                                                                                             | undefined | Define a ação do terceiro botão.                         |

### SectionTitleDTO

| Atributo        | Tipo           | Default   | Descrição                                                             |
|-----------------|----------------|-----------|-----------------------------------------------------------------------|
| title           | String         | undefined | Define o texto de título.                                             |
| subTitle        | String?        | undefined | Define o texto de subtítulo (opcional).                               |
| firstButton     | IconButtonDTO? | undefined | Define dados configuráveis para o primeiro botão de ícone (opcional). |
| secondButton    | IconButtonDTO? | undefined | Define dados configuráveis para o segundo botão de ícone (opcional).  |
| thirdButton     | IconButtonDTO? | undefined | Define dados configuráveis para o terceiro botão de ícone (opcional). |
| hasBottomMargin | Bool           | undefined | Indica se há margem inferior (opcional).                              |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    let dto = SectionTitleDTO(
			title: "Large Inverse",
            subTitle: "Descrição large normal",
            firstButton: .init(image: .icAddCard, accessibilityValue: "Adicionar Cartão"),
            secondButton: .init(image: .icBank, accessibilityValue: "Banco"),
            thirdButton: .init(image: .icPix, accessibilityValue: "Pix")
        )
	)
	
    lazy var sectionTitle = dependencies
        .artemisComponents
        .toSectionTitle()
		.setDTO(
			dto
		)
		.onClick { _ in
            debugPrint("### onClick firstButton ###")
        }
        .onSecondaryClick { _ in
            debugPrint("### onSecondaryClick secondButton ###")
        }
        .onTertiaryClick { _ in
            debugPrint("### onTertiaryClick thirdButton ###")
        }
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Requisitos de conformidade WCAG
a) Quando possuir apenas title deve ter semântica "title";
b) Quando possuir title + ícone, o ícone deve ser ignorado e manter a semântica de "title";
c) Quando possuir title + description, devem receber o foco visível individualmente e o title deve ter semântica de "title";
d) Quando possuir múltiplos ícones com tap, as ações devem ser vinculadas ao "UIAccessibilityCustomAction".

Comportamento e interação:

*Apenas Title / title + ícone:*
Um toque: aplica o foco visível e o LT anuncia o conteúdo do Section Title + semântica;
Arrasto vertical: navega individualmente pelos Sections Titles ("rotor &gt; Headings")

*Title \_ Description:
Um toque: aplica o foco visível individualmente e o LT anuncia o conteúdo do Title e description, respectivamente.

*múltiplos ícones com tap:
Um toque: aplica o foco visível e o LT anuncia o conteúdo do Title + description;
Dois toques: dispara a ação do tap principal;
Arrasto vertical (Rotor &gt; Actions): navega pelas ações dos ícones;

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - ShareWalletItemDTO
- Exemplos
- Acessibilidade

<!-- image -->

<!-- image -->

ShareWalletItem preenchido completamente, com todos os campos sendo utilizados mas com informações sensíveis ocultas.

<!-- image -->

ShareWalletItem cenário de erro e cenário de emptystate padrão.

<!-- image -->

ShareWalletItem cenário de emptyState com animação Lottie.

### Funções / Modificadores

| Atributo                                                    | Parametro          | Default   | Descrição                                                                 |
|-------------------------------------------------------------|--------------------|-----------|---------------------------------------------------------------------------|
| func setStyle(_ style: ShareWalletItemStyle) -> Self        | .default  .inverse | .default  | Define o estilo do componente                                             |
| func setDefaultStyle(_ style: ShareWalletItemStyle) -> Self | .default  .inverse | .default  | Define o estilo padrão do item de compartilhamento de carteira            |
| func setDTO(_ dto: ShareWalletItemDTO) -> Self              | ShareWalletItemDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo.               |
| func hideSensitiveInfo(_ hide: Bool) -> Self                | Bool               | undefined | Altera a visualização dos valores sensíveis, para visível ou não visível. |

### ShareWalletItemDTO

| Atributo                 | Tipo                                  | Default   | Descrição                                                                                         |
|--------------------------|---------------------------------------|-----------|---------------------------------------------------------------------------------------------------|
| type                     | ShareWalletItemType.item.error.empty  | item      | Define qual o tipo de card será exibido                                                           |
| title                    | String?                               | undefined | Texto a ser apresentando pelo componente                                                          |
| subtitle                 | String?                               | undefined | Texto a ser apresentando pelo componente                                                          |
| description              | String?                               | undefined | Texto a ser apresentado pelo componente                                                           |
| image                    | AvatarDTO?                            | undefined | Imagem a ser apresentada pelo componente                                                          |
| isObfuscated             | Bool                                  | undefined | Regra de exibição de informações definidas como sensíveis                                         |
| titleErrorButton         | String?                               | undefined | Texto a ser apresentando pelo componente                                                          |
| titleEmptyStateAnimation | String?                               | undefined | Título para quando for o emptyStateAnimations                                                     |
| animationType            | ShareWalletAnimationType?.skate.beach | undefined | Tipo de animação que será exibida no emptyState animation do item de compartilhamento de carteira |

## Exemplos

#### Primary

```
import ArtemisComponents
import ArtemisComponentsInterface
import ArtemisCore
import ArtemisCoreInterface
import UIKit
final class ShareWalletItemFactory: MakeController {
    static func makeController() -> UIViewController {
        let controller = SampleController()
        controller.cellControllersLoad = {
            listShareWallet()
        }

        return controller
    }

    static func listShareWallet() -> [ShareWalletItemCell] {
        let defaultItem = ShareWalletItemCell.make(
            dto: .defaultItem(
                title: "PicPay Default",
                subtitle: "Saldo em conta",
                description: "R$ 1.000.000,00",
                image: .initials("PD"),
                isObfuscated: false
            )
        )
        defaultItem
            .customView
            .setStyle(.defaultNormal)

        let defaultItemTruncate = ShareWalletItemCell.make(
            dto: .defaultItem(
                title: "PicPay Default com truncate de texto para quebrar a linha",
                subtitle: "Saldo em conta com truncate de texto para quebrar a linha",
                description: "R$ 1.000.000,00",
                image: .initials("PD"),
                isObfuscated: false
            )
        )
        defaultItemTruncate
            .customView
            .setStyle(.defaultNormal)

        let highlightIem = ShareWalletItemCell.make(
            dto: .defaultItem(
                title: "PicPay Highlight",
                subtitle: "Saldo em conta",
                description: "R$ 1.000,00",
                image: .initials("PH"),
                isObfuscated: false
            )
        )
        highlightIem
            .customView
            .setStyle(.highlight)

        let highlightIemTruncate = ShareWalletItemCell.make(
            dto: .defaultItem(
                title: "PicPay Highlight com truncate de texto para quebrar a linha",
                subtitle: "Saldo em conta com truncate de texto para quebrar a linha",
                description: "R$ 1.000,00",
                image: .initials("PH"),
                isObfuscated: false
            )
        )
        highlightIemTruncate
            .customView
            .setStyle(.highlight)

        let defaultItemHidden = ShareWalletItemCell.make(
            dto: .defaultItem(
                title: "PicPay Default",
                subtitle: "Saldo em conta",
                description: "R$ 1.000.000,00",
                image: .initials("PD"),
                isObfuscated: true
            )
        )
        defaultItemHidden
            .customView
            .setStyle(.defaultNormal)

        let highlightIemHiden = ShareWalletItemCell.make(
            dto: .defaultItem(
                title: "PicPay Highlight",
                subtitle: "Saldo em conta",
                description: "R$ 1.000,00",
                image: .initials("PH"),
                isObfuscated: true
            )
        )
        highlightIemHiden
            .customView
            .setStyle(.highlight)

        let errorItem = ShareWalletItemCell.make(
            dto: .error(
                subtitle: "Não foi possível carregar suas informações",
                titleErrorButton: "Label"
            )
        )

        let errorItemNoButton = ShareWalletItemCell.make(
            dto: .error(
                subtitle: "Não foi possível carregar suas informações"
            )
        )

        let emptyItem = ShareWalletItemCell.make(
            dto: .empty()
        )

        let emptyStateAnimationSkate = ShareWalletItemCell.make(
            dto: .emptyAnimation(
                description: "A conta que cresce\nno pique dos seus\nfilhos.",
                titleButton: "Criar conta",
                animationType: .skate
            )
        )

        let emptyStateAnimationBeach = ShareWalletItemCell.make(
            dto: .emptyAnimation(
                description: "A conta que cresce\nno pique dos seus\nfilhos.",
                titleButton: "Criar conta",
                animationType: .beach
            )
        )

        return [
            defaultItem,
            defaultItemTruncate,
            highlightIem,
            highlightIemTruncate,
            defaultItemHidden,
            highlightIemHiden,
            errorItem,
            errorItemNoButton,
            emptyItem,
            emptyStateAnimationSkate,
            emptyStateAnimationBeach
        ]
    }
}

final class ShareWalletItemCell: UITableViewCell {
    lazy var customView: any ShareWalletItemInterface = {
        let converter = ArtemisConverter()
        return converter.toShareWalletItem(initialConfiguration: .config(self))
    }()

    private let dto: ShareWalletItemDTO
    init(dto: ShareWalletItemDTO) {
        self.dto = dto
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }

        customView
            .setDTO(dto)
    }

    static func make(dto: ShareWalletItemDTO) -> ShareWalletItemCell {
        return ShareWalletItemCell(dto: dto)
    }
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Todos os itens do Share Wallet Item devem ser agrupados para o foco visível e anúncio do LT;
    - O avatar deve ser tratado como decorativo;
    - O que deve ser lido:Title + description + semântica: "Button".
- Comportamento e interação:
- Comportamento e interação:
    - Um toque: aplica o foco visível no share Wallet Item e o LT anuncia seu respectivo conteúdo;
    - Dois toques: Ativa o CTA

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - ChipsStackedDTO
    - ChipsStackedDTOAndStyle
- Exemplos

O componente ChipsStacked agrupa os ChipItem em uma lista até o limite da largura da tela, quebrando a linha e alinhando os restante dos itens verticalmente.  É possível configurar para seleção única ou seleção múltipla dos itens, com um limite de 12 elementos no total.

Caso seja passado um número maior que o limite de 12, serão exibidos somente os 12 primeiros elementos

<!-- image -->

### Funções / Modificadores

| Método                                                                      | Parametro       | Descrição                                                                                                                    |
|-----------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ChipsStackedDTO) -> Self                                 | ChipsStackedDTO | Define os dados do componente.                                                                                               |
| func onClickChild(_ callback: @escaping (Int, DTOProtocol) -> Void) -> Self |                 | Método de injeção de callback para ação de toque no item da lista, retorna o index do item selecionado e seu respectivo DTO. |

### ChipsStackedDTO

| Atributo          | Tipo                      | Obrigatório   | Descrição                                                                                 |
|-------------------|---------------------------|---------------|-------------------------------------------------------------------------------------------|
| isSingleSelection | Bool                      | Sim           | Indica se a seleção é única. Ao selecionar o próximo item, o anterior é desmarcado.       |
| isLabelOnly       | Bool                      | Sim           | Indica se será exibido somente as labels, ignorando ícones e imagens para todos os itens. |
| itemsDtoAndStyles | [ChipsStackedDTOAndStyle] | Sim           | Coleção de itens de e seus respectivos estilos .                                          |

### ChipsStackedDTOAndStyle

| Atributo   | Tipo          | Obrigatório   | Descrição                    |
|------------|---------------|---------------|------------------------------|
| itemDto    | ChipItemDTO   | Sim           | DTO para ChipItemDTO.        |
| itemStyle  | ChipItemStyle | Sim           | Estilo do item ChipItemStyle |

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let items: [ChipsStackedDTOAndStyle] = [.init(itemDto: .init(id: 0, isSelected: false, text: "Adição de dinheiro", hasClose: true), itemStyle: .normal),
                                            .init(itemDto: .init(id: 0, isSelected: false, text: "Compras PicPay Shop", hasClose: true, icon: .icBag), itemStyle: .normal)]
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        
        let dto = ChipsStackedDTO(isSingleSelection: true, isLabelOnly: true, itemsDtoAndStyles: items)
        let chipsStaked = dependencies.toChipsStacked(initialConfiguration: .config(self))
              .setDTO(dto)
              .onClickChild { index, dto in
                  print(">>>> on Click Child [\(index)] \(dto)")
              }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

#### Variações:

Descreva brevemente a finalidade de uso do componente. Por exemplo:

O componente TagArgumentative é usado para itens que precisam ser rotulados, categorizados ou organizados usando palavras-chaves que os descrevem e sempre que o texto for igual ou maior que 13 caracteres. Quando o valor for inferior a 13, utilizar o componente Tag / iOS .

#### Guidelines

Descreva as diretrizes/regras do componente.. Por exemplo:

- São etiquetas curtas com objetivo de destacar e diferenciar elementos de uma lista.
- A interação possui 2 textos iguais que passam da direita para esquerda dentro do componente, e ficam em looping.
- Não devem ultrapassar 22 caracteres.
- Usar apenas textos em caixa alta.

### Funções / Modificadores

| Atributo                                              | Parametro                              | Default   | Descrição                                                   |
|-------------------------------------------------------|----------------------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: TagArgumentativeDTO)               | TagArgumentativeDTO                    | undefined | Define os dados configuráveis do componente. Veja a abaixo. |
| func setStyle(_ style: TagArgumentativeStyle) -> Self | .normal.neutralDark.neutralBright.shop | .normal   | Define um estilo do componente.                             |

### TagArgumentativeDTO

| Atributo   | Tipo   | Default   | Descrição             |
|------------|--------|-----------|-----------------------|
| title      | string | undefined | Valor do texto da tag |

### TagArgumentativeStyle

| Atributo        | Tipo    | Default   | Descrição                                        |
|-----------------|---------|-----------|--------------------------------------------------|
| backgroundColor | UIColor | undefined | cor do background da tag para o style informado. |
| foregroundColor | UIColor | undefined | cor do texto da tag para o style informado.      |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface
final class CustomView: UIView {
    let dependencies: Dependencies
    lazy var tag = dependencies
        .artemisComponents
        .toTagArgumentative()
        .setDTO(.init(title: "Title"))
        .setStyle(.neutralDark)
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

a) herdará do componente 'pai' a semântica, o estado, as formas de interação e comportamentos;
b) A informação apresentada pela Tag deve ser um complemento ao rótulo do componente 'pai';
c) O que deve ser lido:

- Conteúdo textual do item 'pai' \_+ Texto da Tag Argumentative + semântica herdada do item 'pai' (se houver);

Comportamento e Interação:
a) 1 toque: habilita o foco visível em torno da Tag Argumentative incluindo o componente 'pai' (se houver).
b) 2 toques: executa a ação (se houver).
c) Ao receber foco: o LT deve anunciar o conteúdo do componente 'pai' (se houver) e da Tag Argumentative na sequência.

O TagArgumentative deve ser utilizado somente por outros componentes do Apollo.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - BannerAdCarouselDTO
- Exemplos
- Acessibilidade
- Skeleton
- Exemplos

<!-- image -->

Implementa os seguintes protocolos

- ComponentProtocol
- CollectionEventProtocol
- OnSecondaryClickChildEventProtocol
- ScrollNotifiable
- MarginToggle

#### Guidelines

- Carrossel horizontal de BannerAdItem paginado por padrão

### Funções / Modificadores

| Atributo                                                                   | Parametro                               | Default   | Descrição                                                            |
|----------------------------------------------------------------------------|-----------------------------------------|-----------|----------------------------------------------------------------------|
| func setDTO(_ dto: BannerAdCarouselDTO)                                    | BannerAdCarouselDTO                     | undefined | Define os dados configuraveis do componente. Veja a abaixo.          |
| func update(dto: BannerAdItemDTO, style: BannerAdItemStyle, at index: Int) | BannerAdItemDTO, BannerAdItemStyle, Int | undefined | Definie o dado, estilo e index do item a ser modificado no carrossel |

### BannerAdCarouselDTO

| Atributo                | Tipo                | Default   | Descrição                                                                           |
|-------------------------|---------------------|-----------|-------------------------------------------------------------------------------------|
| items                   | [BannerAdItemDTO]   | undefined | Recebe um array de itens a serem exibidos no carrossel                              |
| styles                  | [BannerAdItemStyle] | undefined | Recebe um array de estilos a serem aplicados sequencialmente aos itens do carrossel |
| childViewVisibilityRate | CGFloat             | 1         | Percentual do item visível necessária para ativar disparo de métodos de tracking    |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let items: [BannerAdItemDTO] = [
        .init(
            title: "PicPay Parcela",
            imageDTO: ImageDTO.icon(image: .illuSample),
            backgroundColor: "#3CB799",
            linkArrowDTO: LinkArrowDTO(title: "Saiba mais"),
            description: "Faça transações em até 6x sem usar cartão."
        ),
        .init(
            title: "Pegue empréstimo usando seu carro como garantia.",
            imageDTO: ImageDTO.icon(image: .illuSample),
            backgroundColor: "#D2EE97",
            linkArrowDTO: LinkArrowDTO(title: "Saiba mais")
        )
    ]
    let styles: [BannerAdItemStyle] = [.inverse, .normal]
    
    lazy var bannerAdCarousel = dependencies
        .artemisComponents
        .toBannerAdCarousel()
        .setDTO(
            BannerAdCarouselDTO(
                items: items,
                styles: styles
            )
        )
        .onLoad { _ in
            print("Banner loaded")
        }
        .onAppear{ _ in
            print("Banner appeared")
        }
        .onAppearChild { index, _ in
            print("Banner ad item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Banner ad index \(index) primary click")
        }
        .onSecondaryClickChild { _ in
          print("Banner ad index \(index) link arrow click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        bannerAdCarousel.update(
            dto: BannerAdItemDTO(
                title: "Titulo do banner",
                imageDTO: ImageDTO.icon(image: .illuSample),
                backgroundColor: "#F2F2F0",
                linkArrowDTO: LinkArrowDTO(title: "Link"),
                description: "Descrição do banner"
            ),
            style: .normal,
            at: 1
        )
    }
}
```

## Acessibilidade

a) Cada Banner Ad deve ser lido individualmente pelo LT;
b) Todos os itens do Banner Ad devem ser agrupados para o foco visível e anúncio do LT;
c) A ilustração deve ser tratada como decorativa;
d) A semântica de cada banner Ad deve ser "Button";
e) O que deve ser lido:Text + semântica: "Button".

Comportamento e interação:
a) Um toque: aplica o foco visível no Banner Ad e o LT anuncia seu respectivo conteúdo;
b) Dois toques: Ativa o CTA.
c) Um arrasto da esquerda para a direita: foca o próximo Banner Ad e o LT anuncia todo conteúdo textual (quando na última posição, foca o próximo componente da tela);
d) Um arrasto da direita para a esquerda: foca o Banner Ad anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o componente que antecede o Banner Ad Carousel.

## Skeleton

<!-- image -->

#### Guidelines

- Implementa metodos dos seguintes protocol:
- Implementa metodos dos seguintes protocol:
    - MarginToggle
    - SkeletonEventProtocol
    - CarouselInterface

## Exemplos

#### Primary

```
import ArtemisComponents
import ArtemisComponentsInterface
import ArtemisCore
import ArtemisCoreInterface

lazy var customView: any CarouselSkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonBannerAdCarousel(accessibilityAnnouncement: "Carregando")
    }()

    private let topEnabled: Bool
    private let bottomEnabled: Bool
    init(
        topEnabled: Bool,
        bottomEnabled: Bool
    ) {
        self.topEnabled = topEnabled
        self.bottomEnabled = bottomEnabled
        super.init(
            style: .default,
            reuseIdentifier: "custom"
        )
        buildLayout()
    }

    required init?(
        coder: NSCoder
    ) {
        nil
    }

    func buildLayout() {
        backgroundColor = .gray
        contentView.addSubview(
            customView
        )
        customView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
        }

        customView.backgroundColor = .white

        customView
            .enableTopMargin(
                topEnabled
            )
            .enableBottomMargin(
                bottomEnabled
            )
            .stopShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

### Guidelines

- Componente Base utilizado exclusivamente para criação de listas.
- A largura do componente deve preencher o componente pai.
- A altura é variável conforme o conteúdo.
- Cada variante possui diferentes limites de quantidade de linhas.

### Funções / Modificadores

| Atributo                                     | Parametro            | Default   | Descrição                                                   |
|----------------------------------------------|----------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ListContentAreaDTO)       | ListContentAreaDTO   | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setStyle(_ style: ListContentAreaStyle) | ListContentAreaStyle | .normal   | Define o estilo do componente .normal, .inverse ou .custom  |
| func hideSensitiveInfo( _ hide: Bool )       | Bool                 | undefined | Método para ocultar ou exibir informações sensíveis         |
| func disableAccessibilityElement()           |                      |           | Método para desabilitar o elemento de acessibilidade        |

### IdentifierDTO

| Atributo          | Tipo                       | Default   | Descrição                                                            |
|-------------------|----------------------------|-----------|----------------------------------------------------------------------|
| title             | String                     |           | Título do conteúdo                                                   |
| type              | ListContentAreaContentType |           | Tipo do conteúdo                                                     |
| numberOfLines     | Int                        |           | Número de linhas do conteúdo                                         |
| isSensible        | Bool                       | false     | Indica se o conteúdo é sensível                                      |
| accessibilityText | String                     | nil       | Texto acessível customizado, se nulo, utiliza o mesmo valor do title |

### Construtores do ListContentAreaDTO

| Atributo                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Tipo de célula                         | Exemplo   |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|-----------|
| public init(         label: String,         labelIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Label                                  |           |
| public init(         label: String,         labelIsSensible: Bool = false,         bigLabel: String,         bigLabelIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                                                                                       | Label + Big Label                      |           |
| public init(         label: String,         labelIsSensible: Bool = false,         bigLabel: String,         bigLabelIsSensible: Bool = false,         plus: String,         plusIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                           | Label + Big Label + Plus               |           |
| public init(         label: String,         labelIsSensible: Bool = false,         plus: String,         plusIsSensible: Bool = false,         plusTruncateType: PlusTruncateType = .truncate3Lines     )                                                                                                                                                                                                                                                                                                                                                                 | Label + Plus                           |           |
| public init(         bigLabel: String,         bigLabelIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Big Label                              |           |
| public init(         bigLabel: String,         bigLabelIsSensible: Bool = false,         plus: String,         plusIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                                                                                         | Big Label + Plus                       |           |
| public init(         plus: String,         plusIsSensible: Bool = false,         label: String,         labelIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                                                                                               | Plus + Label                           |           |
| public init(         plus: String,         plusIsSensible: Bool = false,         bigLabel: String,         bigLabelIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                                                                                         | Plus + Big Label                       |           |
| public init(         plus: String,         plusIsSensible: Bool = false,         label: String,         labelIsSensible: Bool = false,         secondPlus: String,         secondPlusIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                       | Plus + Label + Plus                    |           |
| public init(         bigLabel: String,         bigLabelIsSensible: Bool = false,         label: String,         labelIsSensible: Bool = false,         plus: String,         plusIsSensible: Bool = false     )                                                                                                                                                                                                                                                                                                                                                           | Big Label + Label + Plus               |           |
| public init(         firstLabel: String,         firstLabelType: ListContentAreaContentType,         firstLabelNumberOfLines: Int = 0,         secondLabel: String? = nil,         secondLabelType: ListContentAreaContentType? = nil,         secondLabelNumberOfLines: Int = 0,         thirdLabel: String? = nil,         thirdLabelType: ListContentAreaContentType? = nil,         thirdLabelNumberOfLines: Int = 0,         fourthLabel: String? = nil,         fourthLabelType: ListContentAreaContentType? = nil,         fourthLabelNumberOfLines: Int = 0     ) | Plus + Label + Big Label + Large Label |           |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    lazy var listContentAreaWithLabel = dependencies
            .artemisBaseComponents
            .tolistContentArea()
            .setDTO(
                  label:"area de conteúdo de lista com label simples"
                )
            )
            
    lazy var listContentAreaWithLabelAndBiglabel = dependencies
            .artemisBaseComponents
            .tolistContentArea()
            .setDTO(
                   bigLabel: "area de conteúdo de lista com label grande.",
                   label: "area de conteúdo de lista com label simples"
                )
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- O que deve ser lido pelo Voice Over :
- O que deve ser lido pelo Voice Over:
    - Todo o conteúdo de texto.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonListContentArea(
            skeletonListContentAreaType: .two
        )
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - FABDTO
- Exemplos
- Acessibilidade
- Skeleton
    - Exemplos

<!-- image -->

<!-- image -->

#### Guidelines

- O componente floating action button (FAB) executa a ação principal ou mais comum em uma tela. Ele aparece na frente de todo o conteúdo da tela, normalmente como uma forma circular com um ícone no centro ou um texto seguido um ícone.

### Funções / Modificadores

| Atributo                         | Parametro            | Default   | Descrição                                    |
|----------------------------------|----------------------|-----------|----------------------------------------------|
| func changeSize(_ size: FABSize) | .expanded .collapsed | undefined | Define o tamanho do componente               |
| func setDTO(_ dto: FABDTO)       | FABDTO               | undefined | Define os dados configuráveis do componente. |

### FABDTO

| Atributo    | Tipo      | Default   | Descrição                         |
|-------------|-----------|-----------|-----------------------------------|
| icon        | ImageName | undefined | Ícone do componente               |
| titleString | String    | undefined | Texto a ser exibido do componente |
| size        | FABSize   | undefined | Tamanho do componente             |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var buttonFAB = dependencies
        .artemisComponents
        .toFAB()
        .setDTO(
            .init(
              icon: ImageName.icAddCard,
			  titleString: "FAB",
			  size: .expanded
            )
          )
        .setStyle(.primary)
        .setDelegate(self)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

O que sera transcrito pelo Voice Over:

- Rótulo do Fab Button + semântica: button

```
private extension FABView {
	func fillAccessibility(
		with dto: DTO
	) {
        accessibilityValue = dto.accessibilityValue
    }
}

extension FABDTO {
    var accessibilityValue: String {
        titleString
    }
}
```

## Skeleton

<!-- image -->

### Exemplos

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonFAB(
            width: width
        )
    }()

    private let width: CGFloat
    init(
        width: CGFloat
    ) {
        self.width = width
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(16)
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - CreditCardCarouselDTO
    - CreditCardDTOsAndStyles
- Exemplos
- Acessibilidade

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionEventProtocol
- OnSecondaryClickChildEventProtocol
- OnChangeChildEventProtocol
- MarginToggle

<!-- image -->

<!-- image -->

#### Guidelines

- Carrossel horizontal de CreditCardItem paginado por padrão

### Funções / Modificadores

| Atributo                                        | Parametro                                                                                                                                         | Default   | Descrição                                                          |
|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|-----------|--------------------------------------------------------------------|
| func setDTO(_ dto: CreditCardCarouselDTO)       | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3775201336?draftShareId=e88aa1b7-4fb5-49a4-83d0-2d8d9f710964#CreditCardCarouselDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo.        |
| func hideAllSensitiveInfo(_ hide: Bool) -> Self | Bool                                                                                                                                              | undefined | Toggle para esconder/exibir valores sensíveis do item de carrossel |

### CreditCardCarouselDTO

| Atributo               | Tipo                                                                                                                                                | Default   | Descrição                                                                                 |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------------|
| dtoAndStyles           | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3775201336?draftShareId=e88aa1b7-4fb5-49a4-83d0-2d8d9f710964#CreditCardDTOsAndStyles | undefined | Recebe um array de itens e estilos a serem exibidos no carrossel                          |
| scrollAnimationEnabled | Bool                                                                                                                                                | undefined | Habilita/Desabilita animação de transição de estilos para o segundo elemento do carrossel |

### CreditCardDTOsAndStyles

| Atributo   | Tipo                | Default   | Descrição                          |
|------------|---------------------|-----------|------------------------------------|
| dto        | CreditCardItemDTO   | undefined | Recebe um DTO de CreditCardItem    |
| style      | CreditCardItemStyle | undefined | Recebe um estilo de CreditCardItem |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let header = CreditCardHeaderItemDTO(
        leftUrl: "https://picpay.s3.sa-east-1.amazonaws.com/openbanking/picpay-logo-icon-pf.svg",
		leftPlaceholderIcon: nil,
		rightUrl: "https://qa-wallet-integration.ppay.me/ds-svgs-test/brand/large/default/master.svg",
		rightPlaceholderIcon: nil,
		rightIconAccessibility: "master card",
		titlePrefix: "PicPay",
		titleSuffix: "1234"
	)
	let body = CreditCardItemBodyDTO(
		title: "Limite Disponível",
		subtitle: "R$ 800,00",
		tag: "PRINCIPAL"
	)
	let dto = CreditCardItemDTO(
		type: .data(
			CreditCardItemDataDTO(
				header: header,
				body: body
			)
		)
	)
	let picpayDTO = CreditCardCarouselDTO.CreditCardDTOsAndStyles(
		dto: dto,
		style: .picpay
	)
                            
    let cardDTOs = [
        picpayDTO
    ]
    
    lazy var carousel = dependencies
        .artemisComponents
        .toCreditCardCarousel()
        .setDTO(
            CreditCardCarouselDTO(
				dtoAndStyles: cardDTOs,
				scrollAnimationEnabled: false
			)
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .onSecondaryClickChild { _ in
          print("Carousel index \(index) link arrow click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

a) Cada Credit Card Item deve ser lido individualmente pelo LT;
b) Todos os itens do Credit Card Item devem ser agrupados para o foco visível e anúncio do LT;
c) O avatar deve ser tratado como decorativo;
d) O que deve ser lido:Title + Description + semântica: "Button".

Comportamento e interação:
a) Um toque: aplica o foco visível no Credit Card Item e o LT anuncia seu respectivo conteúdo;
b) Dois toques: Ativa o CTA.
c) Um arrasto da esquerda para a direita: foca o próximo Credit Card Item e o LT anuncia todo conteúdo textual (quando na última posição, foca o próximo componente da tela);
d) Um arrasto da direita para a esquerda: foca o Credit Card Item anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o componente que antecede o Credit Card Carousel.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

ChipsCarousel agrupa os ChipItem em uma lista horizontalmente, tal lista pode ter a opção de seleção única dos items ou seleção múltipla dos items.

### Funções / Modificadores

| Atributo                                                                   | Parametro                     | Default   | Descrição                                                                                                                 |
|----------------------------------------------------------------------------|-------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ChipsCarouselDTO) -> Self                               | ChipsCarouselDTO              | undefined | Define os dados configuraveis do componente.                                                                              |
| func update(dtoAndStyle: ChipsCarouselDTOAndStyle,at index: Int) -> Self   | ChipsCarouselDTOAndStyle, Int | undefined | Atualiza um item da lista a partir do índice.                                                                             |
| func selectChip(at index: Int, shouldScroll: Bool, animated: Bool) -> Self | Int, Bool, Bool               | undefined | Seleciona uma chip programaticamente a partir do índice, podendo scrollar até a chip selecionada de forma animada ou não. |

### ChipsCarouselDTO

| Atributo                | Tipo                                | Default   | Descrição                                                     |
|-------------------------|-------------------------------------|-----------|---------------------------------------------------------------|
| isSingleSelection       | Bool                                | undefined | Define se irá possuir uma única seleção                       |
| isSelectionRequired     | Bool                                | undefined | Define se a seleção é requerida                               |
| itemsDtoAndStyles       | [ChipsCarouselDTOAndStyle]          | undefined | Define a lista de ChipItem com style                          |
| backgroundColor         | String                              | nil       | Define se a cor de fundo                                      |
| addMoreButton           | ChipsCarouselMoreOptionsDTOAndStyle | nil       | Define se possuirá IconButton com style ou ChipItem com style |
| childViewVisibilityRate | CGFloat                             | 1.0       |                                                               |
| shouldSelect            | Bool                                | true      | Define se a seleção é possível                                |

### Inicializadores ChipsCarouselDTO

Para manter retrocompatibilidade após a atualização(02 Jul 2024), o ChipsCarouselDTOpossui dois inicializadores que diferem apenas nos atributos addMoreIconOrChipButton e addMoreButton .

| Inicializador                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Descrição                                                                                     |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| public init(         isSingleSelection: Bool,         isSelectionRequired: Bool,         itemsDtoAndStyles: [ChipsCarouselDTOAndStyle],         backgroundColor: String? = nil,         addMoreIconOrChipButton: ChipsCarouselMoreOptionsDTOAndStyle? = nil,         childViewVisibilityRate: CGFloat = 1.0,         shouldSelect: Bool = true     ) {         self.isSingleSelection = isSingleSelection         self.isSelectionRequired = isSelectionRequired         self.itemsDtoAndStyles = itemsDtoAndStyles         self.backgroundColor = backgroundColor         self.addMoreButton = addMoreIconOrChipButton         self.childViewVisibilityRate = childViewVisibilityRate         self.shouldSelect = shouldSelect     }               | Recebe o addMoreIconOrChipButton como um atributo do tipo ChipsCarouselMoreOptionsDTOAndStyle |
| public init(         isSingleSelection: Bool,         isSelectionRequired: Bool,         itemsDtoAndStyles: [ChipsCarouselDTOAndStyle],         backgroundColor: String? = nil,         addMoreButton: IconButtonDTOAndStyle? = nil,         childViewVisibilityRate: CGFloat = 1.0,         shouldSelect: Bool = true     ) {         self.isSingleSelection = isSingleSelection         self.isSelectionRequired = isSelectionRequired         self.itemsDtoAndStyles = itemsDtoAndStyles         self.backgroundColor = backgroundColor         self.addMoreButton = ChipsCarouselMoreOptionsDTOAndStyle.iconButton(addMoreButton)         self.childViewVisibilityRate = childViewVisibilityRate         self.shouldSelect = shouldSelect     } | Recebe o addMoreButton como um atributo do tipo IconButtonDTOAndStyle                         |

### Exemplos

#### Primary

Utilização do inicializador com addMoreButton do tipo IconButtonDTOAndStyle

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var chipsCarousel = dependencies
            .artemisBaseComponents
            .toChipsCarousel()
            .setDTO(
                .init(
                      isSingleSelection: true,
                      isSelectionRequired: true,
                      itemsDtoAndStyles: getList(hasFirsSelected: true, hasClose: false, hasIdentifier: true, style: .normal),
                      backgroundColor: "backgroundBrandA",
                      addMoreButton: IconButtonDTOAndStyle(
                          buttonDTO: IconButtonDTO(
                              image: .icPlus,
                              accessibilityValue: "Adicionar Mais - Teste"
                          ),
                          buttonStyle: .neutral
                      )
                  )
            )
            .setStyle(
                style: .normal
            )

     func getList(hasFirsSelected: Bool, hasClose: Bool, hasIdentifier: Bool, style: ChipItemStyle) -> [ChipsCarouselDTOAndStyle] {
        var list: [ChipsCarouselDTOAndStyle] = (0..<20).map { id in
            if hasIdentifier {
                return ChipsCarouselDTOAndStyle(
                    itemDto: ChipItemDTO(id: Int64(id), isSelected: false, text: "Label", hasClose: hasClose, icon: .icPlaceholder),
                    itemStyle: style
                )
            } else {
                return ChipsCarouselDTOAndStyle(
                    itemDto: ChipItemDTO(id: Int64(id), isSelected: false, text: "Label", hasClose: hasClose),
                    itemStyle: style
                )
            }
        }

        if hasFirsSelected {
            selectFirstElement(from: &list)
            return list
        }
        return list
    }
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

#### Secondary

Utilização do inicializador com addMoreIconOrChipButton do tipo IconButtonOrChipItemDTOAndStyle

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var chipsCarousel = dependencies
            .artemisBaseComponents
            .toChipsCarousel()
            .setDTO(
                .init(
                      isSingleSelection: true,
                      isSelectionRequired: true,
                      itemsDtoAndStyles: getList(hasFirsSelected: true, hasClose: false, hasIdentifier: true, style: .normal),
                      backgroundColor: "backgroundBrandA",
                      addMoreIconOrChipButton: .chipItem(ChipItemDTOAndStyle(
                            chipDTO: ChipItemDTO(
                                id: 0,
                                isSelected: false,
                                text: "Adicionar mais",
                                hasClose: false,
                                icon: .icPlus
                            ),
                            chipStyle: .normal
                        ))

                  )
            )
            .setStyle(
                style: .normal
            )

     func getList(hasFirsSelected: Bool, hasClose: Bool, hasIdentifier: Bool, style: ChipItemStyle) -> [ChipsCarouselDTOAndStyle] {
        var list: [ChipsCarouselDTOAndStyle] = (0..<20).map { id in
            if hasIdentifier {
                return ChipsCarouselDTOAndStyle(
                    itemDto: ChipItemDTO(id: Int64(id), isSelected: false, text: "Label", hasClose: hasClose, icon: .icPlaceholder),
                    itemStyle: style
                )
            } else {
                return ChipsCarouselDTOAndStyle(
                    itemDto: ChipItemDTO(id: Int64(id), isSelected: false, text: "Label", hasClose: hasClose),
                    itemStyle: style
                )
            }
        }

        if hasFirsSelected {
            selectFirstElement(from: &list)
            return list
        }
        return list
    }
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- O que sera transcrito pelo Voice Over:
- O que sera transcrito pelo Voice Over:
    - Herdará do componente base.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonlCarouselInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonChipsCarousel()
    }()
    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

Os componentes do tipo Hint se trata de uma Stack de componentes contendo um ícone de apoio visual, textos de título e descrição bem como um botão para ação.

### Guidelines

Descreva as diretrizes/regras do componente.. Por exemplo:

- Título possui tamanho máximo de 2 linhas;
- Descrição possui tamanho máximo de 3 linhas;
- Título, descrição e botão são todos opcionais, porém é obrigatório ter pelo menos um dos 3 elementos sempre presente.
- Implementa os protocolos de interação https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3371335684/Events#BaseEventsProtocol

### HintDTO

| Atributo    | Tipo           | Default   | Descrição                                            |
|-------------|----------------|-----------|------------------------------------------------------|
| imageDTO    | ImageDTO       | undefined | Data Transfer Object para o ImageDTO                 |
| title       | String?        | nil       | Título da dica (opcional)                            |
| description | String?        | nil       | Descrição da dica (opcional)                         |
| buttonDTO   | ButtonFlexDTO? | nil       | Data Transfer Object para o ButtonFlexDTO (opcional) |

### Funções / Modificadores

| Função                                                 | Descrição                                                                                                        |
|--------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| @discardableResult func setDTO(_ dto: HintDTO) -> Self | Método de injeção de conteúdo através de um Data Transfer Object próprio. Retornando a própria instância de Hint |

### Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var component = dependencies
        .artemisComponents
        .toHint()
        .setDTO(
            HintDTO(
                imageDTO: .init(...),
                title: "Título",
                ...
            )
        )
        .onLoad { [weak self] dto in
            ...
        }
        .onAppear { [weak self] dto in
            ...
        }
        .onClick { [weak self] _ in
            ...
        }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

a) O icon placeholder, o title e o description devem ser agrupados para o foco vísível e anuncio do LT;
b) O Icon Placeholder deve ser decorativo;
d) O button flex deve ser lido no próximo swipe.
e) O button flex precisa ter o title como rótulo complementar.
f) a semântica deve ser button (em Android e iOS) O que deve ser lido:
Title + Description + semântica;
saiba mais + title + semântica.
Comportamento e Interação
a) Um toque: habilita o foco visível em torno do hint e seu respectivo ícone.
b) Dois toques: Habilita a edição.
c) Ao receber foco: O LT deve anunciar: placeholder + semântica.
d) Swipe à direita: foca o button flex e anuncia seu rótulo + Title.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonHint(
            hasBottomSpacing: false,
            accessibilityAnnouncement: "Skeleton Hint"
        )
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

   required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Componente interno de exibição de textos com fontes customizadas
- É possível fazer múltiplas configurações de estilos tanto via métodos com NSRange quanto via injeção de texto em formato markdown/html. Para mais informações confira a explicação completa dos métodos

Algumas configurações podem sobrescrever outras dependendo da ordem de aplicação de métodos. e.g.:

- Adicionar uma cor via html para parte do texto, mas depois aplicar foreground(:UIColor) sem um range apropriado irá sobrescrever a primeira cor com a segunda
- Estilos de texto com propriedades decorative adicionam attributes ao texto que no momento não são removidas ao sobrescrever texto com outra fonte. Mesma situação de estilos com propriedades de case, que alteram a string interna do texto. Para lista completa de estilos confira a documentação

## Funções / Modificadores

| Atributo                                                                                                        | Parametro                                                                                                                                                                                                                   | Default                              | Descrição                                                                                                     |
|-----------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------|---------------------------------------------------------------------------------------------------------------|
| var title: String                                                                                               | undefined                                                                                                                                                                                                                   | undefined                            | Variável para acesso ao título atribuído ao componente                                                        |
| var plainTitle: String                                                                                          | undefined                                                                                                                                                                                                                   | undefined                            | Variável para acesso ao texto da attributed string do componente                                              |
| @discardableResult func title(_ text: String) -> Self                                                           | Texto para ser configurado                                                                                                                                                                                                  | undefined                            | Configura texto do componente                                                                                 |
| @discardableResult func markdown(_ text: String) -> Self                                                        | Texto para ser configurado                                                                                                                                                                                                  | undefined                            | Configura o texto do componente baseado em padrões de marcação estilo Markdown                                |
| @discardableResult func html(_ text: String) -> Self                                                            | Texto para ser configurado                                                                                                                                                                                                  | undefined                            | Configura o texto do componente baseado em padrões de marcação estilo HTML                                    |
| @discardableResult func font(font: FontStyleProtocol, range: NSRange?, maximumAccessibleFont: CGFloat?) -> Self | FontStyleName / iOS range: parte do texto a ser configurado, aplicado ao texto todo caso nulomaximumAccessibleFont: tamanho máximo de fonte caso usuário utilize fonte aumentada por acessibilidade, não limitado caso nulo | undefinednilnil                      | Configura a fonte do texto                                                                                    |
| @discardableResult func foreground(color: UIColor, range: NSRange?) -> Self                                     | color: cor aplicado ao textorange: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                                                       | undefinednil                         | Configura a cor do texto                                                                                      |
| @discardableResult func foreground(highlights: [String: UIColor]) -> Self                                       | highlights: Dicionário de cores de fundo baseados com o texto a ser ressaltado como chave                                                                                                                                   | undefined                            | Configura o background de partes do texto para efeito de highlight                                            |
| @discardableResult func background(color: UIColor, range: NSRange?) -> Self                                     | color: Cor para ser aplicado ao fundo do textorange: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                                     | undefinednil                         | Configura o background do texto                                                                               |
| @discardableResult func clear() -> Self                                                                         | undefined                                                                                                                                                                                                                   | undefined                            | Reseta configuração do Text para as configurações iniciais                                                    |
| @discardableResult func corner(radius: BorderRadiusName) -> Self                                                | radius: Tipo do radius a ser aplicado no texto baseado no tema                                                                                                                                                              | undefined                            | Configura corner radius no texto                                                                              |
| @discardableResult func linkTouch(_ completion: @escaping (String) -> Void) -> Self                             | completion: Ação de execução do toque                                                                                                                                                                                       | undefined                            | Setup do método de callback injetado ao componente após toque                                                 |
| @discardableResult func link(_ url: String, range: NSRange?) -> Self                                            | url: url configurada para ser clicavel em parte do textorange: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                           | undefinednil                         | Configura o link em parte do texto                                                                            |
| @discardableResult func shadow(color: UIColor, blur: CGFloat, range: NSRange?) -> Self                          | color: cor para a sombrablur: blur aplicada na sombrarange: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                              | undefined1nil                        | Configura sombra em parte do texto                                                                            |
| @discardableResult func strikeThrough(color: UIColor, range: NSRange?) -> Self                                  | color: cor para o traçorange: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                                                            | undefinednil                         | Configura traço no texto                                                                                      |
| @discardableResult func underline(color: UIColor, range: NSRange?) -> Self                                      | color: cor para a linharange: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                                                            | undefinednil                         | Configura uma linha embaixo do texto                                                                          |
| @discardableResult func bold(range: NSRange?) -> Self                                                           | range: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                                                                                   | nil                                  | Configura o estilo bold da font configurada para o texto                                                      |
| @discardableResult func sensible(range: NSRange?) -> Self                                                       | range: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                                                                                   | nil                                  | Configura Parte to texto como sensivel(ocultavel)                                                             |
| @discardableResult func hideSensibleInfo(_ hide: Bool) -> Self                                                  | hide: torna escondido ou nao partes do texto que é configurado como ocultavel                                                                                                                                               | undefined                            | Esconde ou apresenta parte ocultavel do text                                                                  |
| @discardableResult func accessibilityValueForSensibleInfo(_ text: String?) -> Self                              | text: texto configuravel para acessibilidade de texto oculto                                                                                                                                                                | undefined                            | Configurar texto para quando o texto estiver oculto                                                           |
| @discardableResult func alignment(_ alignment: NSTextAlignment, range: NSRange?) -> Self                        | alignment: alinhamento para o textorange: parte do texto a ser configurado, aplicado ao texto todo caso nulo                                                                                                                | undefinednil                         | Configura alinhamento do texto                                                                                |
| @discardableResult func uppercased() -> Self                                                                    | undefined                                                                                                                                                                                                                   | undefined                            | Configura case do texto para uppercase                                                                        |
| @discardableResult func onClick(_ action: @escaping () -> Void) -> Self                                         | undefined                                                                                                                                                                                                                   | undefined                            | Detecta o clique no componente                                                                                |
| func onStateChange(_ onChangeState: ((UIControl.State) -> Void)?)                                               | undefined                                                                                                                                                                                                                   | UIControl.Statehighlighted ou normal | Detecta o clique retornando o estado do clique, permitindo fazer troca de cor, aplicar overlay e semelhantes. |

### Markdown

Injeção de conteúdo de texto em formato markdown suporta as seguintes sintaxes:

- \_\_{texto}\_\_: bold
- \*\*{text}\*\*: bold
- \~\~{text}\~\~: strikethrough
- \[{text}\]\({http://link}\): link
- \|\|{text}\|\|: sensible

### HTML

Injeção de conteúdo de texto em formato html suporta as seguintes sintaxes

- &lt;br&gt;: line break
- &lt;span color=\"{ColorName ou NotTokenableColorName}\"&gt;{text}&lt;/span&gt;: font color
- &lt;span style=\"color:{ColorName ou NotTokenableColorName}\"&gt;{text}&lt;/span&gt;: font color
- &lt;font color=\"{ColorName ou NotTokenableColorName}\"&gt;{text}&lt;/span&gt;: font color
- &lt;span style=\"font-family:{FontStyleName}\"&gt;{text}&lt;/span&gt;: font family
- &lt;a href=\"http://link\"&gt;{text}&lt;/a&gt;: link
- &lt;b&gt;{text}&lt;/b&gt;: bold
- &lt;strong&gt;{text}&lt;/strong&gt;: bold
- &lt;del&gt;{text}&lt;/del&gt;: strikethrough
- &lt;s&gt;{text}&lt;/s&gt;: strikethrough
- &lt;u&gt;{text}&lt;/u&gt;: underline
- &lt;ins&gt;{text}&lt;/ins&gt;: underline
- &lt;span style=\"sensible\"&gt;{}&lt;/span&gt;: sensible

Para mais detalhes, consultar documentação de FontStyleName / iOS e ColorName / iOS

## Exemplos

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var text = dependencies
        .artemisComponents
        .toText()
        .title("Texto")
        .font(.smallRegular)
        .foreground(
            color: dependencies.themeTokens.colors.accent
        )
        .click { [weak self] in
            guard let self, let dto else { return }
            //Executa uma função de clique aqui.
        }
        .onChangeState { [weak self] state in
              switch state {
              case .highlighted:
                  //Aplica um possível overlay de tap
              case .normal:
                  //Remove um possível overlay de tap
              default:
                  break
              }
        }

    // Caso queira customização em somente uma parte do texto via HTML
    // Fazer o setup de fonte e cor antes de injetar o HTML
    // Dessa maneira a parte sem tags não terá as configurações sobrescritas
    // Para mais detalhes em como formatar as tags conferir a doc correspondente
    lazy var textHTML = dependencies
        .artemisComponents
        .toText()
        .font(.smallRegular)
        .foreground(
            color: dependencies.themeTokens.colors.accent
        )
        .html("Texto <span color=\"supportCriticalA\">porém vermelho</span>")
        
    // Também se pode usar NotTokenableColorName
    lazy var textHTML2 = dependencies
        .artemisComponents
        .toText()
        .font(.smallRegular)
        .foreground(
            color: dependencies.themeTokens.colors.accent
        )
        .html("Texto <span color=\"ifNubank\">roxo</span>")

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

<!-- image -->

Componente visual de marcação de seleção de item.

### Funções / Modificadores

| Atributo                                   | Parametro      | Default   | Descrição                                                   |
|--------------------------------------------|----------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: RadioButtonDTO) -> Self | RadioButtonDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo. |

### RadioButtonDTO

| Atributo        | Tipo                  | Default   | Descrição                                                      |
|-----------------|-----------------------|-----------|----------------------------------------------------------------|
| selected        | Bool                  | undefined | Indicativo se o componente está selecionado                    |
| disabled        | Bool                  | undefined | Indicativo se o componente esta desativado                     |
| foregroundColor | NotTokenableColorName | nil       | Altera a cor do rádio ao ser selecionado, independente do tema |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var radioButton = dependencies
        .artemisComponents
        .toRadioButton()
        .setDTO(.init(selected: true, disabled: false))

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

a) O radio e seu respectivo rótulo devem estar agrupados num único foco visível para o LT.
b) O rótulo deve descrever com clareza a finalidade de cada radio.
c) O estado do radio precisa ser condizente com sua situação e deve ser anunciado corretamente pelo LT quando alterado.
d) O que deve ser lido:
conteúdo textual relacionado + Semântica: botão de opção (em android) / botão (em iOS) + Estado: Marcado/desmarcado

Comportamento e Interação:
a) 1 toque: Direciona o foco visível para o radio e seu respectivo rótulo.
b) Dois toques: marca ou desmarca.
Ao marcar: a. O foco se mantem no agrupamento e o LT deve anunciar a alteração de estado "marcado".
Ao desmarcar: O foco se mantem no agrupamento e o LT deve anunciar a alteração de estado desmarcado.

O Radio Button deve ser utilizado somente por outros componentes do Apollo.

## Skeleton

<!-- image -->

### Exemplos

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonRadioButton()
    }()

    init() {
        super.init(
            style: .default,
            reuseIdentifier: "custom"
        )
        buildLayout()
    }

    required init?(
        coder: NSCoder
    ) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(16)
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

Implementa os seguintes protocolos:

- ComponentProtocol
- https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/3371335684/Events#CollectionAllEventProtocol
- ScrollNotifiable
- OnRemoveChildEventProtocol

#### Guidelines

- O Hidden oculta a visualização dos valores dentro de todos os cards do carrossel;
- Quando habilitado animação de transição, o segundo elemento terá troca de estilo de highlightOn para highlightOff ao longo do scroll

## Funções / Modificadores

| Atributo                                                                           | Parametro                                                                                                                                       | Default                     | Descrição                                                                                                    |
|------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|--------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: HeroCardCarouselDTO) -> Self                                    | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3812753759?draftShareId=6d8cd4a1-7c2c-4cb1-9768-efc8cf858eca#HeroCardCarouselDTO | undefined                   | Define os dados configuraveis do componente. Veja a abaixo.                                                  |
| func update(dto: HeroCardItemDTO, style: HeroCardItemStyle, at index: Int) -> Self | HeroCardItemDTOHeroCardItemStyleInt                                                                                                             | undefinedundefinedundefined | Atualiza o DTO e estilo de um item no index fornecido                                                        |
| func updateAllItemsStyle(with ifThemeColors: ColorVariation) -> Self               | ColorVariation                                                                                                                                  | undefined                   | Atualiza o estilo de todos os items dentro do carousel                                                       |
| func isShimmering(dto: LoadableDTO, at index: Int) -> Self                         | LoadableDTOInt                                                                                                                                  | undefined                   | Atualiza o DTO de Loadable no index fornecido. Permite ativar ou desativar o shimmer de carregamento do item |
| func hideSensitiveInfo(_ hide: Bool, at index: Int) -> Self                        | BoolInt                                                                                                                                         | undefinedundefined          | Toggle para esconder/exibir valores sensíveis de item específico de carrossel                                |
| func hideAllSensitiveInfo(_ hide: Bool) -> Self                                    | Bool                                                                                                                                            | undefined                   | Toggle para esconder/exibir todos os valores sensíveis dos itens de carrossel                                |
| removeItem(at index: Int)                                                          | Int                                                                                                                                             | undefined                   | Método responsável por remover da view o card localizado naquele index.                                      |

### HeroCardCarouselDTO

| Atributo                | Tipo                                                                                                                                          | Descrição                                                              |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| cardDTOsAndStyles       | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3812753759?draftShareId=6d8cd4a1-7c2c-4cb1-9768-efc8cf858eca#CardDTOsAndStyles | Dtos dos cards                                                         |
| scrollAnimationEnabled  | Bool                                                                                                                                          | Toggle de animação de transição de estilos no scroll do segundo item   |
| childViewVisibilityRate | CGFloat                                                                                                                                       | Porcentagem de item necessário para disparo de eventos de rastreamento |

### CardDTOsAndStyles

| Atributo   | Tipo                    | Descrição                  |
|------------|-------------------------|----------------------------|
| dto        | LoadableHeroCardItemDTO | Dtos do loadable dos cards |
| style      | HeroCardItemStyle       | Dto do card de mais opções |

### LoadableHeroCardItemDTO

| Atributo     | Tipo             | Descrição                                                                                                                                                                                                       |
|--------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| loadableDTO  | LoadableDTO      | Dto do shimmer do card                                                                                                                                                                                          |
| componentDTO | HeroCardItemDTO? | Dto dos dados do card. Opcional pois inicialmente o card pode estar em estado de loading até serem carregados os dados relativos ao item. Pode ser setado posteriormente através da função update do carrossel. |

## Como utilizar

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let dto = HeroCardCarouselDTO(
        cardDTOsAndStyles: [
            .init(
                dto: .init(
                    loadableDTO: .init(isShimmering: false),
                    componentDTO: .item(
                        title: "Title",
                        link: .init(title: "Link"),
                        subtitle: "Label",
                        subtitleDescription: "R$ 0,00",
                        description: "Description",
                        descriptionValue: "R$ 0,00",
                        buttonDTO: .init("button", hasArrow: false),
                        isObfuscated: false
                    )
                ),
                style: .highlightNormal
            )
        ],
        scrollAnimationEnabled: true
    )
    lazy var carousel = dependencies
        .artemisComponents
        .toHeroCardCarousel()
        .setDTO(
            dto
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .onRemoveChild { index, _ in
            print(">>>> HeroCard with index \(index) has been removed from carousel")
        }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Requisitos de Conformidade WCAG
a) Cada card deve ser lido individualmente pelo LT;
b) Os itens de cada card devem obedecer a especificação do card distribution item.
Comportamento e interação:
a) Um toque: aplica o foco visível no card e o LT anuncia seu respectivo conteúdo;
b) Dois toques: Ativa o CTA;
c) Um arrasto da esquerda para a direita: foca o próximo card e o LT anuncia todo conteúdo textual (quando na última posição, foca o próximo componente da tela);
d) Um arrasto da direita para a esquerda: foca o card anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o título da seção).

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - Funções / Modificadores
    - ToDoDTO
- Exemplos
- Acessibilidade

<!-- image -->

### Guidelines

- Componente específico para alertar tarefas que o usuário pode executar
- Máximo de 2 linhas de texto no description
- Só aparece 1 card por vez na tela

### Funções / Modificadores

| Atributo                            | Parametro   | Default   | Descrição                                                   |
|-------------------------------------|-------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ToDoDTO) -> Self | ToDoDTO     | undefined | Define os dados configuraveis do componente. Veja a abaixo. |

### ToDoDTO

| Atributo      | Tipo          | Default   | Descrição                                |
|---------------|---------------|-----------|------------------------------------------|
| label         | String        | undefined | Texto a ser apresentando pelo componente |
| buttonFlexDTO | ButtonFlexDTO | undefined | Botão a ser apresentado pelo componente  |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var toDoItem = dependencies
        .artemisComponents
        .toToDo()
        .setDTO( 
              .init(
                    label: "Texto de teste de quantidade de linhas. Texto de teste de quantidade de linhas. Texto de teste de quantidade de linhas. ",
                     button: "Teste de botão"
                )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func didTap() {}
}
```

## Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - descrição e texto do botão sendo a característica do componente identificada como botão.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - FinantialStatementPreviewDTO
- Exemplos
- Acessibilidade

#### Guidelines

- Componente destinado ao Finantial Statement Preview Module / iOS para apresentar as últimas transações realizadas no histórico de transação referenciado;
- Exibe no máximo as três últimas transações realizadas;
- Não havendo transações, deve-se exibir o módulo de empty state;
- O botão de acesso ao extrato sempre estará visível, mesmo quando houve panes 3 ou menos transações.

### Funções / Modificadores

| Atributo                                                 | Parametro                                                                                                                                                | Default   | Descrição                                                 |
|----------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------|-----------------------------------------------------------|
| func setDTO(_ dto: FinantialStatementPreviewDTO) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/4063952958?draftShareId=5d6ebb27-ce44-44dd-9302-4a7a11776de4#FinantialStatementPreviewDTO | undefined | Define os dados configuráveis do componente. Veja abaixo. |
| func hideSensitiveInfo(_ hide: Bool) -> Self             | Bool                                                                                                                                                     | false     | Método utilizado para esconder ou não dados sensíveis.    |

### FinantialStatementPreviewDTO

| Atributo   | Tipo                      | Default   | Descrição                                        |
|------------|---------------------------|-----------|--------------------------------------------------|
| sections   | [BankStatementSectionDTO] | undefined | Define os itens que serão apresentados na lista. |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies
    
    let bankStatementItemDTOAndStyle = BankStatementItemDTOAndStyle(
        financeEvent: "Finance Event",
        value: "+R$ 1.000,00",
        isObfuscated: false,
        shouldShowDivider: true,
        shouldShowChevron: true,
        secondIdentifier: nil,
        fromToPrepositionAccessibility: nil,
        fromTo: "From/To",
        sourceOfFunding: "Source of Funding",
        time: "00h00",
        buttonDTO: nil
    )
    
    let arrayBankStatementSectionDTO = [
      BankStatementSectionDTO(
      date: "Hoje", 
      items: [
        bankStatementItemDTOAndStyle
      ], 
      isObfuscated: false, 
      balance: "R$ 24,90"),
    ]
    
    lazy var finantialStatementPreview = dependencies
        .artemisComponents
        .toFinantialStatementPreview()
        .setDTO(
          dto: arrayBankStatementSectionDTO
        )
        
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

Ordem de leitura

- Selection title
- Selection title
    - Exemplo de leitura: Extrato PicPay
- Separador de Dias
- Separador de Dias
    - Exemplo de leitura: Hoje; Ontem; Domingo 23 de Dezembro
- Transações
- Transações
    - Seguir pardrão de leitura estipulado para módulos
- Botão
- Botão
    - Formato: {Label} + {TIpo do Componente}
    - Exemplo de leitura: {Ver extrado completo} + {Botão}

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - ImageDTO
    - Inicializadores

O componente de Image se tratam de um componente base interno, utilizado para adicionar imagens a construção de outros componentes. As imagens permitidas são somente as estabelecidas pelo Studio, incluíndo ícones. Todas as imagens core do DS estarão disponíveis via assets do módulo de DS ou via CDN. O Componente só consegue receber os assets adicionados ao enum de assets do DS, não sendo possível passar assets externos ao componente. Se você precisar utilizar de um asset ou imagem externa (de produto/BU), você pode adicionar via URL de sua CDN própria.

#### Guidelines

- Só poderá receber assets do catálogo do DS, aprovados previamente com Studio;
- Caso tenha dúvidas sobre os assets, confira nossa doc: Imagens
- Caso precise de uma imagem externa, você pode adicionar uma imagem via URL.

### ImageDTO

| Atributo           | Tipo       | Default      | Descrição                                                                    |
|--------------------|------------|--------------|------------------------------------------------------------------------------|
| image              | String     | undefined    | Nome da imagem                                                               |
| color              | ColorName? | contentA     | Nome da cor a ser aplicada na imagem. Segue as definições de tokens do DS    |
| accessibilityValue | String?    | nil          | Valor de acessibilidade da imagem                                            |
| isClickable        | Bool       | false        | Indica se a imagem é clicável                                                |
| options            | Options    | .retryFailed | Indica se a imagem possui orientações especificas para o download da imagem. |

### Inicializadores

| Função                                                                                                                             | Descrição                                             |
|------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------|
| icon(image: ImageName, color: ColorName = .contentA, accessibilityValue: String? = nil, isClickable: Bool = false) -> Self         | Define uma imagem de ícone via assets do módulo de DS |
| downloadedImage(image: String, color: ColorName = .contentA, accessibilityValue: String? = nil, isClickable: Bool = false) -> Self | Define uma imagem para ser baixada via URL            |

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

<!-- image -->

Chips são componentes compactos para representar informação discreta, além disso, eles podem ser utilizados como seletores e/ou filtros.

### Funções / Modificadores

| Atributo                                      | Parametro                                         | Default   | Descrição                                    |
|-----------------------------------------------|---------------------------------------------------|-----------|----------------------------------------------|
| func setDTO(_ dto: ClipItemDTO) -> Self       | ClipItemDTO                                       | undefined | Define os dados configuraveis do componente. |
| func setStyle(_ style: ClipItemStyle) -> Self | .normal .inverse .normalSelected .inverseSelected | undefined | Define o estilo do componente.               |

### ChipItemDTO

| Atributo   | Tipo     | Default   | Descrição                                           |
|------------|----------|-----------|-----------------------------------------------------|
| id         | Int      | undefined | Define o id do componente.                          |
| idSelected | Bool     | undefined | Define se o componente foi selecionado.             |
| text       | String   | undefined | Define o texto a ser apresentado no componente.     |
| hasClose   | Bool     | undefined | Define se o componente exibirá o simbolo de fechar. |
| icon       | ImageDTO | undefined | Define se o componente terá um ícone.               |
| image      | ImageDTO | undefined | Define se o componente terá uma imagem.             |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var chipItemWithIcom = dependencies
            .artemisBaseComponents
            .toChipItem()
            .setDTO(
                .init(
                    id: 0,
                    isSelected: false,
                    text: "Com ícone",
                    hasClose: false,
                    icon: .icPlaceholder
                )
            )
            .setStyle(
                style: .normal
            )

    lazy var chipItemWithImage = dependencies
            .artemisBaseComponents
            .toChipItem()
            .setDTO(
                .init(
                    id: 0,
                    isSelected: false,
                    text: "Com imagem",
                    hasClose: false,
                    imageUrl: ImageName.illuSample.rawValue
                )
            )
            .setStyle(
                style: .normal
            )
            
    lazy var chipItemWithoutIdentifier = dependencies
            .artemisBaseComponents
            .toChipItem()
            .setDTO(
                .init(
                    id: 0,
                    isSelected: false,
                    text: "Sem identificador",
                    hasClose: true
                )
            )
            .setStyle(
                style: .normal
            )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- O que sera transcrito pelo Voice Over:
- O que sera transcrito pelo Voice Over:
    - O texto do componente seguido pela caraterística do tipo botão + a identificação se está selecionado.

```
private extension ChipItemView {
    func fillAccessibility(with dto: DTO) {
        accessibilityLabel = dto.text
        accessibilityTraits = dto.isSelected ? [.button, .selected] : .button
    }
}
```

## Skeleton

<!-- image -->

### Exemplos

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonChipItem(
            width: width
        )
    }()

    private let width: CGFloat
    init(
        width: CGFloat
    ) {
        self.width = width
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(16)
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

### Guidelines

- Componente de espaçamento personalizado

### Funções / Modificadores

| Atributo / Método                    | Parâmetro                                          | Default        | Descrição                                                                                 |
|--------------------------------------|----------------------------------------------------|----------------|-------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ArtemisSpacerDTO) | ArtemisSpacerDTO                                   | nil            | Seta um espaço entre os itens, com comportamento flexível ou fixo baseado no DTO.         |
| init(fixedSize:axis:)                | CGFloat?, NSLayoutConstraint.Axis                  | nil, .vertical | Cria um espaçador com tamanho fixo opcional e eixo de aplicação (horizontal ou vertical). |
| init(dependencies:spacingName:axis:) | Dependencies, SpacingName, NSLayoutConstraint.Axis | .vertical      | Cria um espaçador com base em um token de espaçamento (SpacingName) resolvido via tema.   |

### Exemplos

✅ Exemplo com CGFloat

```
final class CustomStackView: UIView {
    typealias Dependencies = HasArtemisComponentsInterface
    let dependencies: Dependencies

    private lazy var stack = dependencies.artemisComponents.toVStack(
        spacing: 12
    ) {
        UILabel() .. {
            $0.text = "Topo"
            $0.textAlignment = .center
        }

        dependencies.artemisComponents
            .toSpacer(initialConfiguration: .config(self))
            .setDTO(ArtemisSpacerDTO(fixedSize: 16, axis: .vertical))

        UILabel() .. {
            $0.text = "Base"
            $0.textAlignment = .center
        }
    }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
```

✅ Exemplo com SpacingName (token de espaçamento)

```
final class CustomStackView: UIView {
    typealias Dependencies = HasArtemisComponentsInterface
    let dependencies: Dependencies

    private lazy var stack = dependencies.artemisComponents.toVStack(
        spacing: .spacingSm
    ) {
        UILabel() .. {
            $0.text = "Topo"
            $0.textAlignment = .center
        }

        dependencies.artemisComponents
            .toSpacer(initialConfiguration: .config(self))
            .setDTO(
                ArtemisSpacerDTO(
                    dependencies: dependencies,
                    spacingName: .spacingMd,
                    axis: .vertical
                )
            )

        UILabel() .. {
            $0.text = "Base"
            $0.textAlignment = .center
        }
    }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
```

Obs: O Valor default nil cria um espaço com o máximo de expansão, ideal para empurrar views para o final da sua linha horizontal e/ou vertical

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - PersonaCarouselDTO
- Exemplos
- Acessibilidade
- Skeleton

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionEventProtocol
- ScrollNotifiable
- MarginToggle

<!-- image -->

#### Guidelines

- Carrossel horizontal de PersonaCarouselItemViews
- Não paginado por padrão

### Funções / Modificadores

| Atributo                                                       | Parametro                   | Default   | Descrição                                                                          |
|----------------------------------------------------------------|-----------------------------|-----------|------------------------------------------------------------------------------------|
| func setDTO(_ dto: PersonaCarouselDTO)                         | PersonaCarouselDTO          | undefined | Define os dados configuraveis do componente. Veja a abaixo.                        |
| func update(dto: PersonaCarouselItemDTO, at index: Int)-> Self | PersonaCarouselItemDTO, Int | undefined | Atualiza item referente ao índex passado com os dados de item de Persona injetados |

### PersonaCarouselDTO

| Atributo                | Tipo                     | Default   | Descrição                                                                        |
|-------------------------|--------------------------|-----------|----------------------------------------------------------------------------------|
| items                   | [PersonaCarouselItemDTO] | undefined | Recebe um array de DTOs de PersonaCarouselItem a serem exibidos no carrossel     |
| childViewVisibilityRate | CGFloat                  | 1         | Percentual do item visível necessária para ativar disparo de métodos de tracking |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let image = "https://templates.joomla-monster.com/joomla30/jm-news-portal/components/com_djclassifieds/assets/images/default_profile.png"
    let dto = PersonaCarouselDTO(
        items: [
            .init(
                label: "Label",
                initials: "LB"
            ),
            .init(
                label: "Label",
                initials: "LB",
                image: image
            ),
            .init(
                label: "Label",
                initials: "LB",
                image: image,
                tag: .init(
                    title: "Tag com texto grande"
                )
            ),
            .init(
                label: "Label",
                initials: "LB",
                tag: .init(
                    title: "Tag"
                )
            )
        ]
    )
    
    lazy var carousel = dependencies
        .artemisComponents
        .toPersonaCarousel()
        .setDTO(
            dto
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        carousel.update(
            dto: .init(
                label: "Label Update",
                initials: "LB"
            ),
            at: 1
        )
    }
}
```

## Acessibilidade

a) Cada item (persona carousel item e more options) do Persona Carousel deve ser focado e anunciado pelo LT individualmente;
b) Cada item deve obedecer a semântica "Button" herdada do persona carousel item e more options ou do "More Options".
c) O que deve ser lido:Individualmente cada um dos Persona Carousel Itens e o "More options", respeitando a spec destes componentes.

Comportamento e interação:

a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques em cada item: ativa o CTA;
c) Um arrasto da esquerda para a direita: foca o próximo item do Persona carousel e o LT anuncia todo conteúdo textual (quando na última posição, foca o componente posterior ao Persona carousel;
d) Um arrasto da direita para a esquerda: foca o item anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o componente anterior ao Persona Carousel.

## Skeleton

<!-- image -->

#### Exemplo

```
var pesonaCarouselLoadable: (
        loadable: (
            loadable: any LoadableInterface,
            module: any BaseModuleInterface
        ),
        component: any PersonaCarouselInterface
    ) = dependencies.artemisModules.toLoadablePersonaCarousel()

// cria o shimmer para o componente
func makeLoading() -> UIView {
    myContactsSection.loadable.loadable.startShimmer()
}

// para configuração de DTO, o processo é identico ao componente padrão
func make() -> UIView {
    let image = "https://templates.joomla-monster.com/joomla30/jm-news-portal/components/com_djclassifieds/assets/images/default_profile.png"
    let dto = PersonaCarouselDTO(
        items: [
            .init(
                label: "Label",
                initials: "LB"
            ),
            .init(
                label: "Label",
                initials: "LB",
                image: image
            ),
            .init(
                label: "Label",
                initials: "LB",
                image: image,
                tag: .init(
                    title: "Tag com texto grande"
                )
            ),
            .init(
                label: "Label",
                initials: "LB",
                tag: .init(
                    title: "Tag"
                )
            )
        ]
    )
    
    // configuração do persona carousel DTO
    pesonaCarouselLoadable
        .component
        .setDTO(
            dto
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )
    
    // configuração do BaseModule DTO
    let moduleDto = BaseModuleDTO(
        sectionTitleDTO: .init(title: "Some Title"),
        chipsCarouselDTO: nil, // chips são optionais
        buttonTitle: "My Button"
    )
    pesonaCarouselLoadable
        .loadable
        .module
        .setDTO(baseModuleDto)
        
    // por padrão o shimmer vem no estado Start, é preciso pará-lo para
    // poder se ter o comportamento padrão de um persona carousel
    return pesonaCarouselLoadable.loadable.loadable.stopShimmer()
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - IconButtonDTO
- Exemplos
- Acessibilidade
- Skeleton
    - Exemplo

<!-- image -->

#### Guidelines

- Componente representado por um ícone de 24x24 podendo ou não possuir um badge no canto superior direito

### Funções / Modificadores

| Atributo                                | Parametro                                                     | Default   | Descrição                                                   |
|-----------------------------------------|---------------------------------------------------------------|-----------|-------------------------------------------------------------|
| func setStyle(_ style: IconButtonStyle) | .neutral .highlight .neutralOverlayDark .neutralOverlayBright | .neutral  | Define o estilo do componente                               |
| func setDTO(_ dto: IconButtonDTO)       | IconButtonDTO                                                 | undefined | Define os dados configuraveis do componente. Veja a abaixo. |
| func setBadge(value: Int) -> Self       | Int                                                           | undefined | Método para definir o valor do badge                        |
| func hideBadge(_ hide: Bool) -> Self    | Bool                                                          | undefined | Método para ocultar ou mostrar o badge                      |

### IconButtonDTO

| Atributo           | Tipo      | Default   | Descrição                                 |
|--------------------|-----------|-----------|-------------------------------------------|
| image              | ImageName | undefined | Nome da imagem do ícone                   |
| accessibilityValue | String    | undefined | Valor de acessibilidade para o ícone      |
| badge              | BadgeDTO? | nil       | Badge a ser exibido quando for necessário |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var buttonFlex = dependencies
        .artemisComponents
        .toIconButton()
        .setDTO(
            IconButtonDTO(
            image: .icAirplane,
            accessibilityValue: "Editar",
            badge: BadgeDTO.notificationIcon(
                content: .icHeart,
                accessibilityValue: "Favorito"
                )
            )
        )
        .setStyle(
            .neutral
        )
        .onLoad { _ in
            print("IconButton loaded")
        }
        .onAppear{ _ in
            print("IconButton appeared")
        }
        .onClick { _ in
          print("IconButton click")
        }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Acessibilidade

- Deve conter um texto alternativo para o ícone que descreva sua finalidade.
- O que deve ser lido pelo Voice Over:
- O que deve ser lido pelo Voice Over:
    - Texto alternativo + Semântica: button.

#### Comportamento e interação:

- Um toque: aplica o foco visível no Button Icon e o LT anuncia seu respectivo conteúdo;
- Dois toques: aciona o CTA.

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonIconButton(
            margin: margin,
            accessibilityAnnouncement: accessibilityAnnouncement
        )
    }()
   
    private let margin: Margin
    private let accessibilityAnnouncement: String
    init(
        margin: Margin = .centered
        width: accessibilityAnnouncement = "Skeleton"  
    ) {
        self.margin = margin
        accessibilityAnnouncement = accessibilityAnnouncement
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }
   required init?(coder: NSCoder) {
        nil
    }
    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Exemplos

<!-- image -->

#### Funções / Modificadores

| Atributo                                                           | Parametro          | Default   | Descrição                                                          |
|--------------------------------------------------------------------|--------------------|-----------|--------------------------------------------------------------------|
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void) -> Self   | Método de callback | undefined | Injeção de método de comportamento ao carregar item                |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void) -> Self | Método de callback | undefined | Injeção de método de comportamento ao componente aparecer em tela  |
| func onAppear() -> Self                                            | undefined          | undefined | Chamada de método de callback injetado via onAppear(callback:)     |
| func animateFill() -> Self                                         | undefined          | undefined | Invoca método de animação do preenchimento do visual do componente |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var linearTimer = dependencies
        .artemisComponents
        .toLinearTimer()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate() {
        linearTimer.animateFill()
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
- Sobre o elemento
    - Funções / Modificadores
    - ContainerImageMediumDTO
- Exemplos
- Acessibilidade
- Skeleton
- Skeleton
    - Exemplos

<!-- image -->

#### Guidelines

- Componente usado para exibir carregamento da imagem.

### Inits

| Tipo                                   | Descrição                                                                          |
|----------------------------------------|------------------------------------------------------------------------------------|
| init(image: ContainerLoadImageAllowed) | Inicializa o componente através da seleção de imagens pré-definidas no mesmo.      |
| init(imageURL: String)                 | Inicializa o componente através da passagem da URL da imagem que deve ser exibida. |

### Funções / Modificadores

| Atributo                                                                                        | Parametro                                                                                                                                                        | Default   |                                                                                                                              |
|-------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ContainerLoadImageDTO) -> Self                                               | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3972858339?draftShareId=cb2d57e3-79c9-4c51-87e7-3410a1f6300a#ContainerLoadImageDTO                | undefined | Define os dados configuráveis do componente.                                                                                 |
| func setDTO(_ dto: ContainerLoadImageDTO, _ didFailureCallback: @escaping (() -> Void)) -> Self | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3972858339?draftShareId=cb2d57e3-79c9-4c51-87e7-3410a1f6300a#ContainerLoadImageDTO e uma closure. | undefined | Define os dados configuráveis do componente, com a adição de uma closure executada em caso de falha da requisição da imagem. |

### ContainerLoadImageDTO

| Atributo   | Tipo     | Default   | Descrição                               |
|------------|----------|-----------|-----------------------------------------|
| imageDTO   | ImageDTO | undefined | Define os dados configuráveis da imagem |

## Exemplos

#### Primary

```
lazy var customView: any ContainerLoadImageInterface = {
        let converter = ArtemisConverter()
        return converter.toContainerLoadImage()
    }()

    private let dto: ContainerLoadImageDTO
    init(dto: ContainerLoadImageDTO) {
        self.dto = dto
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        customView
            .setDTO(dto)
            .onLoad { [weak self] dto in
                print(">>>> ContainerLoadImage on load \(dto)")
            }
            .onAppear { [weak self] dto in
                print(">>>> ContainerLoadImage on appear \(dto)")
            }

            customView.onAppear()
    }
```

## Acessibilidade

Sem especificação de acessibilidade do componente.

## Skeleton

<!-- image -->

### Exemplos

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonContainerLoadImage(height: height)
    }()

    private let height: CGFloat
    init(
        height: CGFloat
    ) {
        self.height = height
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(
        coder: NSCoder
    ) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }

        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

<!-- image -->

Componente base utilizado para visualização de barra de progresso.

### Funções / Modificadores

| Atributo                                                          | Parametro       | Default   | Descrição                                                                       |
|-------------------------------------------------------------------|-----------------|-----------|---------------------------------------------------------------------------------|
| func setDTO(_ dto: TimelineItemDTO) -> Self                       | TimelineItemDTO | undefined | Injeção do conteúdo.                                                            |
| func startResumeProgress() -> Self                                |                 |           | Iniciar ou dar sequência na animação de enchimento da barra.                    |
| func stopProgress() -> Self                                       |                 |           | Parar animação de enchimento da barra.                                          |
| func resetProgress() -> Self                                      |                 |           | Resetar para o estado inicial, onde a barra ainda não foi preenchida            |
| func finishProgress() -> Self                                     |                 |           | Forçar o encerramento da animação, completando o enchimento da barra.           |
| func didFinishAnimating(_ callback: @escaping () -> Void) -> Self | @escaping ()    | undefined | Callback que recebe a informação de quando o enchimento da barra foi concluído. |

### TimelineDTO

| Atributo     | Tipo         | Default   | Descrição                                                                  |
|--------------|--------------|-----------|----------------------------------------------------------------------------|
| timeInterval | TimeInterval | undefined | Atributo que vai determinar a duração do enchimento da barra de progresso. |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var tielineItem = dependencies
        .artemisComponents
        .toTimelineItem()
        .setDTO(
          .init(
            timeInterval: 4
          )
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ] [  ] [  ] [  ]

O NavProgressBar é um componente visual que exibe uma barra de progresso dentro da barra de navegação. 
O pode gerenciar passos principais e sub steps (ramificações), incluindo a divisão de um step em várias sub etapas.

Ela está localizada dentro do BaseComponents.

#### Guidelines

- Possui estilos normal e custom
- Recebe total de steps e step inicial;
- Ramifica em steps menores;
- Consegue avançar ou voltar para um step setado, ou voltar um step;

### Funções / Modificadores

| Função                                                                                                          | Descrição                                                                                                                                                                                                                                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| setDTO(_ dto: NavProgressBarDTO) -> Self                                                                        | Configura o componente com o DTO fornecido.                                                                                                                                                                                                                                                                                         |
| setStep(steps: Int)                                                                                             | Avança ou volta para step ou substep difinido no parâmetro de steps                                                                                                                                                                                                                                                                 |
| backStep()                                                                                                      | Retrocede para o step ou substep anterior.                                                                                                                                                                                                                                                                                          |
| func nextBranchStep(steps: Int)                                                                                 | Cria uma nova ramificação com uma quantidade especificada de passos, avançando 1 passo já do step da ramificação                                                                                                                                                                                                                    |
| func updateNavProgressBar(in viewController: UIViewController, with navProgressBarConfig: NavProgressBarConfig) | Método que permite atualizar o status da ProgressBar.  O NavProgressBarConfig permite voltar um step, configurar o step atual,  e adicionar ramificação.    - viewController: O UIViewController onde será atualizado o status do ProgressBar    - navProgressBarConfig:  enum que possibilita passar a configuracao da progressBar |

### Variações

- Cores disponíveis:

| normal   | custom   |
|----------|----------|
|          |          |

## NavProgressBarDTO

| Atributo    | Tipo   | Default   | Descrição                                                                  |
|-------------|--------|-----------|----------------------------------------------------------------------------|
| totalSteps  | Int    |           | Número total inicial de etapas do NavProgressBar (obrigatório e valor > 0) |
| currentStep | Int    |           | Passo inicial do NavProgressBar (obrigatório e valor > 0)                  |

## Como utilizar

Setar os parâmetros iniciais de totalSteps e currentStep na NavBar

```
func setupNavigation(_ themeName: ThemeName, _ style: NavBarStyle) {
        let dto = NavBarDTO(
            backItem: .init(
                image: .icArrowLeft,
                accessibilityLabel: "Voltar"
            ),
            navProgressBar: .initial(.init(totalSteps: 10, currentStep: 5))
        )
        ArtemisConverter().toNavBar(
            self,
            dto: dto,
            style: style,
            onBackClick: {
                [weak self] in
                guard let self else { return }
                navigationController?.popViewController(animated: true)
            }
        )
    }
```

Caso utilize a mesma navBar setada anteriormente e queira chamar uma das funções de setar o step, voltar ou inserir ramificação na mesma view precisa chamar função abaixo para atualizar o progress.
ArtemisConverter().updateNavProgressBar(in: viewController, with: )

```
final class SampleViewController: UIViewController {

    lazy var customView: any NavProgressBarInterface = {
        let converter = ArtemisConverter()
        return converter.toNavProgressBar()
    }()
      customView
            .setDTO(dto)
            .onLoad { [weak self] dto in
                print(">>>> NavProgressBar on load \(dto)")
            }

    func setStep() {
        ArtemisConverter().updateNavProgressBar(in: viewController, with: .setStep(6))
      }
    func backStep() {
        ArtemisConverter().updateNavProgressBar(in: viewController, with: .back)
      }
    func nextBranchStep() {
        ArtemisConverter().updateNavProgressBar(in: viewController, with: .branchSteps(5))
      }    
}
```

Caso utilize a mesma navBar setada anteriormente e queira chamar uma das funções de setar o step, voltar ou inserir ramificação em uma outra view controller só chamar as ações no inicializador dessa view. O exemplo abaixo inicializa essa view no step 3.

```
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    ArtemisConverter().toNavBar(
      viewController: self, 
      dto: .init(navProgressBar: .setStep(3)), 
      style: .standard
    ) {
    } onFirstRightClick: {
    } onSecondRightClick: {
    }
}
```

## Dúvidas frequentes

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - MoreOptionsMenuListItemDTO
    - Exemplos
    - Acessibilidade

<!-- image -->

### Guidelines

- Variante do componente MenuListItem / iOS

| Atributo                                       | Parametro                  | Default   | Descrição                                    |
|------------------------------------------------|----------------------------|-----------|----------------------------------------------|
| func setDTO(_ dto: MoreOptionsMenuListItemDTO) | MoreOptionsMenuListItemDTO | undefined | Define os dados configuráveis do componente. |

### MoreOptionsMenuListItemDTO

| Atributo             | Tipo   | Default   | Descrição                                                          |
|----------------------|--------|-----------|--------------------------------------------------------------------|
| accessibilityContext | String | undefined | Contexto de acessibilidade do item de lista de mais opções no menu |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var MoreOptionsMenuListItem = dependencies
        .artemisComponents
        .toMoreOptionsMenuListItem()
        .setDTO( 
            .init(
                  title: "Ver mais opções",
                  accessibilityContext: "Ver mais Ofertas e cashback"
              )
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Todo conteúdo de texto existente
    - Semântica: button.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

Shape List Multi Select Item é um componente exclusivamente voltado atender listagens de seleção múltiplas.

É possível aplicar tanto com componente checkbox, quanto com a opção de toggle.

|    |     |
|----|-----|
|    |     |
|    |     |
|    |     |

### Guidelines

- O elemento não pode ser utilizado sozinho, deve ser utilizado o componente ShapeListMultiSelectBundle contendo 1 item.
- Pode receber identifier.
- Tem possibilidade de receber um CheckboxDTO ou ToggleDTO.
- Pode receber tag.
- ListContentArea obrigatório.
- Item pode iniciar selecionado ou não para configura-ló: caso o item for checkbox utilizar o init que contém o parâmetro checkboxSelected caso for toggle utilizar o init com o parâmetro toggleSelected.
- Tap/pressed state (overlay) aplica em todo componente, que inclusive muda seu background e borda quando selecionado.

### Funções / Modificadores

| Atributo                                        | Parametro                   | Default   | Descrição                                                   |
|-------------------------------------------------|-----------------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: ShapeListMultiSelectItemDTO) | ShapeListMultiSelectItemDTO | undefined | Define os dados configuráreis do componente. Veja a abaixo. |

### Atributos

| Atributo                         | Tipo               | Default   | Descrição                                                                                                |
|----------------------------------|--------------------|-----------|----------------------------------------------------------------------------------------------------------|
| listContentAreaDTO               | ListContentAreaDTO |           | Define o texto pertencente ao componente                                                                 |
| checkboxSelected                 | Bool               |           | Define se o checkbox está selecionado ou não                                                             |
| tagDTO?                          | TagDTO             | nil       | Define a tag que fica acima do listContentArea                                                           |
| identifierDTO?                   | IdentifierDTO      | nil       | Define o identifier que fica na esquerda do componente (ícone, imagem, etc)                              |
| shouldChangeElementActionOnClick | Bool               | true      | Define se o checkbox/toggle deve alterar o estado ao ser clicado, isso NÃO BLOQUEIA O CALLBACK DE CLICK  |
| disabled                         | Bool               | false     | Desabilita/Habilita o item ao ser clicado. Isso esconde o checkbox/toggle e BLOQUEIA O CALLBACK DE CLICK |

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - ShortcutCarouselDTO
- Exemplos
- Acessibilidade

Implementa os seguintes protocolos:

- ComponentProtocol
- CollectionEventProtocol
- OnMoreOptionsClickEventProtocol
- ScrollNotifiable
- MarginToggle

<!-- image -->

#### Guidelines

- Carrossel horizontal de any ShortcutItemDTOProtocol
- Não paginado por padrão
- Pode aceitar diversos tipos especializados de itens conformando com o protocolo base de ShortcutCarouselItemView , sendo diferenciados pelo tipo de DTO passado na construção:
- Pode aceitar diversos tipos especializados de itens conformando com o protocolo base de ShortcutCarouselItemView, sendo diferenciados pelo tipo de DTO passado na construção:
    - IconCarouselItemView
    - MerchantCarouselItemView
    - PersonaCarouselItemView

### Funções / Modificadores

| Atributo                                                                                  | Parametro                                       | Default   | Descrição                                                                                |
|-------------------------------------------------------------------------------------------|-------------------------------------------------|-----------|------------------------------------------------------------------------------------------|
| func setDTO(_ dto: ShortcutCarouselDTO)                                                   | ShortcutCarouselDTO                             | undefined | Define os dados configuraveis do componente. Veja a abaixo.                              |
| func update(at index: Int, dto: IconCarouselItemDTO, style: IconCarouselItemStyle)-> Self | Int, IconCarouselItemDTO, IconCarouselItemStyle | undefined | Atualiza item referente ao índex passado com os dados e estilo de item de Icon injetados |
| func update(at index: Int, dto: MerchantCarouselItemDTO) -> Self                          | Int, MerchantCarouselItemDTO                    | undefined | Atualiza item referente ao índex passado com os dados de item de Merchant injetados      |
| func update(at index: Int, dto: PersonaCarouselItemDTO) -> Self                           | Int, PersonaCarouselItemDTO                     | undefined | Atualiza item referente ao índex passado com os dados de item de Persona injetados       |

### ShortcutCarouselDTO

Devido a utilização de protocolos como tipos existenciais é necessário conformar com os protocolos Equatable e Decodable manualmente, visto que Swift não consegue extrapolar os métodos somente com a assinatura do protocolo no lugar de um tipo concreto.

Por causa desse ponto, qualquer atualização nos estilos, DTOs, adição de novos elementos de Shortcut ou grupos de DTO+Style precisam ser também consideradas na lógica desses métodos dentro de ShortcutCarouselDTO

| Atributo                | Tipo                          | Default   | Descrição                                                                        |
|-------------------------|-------------------------------|-----------|----------------------------------------------------------------------------------|
| items                   | [any ShortcutItemDTOProtocol] | undefined | Recebe um array de itens genéricos a serem exibidos no carrossel                 |
| moreOptionsDTO          | MoreOptionsCarouselItemDTO?   | nil       | DTO de componente de MoreOptions adicionado ao final do carrossel                |
| childViewVisibilityRate | CGFloat                       | 1         | Percentual do item visível necessária para ativar disparo de métodos de tracking |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    let personaImage = "https://templates.joomla-monster.com/joomla30/jm-news-portal/components/com_djclassifieds/assets/images/default_profile.png"
    let items: [any ShortcutItemDTOProtocol] = [
        IconCarouselItemDTO(
            icon: .icon(
                image: .icAddCard,
                color: .accent
            ),
            title: "Icon Item",
            tag: TagArgumentativeDTO(
                title: "Icon"
            )
        ),
        MerchantCarouselItemDTO(
            image: nil,
            tag: .init(
                title: "Merchant"
            ),
            label: "Merchant Item"
        ),
        PersonaCarouselItemDTO(
            label: "Persona Item",
            initials: "PI",
            image: personaImage,
            tag: TagArgumentativeDTO(
                title: "Persona"
            )
        )
    ]
    
    lazy var carousel = dependencies
        .artemisComponents
        .toShortcutCarousel()
        .setDTO(
            ShortcutCarouselDTO(
                items: items,
                moreOptionsDTO: .init(
                    content: .init(
                        title: "Ver mais opções",
                        accessibilityContext: "Veja mais opções de atalhos"
                    )
                ),
                childViewVisibilityRate: 0.5
            )
        )
        .onLoad { _ in
            print("Carousel loaded")
        }
        .onAppear{ _ in
            print("Carousel appeared")
        }
        .onLoadChild { index, _ in
            print("Carousel item \(index) loaded")
        }
        .onAppearChild { index, _ in
            print("Carousel item \(index) appeared")
        }
        .onClickChild { index, _ in
          print("Carousel index \(index) primary click")
        }
        .onMoreOptionsClick { index, _ in
            print("Carousel more options \(index) click")
        }
        .enableTopMargin(
            true
        )
        .enableBottomMargin(
            false
        )

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        carousel.update(
            at: 3,
            dto: IconCarouselItemDTO(
                icon: .icon(
                    image: .icBag,
                    color: .accent
                ),
                title: "Updated"
            ),
            style: .highlightColor
        )
    }
}
```

## Acessibilidade

a) Cada item (icon carousel item, merchant carousel item, persona carousel item e more options) do Merchant Carousel deve ser focado e anunciado pelo LT individualmente;
b) Cada item deve obedecer a semântica "Button" herdada do icon carousel item, merchant carousel item, persona carousel item e more options ou do "More Options".
c) O que deve ser lido:Individualmente cada um dos Merchants Carousel Itens e o "More options", respeitando a spec destes componentes.

Comportamento e interação:

a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques em cada item: ativa o CTA;
c) Um arrasto da esquerda para a direita: foca o próximo item do Shortcut carousel e o LT anuncia todo conteúdo textual (quando na última posição, foca o componente posterior ao Shortcut Carousel;
d) Um arrasto da direita para a esquerda: foca o item anterior e o LT anuncia todo conteúdo textual (quando na primeira posição foca o componente anterior ao Shortcut Carousel.

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Guidelines
    - MerchantCarouselItemDTO
    - Exemplos
    - Acessibilidade

<!-- image -->

<!-- image -->

<!-- image -->

### Guidelines

- Componente possuindo uma imagem em destaque seguido abaixo podendo ter uma tag ou labels.

| Atributo                                                  | Parametro               | Default   | Descrição                                                   |
|-----------------------------------------------------------|-------------------------|-----------|-------------------------------------------------------------|
| func setStyle(_ style: MerchantCarouselItemStyle) -> Self | .norma  .shop           | undefined | Define o estilo do componente                               |
| func setDTO(_ dto: MerchantCarouselItemDTO) -> Self       | MerchantCarouselItemDTO | undefined | Define os dados configuraveis do componente. Veja a abaixo. |

### MerchantCarouselItemDTO

| Atributo                 | Tipo                 | Default   | Descrição                                                                                                                                |
|--------------------------|----------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------|
| initials                 | String               | undefined | Texto que representa as iniciais a serem exibidas caso não tenha imagem. As iniciais geralmente são derivadas do nome ou título do item. |
| image                    | ImageDTO?            | nil       | Imagem associada ao item do carrossel. Pode ser nil caso não haja imagem disponível.                                                     |
| tag                      | TagArgumentativeDTO? | nil       | Objeto que representa a tag associada ao item do carrossel. Pode ser nil se não houver tag associada.                                    |
| label                    | String               | undefined | Texto exibido como rótulo ou legenda do item do carrossel.                                                                               |
| applyInitialAbbreviation | Bool                 | undefined | Indica se a string informada no campo initials deve ser abreviada                                                                        |

### Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var merchantCarouselItem = dependencies
        .artemisComponents
        .toMerchantCarouselItem()
        .setDTO(
          initials: "Initials",
          image: ImageDTO.icon(
              image: .illuSample
          ),
          tag: TagArgumentativeDTO(
              title: "TAG"
          ),
          label: "Label"
        )
        .setStyle(.normal)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - Texto alternativo + (texto da tag ou texto alternativo da tag)+ semântica "button".

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

[  ] [  ] [  ] [  ] [  ]

<!-- image -->

Descreva brevemente a finalidade de uso do componente. Por exemplo:

Os componentes do tipo TermDiclaimer se tratam de componentes do tipo texto estático já predefinidos sem a possibilidade de edição de seu conteúdo, possui o propósito de informar ao usuário que ele estará aceitando os termos ao continuar.

A classe TermDisclaimerView é a responsável por criar nosso componente customizado. Ela herda da classe UIView.

Um exemplo de uso do componente TermDisclaimer pode ser encontrado no nosso ArtemisComponentsSample, na aba de componentes.

#### Guidelines

- Possui o propósito de informar ao usuário que ele estará aceitando os termos ao continuar.
- Utilize sempre este componente acima do button bundle, nunca em outro local.
- Possui dois hyperlinks que abre um webview dentro do aplicativo para Termos e outro para Políticas de privacidade.

### Funções / Modificadores

| Função                                                              | Descrição                                                             |
|---------------------------------------------------------------------|-----------------------------------------------------------------------|
| setStyle(_ style: TermDisclaimerStyles)                             | Define o estilo de apresentação do componente.                        |
| func didClickOnTermsLink(_ callback: @escaping () -> Void) -> Self  | Callback de ação para clique no hyperlink de Termos.                  |
| func didClickOnPolicyLink(_ callback: @escaping () -> Void) -> Self | Callback de ação para clique no hyperlink de Política de privacidade. |

### Variações

- Estilos disponíveis:

| normal   | custom   |
|----------|----------|
|          |          |

## Acessibilidade

O componente foi construído com as seguintes diretrizes de acessibilidade.
a) Um toque: habilita o foco visível no bloco de texto e o LT anuncia o texto e os hiperlinks.
b) Arrastos verticais em iOS navega pelos hiperlinks.

Abaixo está o video com a evidência do comportamento.

<!-- image -->

## Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Variações Gold
    - Variações Epic
    - Funções / Modificadores
    - ButtonItemDTO
- Exemplos
- Acessibilidade
    - Skeleton
    - Exemplo

<!-- image -->

<!-- image -->

Implementa os seguintes protocolos:

- ComponentProtocol,
- ComponentLoadEventProtocol,
- OnClickEventProtocol

### Variações Gold

| Critical+Inverse   | Primary+Neutral   | Secondary+Inverse   | Tertiary+Inverse   | Primary Disabled   |
|--------------------|-------------------|---------------------|--------------------|--------------------|
|                    |                   |                     |                    |                    |

### Variações Epic

| Critical+Inverse   | Primary+Neutral   | Secondary+Inverse   | Tertiary+Inverse   | Primary Disabled   |
|--------------------|-------------------|---------------------|--------------------|--------------------|
|                    |                   |                     |                    |                    |

### Funções / Modificadores

| Atributo                                                                                                       | Parametro                                                                                                                                                                      | Default                         | Descrição                                                                                                     |
|----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------|---------------------------------------------------------------------------------------------------------------|
| func onLoad(_ callback: @escaping (DTOProtocol) -> Void) -> Self                                               | Método de callback                                                                                                                                                             | undefined                       | Injeção de método de comportamento ao carregar item                                                           |
| func onAppear(_ callback: @escaping (DTOProtocol) -> Void) -> Self                                             | Método de callback                                                                                                                                                             | undefined                       | Injeção de método de comportamento ao componente aparecer em tela                                             |
| func onAppear() -> Self                                                                                        | undefined                                                                                                                                                                      | undefined                       | Chamada de método de callback injetado via onAppear(callback:)                                                |
| func onClick(_ callback: @escaping (DTOProtocol) -> Void) -> Self                                              | Método de callback                                                                                                                                                             | undefined                       | Injeção de método de comportamento de interação primário do componente                                        |
| func setStyle(_ style: ButtonItemStyle) -> Self                                                                | .primaryNeutral | .primaryNeutalInverse | .secondaryNeutal | .secondaryNeutralInverse | .tertiaryNeural | .tertiaryNeutralInverse | .primaryCritical | .primaryCriticalInverse | .primaryNeutral                 | Define o estilo do componente                                                                                 |
| func setDTO(_ dto: ButtonItemDTO) -> Self                                                                      | https://picpay.atlassian.net/wiki/spaces/ARISTEU/pages/edit-v2/3509714985#ButtonItemDTO                                                                                        | undefined                       | Define os dados configuraveis do componente. Veja a abaixo.                                                   |
| func setEnabled(_ enabled: Bool) -> Self                                                                       | Bool                                                                                                                                                                           | undefined                       | Faz o toggle para habilitar/desabilitar botão                                                                 |
| changeStyleAnimated(from fromStyle: ButtonItemStyle, to toStyle: ButtonItemStyle, percentage: CGFloat) -> Self | ButtonItemStyle inicial, ButtonItemStyle final, GFloat com porcentagem da animação                                                                                             | undefined, undefined, undefined | Faz a transição de estilos do botão, seguindo uma porcentagem de fade                                         |
| func startLoading(_ accessibilityValue: String)                                                                | parametro para quando o loading comecar                                                                                                                                        |                                 | coloca o button em estado de loading                                                                          |
| func stopLoading(_ accessibilityValue: String)                                                                 | parametro para quando o loading terminar                                                                                                                                       |                                 | tirar o button de estado de loading                                                                           |
| var currentDTO: ButtonItemDTO?                                                                                 | Não há                                                                                                                                                                         | nil                             | Caso precise, pode-se acessar os valores atuais do DTO do ButtonItem para construção de alguma regra interna. |

### ButtonItemDTO

| Atributo          | Tipo   | Default   | Descrição                                                            |
|-------------------|--------|-----------|----------------------------------------------------------------------|
| title             | String |           | Valor do texto do botão                                              |
| hasArrow          | Bool   | false     | Flag indicativa de exibição de ícone de seta                         |
| accessibilityText | String | nil       | Texto acessível customizado, se nulo, utiliza o mesmo valor do title |

## Exemplos

#### Primary

```
import ArtemisComponentsInterface

final class CustomView: UIView {
    let dependencies: Dependencies

    lazy var buttonFlex = dependencies
        .artemisComponents
        .toButtonItem()
        .setDTO(ButtonItemDTO("Title", hasArrow: true))
        .setStyle(.primaryNeutral)
        .onClick { _ in 
          print("Button Item tapped")
        }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()

        // caso precise, pode-se acessar os valores atuais do DTO do ButtonItem para construção de alguma regra interna
        print(">>>> Button Item Current Title: \(String(describing: buttonFlex.currentDTO?.title))")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func didTap() {}
}
```

## Acessibilidade

a) O rótulo deve descrever com clareza a finalidade de cada Button Item.
b) O estado do button item precisa ser condizente com sua situação e deve ser anunciado corretamente pelo LT quando alterado.
c) O que deve ser lido:

- Rótulo + Semântica: button + estado: (somente quando "Disabled" ou "Pressed").

*Comportamento e Interação:*
a) Um toque em cada item aplica o foco visível e o LT anuncia seu conteúdo;
b) Dois toques no Button Item ativa o CTA ou altera o estado.
Ao marcar: a. O foco se mantem no agrupamento e o LT deve anunciar a alteração de estado "marcado";
Ao desmarcar: O foco se mantem no Button Item e o LT deve anunciar a alteração de estado desmarcado.

### Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonButtonItem()
    }()


    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        
        customView.startShimmer()
    }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

- Sobre o elemento
    - Funções / Modificadores
    - BannerCrossSellingDTO
    - Exemplos
    - Acessibilidade
- Hide
    - Exemplo
- Skeleton
    - Exemplo

Sem o icone do Identifier:

<!-- image -->

<!-- image -->

<!-- image -->

Com icone do Identifier:

<!-- image -->

<!-- image -->

<!-- image -->

<!-- image -->

#### Guidelines

- Componente usado para dar ênfase e destaque em informações importantes que são apresentadas em um contexto específico.
- Componente pode também receber cores conforme determina instituição financeira, exemplo: roxo para o Nubank, laranja para o Itau, … etc.

### Funções / Modificadores

| Atributo                                                | Parametro             | Default   | Descrição                                                   |
|---------------------------------------------------------|-----------------------|-----------|-------------------------------------------------------------|
| func setStyle(_ style: BannerCrossSellingStyle) -> Self | .default  .inverse    | .default  | Define o estilo do componente                               |
| func setDTO(_ dto: ButtonFlexDTO) -> Self               | BannerCrossSellingDTO | undefined | Define os dados configuráveis do componente. Veja a abaixo. |
| func playAnimation() -> Self                            |                       |           | Animação do componente.                                     |
| func hideSensitive(_ hide: Bool) -> Self                | Bool                  | undefined | Define a opção de ocultar conteúdo sensível                 |

### BannerCrossSellingDTO

| Atributo            | Tipo                  | Default   | Descrição                                      |
|---------------------|-----------------------|-----------|------------------------------------------------|
| title               | String                | undefined | Texto a ser apresentando pelo componente       |
| description         | String                | undefined | Texto a ser apresentado pelo componente        |
| background          | NotTokenableColorNane | undefined | Cor do componente                              |
| animationStartDelay | TimeInterval?         | 0         | Delay para iniciar a animação TimeInterval     |
| icon                | ImageName?            | nil       | Icone do item                                  |
| isObfuscated        | Bool                  | false     | Opção de hidden para ocultar conteúdo sensível |
| isAnimationLoop     | Bool                  | false     | Permite a animação lottie ficar em looping     |

### Exemplos

#### Com Background

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var bannerCrossSellig = dependencies
        .artemisComponents
        .toBannerCrossSelling()
        .setDTO( 
              .init(
                    title: "Adicione seus cartões no PicPay",
					description: "Parcele compras e pagamentos em até 12x",
					background: nil,
                )
        .setStyle(.default)
        .setDelegate(self)

    lazy var bannerCrossSelligWithBackground = dependencies
        .artemisComponents
        .toBannerCrossSelling()
        .setDTO( 
              .init(
                    title: "Adicione seus cartões no PicPay",
					description: "Parcele compras e pagamentos em até 12x",
					background: .ifBradesco
                )
        .setStyle(.default)
        .setDelegate(self)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func didTap() {}
}
```

#### Com animação e identifier: (animationStartDelay, icon)

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var bannerCrossSellig = dependencies
        .artemisComponents
        .toBannerCrossSelling()
        .setDTO( 
              .init(
                    title: "Adicione seus cartões no PicPay",
					description: "Parcele compras e pagamentos em até 12x",
					background: nil,
					animationStartDelay: .init(0),
                    icon: nil
                )
        .setStyle(.default)
        .setDelegate(self)

    lazy var bannerCrossSelligWithAnimationAndIdentifier = dependencies
        .artemisComponents
        .toBannerCrossSelling()
        .setDTO( 
              .init(
                    title: "Adicione seus cartões no PicPay",
					description: "Parcele compras e pagamentos em até 12x",
					background: .ifBradesco,
					animationStartDelay: .init(0.35),
                    icon: .icPlaceholder
                )
        .setStyle(.default)
        .setDelegate(self)
        
      let inverseItemLooping = BannerCrossSellingCell.make(
            dto: BannerCrossSellingDTO(
                title: "Animação em Looping no card",
                description: "Validando a arrow no tema inverse",
                background: nil,
                icon: .icPlaceholder,
                isAnimationLoop: true
            )
        )
        inverseItemLooping
            .customView
            .setStyle(.inverse)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func didTap() {}
}
```

### Acessibilidade

- O que deve ser transcrito pelo Voice Over:
- O que deve ser transcrito pelo Voice Over:
    - título e descrição sendo a característica do componente identificada como botão.

## Hide

<!-- image -->

### Exemplo

```
import ArtemisComponentsInterface

final class CustomView: UIView, ButtonFlexDelegate {
    let dependencies: Dependencies

    lazy var bannerCrossSellig = dependencies
        .artemisComponents
        .toBannerCrossSelling()
        .setDTO( 
              .init(
                    title: "Adicione seus cartões no PicPay",
					description: "Parcele compras e pagamentos em até 12x",
					background: nil,
                    animationStartDelay: .init(0),
                    icon: nil,
                    isObfuscated: false
                )
        .setStyle(.default)
        .setDelegate(self)

    lazy var bannerCrossSelligWithHide = dependencies
        .artemisComponents
        .toBannerCrossSelling()
        .setDTO( 
              .init(
                    title: "Adicione seus cartões no PicPay",
					description: "Parcele compras e pagamentos em até 12x",
					background: .ifBradesco,
					animationStartDelay: .init(0.35),
                    icon: .icPlaceholder,
                    isObfuscated: true
                )
        .setStyle(.default)
        .setDelegate(self)

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func didTap() {}
}
```

## Skeleton

<!-- image -->

### Exemplo

```
lazy var customView: any SkeletonInterface = {
        let converter = ArtemisConverter()
        return converter.toSkeletonBannerCrossSelling()
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "custom")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func buildLayout() {
        contentView.addSubview(customView)
        customView.snp.remakeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
        }
        customView.startShimmer()
     }
```

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!## Sobre o elemento

O componente é utilizado no Carousel Banner Offer.

### Guidelines

- O componente é utilizado no Carousel Offer Banner
- O título leva o nome do produto e suporta apenas 1 linha.
- O texto descritivo pode ter no máximo 3 linhas.
- A ancoragem Title + Text é pela base..

### Funções / Modificadores

| Atributo                               | Parametro          | Default   | Descrição                                                   |
|----------------------------------------|--------------------|-----------|-------------------------------------------------------------|
| func setDTO(_ dto: BannerOfferItemDTO) | BannerOfferItemDTO | undefined | Define os dados configuráreis do componente. Veja a abaixo. |

### Atributos

| Atributo    | Tipo   | Default   | Descrição                                                               |
|-------------|--------|-----------|-------------------------------------------------------------------------|
| title       | String | undefined | Define o texto pertencente ao componente                                |
| description | String | undefined | Define a descrição pertencente ao componente                            |
| buttonTitle | String | undefined | Define o texto do buttonFlex do componente                              |
| imageURL    | String | undefined | Define a URL da imagem que será utilizada como background do componente |

Quer colaborar com o Design System?

O Apollo é um produto de todos nós, portanto, todos podem contribuir. Acesse a página de colaboração e entenda como colaborar com o nosso Design System. Sua colaboração é muito bem-vinda!