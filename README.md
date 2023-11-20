# 50 Liralık Benzin

2017 yılında, senelerce önce viral olan bir video nedeniyle "Son 10 yılda 50 lira kaç litre benzin aldı?" sorusuna cevap aramıştım (Videonun bağlantısına sahip olan varsa, buraya eklemek isterim). Gerekli veriyi topladıktan sonra çıktıları o zaman hala aktif olan Twitter hesabında yayınlamış ve tartışmaya açmıştım.

Daha sonra, $/₺ kurunun 4.30'u aşmasıyla, 2018 yılında sonuçları güncelleyip Twitter hesabımdan bir kez daha paylaştım. Bu güncellemeden yaklaşık iki yıl sonra Şubat 2020'de hem veriyi hem de çıktılarımı güncelleme kararı aldım. Bu sayfanın devamındaki başlıklarda, veriyi nasıl derlediğimi, nasıl işlediğimi ve sonuçları detaylarıyla bulabilirsiniz.

## Veri

Pompa fiyatları için İstanbul ili, Şişli ilçesi için OPET'in aşağıdaki web-sitesinde yayınlamış olduğu kurşunsuz benzin ve motorin fiyatları temel alındı. [Ulaşmak için tıklayınız.](https://www.opet.com.tr/gecmis-tarihli-akaryakit-fiyatlari#istanbul) 5 Ocak 2007 ve 02 Şubat 2020 tarihleri arasındaki benzin fiyatlarını bu siteden derledim. Veri setini indirmek için [tıklayınız](https://github.com/kazimanil/50liralikbenzin/blob/master/HamVeri.csv).

Ayrıca hesaplamalara tarih boyutunu ve toplam kat edilen mesafeyi katabilmek için, tüketicinin belirli bir modeli tercih ettiği ve piyasaya sürülen her yeni satın aldığı varsayıldı. Bu çalışma için Volkswagen GOlf modelini tercih ettim. 100 km tüketimleri için aşağıdaki internet sitesinde Wolksvagen Golf 1.4 için belirtilen değerler temel alındı. Otoban ve şehir içi için ortaklaşa belirlenmiş bulunan "Combined" değerler seçildi. [Ulaşmak için tıklayınız.](https://www.autoevolution.com/volkswagen/golf-5-doors/)

* 2003 - 2008 aralığı için VOLKSWAGEN Golf V 5 Doors 1.4 TSI (122 HP) modeli (6.3 LT / 100 KM)
* 2008 - 2012 aralığı için VOLKSWAGEN Golf VI 5 Doors 1.4 TSI (122 HP) modeli (6.2 LT / 100 KM)
* 2012 - 2019 aralığı için VOLKSWAGEN Golf VII 5 Doors 1.4 TSI BlueMotion 6MT (125 HP) modeli (5.2 LT / 100 KM)
* 2019 ve sonrası için VOLKSWAGEN Golf VIII 5 Doors 1.5L TSI 6MT (130 HP) modeli (4.8 LT / 100 KM) [ (kaynak)[https://volkswagen.drive.place/golf/viii/group_hatchback_5d/617000] ]

## Sonuçlar

Aşağıda yayınlanacak ilk iki grafikte, turuncu kesikli çizgiler belirli bir tarihteki gerçek değerleri veriyor. Ancak Türkiye gibi hem ekonomik hem de siyasi gündemi yoğun bir ülkede bu değerlere odaklanmak doğru olmayabilir. Bu nedenle bir de eğilimi (trend) tespit etmeyi mümkün hale getiren pürüzsüzleştirme (Smoothing-Out) yöntemini veriye uyguladım. Bu yöntemin sonuçları ise turkuaz eğri ile yansıtılmaktadır.

İlk iki grafikteki bilgi bir araya getirildiğinde son 12 senede ciddi derece fakirleştiğimizi, TL'nin benzin alım gücünün 12 sene öncesine kıyasla yarıdan fazla azaldığını söylemek mümkün. Ya da, diğer bir ifade ile 50 liranın bizi götürebildiği mesafe ise 2007 yılında 300 kilometreye yakın iken günümüzde bu değer 140 kilometrenin hemen altındadır.

Ayrıca, özellikle 2007-2011 ve 2017-2019 yılları arasında fakirleşmenin ivme kazandığını ve bu ivmenin 2011 ile 2017 yılları arasında  ortadan kaybolduğunu söylemek mümkün.


![Kaç Litre Benzin Alabildik?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_1.jpeg)

![Kaç Kilometre Yol Gidebildik?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_2.jpeg)

Fiyatların yükseliyor oluşu ekonomi için bir sorun teşkil etse de, öngörülemiyor oluşu daha büyük bir sorun teşkil etmektedir. Bu nedenle son iki grafikte, senelik değişim adedi ve toplam zam miktarlarını kıyasladım. Yukarıda ivmenin arttığı yıllar olarak nitelendirdiğim yıllarda hem TL miktar hem de yapılan **güncelleme** tipi olarak, zamlar indirimlerin önüne geçmektedir. Bu da özellikle son yıllarda 2008deki kriz benzeri bir durgunluğun yaşandığının en temel kanıtıdır.

Son yıllarda maalesef, hem fiyatlarda önlemeyen bir yükseliş hem de belirsizlik hakimdir. Umuyorum ki, en kısa sürede, bu durum son bulacak ve ekonomimiz çok daha iyi bir duruma gelecektir.

![Senelik Değişim Adedi](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_3.jpeg)

![Senelik Zam Kıyaslaması (TL)](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_4.jpeg)
