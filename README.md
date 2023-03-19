# PhoenixLAN Fullstack utvikling

Docker-setup for å sette opp ett lokalt fullstack environment for å utvikle de ulike Phoenix tjenestene fra pcen din.

# Oppstarts-Krav

- [Git](https://git-scm.com/download/win)
- **Opsjonelt:**[ GitHub CLI](https://cli.github.com/) (for å lett sette opp git ssh)
- Du trenger Docker og tilhørende docker verktøyer

  - Last ned [Docker Desktop](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)
- Last ned [node](https://nodejs.org/en) og [yarn](https://classic.yarnpkg.com/lang/en/docs/install/#debian-stable)

### Oppsett

- (Mye av denne prosessen vil forhåpentligvis automatiseres i fremtiden)
- Lag en prosjektmappe (her kalt phoenixbackend)
- Git clone følgende repoer (med ssh) inne i denne mappen

  - git@github.com:phoenixlan/fullstack.git
  - git@github.com:phoenixlan/phoenixapi-v1.git
  - git@github.com:phoenixlan/phoenixcheckin-v1.git
  - git@github.com:phoenixlan/phoenixcrew-v1.git
  - git@github.com:phoenixlan/phoenixinfo-v1.git
  - git@github.com:phoenixlan/phoenixjs.git
  - git@github.com:phoenixlan/phoenixmain-v1.git
  - git@github.com:phoenixlan/phoenixparticipate-v1.git
- Du skal da ende opp med denne filstrukturen:

  ```
  +---phoenixbackend
  |   +---fullstack
  |   +---phoenixapi-v1
  |   +---phoenixcheckin-v1
  |   +---phoenixcrew-v1
  |   +---phoenixinfo-v1
  |   +---phoenixjs
  |   +---phoenixmain-v1
  |   +---phoenixparticipate-v1
  ```
- Legg til følgende filer i `fullstack/phoenix-development` mappen:

  ```
  // .env
  JWT_SECRET="test123!"

  VIPPS_CLIENT_ID=
  VIPPS_CLIENT_SECRET==
  VIPPS_SUBSCRIPTION_KEY=
  VIPPS_CALLBACK_URL=https://api.test.phoenix.no/hooks/vipps
  VIPPS_MERCHANT_SERIAL_NUMBER=

  STRIPE_API_KEY=
  STRIPE_ENDPOINT_SECRET=

  ```
  ```
  // .db_env
  POSTGRES_PASSWORD=example
  POSTGRES_USER=phoenix
  DB_HOST=db

  ```
  ```
  // .mailgun_env
  MAILGUN_DOMAIN= 
  MAILGUN_API= 
  MAILGUN_API_KEY= 
  MAILGUN_FROM_EMAIL= 

  ```
- Kjør `yarn` i alle node repoene for å installere de nødvendige node modulene.

  - (I phoenixjs må du også kjøre `yarn build`)
- Gå til `/fullstack/phoenix-development` og kjør `docker-compose up` for å starte docker containerne.
- Fullstack development enviornment skal da være oppe og du kan så gå til f.eks. [http://dev.phoenixlan.no:3000/]()
