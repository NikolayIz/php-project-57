# Используем PHP 8.2 CLI
FROM php:8.2-cli

# Устанавливаем зависимости для Postgres, Zip, Node.js
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    unzip \
    curl \
    git \
    && docker-php-ext-install pdo pdo_pgsql zip

# Устанавливаем Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Устанавливаем Node.js и npm
RUN curl -sL https://deb.nodesource.com/setup_24.x | bash - \
    && apt-get install -y nodejs

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем проект в контейнер
COPY . .

# Устанавливаем PHP зависимости
RUN composer install --no-dev --optimize-autoloader

# Устанавливаем JS зависимости и собираем фронтенд
RUN npm ci
RUN npm run build

# Копируем .env и генерируем ключ приложения (если нужен для деплоя)
RUN cp .env.example .env && php artisan key:generate

# Экспонируем порт
EXPOSE 8000

# Команда для запуска приложения
CMD ["bash", "-c", "php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=$PORT"]
