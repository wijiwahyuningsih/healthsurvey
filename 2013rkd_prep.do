/*---------------------------------------------------------------
Create data covariate variables (2013 Riskesdas) - do file
-----------------------------------------------------------------
Date created    : 31/07/2024
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

*load dataset: 2013 Riskesdas (individu)
u "$raw\determinant_2013rkd", clear
la def YESNO 0 "no" 1 "yes"

* Rename variable
{
rename (IDRT IDART PSU STRATA fwt B1R1 B1R2 B1R5 B1R6 B1R7 B1R8 TGL_KP BLN_KP THN_KP TGL_KA BLN_KA THN_KA NART NO_ART B4K3 B4K4 B4K5 B4K6TGL B4K6BLN B4K6THN B4K7KD B4K7HR B4K7BLN B4K7THN B4K8 B4K9 B4K10 B4K11 B4K12 B4K13 B4K14 NO_AYAH NO_IBU NO_PDPG A01 A02 A03 A04 A05A A05B A05C A05D A05E A05F A06 A07 A08A A08B A08C A09 A10 A11 A12 A13 A14 A15 A16 A17A A17B A17C A17D A17E A17F A17G A17H A18 A19A A19B A20 A21 A22 A23 B01 IA01 IA02A IA02B IA02C IA02D IA02E IA02F IA02G IA02H IA02I IA02J IA03 IA04 IA05A IA05B IA05C IA06BLN IA06THN IA07 IB01 IB02 IB03 IB04 IB05A IB05B IB05C IB05D IB06 IC01 JA01 JA02 JA03 JA04 JA05 JA06 JA07 JA08A JA09A JA08B JA09B JA08C JA09C JA10 JA11 JA11S JA12 JA13 JA14 JA15 JA15_S JA16 JA17 JA18 JA19 JA20A_K2 JA20A_TGL JA20A_BLN JA20A_THN JA20B_K2 JA20B_TGL JA20B_BLN JA20B_THN JA20C_K2 JA20C_TGL JA20C_BLN JA20C_THN JA20D_K2 JA20D_TGL JA20D_BLN JA20D_THN JA20E_K2 JA20E_TGL JA20E_BLN JA20E_THN JA20F_K2 JA20F_TGL JA20F_BLN JA20F_THN JA20G_K2 JA20G_TGL JA20G_BLN JA20G_THN JA20H_K2 JA20H_TGL JA20H_BLN JA20H_THN JA20I_K2 JA20I_TGL JA20I_BLN JA20I_THN JA20J_K2 JA20J_TGL JA20J_BLN JA20J_THN JA21A JA21B JA21C JA21D JA21E JA21F JA21G JA21H JA21I JA21J JA21K JA22 JA23A JA23B JA23C JA23D JA23E JA23F JA23FS JA24 JA25 JA26 JA27 JA28A JA28B JA28C JA28D JA28E JA28F JB01 JB02A JB02B JB03KD JB03A JB03B JB04 JB05 JB06A JB06B JB06C JB06D JB06E JB06F JB06G JB06H JB06I JB06J JB06K JB08 JB06L JB07 JB09 JB10 JB11A JB11B JB11C JB11D JB11E JB11F JB11G JB11H JB12 JC01 JC02A JC02B JC031 JC032 JC033 JC034 JC04 Lahir Puldat UMUR_BULAN ALAT_TIMBANG K01A bb K02A tb K02C WAZ stgizi_bbu HAZ stgizi_tbu WHZ stgizi_bbtb BAZ TB2 IMT KAT_IMT K03A LILA K04A LIPER ALAT_TENSI K05A K05B K05C K06A K06B K06C K07A K07B K07C B1R72 B2R2 B2R3 B2R4 B3R2_TGL B3R2_BLN B3R2_THN B5R1K1 B5R1K2 B5R1K3 B5R1K4 B5R1K5 B5R2K1 B5R2K2 B5R2K3 B5R2K4 B5R2K5 B5R3K1 B5R3K2 B5R3K3 B5R3K4 B5R3K5 B5R4K1 B5R4K2 B5R4K3 B5R4K4 B5R4K5 B5R5K1 B5R5K2 B5R5K3 B5R5K4 B5R5K5 B5R6K1 B5R6K2 B5R6K3 B5R6K4 B5R6K5 B5R7K1 B5R7K2 B5R7K3 B5R7K4 B5R7K5 B5R8K1 B5R8K2 B5R8K3 B5R8K4 B5R8K5 B6R1 B6R2 B6BR1 B6BR2A B6BR2B B6BR2C B6BR2D B6BR2E B6BR2F B6BR2G B6BR3A B6BR3B B6BR3C B6BR3D B6BR3E B6BR3F B6CR1 B6CR2AK3 B6CR2AK4 B6CR2BK3 B6CR2BK4 B6CR2CK3 B6CR2CK4 B6CR2DK3 B6CR2DK4 B7R1 B7R2 B7R3 B7R4 B7R5 B7R6 B8R1A B8R1B B8R2 B8R3A B8R3B B8R3C B8R4A B8R4B B8R4C B8R4D B8R4E B8R5 B8R6A B8R6B B8R7 B8R8A B8R8B B8R9 B8R10 B8R11 B8R12 B8R13 B8R14A B8R14B B8R14C B8R14D B8R14E B8R14F B8R15 B8R16 B9R1 B9R2A B9R2B B9R3AK2 B9R3AK3 B9R3AK4 B9R3AK5 B9R3AK6 B9R3BK2 B9R3BK3 B9R3BK4 B9R3BK5 B9R3BK6 B9R3CK2 B9R3CK3 B9R3CK4 B9R3CK5 B9R3CK6 B9R4 B9R5 B9R6 B9R7 B9R8A B9R8B B9R8C B9R9A B9R9B B9R9C B9R9D B9R9E B9R9F B9R9G B9R9H B9R9I B9R9J B9R10 B9R11 B9R12 eko_nas eko_prov UMUR_AYAH PENDIDIKAN_AYAH PEKERJAAN_AYAH PEKERJAANUTAMA_AYAH UMUR_IBU PENDIDIKAN_IBU PEKERJAAN_IBU PEKERJAANUTAMA_IBU IC02 IC03 IC05 IC06 IC07 IC08 IC09 IC10 IC11A IC11B IC11C IC12 IC13 IC14 IC15 IC16 IC17A IC17B IC17C IC17D IC17E IC19BLN IC19THN IC20 IC21 IC22 IC23 IC24A IC24B IC24C IC24D IC24E IC24F IC24G IC24H IC25 IC26 IC27KD IC27 IC28 IC29 IC30A IC30B IC30C IC31 IC32A IC32B IC32C IC32D IC32E IC33 IC34 IC35 IC36 IC36S IC37 IC37S IC38KD IC38 IC39 IC40) (idrt idart psu strata fwt b1r1 b1r2 b1r5 b1r6 b1r7 b1r8 tgl_kp bln_kp thn_kp tgl_ka bln_ka thn_ka nart no_art b4k3 b4k4 b4k5 b4k6tgl b4k6bln b4k6thn b4k7kd b4k7hr b4k7bln b4k7thn b4k8 b4k9 b4k10 b4k11 b4k12 b4k13 b4k14 no_ayah no_ibu no_pdpg a01 a02 a03 a04 a05a a05b a05c a05d a05e a05f a06 a07 a08a a08b a08c a09 a10 a11 a12 a13 a14 a15 a16 a17a a17b a17c a17d a17e a17f a17g a17h a18 a19a a19b a20 a21 a22 a23 b01 ia01 ia02a ia02b ia02c ia02d ia02e ia02f ia02g ia02h ia02i ia02j ia03 ia04 ia05a ia05b ia05c ia06bln ia06thn ia07 ib01 ib02 ib03 ib04 ib05a ib05b ib05c ib05d ib06 ic01 ja01 ja02 ja03 ja04 ja05 ja06 ja07 ja08a ja09a ja08b ja09b ja08c ja09c ja10 ja11 ja11s ja12 ja13 ja14 ja15 ja15_s ja16 ja17 ja18 ja19 ja20a_k2 ja20a_tgl ja20a_bln ja20a_thn ja20b_k2 ja20b_tgl ja20b_bln ja20b_thn ja20c_k2 ja20c_tgl ja20c_bln ja20c_thn ja20d_k2 ja20d_tgl ja20d_bln ja20d_thn ja20e_k2 ja20e_tgl ja20e_bln ja20e_thn ja20f_k2 ja20f_tgl ja20f_bln ja20f_thn ja20g_k2 ja20g_tgl ja20g_bln ja20g_thn ja20h_k2 ja20h_tgl ja20h_bln ja20h_thn ja20i_k2 ja20i_tgl ja20i_bln ja20i_thn ja20j_k2 ja20j_tgl ja20j_bln ja20j_thn ja21a ja21b ja21c ja21d ja21e ja21f ja21g ja21h ja21i ja21j ja21k ja22 ja23a ja23b ja23c ja23d ja23e ja23f ja23fs ja24 ja25 ja26 ja27 ja28a ja28b ja28c ja28d ja28e ja28f jb01 jb02a jb02b jb03kd jb03a jb03b jb04 jb05 jb06a jb06b jb06c jb06d jb06e jb06f jb06g jb06h jb06i jb06j jb06k jb08 jb06l jb07 jb09 jb10 jb11a jb11b jb11c jb11d jb11e jb11f jb11g jb11h jb12 jc01 jc02a jc02b jc031 jc032 jc033 jc034 jc04 lahir puldat umur_bulan alat_timbang k01a bb k02a tb k02c waz stgizi_bbu haz stgizi_tbu whz stgizi_bbtb baz tb2 imt kat_imt k03a lila k04a liper alat_tensi k05a k05b k05c k06a k06b k06c k07a k07b k07c b1r72 b2r2 b2r3 b2r4 b3r2_tgl b3r2_bln b3r2_thn b5r1k1 b5r1k2 b5r1k3 b5r1k4 b5r1k5 b5r2k1 b5r2k2 b5r2k3 b5r2k4 b5r2k5 b5r3k1 b5r3k2 b5r3k3 b5r3k4 b5r3k5 b5r4k1 b5r4k2 b5r4k3 b5r4k4 b5r4k5 b5r5k1 b5r5k2 b5r5k3 b5r5k4 b5r5k5 b5r6k1 b5r6k2 b5r6k3 b5r6k4 b5r6k5 b5r7k1 b5r7k2 b5r7k3 b5r7k4 b5r7k5 b5r8k1 b5r8k2 b5r8k3 b5r8k4 b5r8k5 b6r1 b6r2 b6br1 b6br2a b6br2b b6br2c b6br2d b6br2e b6br2f b6br2g b6br3a b6br3b b6br3c b6br3d b6br3e b6br3f b6cr1 b6cr2ak3 b6cr2ak4 b6cr2bk3 b6cr2bk4 b6cr2ck3 b6cr2ck4 b6cr2dk3 b6cr2dk4 b7r1 b7r2 b7r3 b7r4 b7r5 b7r6 b8r1a b8r1b b8r2 b8r3a b8r3b b8r3c b8r4a b8r4b b8r4c b8r4d b8r4e b8r5 b8r6a b8r6b b8r7 b8r8a b8r8b b8r9 b8r10 b8r11 b8r12 b8r13 b8r14a b8r14b b8r14c b8r14d b8r14e b8r14f b8r15 b8r16 b9r1 b9r2a b9r2b b9r3ak2 b9r3ak3 b9r3ak4 b9r3ak5 b9r3ak6 b9r3bk2 b9r3bk3 b9r3bk4 b9r3bk5 b9r3bk6 b9r3ck2 b9r3ck3 b9r3ck4 b9r3ck5 b9r3ck6 b9r4 b9r5 b9r6 b9r7 b9r8a b9r8b b9r8c b9r9a b9r9b b9r9c b9r9d b9r9e b9r9f b9r9g b9r9h b9r9i b9r9j b9r10 b9r11 b9r12 eko_nas eko_prov umur_ayah pendidikan_ayah pekerjaan_ayah pekerjaanutama_ayah umur_ibu pendidikan_ibu pekerjaan_ibu pekerjaanutama_ibu ic02 ic03 ic05 ic06 ic07 ic08 ic09 ic10 ic11a ic11b ic11c ic12 ic13 ic14 ic15 ic16 ic17a ic17b ic17c ic17d ic17e ic19bln ic19thn ic20 ic21 ic22 ic23 ic24a ic24b ic24c ic24d ic24e ic24f ic24g ic24h ic25 ic26 ic27kd ic27 ic28 ic29 ic30a ic30b ic30c ic31 ic32a ic32b ic32c ic32d ic32e ic33 ic34 ic35 ic36 ic36s ic37 ic37s ic38kd ic38 ic39 ic40)
}
* General	
{
gen id				= idart
gen weight 			= fwt
gen year_svy		= 2013
gen province_code	= b1r1
egen district_code 	= concat(b1r1 b1r2)
destring province_code district_code,replace
gen quintile		= eko_nas
la def quintile 1"poorest" 2"poor" 3"middle" 4"rich" 5"richest"
la val quintile quintile
tostring psu strata, replace

*Demographic characteristics of child and parents
gen age_day_child = b4k7hr
gen age_month_child	= b4k7bln

*age
gen age_mother = umur_ibu
gen age_mother_cat = age_mother
recode age_mother_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_mother_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years" 
la val age_mother_cat age_mother_cat
gen age_father = umur_ayah
gen age_father_cat = age_father
recode age_father_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_father_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years"
la val age_father_cat age_father_cat

*edu
gen edu_mother = pendidikan_ibu
recode edu_mother (2 = 1) (6 7 = 6)
la def edu_mother 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_mother edu_mother

gen edu_father = pendidikan_ayah
recode edu_father (2 = 1) (6 7 = 6)
la def edu_father 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_father edu_father

*employment
gen employment_mother = .
replace employment_mother = 1 if pekerjaan_ibu == 1 | pekerjaan_ibu == 3 | pekerjaan_ibu == 4
replace employment_mother = 2 if pekerjaanutama_ibu == 1 
replace employment_mother = 3 if pekerjaanutama_ibu == 2
replace employment_mother = 4 if pekerjaanutama_ibu == 3 
replace employment_mother = 5 if pekerjaanutama_ibu == 4 |  pekerjaanutama_ibu == 5
replace employment_mother = 6 if pekerjaanutama_ibu == 6 |  pekerjaanutama_ibu == 7
la def employment_mother 1 "none/student" 2"civil servant/police/army/bumn/bumd" 3 "private" 4 "self-employed" 5 "farmers/fisherman" 6 "worker/driver/art/other"
la val employment_mother employment_mother

gen employment_mother_cat = employment_mother
recode employment_mother_cat (1 = 0) (2 3 4 5 6 = 1)
la val employment_mother_cat YESNO

gen employment_father = .
replace employment_father = 1 if pekerjaan_ayah == 1 | pekerjaan_ayah == 3 | pekerjaan_ayah == 4
replace employment_father = 2 if pekerjaanutama_ayah == 1 
replace employment_father = 3 if pekerjaanutama_ayah == 2
replace employment_father = 4 if pekerjaanutama_ayah == 3 
replace employment_father = 5 if pekerjaanutama_ayah == 4 |  pekerjaanutama_ayah == 5
replace employment_father = 6 if pekerjaanutama_ayah == 6 |  pekerjaanutama_ayah == 7
la def employment_father 1 "none/student" 2"civil servant/police/army/bumn/bumd" 3 "private" 4 "self-employed" 5 "farmers/fisherman" 6 "worker/driver/art/other"
la val employment_father employment_father

gen employment_father_cat = employment_father 
recode employment_father_cat (1 = 0) (2 3 4 5 6 = 1)
la val employment_father_cat YESNO

}

*********************
****Immunization*****
*********************
*definition: 1x HB-0, 1x BCG, 3x DPT-HB/DPT-HB-HiB, 4x polio or 3x IPV (injection polio vaccine), and 1x measles
{
recode ja20* (miss = 0)
gen bcg_in = ja20b_tgl + ja20b_bln + ja20b_thn
gen pol1_in = ja20f_tgl + ja20f_bln + ja20f_thn
gen pol2_in = ja20g_tgl + ja20g_bln + ja20g_thn
gen pol3_in = ja20h_tgl + ja20h_bln + ja20h_thn
gen pol4_in = ja20i_tgl + ja20i_bln + ja20i_thn
gen dpthb1_in = ja20c_tgl + ja20c_bln + ja20c_thn
gen dpthb2_in = ja20d_tgl + ja20d_bln + ja20d_thn
gen dpthb3_in = ja20e_tgl + ja20e_bln + ja20e_thn
gen hblahir_in = ja20a_tgl + ja20a_bln + ja20a_thn
gen campak_in = ja20j_tgl + ja20j_bln + ja20j_thn
foreach i of varlist *_in {
	recode `i' (0 = 0) (nonm = 1)
}
gen tbcg 	= bcg_in
gen tpolio 	= (pol1_in + pol2_in + pol3_in + pol4_in)
gen tdpthb	= (dpthb1_in + dpthb2_in + dpthb3_in)
gen thb0 	= hblahir_in
gen tcmp 	= (campak_in)
gen lbcg=1 if ja21c==1
gen lpolio=1 if ja21e==1 & ja21g>=4
gen ldpthb=1 if ja21h==1 & ja21j>=3
gen lhb0=1 if ja21a==1
gen lcmp=1 if ja21k==1
foreach i of varlist tbcg-tcmp lbcg-lcmp {
	recode `i' (miss = 0)
}
gen vac_bcg 	= tbcg + lbcg
gen vac_polio	= tpolio + lpolio
gen vac_dpthb	= tdpthb + ldpthb
gen vac_hb0	= thb0 + lhb0
gen vac_cmp	= tcmp + lcmp
gen vac_idl = (vac_hb0 >= 1) & (vac_bcg >= 1) & (vac_polio >= 4) & (vac_dpthb >= 3) & (vac_cmp >= 1) if inrange(age_month_child,12,23)
}

*********************
*****Measurement*****
*********************
{
*Height of the mother 
gen height_mother = tb

*Low birth weight
gen birth_wgt_25kg  = ja02 if ja01 == 1
recode birth_wgt_25kg min/2499=1 2500/max=0
la def birth_wgt_25kg 0 ">=2500gr" 1 "<2500gr"
la val birth_wgt_25kg birth_wgt_25kg

*Length at birth
gen birth_lenght_cm  = ja04 if ja03 == 1
}


*********************************************
****ANC, Birth, PNC, IFA and food suppl.*****
*********************************************
{
*ANC indicators
*Complete ANC visit4 (trimester 1, trimester 2, trimester 3) >> (1-1-2)
	gen m1 = ic11a
	recode m1 88 = 0
	gen m2 = ic11b
	recode m2 88 = 0 77 = 0
	gen m3 = ic11c
	recode m3 88 = 0 77 = 0
	gen m12 = m1 + m2 + m3
	
	gen anc = .
	replace anc=0 if m12<4 | ic11a<1 | ic11b<1 | ic11c<2 
	replace anc=1 if m12>=1 & ic11a>=1 & ic11b>=1 & ic11c>=2
	replace anc=. if ic09!=1
	la var anc "anc4+"
	la val anc YESNO
	drop m1 m2 m3	
	
	*ANC facility (often)
	gen anc_place = ic13
	recode anc_place (1 2 = 1) (3 5 6 = 2) (4 7 8 = 3) (9 = 5) 
	replace anc_place=. if ic09!=1
	label define anc_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home" 5 "Other"
	label values anc_place anc_place

	*ANC providing assistance (often)
	gen anc_assist = ic12
	replace anc_assist=. if ic09!=1
	label define anc_assist 1 "Doctor: Obgyn" 2 "Doctor: GP" 3 "Midwife" 4 "Nurse"
	label values anc_assist anc_assist

*Assisted deliveries
	*Place of deliveries
	gen delivery_place	= ic22 
	recode delivery_place (1 2 = 1) (3 4 5 = 2) (6 7 8 = 3) (9 = 4) (10 = 5)
	label define delivery_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home" 5 "Other"
	label values delivery_place delivery_place
        
	*Skilled birth attendance
	gen m3a = strpos(ic21,"A")
	recode m3a 2/max=1
	gen m3b	= strpos(ic21,"B")
	recode m3b 2/max=1
	gen m3c		= strpos(ic21,"C")
	recode m3c 2/max=1
	gen m3d		= strpos(ic21,"D")
	recode m3d 2/max=1
	gen sba = .
	replace sba = 0 if (m3a==0) & (m3b==0) & (m3c==0) & (m3d==0)
	replace sba = 1 if (m3a==1) | (m3b==1) | (m3c==1) | (m3d==1)
	replace sba=. if ic21==""
	la var sba "skilled birth attendance"
	la val sba YESNO
	
	gen delivery_assist = .
	replace delivery_assist = 0 if ic21==""
	replace delivery_assist = 1 if m3a==1 & delivery_assist!=0
	replace delivery_assist = 2 if m3b==1 & delivery_assist!=0
	replace delivery_assist = 3 if m3c==1 & delivery_assist!=0
	replace delivery_assist = 4 if m3d==1 & delivery_assist!=0
	label define delivery_assist 1 "Doctor: Obgyn" 2 "Doctor: GP" 3 "Midwife" 4 "Nurse" 0"Non-HCW",replace
	label values delivery_assist delivery_assist
	drop m3a m3b m3c m3d
	
	
*PNC indicators								
	*Complete PNC	
		gen pnc = 0 if ic24a!=. | ic24c!=. | ic24e!=. | ic24g!=.
		replace pnc = 1 if ic24a==1 & (ic24c==1 | ic24e==1) & ic24g==1
		la var pnc "PNC mother"
		la val pnc YESNO
			
*Iron and Folic Acid (IFA) supplements for pregnant women
	*proportion pregnant women ever received IFA supplements
	gen received_ifa = ic14
	recode received_ifa 2 = 0
	la val received_ifa YESNO
		
	*Number of IFA tablets consumed
	gen consumed_ifa_no = ic15
	recode consumed_ifa_no (1/89 = 1) (90/max = 0) (998 = .)
	la def consumed_ifa_no 0 ">=90" 1 "<90" 
	la val consumed_ifa_no consumed_ifa_no
}	



****************************************
****Morbidities (diarrhoea, TB, ARI)****
****************************************
{
	*Diarrhoea (diagnosed and/or symptoms)
	gen morbidity_diarrhoea = 1 if inlist(a03,1,2) | inlist(a04,1,2)
	recode morbidity_diarrhoea .=0
	la val morbidity_diarrhoea YESNO
	 
	*TB
	gen morbidity_TB = a18
	recode morbidity_TB (1 = 1) (2 3 = 0)
	la val morbidity_TB YESNO
	
    *acute respiratory infection (ARI) (diagnosed and/or symptoms)
	gen morbidity_ARI = 1 if a01==1 | a02==1
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
	*Ever breastfed
	*Definition: percentage of children born in the last 24 months who were ever breastfed
	gen evbf = jb01
	recode evbf (2 = 0)
	la val evbf YESNO
	
	*Exclusive breastfeeding under six months (EBF)
	*Definition: percentage of infants 0–5 months of age who were fed exclusively with breast milk during the previous day
	gen exc_bf	= jb01 == 1 & jb07 ==1 & jb09 == 1 if inrange(age_month_child,0,5)
	la val exc_bf YESNO
	
	*Mixed milk feeding under six months (MixMF)
	*Definition: percentage of infants 0–5 months of age who were fed formula and/or animal milk in addition to breast milk during the previous day
	gen mixmf = 1 if (jb07 == 1 | jb12 == 1) & inrange(age_month_child,0,5)
	replace mixmf = 0 if mixmf == . & inrange(age_month_child,0,5)
	la val mixmf YESNO
}	


*keep new variable	
	keep id psu strata weight year_svy province_code district_code quintile age_day_child age_month_child age_mother age_mother_cat age_father age_father_cat edu_mother edu_father employment_mother employment_mother_cat employment_father employment_father_cat height_mother vac_idl birth_wgt_25kg birth_lenght_cm anc anc_place anc_assist delivery_place delivery_assist sba pnc  morbidity_diarrhoea morbidity_TB morbidity_ARI received_ifa consumed_ifa_no evbf exc_bf mixmf
		
*Save dataset
	label data
	label data "2013 Riskesdas - created: $S_DATE $S_TIME"
	compress	
	save "$dta\dt_2013rkd",replace
	clear
	
