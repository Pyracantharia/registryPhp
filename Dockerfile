# Utiliser l'image PHP ZTS
FROM php:8.4.1-zts-bookworm

# Installer les extensions PHP nécessaires (par exemple, pour un serveur web)
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip

# Installer un serveur web (par exemple, Apache ou Nginx)
RUN apt-get install -y apache2 libapache2-mod-php

# Copier votre application dans le répertoire web
COPY . /var/www/html/

# Exposer le port 80
EXPOSE 80

# Démarrer Apache en mode premier plan
CMD ["apache2-foreground"]
