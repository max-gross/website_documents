set more off 
clear
cd "C:\Users\maxgross\Downloads\"
graph set window fontface "Times New Roman"

import excel "main_figures.xlsx", sheet("Deanza") firstrow clear

# delimit ;
twoway  (line transfer2 year if group=="asian", lcolor(gs13) lpattern(solid)) 
		(line transfer2 year if group=="white", lcolor(gs13) lpattern(solid))
		(line transfer2 year if group=="urm", lcolor(sea) lpattern(solid) lwidth(medthick)),
		text(0.06 4 "Underrep Minority", size(medlarge))
		legend(off) scheme(plotplain) 
		yscale(range(-0.1 0.1))
		ylabel(-0.1 0 0.1,labsize(large) ) xlabel(,labsize(large))
		ytitle("") xtitle("")
		title("")
		subtitle("Shutouts Cause Some to Transfer" 
		"to Another Two Year College...", justification(left)
		bexpand size(large)) saving(t2, replace);
# delimit cr



# delimit ;
twoway  (line transfer4 year if group=="asian", lcolor(sea) lpattern(solid) lwidth(medthick)) 
		(line transfer4 year if group=="white", lcolor(gs13) lpattern(solid))
		(line transfer4 year if group=="urm", lcolor(gs13) lpattern(solid)),
		text(0.06 4 "Asian", size(medlarge))

		legend(off) scheme(plotplain) 
		yscale(range(-0.1 0.1)) ylabel(none)
		xlabel(,labsize(large))
		ytitle("") xtitle("")
		title("")
		subtitle("...And Others to Transfer to Four" "Year Schools", justification(left)
		bexpand size(large)) saving(t4, replace);
# delimit cr

graph combine "t2.gph" "t4.gph", scheme(plotplain) b1("Years Since Course Waitlist", size(medlarge))
graph export "fig_deanza.png", replace

