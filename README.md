# 50 Liralık Benzin

2017 yılında, seneler önce viral olan bir video nedeniyle "Son 10 yılda 50 lira kaç litre benzin aldı?" sorusuna cevap aramıştım. Videonun bağlantısına sahip olan varsa, buraya eklemek isterim. Video viral olduktan sonra ve "50 liralık almak" deyim haline geldikten sonra nedense video internetten kayboldu! 2017 yılında, verileri indirip o zamanlar aktif olan Twitter hesabımda sonuçlarını tartışmaya açmıştım.

Daha sonra, $/₺ kurunun 4.30'u aşmasıyla, 2018 yılında sonuçları güncelleyip Twitter hesabımdan bir kez daha paylaştım. Bu güncellemeden yaklaşık iki yıl sonra Şubat 2020'de hem veriyi hem de çıktılarımı güncelleme kararı aldım. 2020 yılı çıktılarıma [buradan](https://github.com/kazimanil/50liralikbenzin/2020) ulaşabilirsiniz.

2020'den bu yana enflasyondaki yüksek artış hızıyla beraber, benzer çalışmalar gündeme geldi ve tartışmaya açıldı. [Tantuni endeksi](https://twitter.com/oguzergin/status/1504793264637030403) bu çalışmalar arasında bilinen örneklerdendir. 2024 yılının başında son bir kez bu veriyi güncelleme kararı aldım. Bu sayfanın kalanında veri toplama yöntemlerim ve çıktılarım hakkında ayrıntılı bilgiler bulacaksınız. 

# Veri

Pompa fiyatları için İstanbul ili, Şişli ilçesi için OPET'in web-sitesinde yayınlamış olduğu kurşunsuz benzin ve motorin fiyatları temel aldım. [Ulaşmak için tıklayınız.](https://www.opet.com.tr/gecmis-tarihli-akaryakit-fiyatlari#istanbul) 5 Ocak 2007 ve 31 Aralık 2023 tarihleri arasındaki benzin fiyatlarını bu siteden farklı tarihlerde derledim. Veri setini indirmek için [tıklayınız](https://github.com/kazimanil/50liralikbenzin/blob/master/HamVeri.csv).

Ayrıca hesaplamalara tarih boyutunu ve toplam kat edilen mesafeyi katabilmek için, tüketicinin belirli bir modeli tercih ettiği ve piyasaya sürülen her yeni satın aldığı varsaydım. Bu çalışma için, çalışmaya başladığım yıllarda orta sınıf için ulaşabilir bir araç olan, Volkswagen markasının Golf modelini tercih ettim. 100 km tüketimleri için aşağıda paylaştığım kaynakların Wolksvagen Golf 1.4 için yayınladığı değerler temel aldım. Otoban ve şehir içi için ortaklaşa belirlenmiş bulunan "Combined" değerleri kolaylık açısından seçtim. 

* 2003 - 2008 aralığı için VOLKSWAGEN Golf V 5 Doors 1.4 TSI (122 HP) modeli (6.3 LT / 100 KM) [(kaynak)](https://www.autoevolution.com/volkswagen/golf-5-doors/)
* 2008 - 2012 aralığı için VOLKSWAGEN Golf VI 5 Doors 1.4 TSI (122 HP) modeli (6.2 LT / 100 KM) [(kaynak)](https://www.autoevolution.com/volkswagen/golf-5-doors/)
* 2012 - 2019 aralığı için VOLKSWAGEN Golf VII 5 Doors 1.4 TSI BlueMotion 6MT (125 HP) modeli (5.2 LT / 100 KM) [(kaynak)](https://www.autoevolution.com/volkswagen/golf-5-doors/)
* 2019 ve sonrası için VOLKSWAGEN Golf VIII 5 Doors 1.5L TSI 6MT (130 HP) modeli (4.8 LT / 100 KM) [(kaynak)](https://volkswagen.drive.place/golf/viii/group_hatchback_5d/617000)

# Çıktılar

![Kaç Litre Benzin Alabildik?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_1.jpeg)

![Kaç KM yol gidebildik?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_2.jpeg)

![Senelik Zam ve İndirim Adetleri?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_3.jpeg)

![2020 ve Öncesi Senelik Değişim](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_4.jpeg)

![2020 ve Sonrası Senelik Değişim](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_4b.jpeg)

![Senelik Değişim](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_5.jpeg)

![Gösterge Kıyası?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_6.jpeg)

# Değerlendirme
