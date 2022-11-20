# Devops

Docker-setup for å utvikle Phoenix-nettsiden fullstack fra pcen din

## Oppstart

### Krav

Last ned Docker:
**UDATERT**

 * Windows: [Docker Desktop](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
   - You need virtualization enabled on your system
   - You need 64-bit Windows 10 Pro, Enterprise, or Educational
   - Enable linux containers. You should be asked about this during setup.
   - Enable beta features
   - _For more information about Windows requirements, see [https://docs.docker.com/docker-for-windows/install/](https://docs.docker.com/docker-for-windows/install/)_
 * Macos: [Docker Dekstop](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)
 * Linux: Depends on distribution - look up what the Docker package is called in your package manager. Usually `docker`.

You also need docker-compose. On Windows and Macos, this should be bundled with Docker Desktop. On linux, you have to find out what the package name is yourself. It is usually something like `docker-compose`

### Running the application

`cd` into the `development` folder and run `docker-compose up`