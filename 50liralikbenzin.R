# Data Input -----
rm(list = ls()); gc()
source("GGPlot_Theme.R")
veri <- fread("HamVeri.csv")
veri[, ':='( tarih = as.Date(tarih, format = "%d.%m.%Y"),
						 kursunsuz = as.numeric(gsub(pattern = ",", replacement = ".", x = kursunsuz)),
						 dizel = as.numeric(gsub(pattern = ",", replacement = ".", dizel))
						 )]
veri[, ':='(kursunsuz50 = 50 / kursunsuz, 
						dizel50 = 50 / dizel)]

# Fuel Consumption Statistics ----
# taken from autoevolution.com
veri[tarih < as.Date("2008-01-01")
		 , BenzinTuk := 6.3]
veri[tarih >= as.Date("2008-01-01") & tarih < as.Date("2012-01-01")
		 , BenzinTuk := 6.2]
veri[tarih >= as.Date("2012-01-01") & tarih < as.Date("2017-01-01")
		 , BenzinTuk := 5.2]
veri[tarih >= as.Date("2017-01-01")
		 , BenzinTuk := 5.2]

veri[, ':='(kursunsuz50gy = 100 *kursunsuz50 / BenzinTuk)]

# Now let's check how many increments have happened over years.
veri[, kursunsuz_1 := shift(kursunsuz, n = 1, type = "lag")]
veri[, zam := ifelse(kursunsuz > kursunsuz_1, 1, 0)]
veri[, indirim := ifelse(kursunsuz < kursunsuz_1, 1, 0)]
veri[, degisim := abs(kursunsuz - kursunsuz_1)]

veri_yil = veri[, .(degisim = .N, Zam = sum(zam, na.rm = T), indirim = sum(indirim, na.rm = T))
								, .(yil = year(tarih))]
veri_yil = melt.data.table(veri_yil[, c(1,3,4)], id.vars = "yil", variable.name = "degisim", value.name = "adet")

veri_yil2 = veri[, .(Zam     = round(sum(ifelse(zam ==1, degisim, 0), na.rm = T) / sum(zam, na.rm = T), digits = 4),
										 indirim = round(sum(ifelse(indirim ==1, degisim, 0), na.rm = T) / sum(indirim, na.rm = T), digits = 4))
								 , .(yil = year(tarih))]
veri_yil2 = melt.data.table(veri_yil2, id.vars = "yil", variable.name = "degisim", value.name = "ort_TL")

veri_yil = merge(veri_yil, 
								 veri_yil2,
								 by = c("yil", "degisim")); rm(veri_yil2)
veri_yil[, toplam_TL := ort_TL * adet]

# Graphics Output ----
dev.off()
jpeg(filename = "KaçLitre.jpeg", width = 1920, height = 1080)
ggplot(data = veri, aes(x = tarih, y = kursunsuz50)) + 
	geom_line(linetype = "dashed", colour = "orange") + 
	geom_smooth(color = "red", method = "lm", formula = y ~ poly(x,4)) + # geom_smooth(color = "red") +
	labs(title = "50 liralık benzin kaç litre ediyor?", x = "Tarih", y = "Litre Kurşunsuz Benzin") +
	theme_dt() +
	theme(text = element_text(size=30))
dev.off()

jpeg(filename = "KaçKilometre.jpeg", width = 1920, height = 1080)
ggplot(data = veri, aes(x = tarih, y = kursunsuz50gy)) + 
	geom_line(linetype = "dashed", colour = "orange") + 
	geom_smooth(color = "red", method = "lm", formula = y ~ poly(x,4)) + # geom_smooth(color = "red") +
	labs(title = "50 liralık benzin kaç km gidiyor?", x = "Tarih", y = "Kilometre") +
	theme_dt() +
	theme(text = element_text(size=30))
dev.off()

jpeg(filename = "Degisimler (Senelik Adet).jpeg", 1920, 1080)
ggplot(data = veri_yil, aes(x = yil, y = adet, col = degisim)) +
	geom_line(size = 2) +
	labs(title = "Senelik Zam ve İndirim Adetleri", x = "Yıl", y = "Adet") + 
	scale_color_discrete(name = "Değişim Tipi\n",
											 breaks = c("Zam", "indirim"), 
											 labels = c(" Zam", " İndirim")) +
	theme_dt() +
	theme(text = element_text(size=30))
dev.off()

jpeg(filename = "Degisimler (Senelik TL).jpeg", 1920, 1080)
ggplot(data = veri_yil, aes(x = yil, y = toplam_TL, col = degisim)) +
	geom_line(size = 2) +
	labs(title = "Senelik Zam ve İndirim Miktarları (TL)", x = "Yıl", y = "TL") + 
	scale_color_discrete(name = "Değişim Tipi\n",
											 breaks = c("Zam", "indirim"), 
											 labels = c(" Zam Miktarı (TL)", " İndirim Miktarı (TL)")) +
	theme_dt() +
	theme(text = element_text(size=30))
dev.off()