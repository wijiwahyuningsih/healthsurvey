/*---------------------------------------------------------------
Create data covariate variables (2018 Riskesdas) - do file
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

*load dataset: 2021 SSGI
u "$raw\determinant_2021ssgi", clear	
la def YESNO 0 "no" 1 "yes"

* Rename variable
{
rename (CASENUM finalweight_b PROVKAB P101 P105 P601A P601B P601C P601D P601E P601F P601G P601H P601I P601J P601K P601L P601M P601N P601O kuintil P4081ANAK P4082ANAK P4083AYAH P410AYAH P411AYAH P4083IBU P410IBU P411IBU P1007A P1007B P1007C P1007D P1007E P1007F P1007G P1007H P1007I P1007J P1007K P1007L P1007M P1007N P1008A P1008B P1008C P1008D P1008E P1008F P1008G P1008H P1008I P1008J P1008K P1008L P1201 P1203 P1102 P1103 P1104 P1105 P418IBU P419IBU P901 P902 P903 P904 P907 P908 P1107A P1107B P1107C P1107D P1107E P1107F P1107G P1107H P1107I P1107J P1107K P1107L P1107M P1107N P1107O year PSU STRATA P1108 P415IBU) (casenum finalweight_b provkab p101 p105 p601a p601b p601c p601d p601e p601f p601g p601h p601i p601j p601k p601l p601m p601n p601o kuintil p4081anak p4082anak p4083ayah p410ayah p411ayah p4083ibu p410ibu p411ibu p1007a p1007b p1007c p1007d p1007e p1007f p1007g p1007h p1007i p1007j p1007k p1007l p1007m p1007n p1008a p1008b p1008c p1008d p1008e p1008f p1008g p1008h p1008i p1008j p1008k p1008l p1201 p1203 p1102 p1103 p1104 p1105 p418ibu p419ibu p901 p902 p903 p904 p907 p908 p1107a p1107b p1107c p1107d p1107e p1107f p1107g p1107h p1107i p1107j p1107k p1107l p1107m p1107n p1107o year psu strata p1108 p415ibu)
}	
	
* General	
{
gen id  		= casenum	
gen weight 		= finalweight_b
gen province_code	= p101
destring province_code, replace	
gen district_code	= provkab
gen year_svy		= 2021
gen urban		= p105==1
gen quintile	= kuintil
la def quintile 1"poorest" 2"poor" 3"middle" 4"rich" 5"richest"
la val quintile quintile

*Demographic characteristics of child and parents
gen age_day_child 	= p4081anak
gen age_month_child	= p4082anak

*age
gen age_mother = p4083ibu
gen age_mother_cat = age_mother
recode age_mother_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_mother_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years"
la val age_mother_cat age_mother_cat

gen age_father = p4083ayah
gen age_father_cat = age_father
recode age_father_cat min/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/74=6 75/max=7
la def age_father_cat 1"15-24 years" 2"25-34 years" 3"35-44 years" 4"45-54 years" 5"55-64 years" 6"65-74 years" 7"75+ years" 
la val age_father_cat age_father_cat


*edu
gen edu_mother = p410ibu
recode edu_mother (1 3 = 1) (4 = 3) (5 = 4) (6 = 5) (7 8 = 6)
la def edu_mother 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_mother edu_mother

gen edu_father = p410ayah
recode edu_father (1 3 = 1) (4 = 3) (5 = 4) (6 = 5) (7 8 = 6)
la def edu_father 1 "no edu" 3 "elementary" 4 "junior" 5 "senior" 6 "high edu"
la val edu_father edu_father

*employment
gen employment_mother = p411ibu
recode employment_mother (1 2 = 1) (3 = 2) (4 = 3) (5 = 4) (6 7 = 5) (8 9 = 6) 
la def employment_mother 1 "none/student" 2"civil servant/police/army/bumn/bumd" 3 "private" 4 "self-employed" 5 "farmers/fisherman" 6 "worker/driver/art/other"
la val employment_mother employment_mother

gen employment_mother_cat = employment_mother
recode employment_mother_cat (1 = 0) (2 3 4 5 6 = 1)
la val employment_mother_cat YESNO

gen employment_father = p411ayah
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
*Low birth weight
gen birth_wgt_25kg  = p1201 
recode birth_wgt_25kg min/2499=1 2500/max=0 8888=.
la def birth_wgt_25kg 0 ">=2500gr" 1 "<2500gr"
la val birth_wgt_25kg birth_wgt_25kg

*Length at birth
gen birth_lenght_cm  = p1203
recode birth_lenght_cm 88.8=.
}

*********************
****Immunization*****
*********************
*definition: 1x HB-0, 1x BCG, 3x DPT-HB/DPT-HB-HiB, 4x polio or 3x IPV (injection polio vaccine), and 1x measles
*Immunization received by children 
	gen vac_bcg=1 if inlist(p1007b,1,2)
	recode vac_bcg .=0
	gen opv1_in=1 if inlist(p1007f,1,2)
	recode opv1_in .=0
	gen opv2_in=1 if inlist(p1007g,1,2)
	recode opv2_in .=0
	gen opv3_in=1 if inlist(p1007h,1,2)
	recode opv3_in .=0
	gen opv4_in=1 if inlist(p1007i,1,2)
	recode opv4_in .=0
	gen ipv1_in=1 if inlist(p1007j,1,2)
	recode ipv1_in .=0
	gen ipv2_in=1 if inlist(p1007k,1,2)
	recode ipv2_in .=0
	gen ipv3_in=1 if inlist(p1007l,1,2)
	recode ipv3_in .=0
	gen ipv4_in=1 if inlist(p1007m,1,2)
	recode ipv4_in .=0
	gen dpthb1_in=1 if inlist(p1007c,1,2)
	recode dpthb1_in .=0
	gen dpthb2_in=1 if inlist(p1007d,1,2)
	recode dpthb2_in .=0
	gen dpthb3_in=1 if inlist(p1007e,1,2)
	recode dpthb3_in .=0
	
	gen vac_polio=opv1_in+opv2_in+opv3_in+opv4_in
	gen vac_ipv=ipv1_in+ipv2_in+ipv3_in+ipv4_in
	gen vac_hb0=1 if inlist(p1007a,1,2)
	recode vac_hb0 .=0
	gen vac_cmp=1 if inlist(p1007n,1,2)
	gen vac_dpthb=dpthb1_in+dpthb2_in+dpthb3_in
	gen vac_idl = (vac_hb0 >= 1) & (vac_bcg >= 1) & (vac_polio >= 4 | vac_ipv >=3) & (vac_dpthb >= 3) & (vac_cmp >= 1) if inrange(age_month_child,12,23)	
	
	
*********************************************
****ANC, Birth, PNC, IFA and food suppl.*****
*********************************************
{
*Assisted deliveries
	*Place of deliveries
	gen delivery_place	= p418ibu 
	recode delivery_place (1 = 1) (2 5 = 2) (3 4 6 = 3) (7 = 4) (8 = 5)
	label define delivery_place 1 "Hospital" 2 "Clinic" 3 "Puskesmas" 4 "Home" 5 "Other"
	label values delivery_place delivery_place
        
	*Birth assistant
	gen delivery_assist = p419ibu 
	label define delivery_assist 1 "Doctor: Obgyn" 2 "Doctor: GP" 3 "Midwife" 4 "Nurse" 5 "Traditional Doctor" 6 "Others" 7 "None"
	label values delivery_assist delivery_assist
	
	*Skilled birth attendance
	gen sba = .
	replace sba = 1 if inrange(p419ibu,1,4)
	replace sba = 0 if inrange(p419ibu,5,7)
	la var sba "skilled birth attendance"
	la val sba YESNO
	
*Iron and Folic Acid (IFA) supplements for pregnant women
	*proportion pregnant women ever received IFA supplements (in the last 5 years)
	gen received_ifa = p415ibu
	recode received_ifa (2 8 = 0)
	la val received_ifa YESNO
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
	gen morbidity_TB = 1 if p907 == 1
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
	gen exc_bf = p1102 == 1 & p1104 == 1 if inrange(age_month_child,0,5)
	la val exc_bf YESNO

	*Mixed milk feeding under six months (MixMF)
	*Definition: percentage of infants 0–5 months of age who were fed formula and/or animal milk in addition to breast milk during the previous day
	gen mixmf = 1 if (p1102 == 1 | p1107e == 1 | p1107o == 1) & inrange(age_month_child,0,5)
	replace mixmf = 0 if mixmf == . & inrange(age_month_child,0,5)
	la val mixmf YESNO
}	
	
****************************************
****Complementary feeding indicators****
****************************************
{
	*Introduction of solid, semisolid or soft foods 6–8 months (ISSSF)
	*Definition: percentage of infants 6–8 months of age who consumed solid, semisolid or soft foods during the previous day
	gen isssf = 1 if (p1107b == 1 | p1107c == 1 | p1107d == 1 | p1107e == 1 | p1107f == 1 | p1107g == 1 | p1107h == 1 | p1107i == 1 | p1107j == 1 | p1107k == 1 | p1107l == 1 | p1107m == 1 | p1107n == 1) & inrange(age_month_child,6,8)
	replace isssf = 0 if inrange(age_month_child,6,8) & isssf==.
	la val isssf YESNO

	*************************
	**The eight food groups**
	*************************
	*breast milk
	gen  breastmilk = 1 if (p1102 == 1 | p1107o == 1) & inrange(age_month_child,6,23)
	replace breastmilk = 0 if inrange(age_month_child,6,23) & breastmilk==.
	*grains, roots and tubers
	gen  grains = p1107c == 1 if inrange(age_month_child,6,23)
	*pulses (beans, peas, lentils), seeds, legumes and nuts
	gen  nuts = p1107d == 1 if inrange(age_month_child,6,23)
	*dairy products (milk, infant formula, yogurt, cheese)
	gen  diary =1 if (p1107e == 1 | p1107f == 1) & inrange(age_month_child,6,23)
	replace diary = 0 if inrange(age_month_child,6,23) & diary==.
	*flesh foods (meat, fish, poultry, organ meats)
	gen  flesh = p1107g == 1 if inrange(age_month_child,6,23)
	*eggs
	gen  eggs = p1107h == 1 if inrange(age_month_child,6,23)
	*vitamin A-rich fruit and vegetables 
	gen  arich = 1 if (p1107i == 1 | p1107k == 1 | p1107j == 1) & inrange(age_month_child,6,23)
	replace arich = 0 if inrange(age_month_child,6,23) & arich==.
	*other fruit and vegetables
	gen  fruitsveg = 1 if (p1107m == 1 | p1107l == 1) & inrange(age_month_child,6,23)
	replace fruitsveg = 0 if inrange(age_month_child,6,23) & fruitsveg==.
	
	*Minimum dietary diversity 6–23 months (MDD)
	*definition: percentage of children 6–23 months of age who consumed foods and beverages from at least five out of eight defined food groups during the previous day
	gen mdd =  breastmilk +  grains +  nuts +  diary +  flesh +  eggs +  arich +  fruitsveg
	recode mdd min/4 = 0 5/max = 1
	la val mdd YESNO
	
	*Egg and/or flesh food consumption 6–23 months (EFF)
	*definition: percentage of children 6–23 months of age who consumed egg and/or flesh food during the previous day
	gen eff = 0
	replace eff = 1 if  flesh == 1 |  eggs == 1
	replace eff = . if !inrange(age_month_child,6,23)
	la val eff YESNO
	
	*Sweet beverage consumption 6–23 months (SwB)
	*definition: percentage of children 6–23 months of age who consumed a sweet beverage during the previous day
	gen swb = p1107b == 1 if inrange(age_month_child,6,23)
	replace swb = 0 if inrange(age_month_child,6,23) & swb==.
	la val swb YESNO
	
	*Zero vegetable or fruit consumption 6–23 months (ZVF)
	*definition: percentage of children 6–23 months of age who did not consume any vegetables or fruits during the previous day
	gen zvf = 1 if p1107i == 2 & p1107j == 2 & p1107k == 2 & p1107l == 2 & p1107m == 2 & inrange(age_month_child,6,23)
	replace zvf = 0 if inrange(age_month_child,6,23) & zvf==.
	la val zvf YESNO			   
}

*keep new variable	
	keep id psu quintile strata weight province_code district_code year_svy urban age_day_child age_month_child age_mother age_father edu_mother edu_father employment_mother employment_father birth_wgt_25kg birth_lenght_cm vac_idl delivery_place delivery_assist sba received_ifa morbidity_diarrhoea morbidity_TB morbidity_ARI exc_bf mixmf isssf breastmilk grains nuts diary flesh eggs arich fruitsveg mdd eff swb zvf age_mother_cat age_father_cat employment_mother_cat employment_father_cat
	

*Save dataset
	label data
	label data "2021 SSGI - created: $S_DATE $S_TIME"
	compress	
	save "$dta\dt_2021ssgi",replace
	clear
	