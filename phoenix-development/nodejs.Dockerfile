FROM node:20

WORKDIR /srv/phoenix

ENTRYPOINT ["bash", "-c", "yarn dev"]