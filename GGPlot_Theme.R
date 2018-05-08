library(extrafont);
loadfonts()

theme_dt <- function(){
  theme_minimal() %+replace%
    theme(
    axis.line    = element_line(colour = "black", lineend = "square", linetype = "solid"  , size = 0.3),
    axis.text.x  = element_text(size = 11, colour = "darkseagreen1", family = "Ubuntu"),
    axis.text.y  = element_text(size = 11, colour = "darkseagreen1", family = "Ubuntu"),
    axis.title.x = element_text(size = 15, colour = "darkseagreen1", family = "Arial", margin = margin(0.5,0,0,0, "cm")),
    axis.title.y = element_text(size = 15, colour = "darkseagreen1", family = "Arial", margin = margin(0,0.5,0,0, "cm"), angle = 90),
    axis.ticks   = element_line(colour = "darkseagreen1"),
    
    legend.background     = element_rect(fill = "darkslategray"), 
    legend.key            = element_rect(fill = "darkslategray"),
    legend.box.background = element_rect(fill = "darkslategray"),
    legend.text           = element_text(colour = "darkseagreen1", size = 11, family = "Ubuntu"),
    legend.title          = element_text(colour = "darkseagreen1", size = 12, family = "Arial", margin = margin(0, 0.1, 0, 0, "cm")),
    legend.position       = "right",
    legend.text.align     = 0.01,
    legend.title.align    = 0.5,
    
    panel.background = element_rect(fill = "darkslategray"), 
    panel.border     = element_rect(fill = NA, colour = NA), 
    panel.grid.major = element_line(colour = "darkolivegreen1", lineend = "square", linetype = "dotted" , size = 0.2),
    panel.grid.minor = element_line(colour = NA),
    panel.ontop = FALSE,
    
    strip.background = element_rect(fill = "darkslategray"), 
    strip.text       = element_text(size = 11, colour = "darkseagreen1", family = "Ubuntu"),
    strip.text.y     = element_text(angle = -90),
    
    plot.background =  element_rect(fill = "darkslategray"),
    plot.title      =  element_text(size = 20, colour = "darkseagreen1", family = "Arial", margin = margin(0,0,0.5,0, "cm")),
    plot.margin     =  unit(c(1,1,0.5,0.5), "lines")
    )
}
