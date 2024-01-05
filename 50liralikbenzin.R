# Setup ----
rm(list = ls()); gc()
source("https://raw.githubusercontent.com/kazimanil/project_kaf/master/R_functions/gg_theme.R") # My Theme for GGPlot2
library("data.table");
library("ggplot2");
setwd("C:/Users/k.eren/Documents/50liralikbenzin/")
# Data Input -----
veri <- fread("HamVeri.csv")
enflasyon <- fread("tuik_enflasyon.csv")
veri[, ':='( 
	tarih = as.Date(tarih, format = "%d/%m/%Y"),
	kursunsuz = as.numeric(gsub(pattern = ",", replacement = ".", x = kursunsuz)),
	dizel = as.numeric(gsub(pattern = ",", replacement = ".", dizel))
	)]
veri[, ':='(
	kursunsuz50 = 50 / kursunsuz,
	dizel50 = 50 / dizel)]

# Fuel Consumption Statistics ----
# taken from autoevolution.com
veri[tarih < as.Date("2008-01-01"), BenzinTuk := 6.3]
veri[tarih >= as.Date("2008-01-01") & tarih < as.Date("2012-01-01"), BenzinTuk := 6.2]
veri[tarih >= as.Date("2012-01-01") & tarih < as.Date("2019-01-01"), BenzinTuk := 5.2]
veri[tarih >= as.Date("2019-01-01"), BenzinTuk := 4.8]
veri[, ':='(kursunsuz50gy = 100 * kursunsuz50 / BenzinTuk)]

# Now let's check how many increments have happened over years.
veri[, kursunsuz_1 := shift(kursunsuz, n = 1, type = "lag")]
veri[, zam := ifelse(kursunsuz > kursunsuz_1, 1, 0)]
veri[, indirim := ifelse(kursunsuz < kursunsuz_1, 1, 0)]
veri[, degisim := abs(kursunsuz - kursunsuz_1)]

veri_yil = veri[, .(
	degisim = .N, 
	Zam = sum(zam, na.rm = T), 
	indirim = sum(indirim, na.rm = T)
	), .(yil = year(tarih))]
veri_yil = melt.data.table(veri_yil[, c(1,3,4)], id.vars = "yil", variable.name = "degisim", value.name = "adet")

veri_yil2 = veri[, .(
	Zam = round(sum(ifelse(zam ==1, degisim, 0), na.rm = T) / sum(zam, na.rm = T), digits = 4),
	indirim = round(sum(ifelse(indirim ==1, degisim, 0), na.rm = T) / sum(indirim, na.rm = T), digits = 4)
	), .(yil = year(tarih))]
veri_yil2 = melt.data.table(veri_yil2, id.vars = "yil", variable.name = "degisim", value.name = "ort_TL")

veri_yil = merge(
	veri_yil,
	veri_yil2,
	by = c("yil", "degisim")
	); rm(veri_yil2)
veri_yil[, toplam_TL := ort_TL * adet]

# Starting from 2020, the absolute change in the TL / LT price has started making huge spikes
# compared to the past. Hence, I need to calculate the percentage change for a better visualisation.

yillik = veri[, .(yilbasi = min(tarih), yilsonu = max(tarih)), .(yil = year(tarih))]
yillik = merge(
  yillik,
  veri[, .(tarih, yilbasi_fiyat = kursunsuz)],
  by.x = "yilbasi",
  by.y = "tarih"
);

yillik = merge(
  yillik,
  veri[, .(tarih, yilsonu_fiyat = kursunsuz)],
  by.x = "yilsonu",
  by.y = "tarih"
);

yillik = yillik[, .(
  yil,
  yilbasi_fiyat,
  mutlak_degisim = (yilsonu_fiyat - yilbasi_fiyat), 
  yuzde_degisim = 100 * (yilsonu_fiyat - yilbasi_fiyat) / yilbasi_fiyat
  )]

# now let's get the TURKSTAT's yearly inflation rates for a comparison.
enflasyon = enflasyon[month(yilay) == 1]
enflasyon[, onceki_bazpuan := shift(bazpuan, 1)]
enflasyon = enflasyon[!is.na(onceki_bazpuan), .(yil = year(yilay), enflasyon = (bazpuan - onceki_bazpuan) / onceki_bazpuan)]

enflasyon = merge(
  yillik,
  enflasyon,
  by = "yil"
)

# Graphics Output ----
dev.off()
jpeg(filename = "Grafik_1.jpeg", width = 1024, height = 768)
ggplot(data = veri, aes(x = tarih, y = kursunsuz50)) +
	geom_line(linewidth = 1, linetype = "dotted", colour = "orange") +
	geom_smooth(size = 2, color = "turquoise", se = FALSE,  method = "lm", formula = y ~ poly(x,4)) + # geom_smooth(color = "red") +
	labs(title = "50 Lira ile Kaç   Litre Benzin Alınabiliyor?", x = "Tarih", y = "Kurşunsuz Benzin (Lt.)") +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  scale_y_continuous(breaks = seq(0, 20,2)) +
	gg_theme() +
	theme(text = element_text(size=30))
dev.off()

jpeg(filename = "Grafik_2.jpeg", width = 1024, height = 768)
ggplot(data = veri, aes(x = tarih, y = kursunsuz50gy)) +
	geom_line(linewidth = 1, linetype = "dotted", colour = "orange") +
	geom_smooth(size = 2, color = "turquoise", se = FALSE, method = "lm", formula = y ~ poly(x,4)) + # geom_smooth(color = "red") +
	labs(title = "50 liralık benzin ile kaç   km. yol gidiliyor?", x = "Tarih", y = "Ortalama Gidilen Yol (Km.)") +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  scale_y_continuous(breaks = seq(25, 300, 25)) +
	gg_theme() +
	theme(text = element_text(size=30))
dev.off()

jpeg(filename = "Grafik_3.jpeg", 1024, 768)
ggplot(data = veri_yil, aes(x = yil, y = adet, fill = degisim)) +
	geom_col(position = "dodge") +
	labs(title = "Senelik Zam ve İndirim Adetleri", x = "Yıl", y = "Adet") +
	scale_fill_discrete(
	  name = "Değişim Tipi \n",
	  breaks = c("Zam", "indirim"),
		labels = c(" Zam", " İndirim")
		) +
  scale_x_continuous(breaks = seq(2007, 2023, 1)) +
  scale_y_continuous(breaks = seq(0, 60, 10)) +
	gg_theme() +
	theme(text = element_text(size=30), legend.position = "bottom")
dev.off()

jpeg(filename = "Grafik_4.jpeg", 1024, 768)
ggplot(data = veri_yil[yil < 2021], aes(x = yil, y = toplam_TL, fill = degisim)) +
	geom_col(position = "dodge") +
	labs(title = "Senelik Zam ve İndirim Miktarları (TL)", x = "Yıl", y = "TL") +
  scale_fill_discrete(
  name = "Değişim Tipi \n",
	breaks = c("Zam", "indirim"),
	labels = c("Toplam Yapılan\nSenelik Zam (TL)", "Toplam Yapılan\nSenelik İndirim (TL)")
	) +
  scale_x_continuous(breaks = seq(2007, 2020, 1)) +
  scale_y_continuous(breaks = seq(0, 5, 0.5)) +
	gg_theme() +
	theme(text = element_text(size=30), legend.position = "bottom")
dev.off()

jpeg(filename = "Grafik_4b.jpeg", 1024, 768)
ggplot(data = veri_yil[yil > 2019], aes(x = yil, y = toplam_TL, fill = degisim)) +
  geom_col(position = "dodge") +
  labs(title = "Senelik Zam ve İndirim Miktarları (TL)", x = "Yıl", y = "TL") +
  scale_fill_discrete(
    name = "Değişim Tipi \n",
    breaks = c("Zam", "indirim"),
    labels = c("Toplam Yapılan\nSenelik Zam (TL)", "Toplam Yapılan\nSenelik İndirim (TL)")
  ) +
  scale_x_continuous(breaks = seq(2020, 2023, 1)) +
  scale_y_continuous(breaks = seq(0, 30, 5)) +
  gg_theme() +
  theme(text = element_text(size=30), legend.position = "bottom")
dev.off()

jpeg(filename = "Grafik_5.jpeg", 1024, 768)
ggplot(data = enflasyon, aes(x = yil)) +
  geom_bar(
    stat= "identity",
    aes(y = mutlak_degisim),
    fill = "turquoise"
    ) +
  geom_line(
    aes(y = yuzde_degisim / 5), 
    size = 2,
    col = "red"
    ) +
  labs(title = "Senelik Değişim", x = "Yıl", y = "TL (Mutlak)") +
  scale_x_continuous(breaks = seq(2007, 2023, 1)) +
  scale_y_continuous(
    sec.axis = sec_axis(
      trans = ~.*5,
      name = "% Değişim")) +
  gg_theme() +
  theme(text = element_text(size=30))
dev.off()

korelasyon = round(100 * cor(enflasyon$yuzde_degisim, enflasyon$enflasyon))
jpeg(filename = "Grafik_6.jpeg", 1024, 768)
ggplot(data = enflasyon) +
  geom_line(
    aes(x = yil, y = enflasyon * 100, colour = "TUIK"),
    linewidth = 2
  ) +
  geom_line(
    aes(x = yil, y = yuzde_degisim, colour = "Benzin"),
    linewidth = 2
  ) +
  labs(
    title = "TUIK ile Kıyas", 
    subtitle = paste0("Korelasyon: %", korelasyon),
    colour = "",
    x = "Yıl", 
    y = "%"
    ) +
  scale_x_continuous(breaks = seq(2007, 2023, 1)) +
  scale_y_continuous(breaks = seq(-10, 80, 10)) +
  gg_theme() +
  theme(text = element_text(size=30), legend.position = "bottom")
dev.off()

# Daha önceden açıklama kısmında yer alan bu güncelleme notlarını kodlara taşımayı uygun gördüm.
# # Güncellemeler
#
# ## Güncelleme (2020-02-02)
# Son iki yılda kur inanılmaz dalgalandı. Benzin fiyatları da onu takip etti. Tabii ki bu dalgalanma siyasi sonuçlar da doğurdu. Bu verileri hazırlarken *T A M A M mı?* diye sormuşum. Cumhurbaşkanlığı seçimini tamam mı? diyenler kaybetse de, İstanbul seçimini kazandılar. Ek olarak;
#
# * Rapora görselleri ekledim.
# * Temaları güncelledim.
#
# ## Güncelleme (2018-05-08)
# 8 Mayıs 2018 tarihi itibariyle $/₺ kurunun 4.30 değerini aşması sonucu bu çalışmayı güncelleme ihtiyacı hissettim.
# Yukarıdaki belirlediğim kurallar baki kalmak üzere 01-12-2017 ile 08-05-2018 tarihleri arası benzin verilerini yine aynı kaynaktan derledim.
# Ek olarak;
#
# * Bu güncelleme sonrasında, derlediğim benzin fiyatları verisini de paylaşıma açıyorum, neden daha önce açmamış isem zaten??
# * Temaları güncelledim ve temamı oluşturan dosyayı yükledim.
# * Doğru smoothing-out tekniğini kullanıp, kullanmadığımı sorguladım. Veriye daha iyi uyduğunu düşündüğüm için **GAM yöntemini terkettim**. Onun yerine zaman ile km ve zaman ile lt arasında **4. dereceden bir ilişki olduğunu varsayarak** yeni grafikleri çizdirdim.
# * 2018 yılının toplam zam miktarını değerlendirirken; **sadece 5 aylık veriyi** dahil ettiğimi göz önünde bulundurunuz.
#
# Eskiden görseller için verdiğim bu bağlantılar maalesef twitter hesabımı kapamam nedeniyle artık erişilemez durumdadır. Talep edildiği takdirde bu veriyi de paylaşabilirim.
# Görseller için: [2017AralıkVersiyonu](https://twitter.com/kazimanil/status/936331512638791681), [2018MayısVersiyonu](https://twitter.com/kazimanil/status/993926671752417280).
#
