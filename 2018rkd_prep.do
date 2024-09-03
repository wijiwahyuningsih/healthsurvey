/*---------------------------------------------------------------
Create data covariate variables (2018 Riskesdas) - do file
-----------------------------------------------------------------
Date created    : 09/06/2024
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

*load dataset: 2018 Riskesdas 
u "$raw\determinant_2018rkd", clear
la def YESNO 0 "no" 1 "yes"
	
* Rename variable
{
rename (ID PSU STRATA provkab R1801A R1801B R1801C R1801D R1801E R1801F R1801G R1801H R1801I R1801J R1801K R1801L R1801M R1802 B4K10HR B4K10BLN B4K10THN B4K10THN_ibu B4K11_ibu B4K12_ibu B4K10THN_ayah B4K11_ayah B4K12_ayah B10L01B_ibu B10J19A_ibu B10J19B_ibu B10J19C_ibu B10J19D_ibu B10J19E_ibu B10J19F_ibu B10J19G_ibu B10J19H_ibu B10J17_ibu B10J18_ibu B10J20_ibu B10K23A B10K23B B10K23C B10K23D B10K23E B10K23F B10K23G B10K23H B10K23I B10K23J B10K23K B10K23L B10K23M B10K23N B10K23O B10K23P B10K04 B10K05 B10K07 B10K08 B10K32 B10K33 B10K34A B10K34B B10K36 B10K37A B10K37B B10K37C B10K37D B10K37E B10K37F B10K37G B10K37H B10K37I B10K37J B10K37K B10K37L B10K37LS B10K38 B10K39 B10J14_ibu B10J15_ibu B10J16AK2_ibu B10J16AK3_ibu B10J16BK2_ibu B10J16BK3_ibu B10J16CK2_ibu B10J16CK3_ibu B10J40A_ibu B10J40B_ibu B10J40C_ibu B10J41_ibu B10J42_ibu B10J43_ibu B10J43S_ibu B10J28_ibu B10J28S_ibu B10J29_ibu B10J29S_ibu B10J32_ibu B10A13 B10A14A B10A14B B10A14C B10A15A B10A15B B10A15C B10A15D B10A15E B10A05 B10A06A B10A06B B10A06C B10A07 B10A08 B10A09 B10A01 B10A02A B10A02B B10A02C B10A02D B10J21A_ibu B10J21B_ibu B10J21C_ibu B10J22_ibu B10J50_ibu B10J53_ibu B10J52A_ibu B10J52B_ibu B10J52C_ibu B10J52D_ibu B10J52E_ibu B10J52F_ibu B10J52FS_ibu B10J51AK1_ibu B10J51AK2_ibu B10J51AK3_ibu B10J51AK4_ibu B10J51AK4S_ibu B10J51BK1_ibu B10J51BK3_ibu B10J51BK4_ibu B10J51BK4S_ibu B10J51CK1_ibu B10J51CK3_ibu B10J51CK4_ibu B10J51CK4S_ibu B10J51DK1_ibu B10J51DK3_ibu B10J51DK4_ibu B10J51DK4S_ibu B10J51EK1_ibu B10J51EK3_ibu B10J51EK4_ibu B10J51EK4S_ibu B10J51FK1_ibu B10J51FK3_ibu B10J51FK4_ibu B10J51FK4S_ibu B10K44A B10K44B B10K44E B10K44C B10K44D B10K44F B10K44G B10K44H B10K44I B10K44J B10K44K B10K44L B10K44M B10K44MS B10C01_ibu B10C02_ibu B10C03_ibu B10C04_ibu B10C05_ibu B10C06_ibu B10C07_ibu B10C08_ibu B10C09_ibu B10C10_ibu B10K22AK2 B10K22AK3_TGL B10K22AK3_BLN B10K22AK3_THN B10K22BK2 B10K22BK3_TGL B10K22BK3_BLN B10K22BK3_THN B10K22CK2 B10K22CK3_TGL B10K22CK3_BLN B10K22CK3_THN B10K22DK2 B10K22DK3_TGL B10K22DK3_BLN B10K22DK3_THN B10K22EK2 B10K22EK3_TGL B10K22EK3_BLN B10K22EK3_THN B10K22FK2 B10K22FK3_TGL B10K22FK3_BLN B10K22FK3_THN B10K22GK2 B10K22GK3_TGL B10K22GK3_BLN B10K22GK3_THN B10K22HK2 B10K22HK3_TGL B10K22HK3_BLN B10K22HK3_THN B10K22IK5 B10K22IK6_TGL B10K22IK6_BLN B10K22IK6_THN B10K22JK5 B10K22JK6_TGL B10K22JK6_BLN B10K22JK6_THN B10K22KK5 B10K22KK6_TGL B10K22KK6_BLN B10K22KK6_THN B10K22LK5 B10K22LK6_TGL B10K22LK6_BLN B10K22LK6_THN B10K22MK5 B10K22MK6_TGL B10K22MK6_BLN B10K22MK6_THN B10K22NK5 B10K22NK6_TGL B10K22NK6_BLN B10K22NK6_THN B10K22OK5 B10K22OK6_TGL B10K22OK6_BLN B10K22OK6_THN B10K40 B10K41 B10K42 B10K43A B10K43B B10K43C B10K43D B10K43E B10K43F B10K43G B10K43H B10K43I B10K43L B10K43LS QUINTILE) (id psu strata provkab r1801a r1801b r1801c r1801d r1801e r1801f r1801g r1801h r1801i r1801j r1801k r1801l r1801m r1802 b4k10hr b4k10bln b4k10thn b4k10thn_ibu b4k11_ibu b4k12_ibu b4k10thn_ayah b4k11_ayah b4k12_ayah b10l01b_ibu b10j19a_ibu b10j19b_ibu b10j19c_ibu b10j19d_ibu b10j19e_ibu b10j19f_ibu b10j19g_ibu b10j19h_ibu b10j17_ibu b10j18_ibu b10j20_ibu b10k23a b10k23b b10k23c b10k23d b10k23e b10k23f b10k23g b10k23h b10k23i b10k23j b10k23k b10k23l b10k23m b10k23n b10k23o b10k23p b10k04 b10k05 b10k07 b10k08 b10k32 b10k33 b10k34a b10k34b b10k36 b10k37a b10k37b b10k37c b10k37d b10k37e b10k37f b10k37g b10k37h b10k37i b10k37j b10k37k b10k37l b10k37ls b10k38 b10k39 b10j14_ibu b10j15_ibu b10j16ak2_ibu b10j16ak3_ibu b10j16bk2_ibu b10j16bk3_ibu b10j16ck2_ibu b10j16ck3_ibu b10j40a_ibu b10j40b_ibu b10j40c_ibu b10j41_ibu b10j42_ibu b10j43_ibu b10j43s_ibu b10j28_ibu b10j28s_ibu b10j29_ibu b10j29s_ibu b10j32_ibu b10a13 b10a14a b10a14b b10a14c b10a15a b10a15b b10a15c b10a15d b10a15e b10a05 b10a06a b10a06b b10a06c b10a07 b10a08 b10a09 b10a01 b10a02a b10a02b b10a02c b10a02d b10j21a_ibu b10j21b_ibu b10j21c_ibu b10j22_ibu b10j50_ibu b10j53_ibu b10j52a_ibu b10j52b_ibu b10j52c_ibu b10j52d_ibu b10j52e_ibu b10j52f_ibu b10j52fs_ibu b10j51ak1_ibu b10j51ak2_ibu b10j51ak3_ibu b10j51ak4_ibu b10j51ak4s_ibu b10j51bk1_ibu b10j51bk3_ibu b10j51bk4_ibu b10j51bk4s_ibu b10j51ck1_ibu b10j51ck3_ibu b10j51ck4_ibu b10j51ck4s_ibu b10j51dk1_ibu b10j51dk3_ibu b10j51dk4_ibu b10j51dk4s_ibu b10j51ek1_ibu b10j51ek3_ibu b10j51ek4_ibu b10j51ek4s_ibu b10j51fk1_ibu b10j51fk3_ibu b10j51fk4_ibu b10j51fk4s_ibu b10k44a b10k44b b10k44e b10k44c b10k44d b10k44f b10k44g b10k44h b10k44i b10k44j b10k44k b10k44l b10k44m b10k44ms b10c01_ibu b10c02_ibu b10c03_ibu b10c04_ibu b10c05_ibu b10c06_ibu b10c07_ibu b10c08_ibu b10c09_ibu b10c10_ibu b10k22ak2 b10k22ak3_tgl b10k22ak3_bln b10k22ak3_thn b10k22bk2 b10k22bk3_tgl b10k22bk3_bln b10k22bk3_thn b10k22ck2 b10k22ck3_tgl b10k22ck3_bln b10k22ck3_thn b10k22dk2 b10k22dk3_tgl b10k22dk3_bln b10k22dk3_thn b10k22ek2 b10k22ek3_tgl b10k22ek3_bln b10k22ek3_thn b10k22fk2 b10k22fk3_tgl b10k22fk3_bln b10k22fk3_thn b10k22gk2 b10k22gk3_tgl b10k22gk3_bln b10k22gk3_thn b10k22hk2 b10k22hk3_tgl b10k22hk3_bln b10k22hk3_thn b10k22ik5 b10k22ik6_tgl b10k22ik6_bln b10k22ik6_thn b10k22jk5 b10k22jk6_tgl b10k22jk6_bln b10k22jk6_thn b10k22kk5 b10k22kk6_tgl b10k22kk6_bln b10k22kk6_thn b10k22lk5 b10k22lk6_tgl b10k22lk6_bln b10k22lk6_thn b10k22mk5 b10k22mk6_tgl b10k22mk6_bln b10k22mk6_thn b10k22nk5 b10k22nk6_tgl b10k22nk6_bln b10k22nk6_thn b10k22ok5 b10k22ok6_tgl b10k22ok6_bln b10k22ok6_thn b10k40 b10k41 b10k42 b10k43a b10k43b b10k43c b10k43d b10k43e b10k43f b10k43g b10k43h b10k43i b10k43l b10k43ls quintile)
}

* General	
{
gen weight 		= weight_final
gen year_svy		= 2018
gen district_code	= provkab
gen district_code_	= district_code
	tostring district_code_,replace
	gen province_code=substr(district_code_,1,2), b(district_code)
	destring province_code,replace
	drop district_code_
la def quintile 1"poorest" 2"poor" 3"middle" 4"rich" 5"richest"
la val quintile quintile

*Demographic characteristics of child and parents
gen age_day_child = b4k10hr
gen age_month_child	= b4k10bln
gen age_year_child	= b4k10thn

*age
gen age_mother = b4k10thn_ibu
gen age_mother_cat = age_mother
recode age_mother_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_mother_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years" 
la val age_mother_cat age_mother_cat
gen age_father = b4k10thn_ayah
gen age_father_cat = age_father
recode age_father_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_father_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years"
la val age_father_cat age_father_cat

*edu
gen edu_mother = b4k11_ibu
recode edu_mother (2 = 1) (6 7 = 6)
la def edu_mother 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_mother edu_mother

gen edu_father = b4k11_ayah
recode edu_father (2 = 1) (6 7 = 6)
la def edu_father 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_father edu_father

*employment
gen employment_mother = b4k12_ibu
recode employment_mother (1 2 = 1) (3 = 2) (4 = 3) (5 = 4) (6 7 = 5) (8 9 = 6) 
la def employment_mother 1 "none/student" 2"civil servant/police/army/bumn/bumd" 3 "private" 4 "self-employed" 5 "farmers/fisherman" 6 "worker/driver/art/other"
la val employment_mother employment_mother

gen employment_mother_cat = employment_mother
recode employment_mother_cat (1 = 0) (2 3 4 5 6 = 1)
la val employment_mother_cat YESNO

gen employment_father = b4k12_ayah
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
gen height_mother = b10l01b_ibu

*Low birth weight
gen birth_wgt_25kg  = b10k05 if b10k04 == 1
recode birth_wgt_25kg min/2499=1 2500/max=0
la def birth_wgt_25kg 0 ">=2500gr" 1 "<2500gr"
la val birth_wgt_25kg birth_wgt_25kg

*Length at birth
gen birth_lenght_cm  = b10k08  if  b10k07 == 1
}

*********************
****Immunization*****
*********************
*definition: 1x HB-0, 1x BCG, 3x DPT-HB/DPT-HB-HiB, 4x polio or 3x IPV (injection polio vaccine), and 1x measles
{
recode b10k22* (miss = 0)
gen bcg_in = b10k22bk3_tgl + b10k22bk3_bln + b10k22bk3_thn
gen pol1_in = b10k22ik6_tgl + b10k22ik6_bln + b10k22ik6_thn
gen pol2_in = b10k22jk6_tgl + b10k22jk6_bln + b10k22jk6_thn
gen pol3_in = b10k22kk6_tgl + b10k22kk6_bln + b10k22kk6_thn
gen pol4_in = b10k22lk6_tgl + b10k22lk6_bln + b10k22lk6_thn
gen dpthb1_in = b10k22ck3_tgl + b10k22ck3_bln + b10k22ck3_thn
gen dpthb2_in = b10k22dk3_tgl + b10k22dk3_bln + b10k22dk3_thn
gen dpthb3_in = b10k22ek3_tgl + b10k22ek3_bln + b10k22ek3_thn
gen hblahir_in = b10k22ak3_tgl + b10k22ak3_bln + b10k22ak3_thn
gen ipv1_in = b10k22fk3_tgl + b10k22fk3_bln + b10k22fk3_thn
gen ipv2_in = b10k22gk3_tgl + b10k22gk3_bln + b10k22gk3_thn
gen ipv3_in = b10k22hk3_tgl + b10k22hk3_bln + b10k22hk3_thn
gen campak_in = b10k22mk6_tgl + b10k22mk6_bln + b10k22mk6_thn
foreach i of varlist *_in {
	recode `i' (0 = 0) (nonm = 1)
}
gen tbcg 	= bcg_in
gen tpolio 	= (pol1_in + pol2_in + pol3_in + pol4_in)
gen tdpthb	= (dpthb1_in + dpthb2_in + dpthb3_in)
gen tipv    = (ipv1_in + ipv2_in + ipv3_in)
gen thb0 	= hblahir_in
gen tcmp 	= (campak_in)
gen lbcg=1 if b10k23c==1
gen lpolio=1 if b10k23e==1 & b10k23g>=4
gen lipv=1 if b10k23h==1 & b10k23j>=3
gen ldpthb=1 if b10k23k==1 & b10k23m>=3
gen lhb0=1 if b10k23a==1
gen lcmp=1 if b10k23n==1
foreach i of varlist tbcg-tcmp lbcg-lcmp {
	recode `i' (miss = 0)
}
gen vac_bcg 	= tbcg + lbcg
gen vac_polio	= tpolio + lpolio
gen vac_dpthb	= tdpthb + ldpthb
gen vac_ipv	= tipv + lipv
gen vac_hb0	= thb0 + lhb0
gen vac_cmp	= tcmp + lcmp
gen vac_idl = (vac_hb0 >= 1) & (vac_bcg >= 1) & (vac_polio >= 4 | vac_ipv >=3) & (vac_dpthb >= 3) & (vac_cmp >= 1) if inrange(age_month_child,12,23)
}

*********************************************
****ANC, Birth, PNC, IFA and food suppl.*****
*********************************************
{
*ANC indicators
*Complete ANC visit4 (trimester 1, trimester 2, trimester 3) >> (1-1-2)
	gen m1 = b10j16ak3_ibu
	replace m1=0 if b10j14_ibu==1 & m1==.
	gen m2 = b10j16bk3_ibu
	replace m2=0 if b10j14_ibu==1 & m2==.
	gen m3 = b10j16ck3_ibu
	replace m3=0 if b10j14_ibu==1 & m3==.
	gen m12 =  m1 + m2 + m3

	gen anc = .
	replace anc=0 if m12<4 | b10j16ak3_ibu<1 | b10j16bk3_ibu<1 | b10j16ck3_ibu<2 
	replace anc=1 if m12>=1 & b10j16ak3_ibu>=1 & b10j16bk3_ibu>=1 & b10j16ck3_ibu>=2
	replace anc=. if b10j14_ibu!=1
	la var anc "anc4+"
	la val anc YESNO
	drop m1 m2 m3

*ANC skilled
	//ANC provider
	gen rh_anc_pv = 3 if b10j14_ibu == 2 
	replace rh_anc_pv 	= 2 if b10j16ak2_ibu == 2 & b10j16bk2_ibu == 2 & b10j16ck2_ibu == 2
	replace rh_anc_pv 	= 1 if b10j16ak2_ibu == 1 | b10j16bk2_ibu == 1 | b10j16ck2_ibu == 1
	replace rh_anc_pv=. if b10j14_ibu!=1
	label define rh_anc_pv 1 "Health workers"  2 "Non health workers" 3 "No ANC",replace
	label val rh_anc_pv rh_anc_pv
	label var rh_anc_pv "Person providing assistance during ANC"
	recode rh_anc_pv (1 = 1 "Skilled provider") (2/3 = 0 "Unskilled/no one") , gen(rh_anc_pvskill)
	
	gen anc_skilled=0
	replace anc_skilled=. if b10j14_ibu!=1
	replace anc_skilled=1 if anc==1 & rh_anc_pvskill==1
	
	*Skilled anc provider and received quality-adjusted ANC 
/*	label variable b10j19a_ibu   "During pregnancy: height measured"
	label variable b10j19b_ibu   "During pregnancy: weighed"
	label variable b10j19c_ibu   "During pregnancy: blood pressure taken"
	label variable b10j19d_ibu   "Antenatal care: MUAC"
	label variable b10j19e_ibu   "Antenatal care: FUNDUS"
	label variable b10j19f_ibu   "Antenatal care: Baby's position"
	label variable b10j19g_ibu   "Antenatal care: Baby's heart"
	label variable b10j19h_ibu   "Antenatal care: Consultation"*/

	gen anc_qua=0
	replace anc_qua=1 if anc_skilled==1 & b10j19a_ibu==1 & b10j19b_ibu==1 & b10j19c_ibu==1 & b10j19d_ibu==1 & b10j19e_ibu==1 & b10j19f_ibu==1 & b10j19g_ibu==1 & b10j19h_ibu==1
	replace anc_qua=. if anc_skilled==.
	replace anc_qua=. if b10j14_ibu!=1
	la val anc_qua YESNO
	la var anc_qua "anc quality: main treatment - 8 treatment"

	*ANC facility (often)
	gen anc_place = b10j18_ibu
	recode anc_place (1 2 = 1) (3 5 6 9 = 2) (4 7 8 = 3) (10 = 4) 
	replace anc_place=. if b10j14_ibu!=1
	label define anc_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home" 5 "Other"
	label values anc_place anc_place
	
	*ANC providing assistance (often)
	gen anc_assist = b10j17_ibu
	replace anc_assist=. if b10j14_ibu!=1
	label define anc_assist 1 "Doctor: Obgyn" 2 "Doctor: GP" 3 "Midwife" 4 "Nurse"
	label values anc_assist anc_assist

*Assisted deliveries
	*Place of deliveries
	gen delivery_place	= b10j29_ibu 
	recode delivery_place (1 2 = 1) (3 5 6 = 2) (4 7 = 3) (8 = 4) (9 10 11 12 13 = 5)
	label define delivery_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home" 5 "Other"
	label values delivery_place delivery_place
        
	*Skilled birth attendance
	gen m3a = strpos(b10j28_ibu,"A")
	recode m3a 1/max=1
	gen m3b	= strpos(b10j28_ibu,"B")
	recode m3b 1/max=1
	gen m3c		= strpos(b10j28_ibu,"C")
	recode m3c 1/max=1
	gen m3d		= strpos(b10j28_ibu,"D")
	recode m3d 1/max=1
	gen sba = m3a + m3b + m3c + m3d
	recode sba 1/4=1
	replace sba=. if b10j28_ibu==" "
	la var sba "skilled birth attendance"
	la val sba YESNO
	
	gen delivery_assist = .
	replace delivery_assist = 0 if b10j28_ibu==" "
	replace delivery_assist = 1 if m3a==1 & delivery_assist!=0
	replace delivery_assist = 2 if m3b==1 & delivery_assist!=0
	replace delivery_assist = 3 if m3c==1 & delivery_assist!=0
	replace delivery_assist = 4 if m3d==1 & delivery_assist!=0
	label define delivery_assist 1 "Doctor: Obgyn" 2 "Doctor: GP" 3 "Midwife" 4 "Nurse" 0"Non-HCW",replace
	label values delivery_assist delivery_assist
	drop m3a m3b m3c m3d
	
	*Method of deliveries
	gen delivery_method = b10j32_ibu
	recode delivery_method (1 = 0) (2 = 1) (3 4 5 6 = 2)
	label define delivery_method 0 "normal" 1 "sc" 2 "other"
	label values delivery_method delivery_method

*PNC indicators								
	*Complete PNC	
		gen pnc = 0 if b10j40a_ibu!=. | b10j40b_ibu!=. | b10j40c_ibu!=.
		replace pnc = 1 if b10j40a_ibu==1 & b10j40b_ibu==1 & b10j40c_ibu==1
		la var pnc "PNC mother"
		la val pnc YESNO
		
	*PNC received vitA
		gen pnc_vitA = b10j41_ibu
		recode pnc_vitA (2 3 = 2) (4 = 0)
		la var pnc_vitA "how many times did [MOTHER'S NAME] receive vitamin A capsules"
		la def pnc_vitA 1"once" 2"two or more" 0"never"
		la val pnc_vitA pnc_vitA
	
	*During the postpartum period (0-42 days after giving birth), experience the following
		/* b10j43_ibu - ABCDEFGHI
		A. Heavy bleeding from the birth canal
		B. Foul-smelling discharge from the birth canal
		C. Swelling of the face, hands, and feet
		D. Headaches
		E. Seizure 
		F. Fever for more than 2 days
		G. Swollen, red, and painful breasts
		H. Mother appears sad, melancholy/crying for no reason (depression)
		I. Hypertension */

		gen m4a = strpos(b10j43_ibu,"A")
		recode m4a 2/max=1
		gen m4b = strpos(b10j43_ibu,"B")
		recode m4b 2/max=1
		gen m4c = strpos(b10j43_ibu,"C")
		recode m4c 2/max=1
		gen m4d = strpos(b10j43_ibu,"D")
		recode m4d 2/max=1
		gen m4e = strpos(b10j43_ibu,"E")
		recode m4e 2/max=1
		gen m4f = strpos(b10j43_ibu,"F")
		recode m4f 2/max=1
		gen m4g = strpos(b10j43_ibu,"G")
		recode m4g 2/max=1
		gen m4h = strpos(b10j43_ibu,"H")
		recode m4h 2/max=1
		gen m4i = strpos(b10j43_ibu,"I")
		recode m4i 2/max=1
		gen pnc_experience = 0
		replace pnc_experience = 1 if (m4a== 1) | (m4b== 1) | (m4c== 1) | (m4d== 1) | (m4e== 1) | (m4f== 1) | (m4g==1) | (m4h==1) | (m4i==1)
		replace pnc_experience = . if b10j43_ibu == ""
		drop m4a m4b m4c m4d m4e m4f m4g m4h m4i 
		la val pnc_experience YESNO
		
*Iron and Folic Acid (IFA) supplements for pregnant women
	*proportion pregnant women ever received IFA supplements
	gen received_ifa = b10j21a_ibu
	recode received_ifa 2 = 0
	la val received_ifa YESNO
		
	*Number of IFA tablets received
	gen received_ifa_no = b10j21b_ibu
	recode received_ifa_no (1/89 = 1) (90/max = 0) (888 = .)
	la def received_ifa_no 0 ">=90" 1 "<90"  
	la val received_ifa_no received_ifa_no
	
	*Number of IFA tablets consumed
	gen consumed_ifa_no = b10j21c_ibu
	recode consumed_ifa_no (1/89 = 1) (90/max = 0) (888 = .)
	la def consumed_ifa_no 0 ">=90" 1 "<90" 
	la val consumed_ifa_no consumed_ifa_no
	
*Supplementary feeding for pregnant women
	*proportion pregnant women received supplementary feeding
	gen suppl_pregnant = b10j50_ibu
	recode suppl_pregnant 2 = 0
	la val suppl_pregnant YESNO
	
	*pack of buscuit program
	gen suppl_biscuit_pack = b10j51ak2_ibu
	recode suppl_biscuit_pack 0/30 = 0 31/89 = 1 90/max = 2
	la def suppl_biscuit_pack 0 "0-30" 1 "31-89" 2 "90+"
	la val suppl_biscuit_pack suppl_biscuit_pack
	
	*proportion of pregnant women received and consumed all suppl. feeding
	*a. Biskuit Program
	gen suppl_biscuit = 1 if b10j51ak1_ibu == 1 & b10j51ak3_ibu == 1	
	recode suppl_biscuit (. = 0) if suppl_pregnant==1 
	*b. Biskuit lainnya
	gen suppl_biscuit1 = 1 if b10j51bk1_ibu == 1 & b10j51bk3_ibu == 1
	recode suppl_biscuit1 (. = 0) if suppl_pregnant==1 
	*c. Susu Bubuk
	gen suppl_milkpowder = 1 if b10j51ck1_ibu == 1 & b10j51ck3_ibu == 1
	recode suppl_milkpowder (. = 0) if suppl_pregnant==1 
	*d. Susu Cair
	gen suppl_milkcream = 1 if b10j51dk1_ibu == 1 & b10j51dk4_ibu == 1
	recode suppl_milkcream (. = 0) if suppl_pregnant==1 
	*e. Bahan Makanan Mentah
	gen suppl_rawfood = 1 if b10j51ek1_ibu == 1 & b10j51ek4_ibu == 1
	recode suppl_rawfood (. = 0) if suppl_pregnant==1 
	*f. Makanan Matang
	gen suppl_cooked = 1 if b10j51fk1_ibu == 1 & b10j51fk4_ibu == 1		
	recode suppl_cooked (. = 0) if suppl_pregnant==1 
}	

****************************************
****Morbidities (diarrhoea, TB, ARI)****
****************************************
{
	*Diarrhoea (diagnosed and/or symptoms)
	gen sympt_diarrhoea=1 if b10a14a==1 | b10a14b==1 | b10a14c==1
	gen morbidity_diarrhoea = 1 if inlist(b10a13,1,2) | sympt_diarrhoea==1
	recode morbidity_diarrhoea .=0
	drop sympt_diarrhoea
	la val morbidity_diarrhoea YESNO
	
	*TB
	gen morbidity_TB = b10a05
	recode morbidity_TB (1 2 = 1) (3 = 0)
	la val morbidity_TB YESNO
	
    *acute respiratory infection (ARI) (diagnosed and/or symptoms)
	gen sympt_ARI=1 if b10a02a==1 | b10a02b==1 | b10a02c==1 | b10a02d==1
	gen morbidity_ARI = 1 if inlist(b10a01,1) | sympt_ARI==1
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
{
	*Ever breastfed
	*Definition: percentage of children born in the last 24 months who were ever breastfed
	gen evbf = b10k32
	recode evbf (2 8 = 0)
	la val evbf YESNO
	
	*Exclusive breastfeeding under six months (EBF)
	*Definition: percentage of infants 0–5 months of age who were fed exclusively with breast milk during the previous day
	gen exc_bf	= b10k32 == 1 & b10k38 ==1 & b10k40 == 1 if inrange(age_month_child,0,5)
	la val exc_bf YESNO
	
	*Mixed milk feeding under six months (MixMF)
	*Definition: percentage of infants 0–5 months of age who were fed formula and/or animal milk in addition to breast milk during the previous day
	gen mixmf = 1 if (b10k38 == 1 | b10k44e == 1) & inrange(age_month_child,0,5)
	replace mixmf = 0 if mixmf == . & inrange(age_month_child,0,5)
	la val mixmf YESNO
}	
	
****************************************
****Complementary feeding indicators****
****************************************
{
	*Introduction of solid, semisolid or soft foods 6–8 months (ISSSF)
	*Definition: percentage of infants 6–8 months of age who consumed solid, semisolid or soft foods during the previous day
	gen isssf = 1 if (b10k44b == 1 | b10k44c == 1 | b10k44d == 1 | b10k44e == 1 | b10k44f == 1 | b10k44g== 1 | b10k44h == 1 | b10k44i == 1 | b10k44j == 1 | b10k44k == 1 | b10k44l == 1) & inrange(age_month_child,6,8)
	replace isssf = 0 if inrange(age_month_child,6,8) & isssf==.
	la val isssf YESNO
	
	*************************
	**The eight food groups**
	*************************
	*food consumed during the previous day
	*breast milk
	gen  breastmilk = b10k38 == 1 if inrange(age_month_child,6,23)
	*grains, roots and tubers
	gen  grains = b10k44c == 1 if inrange(age_month_child,6,23)
	*pulses (beans, peas, lentils), seeds, legumes and nuts
	gen  nuts = b10k44d == 1 if inrange(age_month_child,6,23)
	*dairy products (milk, infant formula, yogurt, cheese)
	gen  diary =1 if (b10k44e == 1 | b10k44f == 1) & inrange(age_month_child,6,23)
	replace  diary =0 if inrange(age_month_child,6,23) & diary==.
	*flesh foods (meat, fish, poultry, organ meats)
	gen  flesh = b10k44g == 1 if inrange(age_month_child,6,23)
	*eggs
	gen  eggs = b10k44h == 1 if inrange(age_month_child,6,23)
	*vitamin A-rich fruit and vegetables 
	gen  arich = 1 if (b10k44i == 1 | b10k44j == 1) & inrange(age_month_child,6,23)
	replace  arich =0 if inrange(age_month_child,6,23) & arich==.
	*other fruit and vegetables
	gen  fruitsveg = 1 if (b10k44k == 1 | b10k44l == 1) & inrange(age_month_child,6,23)
	replace  fruitsveg =0 if inrange(age_month_child,6,23) & fruitsveg==.

	*Minimum dietary diversity 6–23 months (MDD)
	*definition: percentage of children 6–23 months of age who consumed foods and beverages from at least five out of eight defined food groups during the previous day
	gen mdd = breastmilk + grains +  nuts +  diary +  flesh +  eggs +  arich +  fruitsveg
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
	gen swb = b10k44b == 1 if inrange(age_month_child,6,23)
	replace  swb =0 if inrange(age_month_child,6,23) & swb==.
	la val swb YESNO
	
	*Zero vegetable or fruit consumption 6–23 months (ZVF)
	*definition: percentage of children 6–23 months of age who did not consume any vegetables or fruits during the previous day
	gen zvf = 1 if b10k44i == 2 & b10k44j == 2 & b10k44k == 2 & b10k44l == 2 & inrange(age_month_child,6,23)
	replace zvf =0 if inrange(age_month_child,6,23) & zvf==.
	la val zvf YESNO			   
}
	
*******************
***Mental health***       
*******************
{
	*sad, depressed
	gen mental_sad = b10c01_ibu
	recode mental_sad 2 = 0
	*not interested
	gen mental_notinterest = b10c02_ibu
	recode mental_notinterest 2 = 0
	*exhausted
	gen mental_exhausted = b10c03_ibu
	recode mental_exhausted 2 = 0
	*appetite
	gen mental_appetite = b10c04_ibu
	recode mental_appetite 2 = 0
	*sleeping
	gen mental_sleeping = b10c05_ibu
	recode mental_sleeping 2 = 0
	*speaking
	gen mental_speaking = b10c06_ibu
	recode mental_speaking 2 = 0
	*confident
	gen mental_confident = b10c07_ibu
	recode mental_confident 2 = 0
	*wrong
	gen mental_wrong = b10c08_ibu
	recode mental_wrong 2 = 0
	*thinking
	gen mental_think = b10c09_ibu
	recode mental_think 2 = 0
	*self-harm
	gen mental_harm = b10c10_ibu
	recode mental_harm 2 = 0
	
	gen mental_health = mental_sad + mental_notinterest + mental_exhausted + mental_appetite + mental_sleeping + mental_speaking + mental_confident + mental_wrong + mental_think + mental_harm
}	
		
*keep new variable	
	keep id psu strata weight year_svy province_code district_code quintile age_day_child age_month_child age_year_child age_mother age_mother_cat age_father age_father_cat edu_mother edu_father employment_mother employment_mother_cat employment_father employment_father_cat height_mother vac_idl birth_wgt_25kg birth_lenght_cm anc anc_skilled anc_qua anc_place anc_assist rh_anc_pv rh_anc_pvskill delivery_place delivery_assist sba delivery_method pnc pnc_vitA pnc_experience morbidity_diarrhoea morbidity_TB morbidity_ARI received_ifa received_ifa_no consumed_ifa_no suppl_pregnant suppl_biscuit_pack suppl_biscuit suppl_biscuit1 suppl_milkpowder suppl_milkcream suppl_rawfood suppl_cooked evbf exc_bf mixmf isssf breastmilk grains nuts diary flesh eggs arich fruitsveg mdd eff swb zvf mental_sad mental_notinterest mental_exhausted mental_appetite mental_sleeping mental_speaking mental_confident mental_wrong mental_think mental_harm mental_health
		
*Save dataset
	label data
	label data "2018 Riskesdas - created: $S_DATE $S_TIME"
	compress	
	save "$dta\dt_2018rkd",replace
	clear
	
