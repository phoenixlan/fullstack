FROM node:16

WORKDIR /srv/phoenix

ENTRYPOINT ["bash", "-c", "yarn dev"]