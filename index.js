const express = require('express');
const { createClient } = require('redis');
const app = express();

const port = 3000;

const redisClient = createClient({
  url: 'redis://redis:6379' 
});

redisClient.on('error', err => console.log('Redis Client Hatası:', err));

app.get('/', async (req, res) => {
  
  if (!redisClient.isReady) {
    console.log('Redis bağlantısı kuruluyor...');
    await redisClient.connect(); 
    console.log('Redis bağlantısı kuruldu.');
  }
 
  let visits = parseInt(await redisClient.get('visits') || 0);

  visits++;

  await redisClient.set('visits', visits);

  res.send(`Merhaba Docker! Bu web sayfası ${visits} kez ziyaret edildi.`);
});

app.listen(port, () => { 
  console.log(`Uygulama http://localhost:${port} adresinde calisiyor.`);
  console.log('Redis bağlantısı bekleniyor...'); 
});