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
veri[, Index := .I]

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
