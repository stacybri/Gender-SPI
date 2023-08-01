clear all

frame create main
frame change main

use "C:\Users\wb469649\Documents\GitHub\Gender-SPI\03_output_data\SPI_Gender_SDG_data.dta" 

frame create odin
frame change odin

import excel "C:\Users\wb469649\Documents\GitHub\Gender-SPI\01_raw_data\misc\ODIN_Gender_2022.xlsx", sheet("ODIN 22|23 Report") clear firstrow

keep country_code OGDI NON_OGDI ODIN

rename country_code iso3c
drop if missing(iso3c)

frame change main
frlink 1:1 iso3c, frame(odin)

frget *, from(odin)
drop odin

save "C:\Users\wb469649\WBG\Divyanshi Wadhwa - Gender SPI\data\SPI_Gender_SDG_data.dta", replace