FROM ubuntu

COPY ./app /Projeto

# nome: teste
# link: https://hub.docker.com/repository/docker/werbeth066/lalala

# --------[Comandos para rodar o laravel]--------
# sudo docker image build . -t app:laravel
# sudo docker run -p 8081:80 app:laravel

RUN apt update
# Evita erro que eu ainda não entendi
RUN apt-get install -y tzdata
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y -u ppa:certbot/certbot
RUN apt-get install -y certbot

# Instala e roda o apache php e dependencias
RUN apt-get install -y apache2 php libapache2-mod-php -y
RUN apt install -y php libapache2-mod-php php-mbstring php-xmlrpc php-soap php-gd php-xml php-cli php-zip php-bcmath php-tokenizer php-json php-pear 
RUN service apache2 restart
RUN curl -sS https://getcomposer.org/installer | php

# Entra na pasta onde fica o projeto
WORKDIR /Projeto/Projeto

# Executa o comando para rodar o laravel
ENTRYPOINT ["php", "artisan", "serve", "--host", "0.0.0.0"]