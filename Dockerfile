
# 1. Aşama: Temel imajı belirle (Node.js 18 sürümü, Alpine Linux tabanlı daha küçük boyutlu imaj)
FROM node:18-alpine

# 2. Aşama: Çalışma dizinini belirle
# Bu, container içindeki /app dizini olacak
WORKDIR /app

# 3. Aşama: package.json ve package-lock.json dosyalarını çalışma dizinine kopyala
# Bu adım, node_modules'ın cache'lenmesini sağlar.
# Sadece bağımlılıklar değiştiğinde bu katman yeniden oluşturulur.
COPY package*.json ./

# 4. Aşama: Uygulama bağımlılıklarını kur
RUN npm install

# 5. Aşama: Uygulamanın geri kalan kodunu çalışma dizinine kopyala
# Bu adım, uygulama kodunda bir değişiklik olduğunda çalışır.
COPY . .

# 6. Aşama: Uygulamanın dinleyeceği portu belirt
# Bu sadece belgelendirme amaçlıdır, gerçek port eşleştirmesi `docker run` komutuyla yapılır.
EXPOSE 3000

# 7. Aşama: Container başlatıldığında çalışacak komutu belirle
CMD ["node", "index.js"]