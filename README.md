# 50 Liralık Benzin

2017 yılında, senelerce önce viral olan bir video ile "50 lira son 10 yılda kaç litre benzin aldı?" şeklinde bir veri hazırlama fikrini ortaya atmıştım (Videonun bağlantısını bulamadım, bulan söylesein ekleyeyim). 2018 yılında $/₺ kurunun 4.30'u aşmasıyla yayınladığım ilk güncellemeden yaklaşık iki yıl sonra görece durağan geçen bir kur döneminin ardından Şubat 2020'de ikinci güncellemeyi yayınlama kararı aldım. Aşağıdaki sekmelerde veriyi nasıl derlediğimi, nasıl işlediğimi ve sonuçları detaylarıyla bulabilirsiniz.

## Veri

Pompa fiyatları için İstanbul ili , Şişli ilçesi için OPET'in aşağıdaki web-sitesinde yayınlamış olduğu kurşunsuz benzin ve motorin fiyatları temel alındı. [Ulaşmak için tıklayınız.](https://www.opet.com.tr/gecmis-tarihli-akaryakit-fiyatlari#istanbul)

100 km tüketimleri için aşağıdaki internet sitesinde Wolksvagen Golf 1.4 için belirtilen değerler temel alındı. Otoban ve şehir içi için ortaklaşa belirlenmiş bulunan "Combined" değerler seçildi. [Ulaşmak için tıklayınız.](https://www.autoevolution.com/volkswagen/golf-5-doors/)

* 2003 - 2008 aralığı için VOLKSWAGEN Golf V 5 Doors 1.4 TSI (122 HP) modeli
* 2008 - 2012 aralığı için VOLKSWAGEN Golf VI 5 Doors 1.4 TSI (122 HP) modeli 
* 2012 - 2017 aralığı için VOLKSWAGEN Golf VII 5 Doors 1.4 TSI BlueMotion 6MT (125 HP) modeli
* 2017 ve sonrası için VOLKSWAGEN Golf VII 5 Doors 1.4 TSI 6MT (125 HP) modeli

Not: 2019 ve sonrası için VOLKSWAGEN Golf VIII 5 Doors 1.5L TSI 6MT (130 HP) modeli piyasaya sürülmüş olsa da, henüz yakıt kullanım değerleri yayınlanmadığı için çalışmaya dahil edemedim.

## Kapsam
05-01-2007 ve 02-02-2020 arası benzin fiyatı verisi bulunmaktadır. Ayrıca, hesaplamalara tarih boyutunu katabilmek için tüketicinin her yeni model ile beraber arabasını yenilediği varsayılmaktadır.

## Grafik
Kesikli Siyah Çizgiler: Belirli bir tarihteki gerçek değeri veriyor.

Kırmızı Düz Çizgi: GAM Smoothing-Out yöntemiyle hesaplanmış seyir. Bu hesap ile eğilimi (trend) tespit etmek mümkün hâle geliyor.

## Sonuçlar

![Kaç Litre Benzin Alabildik?](https://github.com/kazimanil/50liralikbenzin/blob/master/KacLitre.jpeg)

![Kaç Kilometre Yol Gidebildik?](https://github.com/kazimanil/50liralikbenzin/blob/master/KacKilometre.jpeg)

![Senelik Değişim Adedi](https://github.com/kazimanil/50liralikbenzin/blob/master/Degisimler_(Senelik_Adet).jpeg)

![Senelik Zam Kıyaslaması (TL)](https://github.com/kazimanil/50liralikbenzin/blob/master/Degisimler_(Senelik_TL).jpeg)

# Güncellemeler

## Güncelleme (2020-02-02)
Son iki yılda kur inanılmaz dalgalandı. Benzin fiyatları da onu takip etti. Tabii ki bu dalgalanma siyasi sonuçlar da doğurdu. Bu verileri hazırlarken *T A M A M mı?* diye sormuşum. Cumhurbaşkanlığı seçimini tamam mı? diyenler kaybetse de, İstanbul seçimini kazandılar. Ek olarak;

* Rapora görselleri ekledim.
* Temaları güncelledim.

## Güncelleme (2018-05-08)
8 Mayıs 2018 tarihi itibariyle $/₺ kurunun 4.30 değerini aşması sonucu bu çalışmayı güncelleme ihtiyacı hissettim.
Yukarıdaki belirlediğim kurallar baki kalmak üzere 01-12-2017 ile 08-05-2018 tarihleri arası benzin verilerini yine aynı kaynaktan derledim.
Ek olarak;

* Bu güncelleme sonrasında, derlediğim benzin fiyatları verisini de paylaşıma açıyorum, neden daha önce açmamış isem zaten??
* Temaları güncelledim ve temamı oluşturan dosyayı yükledim.
* Doğru smoothing-out tekniğini kullanıp, kullanmadığımı sorguladım. Veriye daha iyi uyduğunu düşündüğüm için **GAM yöntemini terkettim**. Onun yerine zaman ile km ve zaman ile lt arasında **4. dereceden bir ilişki olduğunu varsayarak** yeni grafikleri çizdirdim.
* 2018 yılının toplam zam miktarını değerlendirirken; **sadece 5 aylık veriyi** dahil ettiğimi göz önünde bulundurunuz.

Eskiden görseller için verdiğim bu bağlantılar maalesef twitter hesabımı kapamam nedeniyle artık erişilemez durumdadır. Talep edildiği takdirde bu veriyi de paylaşabilirim.
Görseller için: [2017AralıkVersiyonu](https://twitter.com/kazimanil/status/936331512638791681), [2018MayısVersiyonu](https://twitter.com/kazimanil/status/993926671752417280).