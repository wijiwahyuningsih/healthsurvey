/*---------------------------------------------------------------
Create data covariate variables 2023 SKI) - do file
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

*load dataset:2023 SKI 
u "$raw\determinant_2023ski", clear	
la def YESNO 0 "no" 1 "yes"
	
*Rename
{
	rename (CASE PSU STRATA w_final provkab B1R1 B1R5 kuintil B7R4A B7R4B B7R4C B7R4D B7R4E B7R4F B7R4G B7R4H B7R4I B7R4J B7R4K B7R4L B7R4M B7R4N B7R4O B7R4P B4K7KD B4K7HR B4K7BLN B4K7THN_AYAH B4K8_AYAH B4K9_AYAH B4K7THN_IBU B4K8_IBU B4K9_IBU C01_IBU C02_IBU C03_IBU JMLC01_03_IBU C04_IBU C05_IBU C06_IBU C07_IBU C08_IBU C09_IBU C10_IBU JMLC04_10_IBU C11_IBU C12_IBU J02B_IBU I20A2 I20A3 I20A4 I20B2 I20B3 I20B4 I20C2 I20C3 I20C4 I20D2 I20D3 I20D4 I20E2 I20E3 I20E4 I20F2 I20F3 I20F4 I20G2 I20G3 I20G4 I20H2 I20H3 I20H4 I20I2 I20I3 I20I4 I20J2 I20J3 I20J4 I20K2 I20K3 I20K4 I21A2 I21A3 I21A4 I21A5 I21B2 I21B3 I21B4 I21B5 I21C2 I21C3 I21C4 I21C5 I21D2 I21D3 I21D4 I21D5 I21E2 I21E3 I21E4 I21E5 I21F2 I21F3 I21F4 I21F5 I22A I22B I22C I22D I22E I22F I22G I22H I22I I22J I22K I22L I05A I07 I32A I32B I35 I36 I37 I38 I39 I40 I41 I42A I42B I42C I42D I42E I42F I42G I42H I42I I42J I42K I42L I42LS A01 A02A A02B A02C A03A A03B A03C A04A A04B A04C A04D A04E A04F A04G A12 A13A A13B A13C A13D A14A A14B A14C A14D A14E A14ES A15 A16 A05 A06A A06B A06C A07A A07B A07C A07D A08 I50A I50A2 I50B I50C I50D I50E I50E2 I50F I50F2 I50G I50H I50H2 I50I I50J I50K I50L I50M I50N I50O I50P I50Q I50R I50S I50T I50U I50V H09_IBU H10_IBU H11A1_IBU H11A2_IBU H11A3_IBU H11A4_IBU H11A5_IBU H11A6_IBU H11A7_IBU H11A8_IBU H11B1_IBU H11B2_IBU H11B3_IBU H11B4_IBU H11B5_IBU H11B6_IBU H11B7_IBU H11B8_IBU H11C1_IBU H11C2_IBU H11C3_IBU H11C4_IBU H11C5_IBU H11C6_IBU H11C7_IBU H11C8_IBU H11D1_IBU H11D2_IBU H11D3_IBU H11D4_IBU H11D5_IBU H11D6_IBU H11D7_IBU H11D8_IBU H12_IBU H13A_IBU H13B_IBU H13C_IBU H13D_IBU H13E_IBU H13F_IBU H13G_IBU H13H_IBU H13I_IBU H13J_IBU H13K_IBU H13L_IBU H13M_IBU H13N_IBU H13O_IBU H13P_IBU H13Q_IBU H13R_IBU H13S_IBU H41A_IBU H41B_IBU H41C_IBU H41D_IBU H44_IBU H45_IBU H46_IBU H28_IBU H28S_IBU H29_IBU H29S_IBU H32_IBU H32S_IBU H18A_IBU H18B_IBU H19A1_IBU H19A2_IBU H19A3_IBU H19A4_IBU H19B1_IBU H19B2_IBU H19B3_IBU H19B4_IBU H20_IBU H56_IBU H57_IBU H58A_IBU H58B_IBU H58C_IBU H58D_IBU H58E_IBU H58F_IBU H58G_IBU H58GS_IBU H59A2_IBU H59A3_IBU H59A4_IBU H59A5_IBU H59B2_IBU H59B3_IBU H59B4_IBU H59B5_IBU H59C2_IBU H59C2S_IBU H59C3_IBU H59C4_IBU H59C5_IBU I44A I44B I44C I44D I44E I44F I44G I44H I44I I44J I44JS) (case psu strata w_final provkab b1r1 b1r5 kuintil b7r4a b7r4b b7r4c b7r4d b7r4e b7r4f b7r4g b7r4h b7r4i b7r4j b7r4k b7r4l b7r4m b7r4n b7r4o b7r4p b4k7kd b4k7hr b4k7bln b4k7thn_ayah b4k8_ayah b4k9_ayah b4k7thn_ibu b4k8_ibu b4k9_ibu c01_ibu c02_ibu c03_ibu jmlc01_03_ibu c04_ibu c05_ibu c06_ibu c07_ibu c08_ibu c09_ibu c10_ibu jmlc04_10_ibu c11_ibu c12_ibu j02b_ibu i20a2 i20a3 i20a4 i20b2 i20b3 i20b4 i20c2 i20c3 i20c4 i20d2 i20d3 i20d4 i20e2 i20e3 i20e4 i20f2 i20f3 i20f4 i20g2 i20g3 i20g4 i20h2 i20h3 i20h4 i20i2 i20i3 i20i4 i20j2 i20j3 i20j4 i20k2 i20k3 i20k4 i21a2 i21a3 i21a4 i21a5 i21b2 i21b3 i21b4 i21b5 i21c2 i21c3 i21c4 i21c5 i21d2 i21d3 i21d4 i21d5 i21e2 i21e3 i21e4 i21e5 i21f2 i21f3 i21f4 i21f5 i22a i22b i22c i22d i22e i22f i22g i22h i22i i22j i22k i22l i05a i07 i32a i32b i35 i36 i37 i38 i39 i40 i41 i42a i42b i42c i42d i42e i42f i42g i42h i42i i42j i42k i42l i42ls a01 a02a a02b a02c a03a a03b a03c a04a a04b a04c a04d a04e a04f a04g a12 a13a a13b a13c a13d a14a a14b a14c a14d a14e a14es a15 a16 a05 a06a a06b a06c a07a a07b a07c a07d a08 i50a i50a2 i50b i50c i50d i50e i50e2 i50f i50f2 i50g i50h i50h2 i50i i50j i50k i50l i50m i50n i50o i50p i50q i50r i50s i50t i50u i50v h09_ibu h10_ibu h11a1_ibu h11a2_ibu h11a3_ibu h11a4_ibu h11a5_ibu h11a6_ibu h11a7_ibu h11a8_ibu h11b1_ibu h11b2_ibu h11b3_ibu h11b4_ibu h11b5_ibu h11b6_ibu h11b7_ibu h11b8_ibu h11c1_ibu h11c2_ibu h11c3_ibu h11c4_ibu h11c5_ibu h11c6_ibu h11c7_ibu h11c8_ibu h11d1_ibu h11d2_ibu h11d3_ibu h11d4_ibu h11d5_ibu h11d6_ibu h11d7_ibu h11d8_ibu h12_ibu h13a_ibu h13b_ibu h13c_ibu h13d_ibu h13e_ibu h13f_ibu h13g_ibu h13h_ibu h13i_ibu h13j_ibu h13k_ibu h13l_ibu h13m_ibu h13n_ibu h13o_ibu h13p_ibu h13q_ibu h13r_ibu h13s_ibu h41a_ibu h41b_ibu h41c_ibu h41d_ibu h44_ibu h45_ibu h46_ibu h28_ibu h28s_ibu h29_ibu h29s_ibu h32_ibu h32s_ibu h18a_ibu h18b_ibu h19a1_ibu h19a2_ibu h19a3_ibu h19a4_ibu h19b1_ibu h19b2_ibu h19b3_ibu h19b4_ibu h20_ibu h56_ibu h57_ibu h58a_ibu h58b_ibu h58c_ibu h58d_ibu h58e_ibu h58f_ibu h58g_ibu h58gs_ibu h59a2_ibu h59a3_ibu h59a4_ibu h59a5_ibu h59b2_ibu h59b3_ibu h59b4_ibu h59b5_ibu h59c2_ibu h59c2s_ibu h59c3_ibu h59c4_ibu h59c5_ibu i44a i44b i44c i44d i44e i44f i44g i44h i44i i44j i44js)
}

* General	
{
gen id  		= case	
gen weight 		= w_final
gen year_svy		= 2023
gen province_code	= b1r1
gen district_code	= provkab
gen urban		= b1r5==1
gen quintile	= kuintil
la def quintile 1"poorest" 2"poor" 3"middle" 4"rich" 5"richest"
la val quintile quintile

*Demographic characteristics of child and parents
gen age_day_child 	= b4k7hr
gen age_month_child	= b4k7bln

*age
gen age_mother = b4k7thn_ibu
gen age_mother_cat = age_mother
recode age_mother_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_mother_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years" 
la val age_mother_cat age_mother_cat

gen age_father = b4k7thn_ayah
gen age_father_cat = age_father
recode age_father_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_father_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years"
la val age_father_cat age_father_cat

*edu
gen edu_mother = b4k8_ibu
recode edu_mother (0 2 = 1) (6 7 = 6)
la def edu_mother 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_mother edu_mother

gen edu_father = b4k8_ayah
recode edu_father (2 = 1) (6 7 = 6)
la def edu_father 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_father edu_father

*employment
gen employment_mother = b4k9_ibu
recode employment_mother (0 1 2 = 1) (3 = 2) (4 = 3) (5 = 4) (6 7 = 5) (8 9 = 6) 
la def employment_mother 1 "none/student" 2"civil servant/police/army/bumn/bumd" 3 "private" 4 "self-employed" 5 "farmers/fisherman" 6 "worker/driver/art/other",replace
la val employment_mother employment_mother

gen employment_mother_cat = employment_mother
recode employment_mother_cat (1 = 0) (2 3 4 5 6 = 1)
la val employment_mother_cat YESNO

gen employment_father = b4k9_ayah
recode employment_father (1 2 = 1) (3 = 2) (4 = 3) (5 = 4) (6 7 = 5) (8 9 = 6) 
la def employment_father 1 "none/student" 2"civil servant/police/army/bumn/bumd" 3 "private" 4 "self-employed" 5 "farmers/fisherman" 6 "worker/driver/art/other"
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
gen height_mother = j02b_ibu

*Birth weight (or low birth weight status)
gen birth_wgt_25kg  = i05a 
recode birth_wgt_25kg min/2499=1 2500/max=0 8888=.
la def birth_wgt_25kg 0 ">=2500gr" 1 "<2500gr",replace
la val birth_wgt_25kg birth_wgt_25kg

*Length at birth
gen birth_lenght_cm  = i07
recode birth_lenght_cm 88 = .
}

*********************
****Immunization*****
*********************
*definition: 1x HB-0, 1x BCG, 3x DPT-HB/DPT-HB-HiB, 4x polio or 3x IPV (injection polio vaccine), and 1x measles
{
	gen vac_bcg=1 if inlist(i20b2,1,2)
	gen pol1_in=1 if inlist(i21a2,1,2)
	recode pol1_in .=0
	gen pol2_in=1 if inlist(i21b2,1,2)
	recode pol2_in .=0
	gen pol3_in=1 if inlist(i21c2,1,2)
	recode pol3_in .=0
	gen pol4_in=1 if inlist(i21d2,1,2)
	recode pol4_in .=0
	
	gen dpthb1_in=1 if inlist(i20c2,1,2)
	recode dpthb1_in .=0
	gen dpthb2_in=1 if inlist(i20d2,1,2)
	recode dpthb2_in .=0
	gen dpthb3_in=1 if inlist(i20e2,1,2)
	recode dpthb3_in .=0

	gen vac_hb0=1 if inlist(i20a2,1,2)
	recode vac_hb0 .=0
	gen vac_cmp=1 if inlist(i20j2,1,2)
	gen vac_polio=pol1_in+pol3_in+pol3_in+pol4_in
	gen vac_dpthb=dpthb1_in+dpthb2_in+dpthb3_in
	gen vac_idl = (vac_hb0 >= 1) & (vac_bcg >= 1) & (vac_polio >= 4) & (vac_dpthb >= 3) & (vac_cmp >= 1) if inrange(age_month_child,12,23)	
}
    
	
*********************************************
****ANC, Birth, PNC, IFA and food suppl.*****
*********************************************
*ANC indicators (NA)
*Complete ANC visit4 (trimester 1, trimester 2, trimester 3) >> (1-1-2)
	recode h11a2_ibu 88 = .
	recode h11b2_ibu 88 = .
	recode h11c2_ibu 88 = .
	recode h11d2_ibu 88 = .
	local xox "a b c d"	
	foreach x of local xox {
		recode h11`x'2_ibu (miss = 0) if h11`x'2_ibu == . | h11`x'2_ibu == 88
}	
	gen m1 = h11a2_ibu + h11b2_ibu + h11c2_ibu + h11d2_ibu
	replace m1=. if h09_ibu==2
	recode m1 0 = .
	replace m1=0 if h09_ibu==1 & m1==.

	recode h11a3_ibu 88 = .
	recode h11b3_ibu 88 = .
	recode h11c3_ibu 88 = .
	recode h11d3_ibu 88 = .	
	local xox "a b c d"	
	foreach x of local xox {
		recode h11`x'3_ibu (miss = 0) if h11`x'3_ibu == .
}	
	gen m2 = h11a3_ibu + h11b3_ibu + h11c3_ibu + h11d3_ibu
	replace m2=. if h09_ibu==2
	recode m2 0 = .
	replace m2=0 if h09_ibu==1 & m2==.

	recode h11a4_ibu 88 = .
	recode h11b4_ibu 88 = .
	recode h11c4_ibu 88 = .
	recode h11d4_ibu 88 = .	
	local xox "a b c d"	
	foreach x of local xox {
		recode h11`x'4_ibu (miss = 0) if h11`x'4_ibu == .
}	
	gen m3 = h11a4_ibu + h11b4_ibu + h11c4_ibu + h11d4_ibu
	replace m3=. if h09_ibu==2
	recode m3 0 = .
	replace m3=0 if h09_ibu==1 & m3==.
	
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
	gen rh_anc_pv = 3 if h09_ibu == 2
	replace rh_anc_pv 	= 2 if h11a1_ibu == 2 & h11b1_ibu == 2 & h11c1_ibu == 2 | h11d1_ibu == 2
	replace rh_anc_pv 	= 1 if h11a1_ibu == 1 | h11b1_ibu == 1 | h11c1_ibu == 1 | h11d1_ibu == 1
	replace rh_anc_pv=. if h09_ibu!=1
	label define rh_anc_pv 1 "Health workers"  2 "Non health workers" 3 "No ANC",replace
	label val rh_anc_pv rh_anc_pv
	label var rh_anc_pv "Person providing assistance during ANC"
	recode rh_anc_pv (1 = 1 "Skilled provider") (2/3 = 0 "Unskilled/no one") , gen(rh_anc_pvskill)
	gen anc_skilled=0
	replace anc_skilled=. if h09_ibu!=1
	replace anc_skilled=1 if anc==1 & rh_anc_pvskill==1
	
	*Skilled anc provider and received quality-adjusted ANC 
	gen anc_qua=0
	replace anc_qua=1 if anc_skilled==1 & h13a_ibu==1 & h13b_ibu==1 & h13c_ibu==1 & h13d_ibu==1 & h13e_ibu==1 & h13f_ibu==1 & h13g_ibu==1 & (h13r_ibu==1 | h13s_ibu==1)
	replace anc_qua=. if h09_ibu!=1
	replace anc_qua=. if anc_skilled==.
	la val anc_qua YESNO
	la var anc_qua "anc quality: main treatment - 8 treatment"
				
/*	label variable h13a_ibu   "During pregnancy: height measured"
	label variable h13b_ibu   "During pregnancy: weighed"
	label variable h13c_ibu   "During pregnancy: blood pressure taken"
	label variable h13d_ibu   "Antenatal care: MUAC"
	label variable h13e_ibu   "Antenatal care: FUNDUS"
	label variable h13f_ibu   "Antenatal care: Baby's position"
	label variable h13g_ibu   "Antenatal care: Baby's heart"
	label variable h13s_ibu   "Antenatal care: Consultation"*/
	
	*ANC facility (often)
	gen anc_place = h12_ibu
	recode anc_place (1 = 1) (2 5 = 2) (3 4 6 7 = 3) (8 = 4) 
	replace anc_place=. if h09_ibu!=1
	label define anc_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home"
	label values anc_place anc_place
  
*Assisted deliveries
	*Place of deliveries
	gen delivery_place	= h29_ibu
	recode delivery_place (1 2 = 1) (3 5 6 = 2) (4 7 = 3) (8 = 4) (9 = 5)
	label define delivery_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home" 5 "Other"
	label values delivery_place delivery_place

	*Skilled birth attendance
	gen m3a = strpos(h28_ibu,"A")
	recode m3a 2/max=1
	gen m3b	= strpos(h28_ibu,"B")
	recode m3b 2/max=1
	gen m3c	= strpos(h28_ibu,"C")
	recode m3c 2/max=1
	gen m3d	= strpos(h28_ibu,"D")
	recode m3d 2/max=1
	gen sba = .
	replace sba = 0 if (m3a==0) & (m3b==0) & (m3c==0) & (m3d==0)
	replace sba = 1 if (m3a==1) | (m3b==1) | (m3c==1) | (m3d==1)
	replace sba=. if h28_ibu==" "
	la var sba "skilled birth attendance"
	la val sba YESNO
	
	gen delivery_assist = .
	replace delivery_assist = 0 if h28_ibu==" "
	replace delivery_assist = 1 if m3a==1 & delivery_assist!=0
	replace delivery_assist = 2 if m3b==1 & delivery_assist!=0
	replace delivery_assist = 3 if m3c==1 & delivery_assist!=0
	replace delivery_assist = 4 if m3d==1 & delivery_assist!=0
	label define delivery_assist 1 "Doctor: Obgyn" 2 "Doctor: GP" 3 "Midwife" 4 "Nurse" 0"Non-HCW",replace
	label values delivery_assist delivery_assist
	drop m3a m3b m3c m3d
	
	*Method of deliveries
	gen delivery_method = h32_ibu
	recode delivery_method  (1 = 0) (2 = 1) (3 4 5 6 = 2)
	label define delivery_method 0 "normal" 1 "sc" 2 "other"
	label values delivery_method delivery_method

*PNC indicators								
	*Complete PNC	
		gen pnc = 0 if h41a_ibu!=. | h41b_ibu!=. | h41c_ibu!=. | h41d_ibu!=.
		replace pnc = 1 if h41a_ibu==1 & (h41b_ibu==1 | h41c_ibu==1) & h41d_ibu==1
		la var pnc "PNC mother"
		la val pnc YESNO

	*PNC received vitA
		gen pnc_vitA = h44_ibu
		recode pnc_vitA (2 3 = 2) (4 = 0)
		la var pnc_vitA "how many times did [MOTHER'S NAME] receive vitamin A capsules"
		la def pnc_vitA 1"once" 2"two or more" 0"never"
		la val pnc_vitA pnc_vitA
	
	*During the postpartum period (0-42 days after giving birth), experience the following
		gen m4a = strpos(h46_ibu,"A")
		recode m4a 2/max=1
		gen m4b = strpos(h46_ibu,"B")
		recode m4b 2/max=1
		gen m4c = strpos(h46_ibu,"C")
		recode m4c 2/max=1
		gen m4d = strpos(h46_ibu,"D")
		recode m4d 2/max=1
		gen m4e = strpos(h46_ibu,"E")
		recode m4e 2/max=1
		gen m4f = strpos(h46_ibu,"F")
		recode m4f 2/max=1
		gen m4g = strpos(h46_ibu,"G")
		recode m4g 2/max=1
		gen m4h = strpos(h46_ibu,"H")
		recode m4h 2/max=1
		gen m4i = strpos(h46_ibu,"I")
		recode m4i 2/max=1
		gen m4j = strpos(h46_ibu,"J")
		recode m4j 2/max=1
		gen pnc_experience = 0
		replace pnc_experience = 1 if (m4a== 1) | (m4b== 1) | (m4c== 1) | (m4d== 1) | (m4e== 1) | (m4f== 1) | (m4g==1) | (m4h==1) | (m4i==1) | (m4j==1)
		replace pnc_experience = . if h46_ibu == ""
		drop m4a m4b m4c m4d m4e m4f m4g m4h m4i m4j
		la val pnc_experience YESNO
	
*Iron and Folic Acid (IFA) supplements for pregnant women
	*proportion pregnant women ever received IFA supplements
	gen received_ifa = h18a_ibu
	recode received_ifa (2 = 0)
	la val received_ifa YESNO

	*Number of IFA tablets received
	local xox "a b"	
	foreach x of local xox {
		recode h19`x'2_ibu (miss = 0) if h19`x'2_ibu == .
}	
	gen m1 = h19a2_ibu + h19b2_ibu
	replace m1=. if h18a_ibu!=1
	
	*Number of IFA tablets received
	gen received_ifa_no = m1
	recode received_ifa_no (1/89 = 1) (90/max = 0)
	la def received_ifa_no 0 ">=90" 1 "<90" 
	la val received_ifa_no received_ifa_no
	
	local xox "a b"	
	foreach x of local xox {
		recode h19`x'3_ibu (miss = 0) if h19`x'3_ibu == .
}		
	gen m2 = h19a3_ibu + h19b3_ibu
	replace m2=. if h18a_ibu!=1

	*Number of IFA tablets consumed
	gen consumed_ifa_no = m2
	recode consumed_ifa_no (1/89 = 1) (90/max = 0)
	la def consumed_ifa_no 0 ">=90" 1 "<90" 
	la val consumed_ifa_no consumed_ifa_no
	
*Supplementary feeding for pregnant women
	*proportion pregnant women received supplementary feeding
	gen suppl_pregnant = h56_ibu
	recode suppl_pregnant 2 = 0
	la val suppl_pregnant YESNO
	
	*Supplementary feeding during pregnancy
	*a. Biskuit Program
	gen suppl_biscuit = 1 if h59a2_ibu == 1 & (h59a4_ibu == h59a3_ibu)	
	recode suppl_biscuit (. = 0) if h56_ibu==1 
	*b. Pangan lokal
	gen suppl_panganlokal = 1 if h59b2_ibu == 1 & (h59b4_ibu == h59b3_ibu)	
	recode suppl_panganlokal (. = 0) if h56_ibu==1 
	*c. Lainnya
	gen suppl_other = 1 if h59c2_ibu == 1 & (h59c3_ibu == h59c4_ibu)
	recode suppl_other (. = 0) if h56_ibu==1 
		
	*pack of buscuit program
	gen suppl_biscuit_pack = h59a3_ibu
	recode suppl_biscuit_pack 0/30 = 0 31/89 = 1 90/max = 2
	la def suppl_biscuit_pack 0 "0-30" 1 "31-89" 2 "90+"
	la val suppl_biscuit_pack suppl_biscuit_pack
	
	
****************************************
****Morbidities (diarrhoea, TB, ARI)****
****************************************
{
	*Diarrhoea (diagnosed and/or symptoms)
	gen sympt_diarrhoea=1 if a03c==1 | a03b==1 | a03a==1
	gen morbidity_diarrhoea = 1 if inlist(a01,1,2) | sympt_diarrhoea==1
	recode morbidity_diarrhoea .=0
	drop sympt_diarrhoea
	la val morbidity_diarrhoea YESNO
	  
	*Tuberculosis (TB)
	gen morbidity_TB = a12
	recode morbidity_TB (1 2 = 1) (3 = 0)
	la val morbidity_TB YESNO

   	*Acute respiratory infection (ARI) (diagnosed and/or symptoms)
	gen sympt_ARI=1 if a07d==1 | a07c==1 | a07b==1 | a07a==1
	gen morbidity_ARI = 1 if a05==1 | sympt_ARI==1
	recode morbidity_ARI .=0
	drop sympt_ARI
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

	*Ever breastfed
	*Definition: percentage of children born in the last 24 months who were ever breastfed
	gen evbf = i35
	recode evbf (2 3 8 = 0)
	la val evbf YESNO

	*Exclusive breastfeeding under six months (EBF)
	*Definition: percentage of infants 0–5 months of age who were fed exclusively with breast milk during the previous day.
	gen exc_bf	= i37 == 1 & i39 == 2 if inrange(age_month_child,0,5)
	la val exc_bf YESNO
	
	*Mixed milk feeding under six months (MixMF)
	*Definition: percentage of infants 0–5 months of age who were fed formula and/or animal milk in addition to breast milk during the previous day
	gen mixmf = 1 if (i37 == 1 | i50a == 1 | i50e == 1 | i50f == 1) & inrange(age_month_child,0,5)
	replace mixmf = 0 if mixmf == . & inrange(age_month_child,0,5)
	la val mixmf YESNO 
	         
			 
****************************************
****Complementary feeding indicators****
****************************************
{
	*Introduction of solid, semisolid or soft foods 6–8 months (ISSSF)
	*Definition: percentage of infants 6–8 months of age who consumed solid, semisolid or soft foods during the previous day
	gen isssf = 1 if (i50c == 1 | i50d == 1 | i50e == 1 | i50f == 1 | i50g == 1 | i50h == 1 | i50i == 1 | i50j == 1 | i50k == 1 | i50l == 1 | i50m == 1 | i50n == 1 | i50o == 1 | i50p == 1 | i50q == 1 | i50r == 1 | i50s == 1 | i50t == 1 | i50u == 1 | i50v == 1) & inrange(age_month_child,6,8)
	replace isssf = 0 if inrange(age_month_child,6,8) & isssf==.
	la val isssf YESNO
	
	*************************
	**The eight food groups**
	*************************
	*food consumed during the previous day
	*breast milk
	gen  breastmilk = 1 if (i37 == 1 | i50a == 1) & inrange(age_month_child,6,23)
	replace breastmilk = 0 if inrange(age_month_child,6,23) & breastmilk==.
	*grains, roots and tubers
	gen  grains = 1 if (i50j == 1 | i50l == 1 | i50i == 1) & inrange(age_month_child,6,23)
	replace grains = 0 if inrange(age_month_child,6,23) & grains==.
	*pulses (beans, peas, lentils), seeds, legumes and nuts
	gen  nuts = i50t == 1 if inrange(age_month_child,6,23)
	*dairy products (milk, infant formula, yogurt, cheese)
	gen  diary =1 if (i50e == 1 | i50f==1 | i50h==1 | i50u==1) & inrange(age_month_child,6,23)
	replace diary = 0 if inrange(age_month_child,6,23) & diary==.
	*flesh foods (meat, fish, poultry, organ meats)
	gen  flesh = 1 if (i50p == 1 | i50q == 1 | i50s == 1) & inrange(age_month_child,6,23)
	replace flesh = 0 if inrange(age_month_child,6,23) & flesh==.
	*eggs
	gen  eggs = i50r == 1 if inrange(age_month_child,6,23)
	*vitamin A-rich fruit and vegetables 
	gen  arich = 1 if (i50k == 1 | i50n == 1 | i50m == 1) & inrange(age_month_child,6,23)
	replace arich = 0 if inrange(age_month_child,6,23) & arich==.
	*other fruit and vegetables
	gen  fruitsveg = i50o == 1 & inrange(age_month_child,6,23)

	*Minimum dietary diversity 6–23 months (MDD)
	*definition: percentage of children 6–23 months of age who consumed foods and beverages from at least five out of eight defined food groups during the previous day
	gen mdd =  breastmilk+  grains +  nuts +  diary +  flesh +  eggs +  arich +  fruitsveg
	recode mdd min/4 = 0 5/max = 1
	replace mdd = . if !inrange(age_month_child,6,23)
	la val mdd YESNO

	*Egg and/or flesh food consumption 6–23 months (EFF)
	*definition: percentage of children 6–23 months of age who consumed egg and/or flesh food during the previous day
	gen eff = 0
	replace eff = 1 if  flesh == 1 | eggs == 1
	replace eff = . if !inrange(age_month_child,6,23)
	la val eff YESNO
	
	*Sweet beverage consumption 6–23 months (SwB)
	*definition: percentage of children 6–23 months of age who consumed a sweet beverage during the previous day
	gen swb = i50c == 1 if inrange(age_month_child,6,23)
	la val swb YESNO
	
	*Zero vegetable or fruit consumption 6–23 months (ZVF)
	*definition: percentage of children 6–23 months of age who did not consume any vegetables or fruits during the previous day
	gen zvf = 1 if i50k == 2 & i50m == 2 & i50n == 2 & i50o == 2 & inrange(age_month_child,6,23)
	replace zvf = 0 if inrange(age_month_child,6,23) & zvf==.
	la val zvf YESNO			   
}

*******************
***Mental health***       
*******************
{	                 
	*sad, depressed
	gen mental_sad = c01_ibu
	recode mental_sad 2 = 0
	*not interested
	gen mental_notinterest = c02_ibu
	recode mental_notinterest 2 = 0
	*exhausted
	gen mental_exhausted = c03_ibu
	recode mental_exhausted 2 = 0
	*appetite
	gen mental_appetite = c04_ibu
	recode mental_appetite 2 = 0
	*sleeping
	gen mental_sleeping = c05_ibu
	recode mental_sleeping 2 = 0
	*speaking
	gen mental_speaking = c06_ibu
	recode mental_speaking 2 = 0
	*confident
	gen mental_confident = c07_ibu
	recode mental_confident 2 = 0
	*wrong
	gen mental_wrong = c08_ibu
	recode mental_wrong 2 = 0
	*thinking
	gen mental_think = c09_ibu
	recode mental_think 2 = 0
	*self-harm
	gen mental_harm = c10_ibu
	recode mental_harm 2 = 0
	
	gen mental_health = mental_sad + mental_notinterest + mental_exhausted + mental_appetite + mental_sleeping + mental_speaking + mental_confident + mental_wrong + mental_think + mental_harm
}
	
*keep new variable	
	keep psu strata id quintile weight year_svy province_code district_code urban age_day_child age_month_child age_mother age_father edu_mother edu_father employment_mother employment_father height_mother birth_wgt_25kg birth_lenght_cm vac_idl anc anc_skilled anc_qua anc_place rh_anc_pv rh_anc_pvskill delivery_place delivery_assist sba delivery_method pnc pnc_vitA pnc_experience received_ifa received_ifa_no consumed_ifa_no suppl_pregnant suppl_biscuit_pack suppl_biscuit suppl_panganlokal suppl_other morbidity_diarrhoea morbidity_TB morbidity_ARI evbf exc_bf mixmf isssf breastmilk grains nuts diary flesh eggs arich fruitsveg mdd eff swb zvf mental_sad mental_notinterest mental_exhausted mental_appetite mental_sleeping mental_speaking mental_confident mental_wrong mental_think mental_harm mental_health age_mother_cat age_father_cat employment_mother_cat employment_father_cat
	
*Save dataset
	label data
	label data "SKI 2023 - created: $S_DATE $S_TIME"
	compress	
	save "$dta\dt_2023ski",replace
	clear