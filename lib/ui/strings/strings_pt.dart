import 'strings.dart';

class StringsPt extends Strings {
  final String _badRequestComplement = 'retornam 400 (Bad Request)';
  final String _unsupportedEndpointsPhrase =
    'Endpoints não suportados retornam 404 (Not Found).';
  final String _unsupportedMethodsPhrase =
    'Métodos não suportados retornam 405 (Method Not Allowed).';
  final String _unsupportedMediaTypesPhrase =
    'Tipos de mídia não suportados retornam 415 (Unsupported Media Type).';
  @override
  String get appName => 'Bem-vindo(a) ao Meu Currículo Online';
  @override
  String get longRoles =>
    'Desenvolvedor Flutter\n'
    'Desenvolvedor SAP Integration Suite';
  @override
  String get professionalSummaryTitle => 'Resumo Profissional';
  @override
  String get professionalSummaryInfo =>
    'Desenvolvedor profissional com mais de 15 anos de experiência atuando em aplicações '
    'comerciais cliente/servidor (ERP), aplicativos móveis para a plataforma Android, '
    'design/desenvolvimento de jogos casuais, e aplicações multiplataforma com o framework '
    'Flutter.';
  @override
  String get detailsTitle => 'Detalhes';
  @override
  String get personalLocation => 'Brasil, GO';
  @override
  String get programmingSkillsTitle => 'Habilidades Em Programação';
  @override
  String get integrationSkillsTitle => 'Habilidades Em Integração';
  @override
  String get aboutAndExpectationsTitle => 'Sobre Mim e Expectativas';
  @override
  String get aboutAndExpectationsInfo =>
    'Apreciador de ilustração digital para jogos e apaixonado pela arte da música.\n\n'

    'Sempre interessado em aprender mais sobre qualquer assunto. Sobre desenvolvimento, priorizo '
    'fontes como livros, documentações oficiais, e artigos.\n\n'

    'Busco sempre dar o meu melhor em tudo o que faço, mantendo um alto nível de comprometimento '
    'com a qualidade do produto final. Valorizo legibilidade e performance e, por isso, escolhi o '
    'Flutter como meu framework de desenvolvimento multiplataforma.\n\n'

    'Espero ter a oportunidade de participar de projetos de desenvolvimento de aplicações e/ou '
    'integrações de sistemas com base nas minhas habilidades técnicas apresentadas. Enquanto '
    'contribuo com meus conhecimentos, também espero aprimorar-me pessoal e tecnicamente com '
    'meus colegas de equipe.';
  @override
  String get madeWithFlutter => 'Feito com Flutter  🩵';
  @override
  String get language => 'Idioma';
  @override
  String get experienceTitle => 'Experiência';
  @override
  String get sapIntegrationSuiteLearningJourneyTitle =>
    'Jornada de Estudos SAP Integration Suite';
  @override
  String get sapIntegrationSuiteLearningJourneyDetail => 'Desde 2023';
  @override
  String get integrationProjectApimProxyDescription =>
    'Permite aplicações do usuário final se conectarem ao Cloud Integration com um token JWT do '
    'Firebase.';
  @override
  String get integrationProjectApimProxyInfo =>
    '${Strings.widgetPlaceholder}'

    'Aplicações do usuário final devem se autenticar em sistemas backend com credenciais do '
    'usuário final, as quais permitem o sistema backend confiar e identificar o usuário da '
    'requisição.\n\n'

    'Este API Management Proxy aplica as seguintes políticas para confiar e identificar um '
    'usuário final autenticado com o serviço Google Cloud Firebase Authentication:'

    '${Strings.title('▪ GetFirebaseJwtClaims', false)}'
    'Esta política KeyValueMapOperations lê os direitos issuer e audience configurados para a '
    'aplicação do Firebase.'

    '${Strings.title('▪ LookupGoogleApisJwksCache')}'
    'Esta política LookupCache lê as chaves públicas das APIs Google anteriormente baixadas e '
    'armazenadas em cache.'

    '${Strings.title('▪ FetchGoogleApisJwks')}'
    'Esta política ServiceCallout baixa as chaves públicas das APIs Google se não houver um cache '
    'válido.'

    '${Strings.title('▪ ExtractGoogleApisJwksMaxAge')}'
    'Esta política ExtractVariables extrai o valor max-age do cabeçalho Cache-Control da resposta '
    'da política anterior. Este valor é usado para determinar o prazo de expiração do cache das '
    'chaves públicas das APIs Google.'

    '${Strings.title('▪ PopulateGoogleApisJwksCache')}'
    'Esta política PopulateCache salva em cache as chaves públicas das APIs Google baixadas.'

    '${Strings.title('▪ VerifyFirebaseJwt')}'
    'Esta política VerifyJWT verifica o token JWT do Firebase da requisição da aplicação do '
    'usuário final. Ela valida os direitos e a assinatura com as chaves públicas das APIs Google.'

    '${Strings.title('▪ SetHeaders')}'
    'Esta política AssignMessage adiciona o cabeçalho User-ID com o ID do usuário final extraído '
    'do token JWT do Firebase e remove o cabeçalho Authorization antes de encaminhar a requisição '
    'para o Cloud Integration.';
  @override
  String get integrationProjectIFlowProxyDescription =>
    'Valida requisições e gerencia o roteamento para os iFlows.';
  @override
  String get integrationProjectIFlowProxyInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow é o ponto de entrada para todos os iFlows do pacote. Ele executa as seguintes '
    'operações:\n'
    '▪ Validação de configurações comuns de requests;\n'
    '▪ Roteamento para o iFlow de destino via ProcessDirect baseado no caminho da requisição;\n'
    '▪ Logs de exceções;\n'
    '▪ Limpeza de cabeçalhos sensíveis.'

    '${Strings.title('Validação de Configurações de Requests')}'
    'Para cada rota, as seguintes configurações são validadas:\n'
    '▪ Métodos HTTP suportados;\n'
    '▪ Caminhos suportados;\n'
    '▪ Parâmetros de requisição suportados e seus formatos;\n'
    '▪ Rejeição de requisições públicas (alguns iFlows não podem ser chamados por aplicações do '
    'usuário final via API Management Proxy).'

    '${Strings.widgetPlaceholder}'

    '${Strings.title('Limpeza de Cabeçalhos Sensíveis')}'
    'Alguns cabeçalhos sensíveis gerados durante o processamento dos iFlows, como Authorization, '
    'cabeçalhos customizados usando o padrão de nomenclatura _*, cabeçalhos auto-gerados por '
    'etapas DataStore, e outros, são removidos antes de retornar para o Sender.';
  @override
  String get integrationProjectExceptionHandlerDescription =>
    'Salva dados da mensagem no Message Processing Log e envia emails de alerta.';
  @override
  String get integrationProjectExceptionHandlerInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow é responsável por manipular as exceções de todos os iFlows do pacote.\n\n'

    'O log e o envio de email são configurados (habilitado/desabilitado) via parâmetros '
    'externalizados, assim como as configurações SMTP.\n\n'

    'O script a seguir, executado por cada iFlow, trata todas as exceções mapeadas. Exceções não '
    'tratadas são propagadas até o iFlow Proxy, onde este iFlow as captura:'

    '${Strings.widgetPlaceholder}'

    'Exceções comuns relacionadas a formatos de payload incorretos, erros de validação de '
    'esquemas, e conflitos de banco de dados são tratadas como má requisição do usuário.\n'
    'Exceções HTTP e SOAP são tratadas ou propagadas dependendo do código de retorno.';
  @override
  String get integrationProjectCalculatorDescription =>
    'Consome o web service público Calculator (http://www.dneonline.com/calculator.asmx).';
  @override
  String get integrationProjectCalculatorInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow implementa um endpoint dinâmico para atender às quatro operações oferecidas pelo '
    'web service.\n\n'

    'Os endpoints suportados são:\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/add;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/sub;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/mult;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/div.\n\n'

    '${_unsupportedEndpointsPhrase}\n'
    '${_unsupportedMethodsPhrase}\n\n'

    'Os parâmetros são enviados via URL no formato ?paramA=<value>&paramB=<value> e mapeados '
    'para a requisição SOAP:'

    '${Strings.widgetPlaceholder}\n'

    'Através do cabeçalho CamelHttpPath é possível identificar a operação e configurar os '
    'mapeamentos e ação SOAP correspondentes:'

    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectConversionsAndFtpDescription =>
    'Converte o payload de/para diferentes formatos e salva o resultado em um servidor FTP.';
  @override
  String get integrationProjectConversionsAndFtpInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow implementa as conversões mais comuns. O cabeçalho Content-Type define o formato '
    'de origem. O cabeçalho Accept define o formato de destino.\n\n'

    'As conversões suportadas são:\n'
    '▪ POST - text/csv para application/xml;\n'
    '▪ POST - application/json para application/xml;\n'
    '▪ POST - application/xml para text/csv;\n'
    '▪ POST - application/xml para application/json.\n\n'

    '${_unsupportedMethodsPhrase}\n'
    '${_unsupportedMediaTypesPhrase}\n'
    'Conversões não suportadas ${_badRequestComplement}.\n\n'

    'O resultado é salvo em um servidor FTP configurado via parâmetros externalizados.\n\n'

    'Para efeito de demonstração, as conversões entre os formatos XML e JSON incluem '
    'mapeamento de namespaces.\n\n'

    'JSON para XML:'

    '${Strings.widgetPlaceholder}'
    '${Strings.widgetPlaceholder}\n'

    'XML para JSON:'

    '${Strings.widgetPlaceholder}'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectSqlServerWithXsltDescription =>
    'Conecta a um banco de dados SQL Server via JDBC e executa operações básicas.';
  @override
  String get integrationProjectSqlServerWithXsltInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow utiliza XSLT para transformar uma requisição no formato JSON para o formato XML '
    'requerido pelo adaptador JDBC.\n\n'

    'As operações suportadas são:\n'
    '▪ GET - SELECT;\n'
    '▪ POST - INSERT;\n'
    '▪ PATCH - UPDATE.\n\n'

    '${_unsupportedMethodsPhrase}\n\n'

    'Através do cabeçalho CamelHttpMethod é possível configurar o esquema de validação do payload '
    'e o mapeamento XSLT correspondentes:'

    '${Strings.widgetPlaceholder}\n'

    'O exemplo a seguir demonstra a implementação da operação SELECT:'

    '${Strings.widgetPlaceholder}';
  @override
  String get fortlevExperienceTitle => 'Desenvolvimento de Aplicativo Flutter Mobile';
  @override
  String get fortlevExperienceDetail => 'BCI/Fortlev ▪ Junho/2021 - Julho/2023';
  @override
  String get fortlevExperienceInfo =>
    'Atuei no desenvolvimento do aplicativo "Mão Dupla" para gestão de Ordens de Frete para a '
    'companhia Fortlev.\n'
    'O aplicativo tem como objetivo automatizar as operações entre os gestores do setor de Carga '
    'e Transporte e Transportadoras e motoristas parceiros.\n\n'

    'Como Analista Desenvolvedor, também contribuí com levantamentos funcionais e técnicos em '
    'colaboração com os gestores e usuários.\n\n'

    'O aplicativo possui as principais funcionalidades:\n'
    '▪ Autenticação de usuários;\n'
    '▪ Gestão de Ordens de Frete e Notas Fiscais;\n'
    '▪ Reporte de incidentes durante o trajeto;\n'
    '▪ Push Notifications para eventos relevantes;\n'
    '▪ Offline First para permitir operações sem conexão;\n'
    '▪ Recursos de ajuda/suporte como Contatos, Dicas e FAQ.';
  @override
  String get smartNewExperienceTitle =>
     'Desenvolvimento de Aplicação Flutter Mobile/Web';
  @override
  String get smartNewExperienceInfo =>
    'Nos primeiros meses do ano, prestei consultoria para o desenvolvimento de um protótipo de '
    'uma aplicação mobile/web para a SmartNew, atuante no desenvolvimento de sistemas de '
    'monitoramento e gerenciamento de frotas. O objetivo era migrar a stack low-code em uso.';
  @override
  String get mobileGameExperienceTitle => 'Design/Desenvolvimento de Jogos Casuais';
  @override
  String get mobileGameExperienceInfo =>
    'Trabalhei em um projeto pessoal de um jogo casual 2D para dispositivos móveis.\n\n'

    'Desenvolvi pequenos protótipos durante a fase de concepção do projeto final utilizando '
    'Android SDK/Java com views nativas.\n\n'

    'A primeira versão do motor foi desenvolvida com Java/OpenGL ES 1.0. Uma segunda versão '
    'foi desenvolvida com OpenGL ES 2.0+.\n\n'

    'Para tornar o jogo multiplataforma, portei o código para C++ e fiz alguns experimentos '
    'com Unity/C#.';
  @override
  String get santriExperienceTitle => 'Desenvolvimento de Aplicação ERP';
  @override
  String get santriExperienceDetail => 'Santri Sistemas ▪ Outubro/2007 - Abril/2012';
  @override
  String get santriExperienceInfo =>
    'Na Santri Sistemas, contribuí para o desenvolvimento da aplicação cliente/servidor ADM '
    'utilizando RAD Studio (Delphi) e banco de dados Oracle com SQL/PL SQL.\n\n'

    'Meu papel consistia em analisar, especificar e implementar as demandas dos clientes sob '
    'supervisão do Analista de Sistemas sênior.\n\n'

    'Como desenvolvedor mais experiente da equipe, minhas atribuições incluíam introduzir e '
    'auxiliar os novos membros com os padrões de desenvolvimento adotados. Também liderei uma '
    'pequena equipe por um curto período antes de deixar a empresa.';
  @override
  String get smallErpExperienceTitle => 'Desenvolvimento de Aplicação ERP';
  @override
  String get smallErpExperienceInfo =>
    'Desenvolvi uma pequena aplicação cliente/servidor utilizando RAD Studio (Delphi) e banco de '
    'dados MySQL para uma pequena loja de materiais para construção em minha cidade.\n\n'

    'Nesse projeto, pude aplicar os conhecimentos que adquiria na faculdade e estudos individuais '
    'do livro Dominando o Delphi ▪ A Bíblia.';
  @override
  String get educationTitle => 'Formação';
  @override
  String get educationUniversityTitle => 'Redes de Computadores';
  @override
  String get educationUniversityDetail => 'Faculdade Estácio de Sá ▪ 2006 - 2008';
  @override
  String get educationUniversityInfo =>
    'O curso abordou todos os fundamentos teóricos e práticos envolvidos em arquitetura de redes '
    'de computadores.\n\n'

    'Também incluiu: Sistemas Digitais, Sistemas Operacionais, Estrutura de Dados e Algoritmos, '
    'e uma introdução a linguagens de programação como C e Java.';
  @override
  String get coursesAndBooksTitle => 'Cursos e Livros Relevantes';
  @override
  String get coursesTitle => 'Cursos';
  @override
  String get booksTitle => 'Livros';
  @override
  String get bookDelphiBibleTitle => 'Dominando o Delphi ▪ A Bíblia';
  @override
  String get bookGoogleAndroidTitle =>
     'Google Android ▪ Aplicações Móveis com o Android SDK';
  @override
  String get courseOracleTitle => 'Guia Para os Exames de Certificação OCA/OCP Oracle';
  @override
  String get courseSapCloudIntegrationImmersionTitle => 'Imersão SAP Cloud Integration';
  @override
  String get courseSapCloudIntegrationImmersionDetail => 'Moovi Education ▪ 05/2025 ▪ 16 horas';
  @override
  String get verifyCertificate => 'Verificar certificado';
  @override
  String get languagesTitle => 'Idiomas';
  @override
  String get languagesInfo =>
    'Português\n'
    '▪ Nativo - '
    'Inglês\n'
    '▪ Leitura avançada\n'
    '▪ Escrita intermediária\n'
    '▪ Conversação técnica intermediária';
  @override
  String get availabilityTitle => 'Disponibilidade';
  @override
  String get availabilityInfo =>
    'Contrato Pessoa Jurídica (PREFERÍVEL)\n'
    '▪ Fixo\n'
    '▪ Hora - '
    'Contrato Pessoa Física - '
    'Somente remoto - '
    'Freelance';
}