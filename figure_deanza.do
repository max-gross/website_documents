clear
set more off
macro drop all
capture log close
graph set window fontface "Times"

/********************************************************************************
Course Shutouts
Complier Densities 

Created on: 4/6/17

Last Modified on: 6/20/19

Description: This file creates figures showing the density of complier outcomes.

********************************************************************************/

** Setting the Directory 
global output "/afs/umich.edu/user/s/r/srobles/DeAnza/Do Files/primary2014/Output Data/"
global graph "/afs/umich.edu/user/s/r/srobles/DeAnza/Do Files/primary2014/Graphs/working/"

********************************************************************************

**********************************
**(1) ESTIMATE COMPLIER DENSITY
**********************************

use "$output/deanza_master_analysis.dta", clear

**Controls
local controls white asian hisp black race_other racecode_miss female female_miss  ///
	age age_miss intl fareceipt fareceipt_miss firsttime i.termid ///
	i.regpriority specprogram specprogram_miss specialadmit


local estimate_dists = 1
	

				
				
	use "$output/distributions_ncourses_drop.dta", clear
	sum EY_1
	local EY_1=r(mean)
	sum EY_0
	local EY_0=r(mean)
	sum KS
	local ks=round(r(max),0.01)
	sum y
	local ymin=r(min)
	local ymax=r(max)
	drop if y>9 /* For readability of graph*/
	
	# delimit ;
	graph twoway (line f1 y, lcolor(vermillion) lpattern(solid))
		(line f0 y, lcolor(sea) lpattern(dash)),
		scheme(plotplain)
		xtitle("Number of Courses", size(large))
		ytitle("")
		ylabel(0 0.1 0.2 0.3,labsize(large))
		xlabel(0 2 4 6 8, labsize(large))
		xscale(noline)
		yscale(range(0 0.3))
		legend(lab(1 "Shutout of Course Section") lab(2 "Not Shutout") col(1) 
		ring(0) bmargin(large) position(2) size(large))
		title("Shutouts Increased Likelihood of Taking Zero Courses", size(large));
	# delimit cr
		
	graph export "$graph/fig_complier_density_ncourses_drop_max.png", replace
	






