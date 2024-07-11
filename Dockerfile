# Указываем базовый образ с Python
FROM python:3.9-slim

# Устанавливаем необходимые зависимости для WeasyPrint
RUN apt-get update && apt-get install -y \
    libpango-1.0-0 \
    libcairo2 \
    libffi-dev \
    shared-mime-info \
    fonts-liberation \
    libjpeg62-turbo \
    liblcms2-2 \
    libtiff-dev \
    libopenjp2-7 \
    libpangocairo-1.0-0 \
    libpangoft2-1.0-0 \
    libharfbuzz0b \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Создаем рабочую директорию
WORKDIR /app

# Копируем файлы в контейнер
COPY requirements.txt requirements.txt
COPY app app

# Устанавливаем Python-зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Указываем команду по умолчанию
CMD ["python", "app/generate_invoice.py"]
