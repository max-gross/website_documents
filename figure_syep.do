clear
set more off
graph set window fontface "Serif"

set obs 4
gen group=1 if _n<=2
replace group=2 if _n>2
la def g 1 "Applied but did not Participate" 2 "Participated"
la val g group

gen outcome=1 if _n==1 | _n==3
replace outcome=2 if _n==2 | _n==4
la def outlab 1 "Enrolled in K-12" 2 "Graduated High School"
la val outcome outlab

gen y=94.5 if _n==1
replace y=95.9 if _n==3
replace y=85 if _n==2
replace y=88.4 if _n==4

#delimit ;	
graph bar y, over(group) over(outcome, label(labsize(large)))
	scheme(plotplain)
	asyvars
	bar(1, fcolor(sea)) bar(2, fcolor(vermillion))
	legend(label(1 "Non-selected applicants") 
	label(2 "Participants")
	col(1) pos(2) ring(0) bmargin(medlarge) size(large) style(areastyle(none)))
	exclude0
	ytitle("")
	yscale(range(60 100) noline)
	ylabel(60 "60%" 80 "80%" 100 "100%", labsize(large) notick)
	title("Summer employment improved academic outcomes",
	justification(left) bexpand size(vlarge));
;

# delimit cr

graph export "C:\Users\maxgross\Downloads\syep.png", as(png) replace
