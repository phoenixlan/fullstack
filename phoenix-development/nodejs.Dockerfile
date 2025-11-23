FROM node:24

WORKDIR /srv/phoenix

ENTRYPOINT ["bash", "-c", "yarn dev"]