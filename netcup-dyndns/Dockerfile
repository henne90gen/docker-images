FROM php:8.1.3-cli-alpine

RUN mkdir /app
WORKDIR /app

COPY . /app
RUN mv config.env.php config.php

CMD [ "php", "./update.php" ]
