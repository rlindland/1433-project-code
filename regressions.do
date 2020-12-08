
// Reg 1: Event Study 1 main result
import delimited "/Users/robert/Downloads/1433-project-code/formatted_data.csv", encoding(ISO-8859-1)clear
eststo clear
eststo: eventdd raw_change in* hweek* candtime* if cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
esttab using ~/Downloads/cdtest/fp_main.tex, se 

// Reg 2: Event Study 1 sextile results
eststo clear
eststo: eventdd raw_change in* hweek* candtime* if stile_1==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)))
eststo: eventdd raw_change in* hweek* candtime* if stile_2==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
eststo: eventdd raw_change in* hweek* candtime* if stile_3==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
eststo: eventdd raw_change in* hweek* candtime* if stile_4==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
eststo: eventdd raw_change in* hweek* candtime* if stile_5==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
eststo: eventdd raw_change in* hweek* candtime* if stile_6==1 & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
esttab using ~/Downloads/cdtest/fp_med_poll.tex, se 

// Reg 3: Placebo Test
eststo clear 
import delimited "/Users/robert/Downloads/1433-project-code/placebo_data.csv", encoding(ISO-8859-1)clear
eststo: eventdd raw_change in* hweek* candtime* if cand!="tom-steyer" & date<20200300, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) ylabel(-2(2)6) )

import delimited "/Users/robert/Downloads/1433-project-code/real_data.csv", encoding(ISO-8859-1)clear
eststo: eventdd raw_change in* hweek* candtime* if cand!="tom-steyer" & date<20200300, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) ylabel(-2(2)6) )
esttab using ~/Downloads/cdtest/fp_placebo.tex, se 

// Reg 4: Robustness for above/below spending 
import delimited "/Users/robert/Downloads/1433-project-code/formatted_data.csv", encoding(ISO-8859-1)clear
eststo clear
eststo: eventdd raw_change in* hweek* candtime* if cand!="tom-steyer" & med_cost==1, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
eststo: eventdd raw_change in* hweek* candtime* if cand!="tom-steyer" & med_cost==0, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
esttab using ~/Downloads/cdtest/fp_med_cost.tex, se 

// Reg 5: Robustness for above/below airings
eststo clear
eststo: eventdd raw_change in* hweek* candtime* if cand!="tom-steyer" & med_airings==1, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
eststo: eventdd raw_change in* hweek* candtime* if cand!="tom-steyer" & med_airings==0, timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
esttab using ~/Downloads/cdtest/fp_med_airings.tex, se 

// Reg 6: Robustness for 2016 dem/rep/close states 
eststo clear
eststo: eventdd raw_change in* hweek* candtime* if color=="r" & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
eststo: eventdd raw_change in* hweek* candtime* if color=="b" & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
eststo: eventdd raw_change in* hweek* candtime* if color=="p" & cand!="tom-steyer", timevar(grouped_3) ci(rcap) lags(10) leads(10) inrange graph_op(xtitle(Periods of 3 Days) ytitle(Change (Pct. Points)) )
esttab using ~/Downloads/cdtest/fp_color.tex, se 

// Reg 7: Event Study 2
clear
import delimited "/Users/robert/Downloads/1433-project-code/formatted_data.csv", encoding(ISO-8859-1)clear
eststo clear
eststo: eventdd raw_change in* week* candtime* topic* if date<=20200303, timevar(grouped_6) ci(rcap) lags(1) leads(5) inrange
esttab using ~/Downloads/cdtest/issues_ree.csv, se
