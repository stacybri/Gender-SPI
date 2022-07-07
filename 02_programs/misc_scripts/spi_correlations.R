library(tidyverse)
library(haven)
library(lattice)
library(here)
library(rgl)

#set directories
dir <- here()

raw_dir <- paste(dir, '01_raw_data', sep="/")
output_dir <- paste(dir, '03_output_data', sep="/")


combined_df <- read_stata(  paste0(output_dir, '/SPI_Gender_SDG_data.dta'))


gend_gdp_plt <-combined_df %>%
  ggplot(aes(x=NY_GDP_PCAP_PP_CD, y=availability)) +
  geom_text(aes(label=iso3c)) +
  geom_smooth(method='lm') +
  theme_bw() + 
  scale_x_log10(labels=scales::comma) +
  xlab('GDP per capita, PPP (current international $), logged') +
  ylab('Availability of Gender SDG Indicators (%)') +
  theme(legend.position = 'bottom') +
  expand_limits(y=c(0,100)) +
  labs(
    title='Plot of GDP per capita and Availability of Gender SDG Indicators',
    caption=str_wrap('Source: GDP per capita from the World Development Indicatrs (NY.GDP.PCAP.PP.CD).  The availability of Gender SDG Indicators based on authors calculations based on the UN Global SDG Database.',100)
  )

gend_gdp_plt

cloud(NY_GDP_PCAP_PP_CD ~ IQ_SPI_OVRL*availability, data=combined_df)

x <- log(combined_df$NY_GDP_PCAP_PP_CD)
y <- combined_df$IQ_SPI_OVRL
z <- combined_df$availability
labs <- combined_df$iso3c


rgl_init()
plot3d(x, y, z, 
       col="blue", type ="p",
       xlab ="GDP per capita, PPP", 
       ylab = "SPI Overall Score", zlab = "Gender Availability",
       zlim=c(0,100),
       ylim=c(0,100))
text3d(x,y,z,labs)


