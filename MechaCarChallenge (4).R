library(tidyverse)

# Deliverable 1----
df <- read_csv("MechaCar_mpg.csv")

model <- lm(mpg ~ ., df)
summary(model)

# Deliverable 2----
df2 <- read_csv("Suspension_Coil.csv")
total_summary <- df2 %>% 
  summarise(
    Mean=mean(PSI),
    Median=median(PSI),
    Variance=var(PSI),
    SD=sd(PSI)
  )
total_summary

lot_summary <- df2 %>% 
  group_by(Manufacturing_Lot) %>% 
  summarise(
    Mean=mean(PSI),
    Median=median(PSI),
    Variance=var(PSI),
    SD=sd(PSI)
  )
lot_summary

# Deliverable 3----
t.test(df2$PSI, mu=1500)
t.test(df2 %>% filter(Manufacturing_Lot == "Lot1") %>% select(PSI) %>% unlist, mu=1500)
t.test(df2 %>% filter(Manufacturing_Lot == "Lot2") %>% select(PSI) %>% unlist, mu=1500)
t.test(df2 %>% filter(Manufacturing_Lot == "Lot3") %>% select(PSI) %>% unlist, mu=1500)
