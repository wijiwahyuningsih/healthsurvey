/*---------------------------------------------------------------
Create data covariate variables (2019 SSGI) - do file
-----------------------------------------------------------------
Date created    : 16/06/2024
Date modified   : 02/08/2024
---------------------------------------------------------------*/

if c(username) == "Asus" {
	gl wof  	"C:\Users\Asus\Documents\Project\Stranas stunting\Data"
	gl dta  	"$wof\data"
	gl raw		"$wof\original"
	gl dof		"$wof\dofile"
	gl out		"$wof\output"
}
clear
set more off

*load dataset: SSGI 2019
u "$raw\determinant_2019ssgi", clear
la def YESNO 0 "no" 1 "yes"

* Rename variable
{
	rename (IDART wi final_weight R101 R102 R105 R107 R108 R401 R403 R405 B507A B507B B513 B505 B506 B508 B509 B510 B511 B512 B514 haz_kat R1401 R1402 R1403 R1404A_TGL R1404A_BLN R1404A_THN R1404B_TGL R1404B_BLN R1404B_THN R1404C_TGL R1404C_BLN R1404C_THN R1404D_TGL R1404D_BLN R1404D_THN R1404E_TGL R1404E_BLN R1404E_THN R1404F_TGL R1404F_BLN R1404F_THN R1404G_TGL R1404G_BLN R1404G_THN R1404H_TGL R1404H_BLN R1404H_THN R1404I_TGL R1404I_BLN R1404I_THN R1404J_TGL R1404J_BLN R1404J_THN R1404K_TGL R1404K_BLN R1404K_THN R1404L_TGL R1404L_BLN R1404L_THN R1404M_TGL R1404M_BLN R1404M_THN R1404N_TGL R1404N_BLN R1404N_THN R1405 R1406 R1407 R1408 R1409 R1410 R1411 R1412 R1413 R1414 R1415 R1416I R1416II R1417_A R1417_B R1417 R1418A R1418B R1418C_0 R1418C_1 R1418C_2 R1419A R1419B R1419C R1419D R1419E R1419F R1419G R1419H R1419I R1419J R1419K R1419L R1419M R301 R1008 R1101_A R1101_B R1101_C R1101_D R1101_E R1101_X R1102 R1103 R1104 R1105 R1201 R1301 R1801 R1802 R1803 R1804 R1809A R1809B R1809C R1810A R1810B R1811A R1813A R1813B R1813C R1813D R1813E R1814A R1814B R1816 R1817 R2001A R2001B R2001C R2001D R2001E R2001F R2001G R2001H R2001I R2001J R2001K R2001L R2001M R2002 R2101 R2105 R2106 R2107A R2109 R403_Ibu R404 R407_Ibu R409 R613 R615 R701_A R701_B R701_C R701_D R701_X R702 R703 R704 R705 R1002 R1003 R1004 R1005 R1006 R1007 R1009 R1501A R1501B R1502B R1503 R1504A R1504B R1504C R1505A R1505B R1505C R1601 R1602 R1602LAIN R1603 R1603LAIN R1604 R1605 R1605LAIN R1606 R1607 R1608 R1609 Year QNAS) (idart wi final_weight r101 r102 r105 r107 r108 r401 r403 r405 b507a b507b b513 b505 b506 b508 b509 b510 b511 b512 b514 haz_kat r1401 r1402 r1403 r1404a_tgl r1404a_bln r1404a_thn r1404b_tgl r1404b_bln r1404b_thn r1404c_tgl r1404c_bln r1404c_thn r1404d_tgl r1404d_bln r1404d_thn r1404e_tgl r1404e_bln r1404e_thn r1404f_tgl r1404f_bln r1404f_thn r1404g_tgl r1404g_bln r1404g_thn r1404h_tgl r1404h_bln r1404h_thn r1404i_tgl r1404i_bln r1404i_thn r1404j_tgl r1404j_bln r1404j_thn r1404k_tgl r1404k_bln r1404k_thn r1404l_tgl r1404l_bln r1404l_thn r1404m_tgl r1404m_bln r1404m_thn r1404n_tgl r1404n_bln r1404n_thn r1405 r1406 r1407 r1408 r1409 r1410 r1411 r1412 r1413 r1414 r1415 r1416i r1416ii r1417_a r1417_b r1417 r1418a r1418b r1418c_0 r1418c_1 r1418c_2 r1419a r1419b r1419c r1419d r1419e r1419f r1419g r1419h r1419i r1419j r1419k r1419l r1419m r301 r1008 r1101_a r1101_b r1101_c r1101_d r1101_e r1101_x r1102 r1103 r1104 r1105 r1201 r1301 r1801 r1802 r1803 r1804 r1809a r1809b r1809c r1810a r1810b r1811a r1813a r1813b r1813c r1813d r1813e r1814a r1814b r1816 r1817 r2001a r2001b r2001c r2001d r2001e r2001f r2001g r2001h r2001i r2001j r2001k r2001l r2001m r2002 r2101 r2105 r2106 r2107a r2109 r403_ibu r404 r407_ibu r409 r613 r615 r701_a r701_b r701_c r701_d r701_x r702 r703 r704 r705 r1002 r1003 r1004 r1005 r1006 r1007 r1009 r1501a r1501b r1502b r1503 r1504a r1504b r1504c r1505a r1505b r1505c r1601 r1602 r1602lain r1603 r1603lain r1604 r1605 r1605lain r1606 r1607 r1608 r1609 year qnas)	
}

* General	
{
gen id				= idart
gen weight 			= final_weight
gen year_svy		= 2019
gen province_code	= r101
gen district_code	= r101*100+r102
gen strata			= district_code*10+r105
egen psu 			= concat (district_code r107)
gen urban			= r105==1
gen quintile		= qnas
	la def quintile 1"poorest" 2"poor" 3"middle" 4"rich" 5"richest"
	la val quintile quintile

*Demographic characteristics of child and parents
gen age_day_child = b507a
gen age_month_child	= r1401
 
*age
gen age_mother = r407_ibu
gen age_mother_cat = age_mother
recode age_mother_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_mother_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years" 
la val age_mother_cat age_mother_cat

*edu
gen edu_mother = r615
recode edu_mother (1 = 1) (2 3 4 5 = 3) (6 7 8 9 = 4) (10 11 12 13 14 15 = 5) (16 17 18 19 20 21 22 = 6)
la def edu_mother 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"

*employment category
gen employment_mother_cat = 1 if r701_a == "A"
replace employment_mother_cat = 0 if employment_mother_cat == .
la val employment_mother_cat YESNO			   
}

*********************
*****Measurement*****
*********************
{
*Height of the mother 
*Low birth weight
gen meas_birth_wgt	= inlist(r1504c,1,2) if r1503 == 1 // condition: gave birth within 2 years
gen birth_wgt_25kg  = r1504c == 1 if meas_birth_wgt == 1
la def birth_wgt_25kg 0 ">=2500gr" 1 "<2500gr"
la val birth_wgt_25kg birth_wgt_25kg

}

*********************
****Immunization*****
*********************
*definition: 1x HB-0, 1x BCG, 3x DPT-HB/DPT-HB-HiB, 4x polio or 3x IPV (injection polio vaccine), and 1x measles
{
	recode r1404* (miss = 0) if inrange(r1401,12,23)
	gen bcg_in = r1404a_tgl + r1404a_bln + r1404a_thn
	gen pol1_in = r1404b_tgl + r1404b_bln + r1404b_thn
	gen pol2_in = r1404c_tgl + r1404c_bln + r1404c_thn
	gen pol3_in = r1404d_tgl + r1404d_bln + r1404d_thn
	gen pol4_in = r1404e_tgl + r1404e_bln + r1404e_thn
	gen dpt1_in = r1404f_tgl + r1404f_bln + r1404f_thn
	gen dpt2_in = r1404g_tgl + r1404g_bln + r1404g_thn
	gen dpt3_in = r1404h_tgl + r1404h_bln + r1404h_thn
	gen hblahir_in = r1404i_tgl + r1404i_bln + r1404i_thn
	gen hb1_in = r1404j_tgl + r1404j_bln + r1404j_thn
	gen hb2_in = r1404k_tgl + r1404k_bln + r1404k_thn
	gen hb3_in = r1404l_tgl + r1404l_bln + r1404l_thn
	gen campak_in = r1404m_tgl + r1404m_bln + r1404m_thn
	gen mmr_in = r1404n_tgl + r1404n_bln + r1404n_thn
	foreach i of varlist *_in {
		recode `i' (0 = 0) (nonm = 1)
	}
	gen tbcg 	= bcg_in
	gen tpolio 	= (pol1_in + pol2_in + pol3_in + pol4_in)
	gen tdpt	= (dpt1_in + dpt2_in + dpt3_in)
	gen thb		= (hb1_in + hb2_in + hb3_in)
	gen thb0 	= hblahir_in
	gen tcmp 	= (campak_in)
	recode r1407 (1=1) (5=0) (8=0) if inrange(r1401,12,23), gen(lbcg)
	gen lpolio	= r1410 if ((r1402 == 2 | r1403 > 0) & inrange(r1401,12,23))
	gen ldpt	= r1412 if ((r1402 == 2 | r1403 > 0) & inrange(r1401,12,23))
	gen lhb		= r1414 if ((r1402 == 2 | r1403 > 0) & inrange(r1401,12,23))
	recode r1416i (1=1) (5=0) (8=0) if inrange(r1401,12,23), gen(lcmp)
	foreach i of varlist tbcg-tcmp lbcg-lcmp {
		recode `i' (miss = 0) if inrange(r1401,12,23)
	}
	gen vac_hb0		= thb0
	gen vac_bcg 	= tbcg + lbcg
	gen vac_polio	= tpolio + lpolio
	gen vac_dpt	= tdpt + ldpt
	gen vac_hb	= thb + lhb
	gen vac_cmp	= tcmp + lcmp
	gen vac_idl = (vac_hb0 >= 1) & (vac_bcg >= 1) & (vac_polio >= 4) & (vac_dpt >= 3) & (vac_cmp >= 1) & (vac_hb  >= 3) if inrange(r1401,12,23)	
	}
	
	
*********************************************
****ANC, Birth, PNC, IFA and food suppl.*****
*********************************************
{
*Assisted deliveries
	*Place of deliveries 
	gen delivery_place	= r1504a
	recode delivery_place (1 = 1) (2 5 = 2) (3 4 6 = 3) (7 = 4) (8 = 5)	
	label define delivery_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home" 5 "Other"
	label values delivery_place delivery_place
	
	*Birth attendance	
	gen delivery_assist = r1504b
	recode delivery_assist (1 = 1) (2 = 2) (3 = 3) (4 5= 4) (6 = 5) (7 = 6)
	label define delivery_assist 1 "Doctor: Obgyn" 2 "Doctor: GP" 3 "Midwife" 4 "Nurse and other health workers" 5 "Traditional Doctor" 6 "Others"
	label values delivery_assist delivery_assist

	*Skilled birth attendance
	gen sba = .
	replace sba = 1 if inrange(r1504b,1,5)
	replace sba = 0 if inrange(r1504b,6,7)
	la var sba "skilled birth attendance"
	la val sba YESNO
	
}


****************************************
********** IYCF indicators *************	
*****infant and young child feeding*****
****************************************
*Source: Indicators for assessing infant and young child feeding practices: definitions and measurement methods (2021)
****************************************
********Breastfeeding indicators********
****************************************
{
	*Ever breastfed
	*Definition: percentage of children born in the last 24 months who were ever breastfed
	gen evbf = r1417
	recode evbf (5 8 = 0)
	la val evbf YESNO

	*Exclusive breastfeeding under six months (EBF)
	*Definition: percentage of infants 0–5 months of age who were fed exclusively with breast milk during the previous day
	gen exc_bf = r1417 == 1 & r1418a ==1 & r1418b == 1 if inrange(age_month_child,0,5)
	la val exc_bf YESNO
}	   		
	
****************************************
****Complementary feeding indicators****
****************************************
{
	*Introduction of solid, semisolid or soft foods 6–8 months (ISSSF)
	*Definition: percentage of infants 6–8 months of age who consumed solid, semisolid or soft foods during the previous day
	gen isssf = 1 if (r1419b == 1 | r1419c == 1 | r1419d == 1 | r1419e == 1 | r1419f == 1 | r1419g== 1 | r1419h == 1 | r1419i == 1 | r1419j == 1 | r1419k == 1 | r1419l == 1 | r1419m == 1) & inrange(age_month_child,6,8)
	replace isssf = 0 if inrange(age_month_child,6,8) & isssf==.
	la val isssf YESNO
	
	*************************
	**The seven food groups**
	*************************
	*food consumed during the previous day   
	*breast milk
	gen breastmilk	= r1418a == 1 if inrange(age_month_child,6,23)
	*grains, roots and tubers
	gen grains		= r1419c == 1 if inrange(age_month_child,6,23)
	*legumes and nuts
	gen nuts		= r1419d == 1 if inrange(age_month_child,6,23)
	*dairy products 
	gen diary		= r1419e == 1 if inrange(age_month_child,6,23)
	*flesh foods
	gen  flesh =1 if (r1419f == 1 | r1419g == 1 | r1419h == 1 | r1419i == 1) & inrange(age_month_child,6,23)
	replace  flesh =0 if inrange(age_month_child,6,23) & flesh==.
	*eggs
	gen eggs		= r1419j == 1 if inrange(age_month_child,6,23)
	*vitamin A-rich fruit and vegetables 
	*other fruit and vegetables
	gen  fruitsveg = 1 if (r1419k == 1 | r1419l == 1) & inrange(age_month_child,6,23)
	replace  fruitsveg =0 if inrange(age_month_child,6,23) & fruitsveg==.
	
	*Minimum dietary diversity 6–23 months (MDD)
	*definition: percentage of children 6–23 months of age who consumed foods and beverages from at least five out of eight defined food groups during the previous day
	gen mdd = breastmilk + grains +  nuts +  diary +  flesh +  eggs +  fruitsveg
	recode mdd min/4 = 0 5/max = 1
	replace mdd = . if !inrange(age_month_child,6,23)
	la val mdd YESNO
	
	*Egg and/or flesh food consumption 6–23 months (EFF)
	*definition: percentage of children 6–23 months of age who consumed egg and/or flesh food during the previous day
	gen eff = 0
	replace eff = 1 if  flesh == 1 |  eggs == 1
	replace eff = . if !inrange(age_month_child,6,23)
	la val eff YESNO

	*Sweet beverage consumption 6–23 months (SwB)
	*definition: percentage of children 6–23 months of age who consumed a sweet beverage during the previous day
	gen swb = r1419b == 1 if inrange(age_month_child,6,23)
	replace  swb =0 if inrange(age_month_child,6,23) & swb==.
	la val swb YESNO
	
	*Zero vegetable or fruit consumption 6–23 months (ZVF)
	*definition: percentage of children 6–23 months of age who did not consume any vegetables or fruits during the previous day
	gen zvf = 1 if r1419k == 5 & r1419l == 5 & inrange(age_month_child,6,23)
	replace  zvf =0 if inrange(age_month_child,6,23) & zvf==.
	la val zvf YESNO			   
}

* WASH
{
	gen improved_water = inlist(r1810a,1,2,3,4,5,7) if r1810a!=.
	gen improved_sanitation = inlist(r1809a,1,2) & inlist(r1809b,1,4) & inlist(r1809c,1,2)
}
	 
*Social assistance (PKH)
	*ever received in the last year
	gen received_pkh = r2106 == 1
	
	 
	keep id weight year_svy province_code district_code urban quintile age_day_child age_month_child age_mother edu_mother employment_mother birth_wgt_25kg vac_idl evbf exc_bf isssf breastmilk grains diary flesh eggs fruitsveg nuts mdd eff swb zvf age_month_child age_mother_cat employment_mother_cat delivery_place delivery_assist sba improved_water improved_sanitation received_pkh
	
	*Save dataset
	label data
	label data "2019 SSGI - created: $S_DATE $S_TIME"
	compress	
	save "$dta\dt_2019ssgi",replace
	clear
		