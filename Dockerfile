# 1. Aşama: Temel imajı belirle 
# Docker Hub'daki kendi özel temel imajımızı kullanıyoruz.
FROM aliyasirusta/test:v1.0 

# 2. Aşama: Çalışma dizinini belirle
# Konteyner içinde uygulamanın çalışacağı dizini /app olarak belirliyor.
WORKDIR /app 

# 3. Aşama: package.json ve package-lock.json dosyalarını çalışma dizinine kopyala
# Bağımlılık dosyalarını kopyalayarak npm install adımının önbelleğe alınmasını sağlıyor.
COPY package*.json ./ 

# 4. Aşama: Uygulama bağımlılıklarını kur
# package.json dosyasındaki tüm Node.js bağımlılıklarını yüklüyor.
RUN npm install

# 6. Aşama: Uygulamanın dinleyeceği portu belirt
# Uygulamanın 3000 numaralı port üzerinden dışarıya hizmet vereceğini belirtiyor.
EXPOSE 3000 

# 7. Aşama: Container başlatıldığında çalışacak komutu belirle
# Konteyner başlatıldığında çalışacak varsayılan komutu (Node.js uygulamasını başlatma) belirliyor.
CMD ["node", "index.js"] 