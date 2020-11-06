# Name: Good and Bad Visualization Using Board of Governors 2014 Report Datasets (Assignment #2, Question #3)
# Author: Brianna Drew                                              
# Date Created: October 5th, 2020
# Last Modified: November 6th, 2020

# Import csv data files
revenue_percent = read.csv("C:\\Users\\brian\\OneDrive\\Desktop\\University\\COIS 3510H (Data Visualization)\\Assignments\\#2\\RevenuePercent.csv", header = TRUE)
revenue_absolute = read.csv("C:\\Users\\brian\\OneDrive\\Desktop\\University\\COIS 3510H (Data Visualization)\\Assignments\\#2\\RevenueAbsolute.csv", header = TRUE)
expense_percent = read.csv("C:\\Users\\brian\\OneDrive\\Desktop\\University\\COIS 3510H (Data Visualization)\\Assignments\\#2\\ExpensePercent.csv", header = TRUE)
expense_absolute = read.csv("C:\\Users\\brian\\OneDrive\\Desktop\\University\\COIS 3510H (Data Visualization)\\Assignments\\#2\\ExpenseAbsolute.csv", header = TRUE)
View(revenue_percent) # View the Revenue (Percent) dataset
View(revenue_absolute) # View the Revenue (Absolute) dataset
View(expense_percent) # View the Expense (Percent) dataset
View(expense_absolute) # View the Expense (Absolute) dataset
library(ggplot2) # Import the ggplot2 package
library(cowplot) # Import the cowplot package
library(fmsb) # Import the fmsb package
library(ggpubr) # Import the ggpubr package
library(GGally) # Import the GGally package
library(viridis) # Import the viridis colour package

# 2 GRAPHS THAT MAKE THE DATA LOOK GOOD

# Scatter Plot Matrices
ggpairs(revenue_absolute, title = "Revenue")
ggpairs(expense_absolute, title = "Expenses")

# Bar Plots (small multiples)
revb_grant <- ggplot(revenue_absolute, aes(x = as.factor(Year), y = Grants)) + geom_bar(stat = "identity", fill = viridis(5))
revb_grant <- revb_grant + xlab("Year")
revb_tuition <- ggplot(revenue_absolute, aes(x = as.factor(Year), y = Tuition)) + geom_bar(stat = "identity", fill = viridis(5))
revb_tuition <- revb_tuition + xlab("Year")
revb_ancillary <- ggplot(revenue_absolute, aes(x = as.factor(Year), y = Ancillary)) + geom_bar(stat = "identity", fill = viridis(5))
revb_ancillary <- revb_ancillary + xlab("Year")
revb_private <- ggplot(revenue_absolute, aes(x = as.factor(Year), y = Private)) + geom_bar(stat = "identity", fill = viridis(5))
revb_private <- revb_private + xlab("Year")
revb_other <- ggplot(revenue_absolute, aes(x = as.factor(Year), y = Other)) + geom_bar(stat = "identity", fill = viridis(5))
revb_other <- revb_other + xlab("Year")
rev_bar <- plot_grid(revb_grant, revb_tuition, revb_ancillary, revb_private, revb_other)# Put the plots onto one grid
revb_title <- ggdraw() + draw_label("Revenue", fontface = 'bold') # Create the plot title
plot_grid(revb_title, rev_bar, ncol = 1, rel_heights = c(0.1, 1)) # Add title to the existing plot grid

expb_salaries <- ggplot(expense_absolute, aes(x = as.factor(Year), y = Salaries)) + geom_bar(stat = "identity", fill = viridis(5))
expb_salaries <- expb_salaries + xlab("Year")
expb_scholarships <- ggplot(expense_absolute, aes(x = as.factor(Year), y = Scholarships)) + geom_bar(stat = "identity", fill = viridis(5))
expb_scholarships <- expb_scholarships + xlab("Year")
expb_utilities <- ggplot(expense_absolute, aes(x = as.factor(Year), y = Utilities)) + geom_bar(stat = "identity", fill = viridis(5))
expb_utilities <- expb_utilities + xlab("Year")
expb_supplies <- ggplot(expense_absolute, aes(x = as.factor(Year), y = Supplies)) + geom_bar(stat = "identity", fill = viridis(5))
expb_supplies <- expb_supplies + xlab("Year")
expb_interest <- ggplot(expense_absolute, aes(x = as.factor(Year), y = Interest)) + geom_bar(stat = "identity", fill = viridis(5))
expb_interest <- expb_interest + xlab("Year")
expb_amortization <- ggplot(expense_absolute, aes(x = as.factor(Year), y = Amortization)) + geom_bar(stat = "identity", fill = viridis(5))
expb_amortization <- expb_amortization + xlab("Year")
expb_FVA <- ggplot(expense_absolute, aes(x = as.factor(Year), y = FVA)) + geom_bar(stat = "identity", fill = viridis(5))
expb_FVA <- expb_FVA + xlab("Year")
expb_AE <- ggplot(expense_absolute, aes(x = as.factor(Year), y = AE)) + geom_bar(stat = "identity", fill = viridis(5))
expb_AE <- expb_AE + xlab("Year")
exp_bar <- plot_grid(expb_salaries, expb_scholarships, expb_utilities, expb_supplies, expb_interest, expb_amortization, expb_FVA, expb_AE) # Put the plots onto one grid
expb_title <- ggdraw() + draw_label("Expenses", fontface = 'bold') # Create the plot title
plot_grid(expb_title, exp_bar, ncol = 1, rel_heights = c(0.1, 1)) # Add title to the existing plot grid

# 2 GRAPHS THAT MAKE THE DATA LOOK BAD

# Radar Charts
radarchart(revenue_absolute, maxmin = FALSE, title = "Revenue")
radarchart(expense_absolute, maxmin = FALSE, title = "Expenses")

# Pie Charts
# Extracting relevant values into seperate data frame
rev2010 <- data.frame(
  group = c("Grants", "Tuition", "Ancillary", "Private", "Other"),
  value = c(revenue_percent[5,2], revenue_percent[5,3], revenue_percent[5,4], revenue_percent[5,5], revenue_percent[5,6]))
rev2011 <- data.frame(
  group = c("Grants", "Tuition", "Ancillary", "Private", "Other"),
  value = c(revenue_percent[4,2], revenue_percent[4,3], revenue_percent[4,4], revenue_percent[4,5], revenue_percent[4,6]))
rev2012 <- data.frame(
  group = c("Grants", "Tuition", "Ancillary", "Private", "Other"),
  value = c(revenue_percent[3,2], revenue_percent[3,3], revenue_percent[3,4], revenue_percent[3,5], revenue_percent[3,6]))
rev2013 <- data.frame(
  group = c("Grants", "Tuition", "Ancillary", "Private", "Other"),
  value = c(revenue_percent[2,2], revenue_percent[2,3], revenue_percent[2,4], revenue_percent[2,5], revenue_percent[2,6]))
rev2014 <- data.frame(
  group = c("Grants", "Tuition", "Ancillary", "Private", "Other"),
  value = c(revenue_percent[1,2], revenue_percent[1,3], revenue_percent[1,4], revenue_percent[1,5], revenue_percent[1,6]))
exp2010 <- data.frame(
  group = c("Salaries", "Scholarships", "Utilities", "Supplies", "Interest", "Amortization", "FVA", "AE"),
  value = c(expense_percent[5,2], expense_percent[5,3], expense_percent[5,4], expense_percent[5,5], expense_percent[5,6], expense_percent[5,7], expense_percent[5,8], expense_percent[5,9]))
exp2011 <- data.frame(
  group = c("Salaries", "Scholarships", "Utilities", "Supplies", "Interest", "Amortization", "FVA", "AE"),
  value = c(expense_percent[4,2], expense_percent[4,3], expense_percent[4,4], expense_percent[4,5], expense_percent[4,6], expense_percent[4,7], expense_percent[4,8], expense_percent[4,9]))
exp2012 <- data.frame(
  group = c("Salaries", "Scholarships", "Utilities", "Supplies", "Interest", "Amortization", "FVA", "AE"),
  value = c(expense_percent[3,2], expense_percent[3,3], expense_percent[3,4], expense_percent[3,5], expense_percent[3,6], expense_percent[3,7], expense_percent[3,8], expense_percent[3,9]))
exp2013 <- data.frame(
  group = c("Salaries", "Scholarships", "Utilities", "Supplies", "Interest", "Amortization", "FVA", "AE"),
  value = c(expense_percent[2,2], expense_percent[2,3], expense_percent[2,4], expense_percent[2,5], expense_percent[2,6], expense_percent[2,7], expense_percent[2,8], expense_percent[2,9]))
exp2014 <- data.frame(
  group = c("Salaries", "Scholarships", "Utilities", "Supplies", "Interest", "Amortization", "FVA", "AE"),
  value = c(expense_percent[1,2], expense_percent[1,3], expense_percent[1,4], expense_percent[1,5], expense_percent[1,6], expense_percent[1,7], expense_percent[1,8], expense_percent[1,9]))

ggpie(rev2010, "value", label = "value", fill = "group", palette = viridis(5), title = "Revenue (2010)")
ggpie(rev2011, "value", label = "value", fill = "group", palette = viridis(5), title = "Revenue (2011)")
ggpie(rev2012, "value", label = "value", fill = "group", palette = viridis(5), title = "Revenue (2012)")
ggpie(rev2013, "value", label = "value", fill = "group", palette = viridis(5), title = "Revenue (2013)")
ggpie(rev2014, "value", label = "value", fill = "group", palette = viridis(5), title = "Revenue (2014)")
ggpie(exp2010, "value", label = "value", fill = "group", palette = viridis(8), title = "Expenses (2010)")
ggpie(exp2011, "value", label = "value", fill = "group", palette = viridis(8), title = "Expenses (2011)")
ggpie(exp2012, "value", label = "value", fill = "group", palette = viridis(8), title = "Expenses (2012)")
ggpie(exp2013, "value", label = "value", fill = "group", palette = viridis(8), title = "Expenses (2013)")
ggpie(exp2014, "value", label = "value", fill = "group", palette = viridis(8), title = "Expenses (2014)")

# 2 GRAPHS THAT SHOW DATA HAS NOT CHANGED MUCH OVER TIME

# Line Graphs (small multiples)
rev_grant <- ggplot(revenue_absolute, aes(x = Year, y = Grants)) + geom_line()
rev_tuition <- ggplot(revenue_absolute, aes(x = Year, y = Tuition)) + geom_line()
rev_ancillary <- ggplot(revenue_absolute, aes(x = Year, y = Ancillary)) + geom_line()
rev_private <- ggplot(revenue_absolute, aes(x = Year, y = Private)) + geom_line()
rev_other <- ggplot(revenue_absolute, aes(x = Year, y = Other)) + geom_line()
rev_line <- plot_grid(rev_grant, rev_tuition, rev_ancillary, rev_private, rev_other)# Put the plots onto one grid
rev_title <- ggdraw() + draw_label("Revenue", fontface = 'bold') # Create the plot title
plot_grid(rev_title, rev_line, ncol = 1, rel_heights = c(0.1, 1)) # Add title to the existing plot grid

exp_salaries <- ggplot(expense_absolute, aes(x = Year, y = Salaries)) + geom_line()
exp_scholarships <- ggplot(expense_absolute, aes(x = Year, y = Scholarships)) + geom_line()
exp_utilities <- ggplot(expense_absolute, aes(x = Year, y = Utilities)) + geom_line()
exp_supplies <- ggplot(expense_absolute, aes(x = Year, y = Supplies)) + geom_line()
exp_interest <- ggplot(expense_absolute, aes(x = Year, y = Interest)) + geom_line()
exp_amortization <- ggplot(expense_absolute, aes(x = Year, y = Amortization)) + geom_line()
exp_FVA <- ggplot(expense_absolute, aes(x = Year, y = FVA)) + geom_line()
exp_AE <- ggplot(expense_absolute, aes(x = Year, y = AE)) + geom_line()
exp_line <- plot_grid(exp_salaries, exp_scholarships, exp_utilities, exp_supplies, exp_interest, exp_amortization, exp_FVA, exp_AE) # Put the plots onto one grid
exp_title <- ggdraw() + draw_label("Expenses", fontface = 'bold') # Create the plot title
plot_grid(exp_title, exp_line, ncol = 1, rel_heights = c(0.1, 1)) # Add title to the existing plot grid

# Area Charts (small multiples)
reva_grant <- ggplot(revenue_absolute, aes(x = Year, y = Grants)) + geom_area()
reva_tuition <- ggplot(revenue_absolute, aes(x = Year, y = Tuition)) + geom_area()
reva_ancillary <- ggplot(revenue_absolute, aes(x = Year, y = Ancillary)) + geom_area()
reva_private <- ggplot(revenue_absolute, aes(x = Year, y = Private)) + geom_area()
reva_other <- ggplot(revenue_absolute, aes(x = Year, y = Other)) + geom_area()
rev_area <- plot_grid(reva_grant, reva_tuition, reva_ancillary, reva_private, reva_other)# Put the plots onto one grid
reva_title <- ggdraw() + draw_label("Revenue", fontface = 'bold') # Create the plot title
plot_grid(reva_title, rev_area, ncol = 1, rel_heights = c(0.1, 1)) # Add title to the existing plot grid

expa_salaries <- ggplot(expense_absolute, aes(x = Year, y = Salaries)) + geom_area()
expa_scholarships <- ggplot(expense_absolute, aes(x = Year, y = Scholarships)) + geom_area()
expa_utilities <- ggplot(expense_absolute, aes(x = Year, y = Utilities)) + geom_area()
expa_supplies <- ggplot(expense_absolute, aes(x = Year, y = Supplies)) + geom_area()
expa_interest <- ggplot(expense_absolute, aes(x = Year, y = Interest)) + geom_area()
expa_amortization <- ggplot(expense_absolute, aes(x = Year, y = Amortization)) + geom_area()
expa_FVA <- ggplot(expense_absolute, aes(x = Year, y = FVA)) + geom_area()
expa_AE <- ggplot(expense_absolute, aes(x = Year, y = AE)) + geom_area()
exp_area <- plot_grid(expa_salaries, expa_scholarships, expa_utilities, expa_supplies, expa_interest, expa_amortization, expa_FVA, expa_AE) # Put the plots onto one grid
expa_title <- ggdraw() + draw_label("Expenses", fontface = 'bold') # Create the plot title
plot_grid(expa_title, exp_area, ncol = 1, rel_heights = c(0.1, 1)) # Add title to the existing plot grid