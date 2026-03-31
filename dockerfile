#syntax=docker/dockerfile:1

FROM perl:5.40.1

WORKDIR /src/app/

COPY ./lib/ /src/app/lib/

CMD perl ./lib/main.pm
