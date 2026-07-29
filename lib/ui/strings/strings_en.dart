import 'strings.dart';

class StringsEn extends Strings {
  final String _unsupportedEndpointsPhrase =
    'Unsupported endpoints return 404 (Not Found).';
  final String _unsupportedMethodsPhrase =
    'Unsupported methods return 405 (Method Not Allowed).';
  @override
  String get appName => 'Welcome to My Online Curriculum';
  @override
  String get longRoles =>
    'Flutter Developer\n'
    'SAP Integration Suite Developer';
  @override
  String get professionalSummaryTitle => 'Professional Summary';
  @override
  String get professionalSummaryInfo =>
    'Professional developer with over 15 years of experience working on client/server commercial '
    'applications (ERP), mobile applications for the Android platform, design/development of '
    'casual games, and cross-platform applications using the Flutter framework.';
  @override
  String get detailsTitle => 'Details';
  @override
  String get personalLocation => 'Brazil, GO';
  @override
  String get programmingSkillsTitle => 'Programming Skills';
  @override
  String get integrationSkillsTitle => 'Integration Skills';
  @override
  String get aboutAndExpectationsTitle => 'About Me and Expectations';
  @override
  String get aboutAndExpectationsInfo =>
    'A lover of digital illustration for games and passionate about the art of music.\n\n'

    'Always interested in learning more about any subject. When it comes to development, I '
    'prioritize sources such as books, official documentation, and articles.\n\n'

    'I always strive to do my best in everything I do, maintaining a high level of commitment '
    'to the quality of the final product. I value readability and performance, and that\'s why I '
    'chose Flutter as my cross-platform development framework.\n\n'

    'I hope to have the opportunity to participate in application development and/or system '
    'integration projects based on my demonstrated technical skills. While contributing my '
    'knowledge, I also hope to improve personally and technically alongside my teammates.';
  @override
  String get madeWithFlutter => 'Made with Flutter  🩵';
  @override
  String get language => 'Language';
  @override
  String get experienceTitle => 'Experience';
  @override
  String get sapIntegrationSuiteLearningJourneyTitle =>
    'SAP Integration Suite Learning Journey';
  @override
  String get sapIntegrationSuiteLearningJourneyDetail => 'Since 2023';
  @override
  String get integrationProjectApimProxyDescription =>
    'Allow end-user applications to connect to Cloud Integration using a Firebase JWT token.';
  @override
  String get integrationProjectApimProxyInfo =>
    '${Strings.widgetPlaceholder}'

    'End-user applications must authenticate against backend systems with end-user credentials, '
    'which allow the backend system to trust and identify the user making the request.\n\n'

    'This API Management Proxy applies the following policies to trust and identify an end-user '
    'authenticated with the Google Cloud Firebase Authentication service:'

    '${Strings.title('▪ GetFirebaseJwtClaims', false)}'
    'This KeyValueMapOperations policy reads the issuer and audience claims configured for the '
    'Firebase application.'

    '${Strings.title('▪ LookupGoogleApisJwksCache')}'
    'This LookupCache policy reads the Google APIs’ public keys previously fetched and cached.'

    '${Strings.title('▪ FetchGoogleApisJwks')}'
    'This ServiceCallout policy fetches the Google APIs’ public keys if there is no valid cache.'

    '${Strings.title('▪ ExtractGoogleApisJwksMaxAge')}'
    'This ExtractVariables policy extracts the max-age value from the Cache-Control header from '
    'the previous policy response. This value is used to determine the expiration time of the '
    'Google APIs\’ public keys cache.'

    '${Strings.title('▪ PopulateGoogleApisJwksCache')}'
    'This PopulateCache policy populates a cache with the fetched Google APIs\' public keys.'

    '${Strings.title('▪ VerifyFirebaseJwt')}'
    'This VerifyJWT policy verifies the Firebase JWT token from the end-user application request. '
    'It validates the claims and signature against the Google APIs\' public keys.'

    '${Strings.title('▪ SetHeaders')}'
    'This AssignMessage policy adds the User-ID header with the end-user ID extracted from the '
    'Firebase JWT token and removes the Authorization header before forwarding the request to '
    'Cloud Integration.';
  @override
  String get integrationProjectIFlowProxyDescription =>
    'Validate incoming requests and manage iFlow routing.';
  @override
  String get integrationProjectIFlowProxyInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow is the entry point for all iFlows in the package. It performs the following '
    'operations:\n'
    '▪ Common request settings validation;\n'
    '▪ Destination iFlow routing via ProcessDirect based on the request path;\n'
    '▪ Exceptions logging;\n'
    '▪ Sensitive headers cleaning.'

    '${Strings.title('Request Settings Validation')}'
    'For each route, the following settings are validated:\n'
    '▪ Allowed HTTP methods;\n'
    '▪ Supported paths;\n'
    '▪ Supported query parameters and their format;\n'
    '▪ Public requests rejection (some iFlows cannot be called by end-user applications via the '
    'API Management Proxy).'

    '${Strings.widgetPlaceholder}'

    '${Strings.title('Sensitive Headers Cleaning')}'
    'Some sensitive headers generated during iFlows processing, such as Authorization, custom '
    'headers using the _* naming pattern, auto-generated headers by DataStore steps, and others, '
    'are removed before returning to the Sender.';
  @override
  String get integrationProjectExceptionHandlerDescription =>
    'Log the message\'s data in the Message Processing Log and send alert emails.';
  @override
  String get integrationProjectExceptionHandlerInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow is responsible for exception handling of all iFlows in the package.\n\n'

    'Logging and email sending are configured (enabled/disabled) via externalized parameters, '
    'as well as the SMTP settings.\n\n'

    'The following script, called by each iFlow, handles all the mapped exceptions. Unhandled '
    'exceptions are propagated to the Proxy iFlow, where this iFlow catches them:'

    '${Strings.widgetPlaceholder}'

    'Common exceptions related to incorrect payload formats, schema validation errors, and '
    'database conflicts are handled as user-side bad requests.\n'
    'HTTP and SOAP exceptions are handled or propagated depending on the response code.';
  @override
  String get integrationProjectOAuth2TokensHandlerDescription =>
    'Generate, cache, and manage the expiration time of OAuth2 tokens.';
  @override
  String get integrationProjectOAuth2TokensHandlerInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow handles OAuth2 tokens\' lifecycle for the following scenarios:\n'
    '▪ OAuth2 servers that require Client Credentials and mTLS as authentication for token '
    'generation;\n'
    '▪ Google APIs OAuth2 servers that require a signed JWT as authentication for token '
    'generation.'

    '${Strings.title('Client Credentials and mTLS')}'
    'At the moment of this solution\'s development, the HTTP Receiver adapter does not allow '
    'configuring the OAuth2 Client Credentials and Client Certificate authentication methods '
    'simultaneously.\n'
    'The same limitation applies to the official SDK\'s built-in function for handling OAuth2 '
    'tokens\' lifecycle.\n'
    'This solution generates a request body from a deployed OAuth2 Client Credentials artifact '
    'and configures the HTTP Receiver adapter with the Client Certificate authentication method.'

    '${Strings.title('Google APIs OAuth2 with Signed JWT')}'
    'This solution generates a request body with the signed JWT using a deployed Google APIs '
    'Service Key that contains the private key.\n\n'

    'The following script contains the main methods for the whole solution:'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectGoogleFirebaseAuthUsersDescription =>
    'Manage end-users in the Google Firebase Authentication service.';
  @override
  String get integrationProjectGoogleFirebaseAuthUsersInfo =>
    'This solution is intended to replicate users from the SAP system (e.g., Business Partners) '
    'to the Google Firebase Authentication service so they can sign in to end-user applications '
    'that implement the Firebase Authentication solution.\n\n'

    'It is composed of the following iFlows:'

    '${Strings.title('▪ Google Firebase Auth Users', false)}'
    '${Strings.widgetPlaceholder}'

    'This is the main iFlow which performs the actual integration. It supports the following '
    'operations:\n'
    '▪ POST - creates a new user by providing its ID and email;\n'
    '▪ PATCH - updates a user by providing its ID, email, and status (enabled/disabled);\n'
    '▪ DELETE - deletes a user by providing its ID.'

    '${Strings.title('▪ Google Firebase Auth Users Async')}'
    '${Strings.widgetPlaceholder}'

    'This iFlow processes the main iFlow asynchronously by storing the request in a JMS queue and '
    'returning immediately to the Sender.\n'
    'The actual integration is processed later by another iFlow.'

    '${Strings.title('▪ Google Firebase Auth Users Async Queue')}'
    '${Strings.widgetPlaceholder}'

    'This iFlow processes the JMS queue of asynchronous requests, calls the main iFlow, and '
    'stores the response for later consumption.'

    '${Strings.title('▪ Google Firebase Auth Users Async Response')}'
    '${Strings.widgetPlaceholder}'

    'This iFlow returns all pending stored responses and clears them.';
  @override
  String get integrationProjectInterStatementOauth2MtlsDescription =>
    'Get a bank statement by period from my Inter Bank enterprise account.';
  @override
  String get integrationProjectInterStatementOauth2MtlsInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow implements an API integration that requires OAuth2 authorization and a Mutual TLS '
    'handshake.\n'
    'The iFlow OAuth2 Tokens Handler sets the Authorization header. mTLS is configured directly '
    'in the HTTP Receiver adapter using the Client Certificate authentication method.\n\n'

    'The Sender makes a GET request with the period via URL query parameters.';
  @override
  String get integrationProjectSqlServerWithXsltDescription =>
    'Connect to a SQL Server database via JDBC and perform basic operations.';
  @override
  String get integrationProjectSqlServerWithXsltInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow uses XSLT to transform a JSON request into the XML format required by the '
    'JDBC adapter.\n\n'

    'The supported operations are:\n'
    '▪ GET - SELECT;\n'
    '▪ POST - INSERT;\n'
    '▪ PATCH - UPDATE.\n\n'

    'By reading the CamelHttpMethod header, it is possible to configure the associated payload '
    'validation schema and the XSLT mapping:'

    '${Strings.widgetPlaceholder}\n'

    'The following example demonstrates the implementation of the SELECT operation:'

    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectConversionsAndFtpDescription =>
    'Convert the payload from/to different formats and save the result to an FTP server.';
  @override
  String get integrationProjectConversionsAndFtpInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow implements the most common conversions. The Content-Type header defines the '
    'source format. The Accept header defines the target format.\n\n'

    'The supported conversions are:\n'
    '▪ POST - text/csv to application/xml;\n'
    '▪ POST - application/json to application/xml;\n'
    '▪ POST - application/xml to text/csv;\n'
    '▪ POST - application/xml to application/json.\n\n'

    'The result is saved to an FTP server configured via externalized parameters.\n\n'

    'For demonstration purposes, the conversions between XML and JSON formats include namespace '
    'mappings:'

    '${Strings.title('▪ JSON to XML', false)}'
    '${Strings.widgetPlaceholder}'
    '${Strings.widgetPlaceholder}'

    '${Strings.title('▪ XML to JSON')}'
    '${Strings.widgetPlaceholder}'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectCalculatorDescription =>
    'Consume the public web service Calculator (http://www.dneonline.com/calculator.asmx).';
  @override
  String get integrationProjectCalculatorInfo =>
    '${Strings.widgetPlaceholder}'

    'This iFlow implements a dynamic endpoint to support the four operations offered by the web '
    'service.\n\n'

    'The supported endpoints are:\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/add;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/sub;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/mult;\n'
    '▪ GET - https://<service-instance-URL>/http/<iflow-endpoint>/div.\n\n'

    '${_unsupportedEndpointsPhrase}\n'
    '${_unsupportedMethodsPhrase}\n\n'

    'The parameters are sent via URL in the format ?paramA=<value>&paramB=<value> and mapped '
    'to the SOAP request:'

    '${Strings.widgetPlaceholder}\n'

    'By reading the CamelHttpPath header, it is possible to identify the operation and configure '
    'the associated mappings and SOAP action:'

    '${Strings.widgetPlaceholder}';
  @override
  String get fortlevExperienceTitle => 'Flutter Mobile Application Development';
  @override
  String get fortlevExperienceDetail => 'BCI/Fortlev ▪ June/2021 - July/2023';
  @override
  String get fortlevExperienceInfo =>
    'I worked on the development of the "Mão Dupla" application for Freight Order management '
    'for the Fortlev company.\n'
    'The application aims to automate operations between the Freight and Transportation sector '
    'managers and Carrier and driver partners.\n\n'

    'As a Developer Analyst, I also contributed to functional and technical requirements '
    'gathering in collaboration with managers and users.\n\n'

    'The application has the main features:\n'
    '▪ User authentication;\n'
    '▪ Freight Orders and Invoices management;\n'
    '▪ Incident reporting during the journey;\n'
    '▪ Push Notifications for relevant events;\n'
    '▪ Offline First for no connection operations;\n'
    '▪ Help/support features such as Contacts, Tips, and FAQ.';
  @override
  String get smartNewExperienceTitle => 'Flutter Mobile/Web Application Development';
  @override
  String get smartNewExperienceInfo =>
    'In the first months of the year, I provided consulting services for the development of a '
    'mobile/web application prototype for SmartNew, which operates by developing fleet monitoring '
    'and management systems. The goal was to migrate the existing low-code stack.';
  @override
  String get mobileGameExperienceTitle => 'Design/Development of Casual Games';
  @override
  String get mobileGameExperienceInfo =>
    'I worked on a personal project of a 2D casual game for mobile devices.\n\n'

    'I developed small prototypes during the conception phase of the final project using Android '
    'SDK/Java with native views.\n\n'

    'The first version of the engine was developed using Java/OpenGL ES 1.0. A second version '
    'was developed using OpenGL ES 2.0.\n\n'

    'To turn the game multiplatform, I converted the code to C++. I also made some experiments '
    'with Unity/C#.';
  @override
  String get santriExperienceTitle => 'ERP Application Development';
  @override
  String get santriExperienceDetail => 'Santri Systems ▪ October/2007 - April/2012';
  @override
  String get santriExperienceInfo =>
    'At Santri Systems, I contributed to the development of the client/server application ADM '
    'using RAD Studio (Delphi) and the Oracle database with SQL/PL SQL.\n\n'

    'My role consisted of analyzing, specifying, and implementing the customer\’s requirements '
    'under the supervision of the Senior Systems Analyst.\n\n'

    'As the most experienced developer on the team, my responsibilities included introducing and '
    'assisting new members with the adopted development standards. I also led a small team for a '
    'short period before leaving the company.';
  @override
  String get smallErpExperienceTitle => 'ERP Application Development';
  @override
  String get smallErpExperienceInfo =>
    'I developed a small client/server application using RAD Studio (Delphi) and the MySQL '
    'database for a little building materials store in my city.\n\n'

    'In this project, I was able to apply the knowledge I was acquiring in my graduation and '
    'through individual studies of the book Mastering Delphi ▪ The Bible.';
  @override
  String get educationTitle => 'Education';
  @override
  String get educationUniversityTitle => 'Computer Networks';
  @override
  String get educationUniversityDetail => 'Estácio de Sá University ▪ 2006 - 2008';
  @override
  String get educationUniversityInfo =>
    'The course covered all the theoretical and practical fundamentals involved in computer '
    'network architecture.\n\n'

    'It also included: Digital Systems, Operating Systems, Data Structure & Algorithms, and an '
    'introduction to programming languages such as C and Java.';
  @override
  String get coursesAndBooksTitle => 'Relevant Courses and Books';
  @override
  String get coursesTitle => 'Courses';
  @override
  String get booksTitle => 'Books';
  @override
  String get bookDelphiBibleTitle => 'Mastering Delphi ▪ The Bible';
  @override
  String get bookGoogleAndroidTitle =>
    'Google Android ▪ Mobile Applications with the Android SDK';
  @override
  String get courseOracleTitle => 'Oracle OCA/OCP Certification Exams Guide';
  @override
  String get courseSapCloudIntegrationImmersionTitle => 'SAP Cloud Integration Immersion';
  @override
  String get courseSapCloudIntegrationImmersionDetail => 'Moovi Education ▪ 05/2025 ▪ 16 hours';
  @override
  String get verifyCertificate => 'Verify certificate';
  @override
  String get languagesTitle => 'Languages';
  @override
  String get languagesInfo =>
    'Portuguese\n'
    '▪ Native - '
    'English\n'
    '▪ Advanced reading\n'
    '▪ Intermediate writing\n'
    '▪ Intermediate technical conversation';
  @override
  String get availabilityTitle => 'Availability';
  @override
  String get availabilityInfo =>
    'Independent contract (PREFERABLE)\n'
    '▪ Fixed\n'
    '▪ Hour - '
    'Employee contract - '
    'Remote only - '
    'Freelance';
}