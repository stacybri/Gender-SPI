library(tidyverse)
library(wbstats)


raw_dir <- "C:/Users/wb469649/Documents/GitHub/Gender-SPI/01_raw_data"
output_dir <-  "C:/Users/wb469649/Documents/GitHub/Gender-SPI/03_output_data"
save_dir <- "C:/Users/wb469649/Documents/GitHub/Gender-SPI/02_programs/misc_scripts/SPI_correlations"

avail_df_5 <- read_csv(paste0(output_dir, "/SPI_Gender_UNSD_data_5yr.csv"))

avail_df_1 <- read_csv(paste0(output_dir, "/SPI_Gender_UNSD_data_1yr.csv"))

avail_df_10 <- read_csv(paste0(output_dir, "/SPI_Gender_UNSD_data_10yr.csv"))


#indicators_df <- read_csv(paste(output_dir, '/un_sdg_gender_disagg_df.csv',sep=""))

#merge GDP data

data_sdg <- avail_df_5 %>%
  left_join(
    wb_data(
      indicator=c('NY.GDP.PCAP.PP.CD','IQ.SPI.OVRL'),
      start_date=2004,
      end_date=2020
    )
  )

write_excel_csv(data_sdg, paste0(save_dir,"/Gender_correlations_data.csv"))



data_sdg_1 <- avail_df_1 %>%
  left_join(
    wb_data(
      indicator='NY.GDP.PCAP.PP.CD',
      start_date=2004,
      end_date=2020
    )
  )

data_sdg_10 <- avail_df_10 %>%
  left_join(
    wb_data(
      indicator='NY.GDP.PCAP.PP.CD',
      start_date=2004,
      end_date=2020
    )
  )


# 2020 plot
data_sdg %>%
  filter(date==2020) %>%
  filter(goal=="Tier 1") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('Tier 1 - 2020')

# 2020 plot
data_sdg %>%
  filter(date==2020) %>%
  filter(goal=="Tier 2") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('Tier 2 - 2020')

# 2020 plot
data_sdg %>%
  filter(date==2020) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
    geom_text() +
    geom_smooth() +
    theme_bw() +
    scale_x_log10(labels=scales::comma) +
    ggtitle('2020')

# 2015 plot
data_sdg %>%
  filter(date==2015) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015')

# 2010 plot
data_sdg %>%
  filter(date==2010) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2010')


# 2005 plot
data_sdg %>%
  filter(date==2005) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2005')


# 2015 by goal
#goal 1
data_sdg %>%
  filter(date==2015) %>%
  filter(goal=="1") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015-Goal 1')

#goal 2
data_sdg %>%
  filter(date==2015) %>%
  filter(goal=="2") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015-Goal 2')

#goal 3
data_sdg %>%
  filter(date==2015) %>%
  filter(goal=="3") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015-Goal 3')

#goal 4
data_sdg %>%
  filter(date==2015) %>%
  filter(goal=="4") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015-Goal 4')

#goal 5
data_sdg %>%
  filter(date==2015) %>%
  filter(goal=="5") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015-Goal 5')

#goal 8
data_sdg %>%
  filter(date==2015) %>%
  filter(goal=="8") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015-Goal 8')
# 1 year


# 2020 plot
data_sdg_1 %>%
  filter(date==2020) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2020')

# 2015 plot
data_sdg_1 %>%
  filter(date==2015) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015')

# 2010 plot
data_sdg_1 %>%
  filter(date==2010) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2010')


# 2005 plot
data_sdg_1 %>%
  filter(date==2005) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2005')


# 10 year


# 2020 plot
data_sdg_10 %>%
  filter(date==2020) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2020')

# 2015 plot
data_sdg_10 %>%
  filter(date==2015) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2015')

# 2010 plot
data_sdg_10 %>%
  filter(date==2010) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2010')


# 2005 plot
data_sdg_10 %>%
  filter(date==2005) %>%
  filter(goal=="Combined") %>%
  ggplot(aes(x=NY.GDP.PCAP.PP.CD, y=ind_quality, label=iso3c)) +
  geom_text() +
  geom_smooth() +
  theme_bw() +
  scale_x_log10(labels=scales::comma) +
  ggtitle('2005')