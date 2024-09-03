/*---------------------------------------------------------------
Create data covariate variables (2022 SSGI) - do file
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

*load dataset: 2022 SSGI
u "$raw\determinant_2022ssgi", clear	
la def YESNO 0 "no" 1 "yes"

* Rename
rename (P1308 P1312A P1312B P1312C P1312D P1312E P1312F P1312G P1312H P1312I P1312J P1312JS SANITASI_LAYAK SAM_LAYAK_NEW) (p1308 p1312a p1312b p1312c p1312d p1312e p1312f p1312g p1312h p1312i p1312j p1312js sanitasi_layak sam_layak_new)

* General	
{
gen id  		= cases	
gen weight 		= weight_balita
destring weight, replace
gen year_svy		= 2022
gen district_code	= provkab
gen district_code_	= district_code
	tostring district_code_,replace
	gen province_code=substr(district_code_,2,1), b(district_code)
	destring province_code,replace
	drop district_code_
tostring strata, replace
la def quintile 1"poorest" 2"poor" 3"middle" 4"rich" 5"richest"
la val quintile quintile

*Demographic characteristics of child and parents
gen age_day_child = umur_hr_b
gen age_month_child	= umur_bl_b

*age
gen age_mother = .
gen age_mother_cat = umur_ibu
la def age_mother_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years"
la val age_mother_cat age_mother_cat

gen age_father = .
gen age_father_cat = umur_ayah
la def age_father_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years"
la val age_father_cat age_father_cat

*edu
gen edu_mother = didik_ibu
recode edu_mother (2 = 3) (3 = 4) (4 = 5) (5 = 6)
la def edu_mother 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_mother edu_mother

gen edu_father = didik_ayah
recode edu_father (2 = 3) (3 = 4) (4 = 5) (5 = 6)
la def edu_father 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_father edu_father

*employment
gen employment_mother_cat = kerja_ibu
recode employment_mother_cat 2=0
la val employment_mother_cat YESNO

gen employment_father = pekerjaan_ayah
recode employment_father (2 = 6) (3 = 5) (5 = 3) (6 = 2)
la def employment_father 1 "none/student" 2"civil servant/police/army/bumn/bumd" 3 "private" 4 "self-employed" 5 "farmers/fisherman" 6 "worker/driver/art/other",replace
la val employment_father employment_father

gen employment_father_cat = employment_father 
recode employment_father_cat (1 = 0) (2 3 4 5 6 = 1)
la val employment_father_cat YESNO
}

*********************
*****Measurement*****
*********************
{

*Height of the mother
gen height_mother = p1211
recode height_mother 888.8=.

*Low birth weight
gen birth_wgt_25kg  = p1405 
recode birth_wgt_25kg min/2499=1 2500/max=0 8888=.
la def birth_wgt_25kg 0 ">=2500gr" 1 "<2500gr"
la val birth_wgt_25kg birth_wgt_25kg
	
*Length at birth
gen birth_lenght_cm  = p1408

*********************
****Immunization*****
*********************
*definition: 1x HB-0, 1x BCG, 3x DPT-HB/DPT-HB-HiB, 4x polio or 3x IPV (injection polio vaccine), and 1x measles
{
	gen vac_bcg=1 if inlist(p1005b,1,2)
	gen opv1_in=1 if inlist(p1005g,1,2)
	recode opv1_in .=0
	gen opv2_in=1 if inlist(p1005h,1,2)
	recode opv2_in .=0
	gen opv3_in=1 if inlist(p1005i,1,2)
	recode opv3_in .=0
	gen opv4_in=1 if inlist(p1005j,1,2)
	recode opv4_in .=0
	gen ipv1_in=1 if inlist(p1005k,1,2)
	recode ipv1_in .=0
	gen ipv2_in=1 if inlist(p1005l,1,2)
	recode ipv2_in .=0
	gen ipv3_in=1 if inlist(p1005m,1,2)
	recode ipv3_in .=0
	gen dpthb1_in=1 if inlist(p1005c,1,2)
	recode dpthb1_in .=0
	gen dpthb2_in=1 if inlist(p1005d,1,2)
	recode dpthb2_in .=0
	gen dpthb3_in=1 if inlist(p1005e,1,2)
	recode dpthb3_in .=0
	
	gen vac_polio=opv1_in+opv2_in+opv3_in+opv4_in
	gen vac_ipv=ipv1_in+ipv2_in+ipv3_in
	gen vac_hb0=1 if inlist(p1005a,1,2)
	recode vac_hb0 .=0
	gen vac_cmp=1 if inlist(p1005n,1,2) | inlist(p1005o,1,2)
	gen vac_dpthb=dpthb1_in+dpthb2_in+dpthb3_in
	
	gen vac_idl = (vac_hb0 >= 1) & (vac_bcg >= 1) & (vac_polio >= 4 | vac_ipv >=3) & (vac_dpthb >= 3) & (vac_cmp >= 1) if inrange(age_month_child,12,23)	
}

*********************************************
****ANC, Birth, PNC, IFA and food suppl.*****
*********************************************

*ANC indicators (NA)
*Complete ANC visit4 (trimester 1, trimester 2, trimester 3) >> (1-1-2)
	recode p1204a2 88 = .
	recode p1204b2 88 = .
	recode p1204c2 88 = .
	recode p1204d2 88 = .
	
	local xox "a b c d"	
	foreach x of local xox {
		recode p1204`x'2 (miss = 0) if p1204`x'2 == .
}	
	gen m1 = p1204a2 + p1204b2 + p1204c2 + p1204d2
	replace m1=. if p1201!=1
	recode m1 0 = .
	replace m1=0 if p1201==1 & m1==.


	recode p1204a3 88 = .
	recode p1204b3 88 = .
	recode p1204c3 88 = .
	recode p1204d3 88 = .	
	local xox "a b c d"	
	foreach x of local xox {
		recode p1204`x'3 (miss = 0) if p1204`x'3 == .
}	
	gen m2 = p1204a3 + p1204b3 + p1204c3 + p1204d3
	replace m2=. if p1201!=1
	recode m2 0 = .
	replace m2=0 if p1201==1 & m2==.
	
	recode p1204a4 88 = .
	recode p1204b4 88 = .
	recode p1204c4 88 = .
	recode p1204d4 88 = .		
	local xox "a b c d"	
	foreach x of local xox {
		recode p1204`x'4 (miss = 0) if p1204`x'4 == .
}	
	gen m3 = p1204a4 + p1204b4 + p1204c4 + p1204d4
	replace m3=. if p1201!=1
	recode m3 0 = .
	replace m3=0 if p1201==1 & m3==.
		
	gen m12 =  m1 + m2 + m3
	gen anc = .
	replace anc=0 if m12<4 | m1<1 | m2<1 | m3<2 
	replace anc=1 if m12>=1 & m1>=1 & m2>=1 & m3>=2
	replace anc=. if m12==. 
	la var anc "anc4+"
	la val anc YESNO
	drop m1 m2 m3

*ANC skilled
	//ANC provider
	gen rh_anc_pv = 3 if p1201 == 2
	replace rh_anc_pv 	= 2 if p1204a1 == 2 & p1204b1 == 2 & p1204c1 == 2 & p1204d1 == 2
	replace rh_anc_pv 	= 1 if p1204a1 == 1 | p1204b1 == 1 | p1204c1 == 1 | p1204d1 == 1
	replace rh_anc_pv=. if p1201!=1
	label define rh_anc_pv 1 "Health workers"  2 "Non health workers" 3 "No ANC",replace
	label val rh_anc_pv rh_anc_pv
	label var rh_anc_pv "Person providing assistance during ANC"
	recode rh_anc_pv (1 = 1 "Skilled provider") (2/3 = 0 "Unskilled/no one") , gen(rh_anc_pvskill)
	
	gen anc_skilled=0
	replace anc_skilled=1 if anc==1 & rh_anc_pvskill==1
	replace anc_skilled=. if p1201!=1
	
	*ANC facility (often)
	gen anc_place = p1205
	recode anc_place (1 = 1) (2 5 = 2) (3 4 6 7 = 3) (8 = 4) 
	replace anc_place=. if p1201!=1
	label define anc_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home"
	label values anc_place anc_place
	
*Assisted deliveries
	*Place of deliveries
	gen delivery_place	= p1402 
	recode delivery_place (1 = 1) (2 4 5 = 2) (3 6 7 = 3) (8 = 4) (9 = 5) (88 = 6)
	label define delivery_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home" 5 "Other" 6 "Dont know",replace
	label values delivery_place delivery_place
	*Birth attendance	
	gen delivery_assist = p1403
	label define delivery_assist 1 "Doctor: Obgyn" 2 "Doctor: GP" 3 "Midwife" 4 "Nurse" 5 "Traditional Doctor" 6 "Others" 7 "None" 8 "Dont know"
	label values delivery_assist delivery_assist

	*Skilled birth attendance
	gen sba = .
	replace sba = 1 if inrange(p1403,1,4)
	replace sba = 0 if inrange(p1403,5,8)
	la var sba "skilled birth attendance"
	la val sba YESNO
	
*Iron and Folic Acid (IFA) supplements for pregnant women
	*proportion pregnant women ever received IFA supplements
	gen received_ifa = p1207
	recode received_ifa (2 3 4 = 0)
	la val received_ifa YESNO

	*Number of IFA tablets received
	recode p1208a2 888 = .
	recode p1208b2 888 = .
	local xox "a b"	
	foreach x of local xox {
		recode p1208`x'2 (miss = 0) if p1208`x'2 == . & p1207==1
}	
	gen m1 = p1208a2 + p1208b2
	replace m1=. if p1207!=1
	
	*Number of IFA tablets received
	gen received_ifa_no = m1
	recode received_ifa_no (1/89 = 1) (90/max = 0)
	replace received_ifa_no = . if p1207!=1 & received_ifa_no == .
	la def received_ifa_no 0">=90" 1"<90",replace
	la val received_ifa_no received_ifa_no
	
	recode p1208a3 888 = .
	recode p1208b3 888 = .
	local xox "a b"	
	foreach x of local xox {
		recode p1208`x'3 (miss = 0) if p1208`x'3 == . & p1207==1
}		
	gen m2 = p1208a3 + p1208b3
	replace m2=. if p1207!=1
	
	*Number of IFA tablets consumed
	gen consumed_ifa_no = m2
	recode consumed_ifa_no (0/89 = 1) (90/max = 0)
	replace consumed_ifa_no = . if p1207!=1 & consumed_ifa_no == .
	la def consumed_ifa_no 0">=90" 1"<90",replace
	la val consumed_ifa_no consumed_ifa_no


*Supplementary feeding for pregnant women
{
	*proportion pregnant women received supplementary feeding
	gen suppl_pregnant = p1212
	recode suppl_pregnant 2 = 0
	la val suppl_pregnant YESNO

	*pack of buscuit program
	gen suppl_biscuit_pack = p1214a2
	recode suppl_biscuit_pack 0/30 = 0 31/89 = 1 90/max = 2 888 = .
	la def suppl_biscuit_pack 0 "0-30" 1 "31-89" 2 "90+"
	la val suppl_biscuit_pack suppl_biscuit_pack
	
	*pregnant women received suppl. feeding and consume all
	*a. Biskuit Program
	gen suppl_biscuit = 1 if p1214a1 == 1 & p1214a3 == 1	
	recode suppl_biscuit (. = 0) if suppl_pregnant==1 
	*b. Biskuit lainnya
	gen suppl_biscuit1 = 1 if p1214b1 == 1 & p1214b4 == 1
	recode suppl_biscuit1 (. = 0) if suppl_pregnant==1 
	*c. Susu Bubuk
	gen suppl_milkpowder = 1 if p1214c1 == 1 & p1214c3 == 1
	recode suppl_milkpowder (. = 0) if suppl_pregnant==1 
	*d. Susu Cair
	gen suppl_milkcream = 1 if p1214d1 == 1 & p1214d3 == 1
	recode suppl_milkcream (. = 0) if suppl_pregnant==1 
	*e. Bahan Makanan Mentah
	gen suppl_rawfood = 1 if p1214e1 == 1 & p1214e3 == 1
	recode suppl_rawfood (. = 0) if suppl_pregnant==1 
	*f. Makanan Matang
	gen suppl_cooked = 1 if p1214f1 == 1 & p1214f3 == 1		
	recode suppl_cooked (. = 0) if suppl_pregnant==1 
}	
		
****************************************
****Morbidities (diarrhoea, TB, ARI)****
****************************************
{	
	*Diarrhoea (diagnosed and/or symptoms)
	gen morbidity_diarrhoea = 1 if p903 == 1 | p904 == 1
	recode morbidity_diarrhoea .=0
	la val morbidity_diarrhoea YESNO
	
	*TB
	gen morbidity_TB = 1 if p907 == 1 | p908 == 1
	recode morbidity_TB .=0
	la val morbidity_TB YESNO
	
    *Acute respiratory infection (ARI) (diagnosed and/or symptoms)
	gen morbidity_ARI = 1 if p901 == 1 | p902 == 1
	recode morbidity_ARI .=0
	la val morbidity_ARI YESNO
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
	*Exclusive breastfeeding under six months (EBF)
	*Definition: percentage of infants 0–5 months of age who were fed exclusively with breast milk during the previous day.
	gen exc_bf	= p1305 == 1 & p1307 == 2 if inrange(age_month_child,0,5)
	la val exc_bf YESNO
           	         
	*Mixed milk feeding under six months (MixMF)
	*Definition: percentage of infants 0–5 months of age who were fed formula and/or animal milk in addition to breast milk during the previous day
	gen mixmf = 1 if (p1305 == 1 | p1315d == 1 | p1315e == 1) & inrange(age_month_child,0,5)
	replace mixmf = 0 if mixmf == . & inrange(age_month_child,0,5)
	la val mixmf YESNO
 
}
 
****************************************
****Complementary feeding indicators****
****************************************
{
	*Introduction of solid, semisolid or soft foods 6–8 months (ISSSF)
	*Definition: percentage of infants 6–8 months of age who consumed solid, semisolid or soft foods during the previous day
	gen isssf = 1 if (p1315b == 1 | p1315c == 1 | p1315d == 1 | p1315e == 1 | p1315f == 1 | p1315g == 1 | p1315h == 1 | p1315i == 1 | p1315j == 1 | p1315k == 1 | p1315l == 1 | p1315m == 1 | p1315n == 1 | p1315o == 1 | p1315p == 1 | p1315q == 1 | p1315r == 1 | p1315s == 1 | p1315t == 1 | p1315u == 1) & inrange(age_month_child,6,8)
	replace isssf = 0 if inrange(age_month_child,6,8) & isssf==.
	la val isssf YESNO
	
	*************************
	**The eight food groups**
	*************************
	*food consumed during the previous day
	*breast milk
	gen  breastmilk = p1305 == 1 & inrange(age_month_child,6,23)
	replace breastmilk=. if !inrange(age_month_child,6,23)
	*grains, roots and tubers
	gen  grains = 1 if (p1315h == 1 | p1315i == 1 | p1315k == 1)  & inrange(age_month_child,6,23)
	replace grains = 0 if inrange(age_month_child,6,23) & grains==.
	*pulses (beans, peas, lentils), seeds, legumes and nuts
	gen  nuts = p1315s == 1 if inrange(age_month_child,6,23)
	*dairy products (milk, infant formula, yogurt, cheese)
	gen  diary =1 if (p1315d == 1 | p1315e == 1 | p1315g == 1 | p1315t==1) & inrange(age_month_child,6,23)
	replace  diary =0 if inrange(age_month_child,6,23) & diary==.
	*flesh foods (meat, fish, poultry, organ meats)
	gen  flesh = 1 if (p1315o == 1 | p1315p==1 | p1315r==1) & inrange(age_month_child,6,23)
	replace  flesh =0 if inrange(age_month_child,6,23) & flesh==.
	*eggs
	gen  eggs = p1315q == 1 if inrange(age_month_child,6,23)
	*vitamin A-rich fruit and vegetables 
	gen  arich = 1 if (p1315m == 1 | p1315j == 1 | p1315l == 1) & inrange(age_month_child,6,23)
	replace  arich =0 if inrange(age_month_child,6,23) & arich==.
	*other fruit and vegetables
	gen  fruitsveg = p1315n == 1 & inrange(age_month_child,6,23)
	replace fruitsveg=. if !inrange(age_month_child,6,23)
	
	*Minimum dietary diversity 6–23 months (MDD)
	*definition: percentage of children 6–23 months of age who consumed foods and beverages from at least five out of eight defined food groups during the previous day
	gen mdd =  breastmilk +  grains +  nuts +  diary +  flesh +  eggs +  arich +  fruitsveg
	recode mdd min/4 = 0 5/max = 1
	replace mdd = 0 if inrange(age_month_child,6,23) & mdd==.
	la val mdd YESNO

	*Egg and/or flesh food consumption 6–23 months (EFF)
	*definition: percentage of children 6–23 months of age who consumed egg and/or flesh food during the previous day
	gen eff = 0
	replace eff = 1 if  flesh == 1 |  eggs == 1
	replace eff = . if !inrange(age_month_child,6,23)
	la val eff YESNO
	
	*Sweet beverage consumption 6–23 months (SwB)
	*definition: percentage of children 6–23 months of age who consumed a sweet beverage during the previous day
	gen swb = p1315b == 1 if inrange(age_month_child,6,23)
	la val swb YESNO
	
	*Zero vegetable or fruit consumption 6–23 months (ZVF)
	*definition: percentage of children 6–23 months of age who did not consume any vegetables or fruits during the previous day
	gen zvf = 1 if p1315j == 2 & p1315l == 2 & p1315m == 2 & p1315n == 2 & inrange(age_month_child,6,23)
	replace  zvf =0 if inrange(age_month_child,6,23) & zvf==.
	la val zvf YESNO			   
}
}

* WASH
{
	gen improved_water = sanitasi_layak 
	recode improved_water 2 = 0
	gen improved_sanitation = sam_layak_new
	recode improved_sanitation 2 = 0
}
	 

 
*keep new variable	
	keep strata psu quintile id weight year_svy province_code district_code age_day_child age_month_child age_mother age_father edu_mother edu_father employment_mother_cat employment_father height_mother birth_wgt_25kg birth_lenght_cm vac_idl anc rh_anc_pv rh_anc_pvskill anc_skilled anc_place delivery_place delivery_assist sba received_ifa received_ifa_no consumed_ifa_no suppl_pregnant suppl_biscuit_pack suppl_biscuit suppl_biscuit1 suppl_milkpowder suppl_milkcream suppl_rawfood suppl_cooked morbidity_diarrhoea morbidity_TB morbidity_ARI exc_bf mixmf isssf breastmilk grains nuts diary flesh eggs arich fruitsveg mdd eff swb zvf age_mother_cat age_father_cat employment_mother_cat employment_father_cat improved_sanitation improved_water

			
*Save dataset
	label data
	label data "2022 SSGI - created: $S_DATE $S_TIME"
	compress	
	save "$dta\dt_2022ssgi",replace
	clear