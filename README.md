# 50 Liralık Benzin

2017 yılında, seneler önce viral olan bir video nedeniyle "Son 10 yılda 50 lira kaç litre benzin aldı?" sorusuna cevap aramıştım. Videonun bağlantısına sahip olan varsa, buraya eklemek isterim. Video viral olduktan sonra ve "50 liralık almak" deyim haline geldikten sonra nedense video internetten kayboldu! 2017 yılında, verileri indirip o zamanlar aktif olan Twitter hesabımda sonuçlarını tartışmaya açmıştım.

Daha sonra, $/₺ kurunun 4.30'u aşmasıyla, 2018 yılında sonuçları güncelleyip Twitter hesabımdan bir kez daha paylaştım. Bu güncellemeden yaklaşık iki yıl sonra Şubat 2020'de hem veriyi hem de çıktılarımı güncelleme kararı aldım, çıktılarımı Github ve Linkedin üzerinden yayınladım. 2020 yılı çıktılarıma [buradan](https://github.com/kazimanil/50liralikbenzin/2020) ulaşabilirsiniz.

2020'den bu yana enflasyondaki yüksek artış hızıyla beraber, benzer çalışmalar gündeme geldi ve tartışmaya açıldı. [Tantuni endeksi](https://twitter.com/oguzergin/status/1504793264637030403) bu çalışmalar arasında bilinen bir örnektir. 2024 yılının başında son bir kez bu veriyi güncelleme kararı aldım. Bu sayfanın kalanında veri toplama yöntemlerim ve çıktılarım hakkında ayrıntılı bilgiler bulacaksınız. 

# Veri

Pompa fiyatları için İstanbul ili, Şişli ilçesi için OPET'in web-sitesinde yayınlamış olduğu kurşunsuz benzin ve motorin fiyatları temel aldım. Veri kaynağıma ulaşmak için [tıklayınız](https://www.opet.com.tr/gecmis-tarihli-akaryakit-fiyatlari#istanbul). 5 Ocak 2007 ve 31 Aralık 2023 tarihleri arasındaki benzin fiyatlarını adı geçen siteden derledim. Derlediğim veri setini indirmek için [tıklayınız](https://github.com/kazimanil/50liralikbenzin/blob/master/HamVeri.csv).

Ayrıca hesaplamalara tarih boyutunu ve toplam kat edilen mesafeyi katabilmek için, tüketicinin belirli bir modeli tercih ettiği ve bu modelin piyasaya sürülen her yeni sürümünü satın aldığını varsaydım. Bu çalışma için, çalışmaya başladığım yıllarda orta sınıf için ulaşabilir bir araç olan, Volkswagen markasının Golf modelini tercih ettim. 100 km tüketimleri için aşağıda paylaştığım kaynakların Wolksvagen Golf 1.4 için yayınladığı değerleri temel aldım. Kolaylık olması açısından toban ve şehir içi için ortaklaşa belirlenmiş bulunan "Combined" değerleri seçtim. 

* 2003 - 2008 aralığı için VOLKSWAGEN Golf V 5 Doors 1.4 TSI (122 HP) modeli (6.3 LT / 100 KM) [(kaynak)](https://www.autoevolution.com/volkswagen/golf-5-doors/)
* 2008 - 2012 aralığı için VOLKSWAGEN Golf VI 5 Doors 1.4 TSI (122 HP) modeli (6.2 LT / 100 KM) [(kaynak)](https://www.autoevolution.com/volkswagen/golf-5-doors/)
* 2012 - 2019 aralığı için VOLKSWAGEN Golf VII 5 Doors 1.4 TSI BlueMotion 6MT (125 HP) modeli (5.2 LT / 100 KM) [(kaynak)](https://www.autoevolution.com/volkswagen/golf-5-doors/)
* 2019 ve sonrası için VOLKSWAGEN Golf VIII 5 Doors 1.5L TSI 6MT (130 HP) modeli (4.8 LT / 100 KM) [(kaynak)](https://volkswagen.drive.place/golf/viii/group_hatchback_5d/617000)

# Çıktılar

Çıktılarımı yedi grafik ve üç başlıkta derledim. Bu başlıklar 50 liranın gücü, senelik değişimler ve enflasyon ile kıyas isimleriyle özetlenebilir.

## 50 Liranın Gücü

Hem bu bölümde yayınladığım iki grafikten anlaşılabileceği hem de Tantuni endeksi gibi diğer bilinen endekslerin de gösterdiği üzere, 50 liranın zamanla hem alım gücü hem de yol gitme gücü azaldı. Bu düşüşün daha sertleştiği iki dönem bulunuyor. Bunlardan bir tanesi "teğet" geçtiği iddia edilen 2008 krizi civarında yoğunlaşıyor (farklı kaynaklar: [1](https://www.ntv.com.tr/ekonomi/erdogan-kriz-teget-gecer-2010da-toparlaniriz,YQWaSn8yoUOEuvgX9xjCUQ), [2](https://www.dunya.com/gundem/kuresel-kriz-turkiye-ekonomisini-teget-mi-gecti-haberi-94771), [3](https://iktisatvetoplum.com/kuresel-kriz-turkiye-ekonomisini-teget-mi-gecti-hakan-yetkiner/) ve [4](https://stratejikortak.com/2020/01/2009-ekonomikkrizi-turkiye-teget.html)). Bir diğeri de "Faiz sebep enflasyon sonuçtur" ekonomisini sürdürdüğümüz ve pandemi nedeniyle hem TL'nin değer kaybettiği hem de enflasyon sarmalına giriş yaptığımız 2021 sonrası döneme denk düşüyor (kaynaklar: [5](https://www.mahfiegilmez.com/2021/11/faiz-sebep-enflasyon-sonuctur.html), [6](https://www.indyturk.com/node/122191/t%C3%BCrkiyeden-sesler/faiz-sebep-enflasyon-neticedir).

50 liranın benzin alım gücündeki bu düşüşler- en azından dar veya orta gelirli aileler için- ne krizin teğet geçtiğini ne de faizin sebep olduğunu gösteriyor. Aksine bu zaman aralıklarında yaşanan hem benzindeki hem de benzin fiyatlarından doğrudan veya dolaylı olarak etkilenen ürünlerdeki fiyat yükselişlerinin alım gücünde ciddi düşüşlere yol açtığını iddia etmek mümkündür.

![Kaç Litre Benzin Alabildik?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_1.jpeg)

![Kaç KM yol gidebildik?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_2.jpeg)

## Senelik Değişimler

İkinci bölümde yayınladığım üç grafik de, ilk kısımda yazdığım bulguları doğrular nitelikte. Senelik zam ve indirim miktarları hem TL hem adet cinsinden 2008-2009 ve 2020-2023 yılları arasında yoğunlaşıyor. Öyle ki; 2020 sonrası indirim miktarlarını TL cinsinden 2020 öncesiyle aynı grafiğe koymak bile mümkün olmadı. Bunun sebebi senelik değişim miktarları 2020 öncesinde toplamda 2 lirayı geçmezken, 2020 ile 5 liraya, 2022 ile 20-30 lira civarına yükseliyor. Aslında bu değişimdeki ani artış, şimdiye kadar kullandığım mutlak değişim grafiklerini de işe yaramaz duruma getiriyor. Bu nedenle üçüncü bölümde yüzdesel değişimlere odaklanmaya çalıştım.  

![Senelik Zam ve İndirim Adetleri?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_3.jpeg)

![2020 ve Öncesi Senelik Değişim](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_4.jpeg)

![2020 ve Sonrası Senelik Değişim](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_4b.jpeg)

## Enflasyon ile Kıyas

Türkiye ekonomisinin ciddi krizler ile sınanmadığı yıllarda benzin fiyatlarındaki yıllık değişim en fazla %10 ile sınırlı kalırken; 2008-2009 krizi ve özellikle Yeni Ekonomi Modeli'nin değendiği yıllarda yıllık değişimler %40'ın üzerinde seyrediyor. Çalışanların taşınmasından poşetlerin üretimine, ürünlerin dağıtımından tatil harcamalarına birçok kalemi doğrudan ve dolaylı etkileyen benzin fiyatlarının; benzinin "50 liralık" alınabildiği dönemlere göre çok yükseldiği aşikar. Hatta ve hatta artık "50 liraya" pompanın açılmayacağı günümüzde, eğer önlem alınmazsa; benzin fiyatlarındaki yükselişin hayatımızı bir enflasyon sarmalığına sürüklemeye devam edeceği de ifade edilebilir. Bu nedenle, benzin fiyatlarındaki değişimi TÜİK'in yıllık enflasyon verileriyle kıyaslamayı uygun gördüm. Böylece son iki grafiği hazırladım.

Benzin fiyatının hayatımızın her alanına etkide bulunması; TÜİK'in açıkladığı TÜFE değerleriyle %71 gibi yüksek bir korelasyona sahip olmasıyla doğrulanıyor diyebiliriz. İki grafiğin birbirinden kriz dönemlerinde (2009, 2021, 2023) ayrışması kriz dönemlerine has bir örüntüye benziyor. Ancak, her ne kadar TÜİK verilerinin güvenilirliğini tartışmaya açmak bu çalışmanın odağında olmasa da; TÜİK verilerinin güvenilirliğinin tartışılmaya açıldığı 2021 yılındaki büyük farkı, belki de, TÜİK verilerinin güvenilir olmayışıyla açıklamak olasıdır (kaynak: [7](https://www.ntv.com.tr/ntvpara/tuikten-tartismali-veri-iddialarina-aciklama,pDtlwP0AhE6kCn9FlmbHrg)).

![Senelik Değişim](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_5.jpeg)

![Gösterge Kıyası?](https://github.com/kazimanil/50liralikbenzin/blob/master/Grafik_6.jpeg)

# Değerlendirme

İlk kez 2017 yılında yayınladığım ve farklı aralıklarla 3 defa güncellediğim **50 Liralık Benzin** adlı çalışmamı hayatımda yakaladığım bir boşlukla, sanıyorum, son bir kez daha 2024 yılının Ocak ayında güncelledim. Son bir kez güncelleyeceğim düşüncemin ardında, 50 liraya yemek yemeye dahi zorlanılan günümüzde, bu çalışmayı şimdiki formatıyla devam ettirmenin bir anlamı olacağını sanmamam yatıyor. Şimdiki formatıyla elde ettiğimiz bulgularıysa aşağıdaki gibi özetlemek mümkündür:

- Hep "50 Liralık" benzin almak artık olası değildir.
- 50 Lira'nın alım gücü, özellikle 2020 yılı sonrası olmak üzere, son 15 yılda düzenli olarak erimiştir. Erimenin hızı, dövizdeki yükselişin kısıtlığı olduğu 2009 - 2017 aralığında sınırlı kalmıştır.
- Türkiye'de ekonomik darboğaz, benzin fiyatlarındaki dalgalanma ile takip edilebilir. Bunun olası en büyük nedeni benzin fiyatlarının dövizdeki dalgalanmalara ve vergi miktarlarındaki dalgalanmalara tabii olmasıdır.
- Benzin doğrudan veya dolaylı olarak enflasyon sepetindeki birçok kalemin fiyatını etkilemektedir. Bu nedenle enflasyonu dizginlemek için yapılacak politikalardan biri ülkemizdeki benzin fiyatlarındaki oynaklığı azaltmaktan veya benzin üzerindeki vergileri azaltmaktan geçiyor olabilir. 

Esenlikle,