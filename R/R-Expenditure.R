library(dplyr)
library(ggplot2)
library(tidyverse)

df <- read.csv("../Dataset/expenditure_cleaned.csv")
head(df)


df_2015 <- df %>%
  filter(Year %in% c("2015"))
country_labels <- ifelse(seq_along(df_2015$Country.Name) %% 5 == 0, df_2015$Country.Name, "")
ggplot(df_2015, aes(x = Country.Name, y = Expenditure)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  scale_x_discrete(labels = country_labels) +
  labs(title = "Health Expenditure (% of GDP) 2015",
       x = "Country",
       y = "% Health Expenditure on GDP") +
  theme_minimal()


df_top20 <- df_2015 %>%
  arrange(desc(Expenditure)) %>%
  slice(1:20)
ggplot(df_top20, aes(x = reorder(Country.Name, Expenditure), y = Expenditure)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 20 Country % Health Expenditure on GDP 2015", 
       x = "Country", 
       y = "% Health Expenditure on GDP 2015") +
  theme_minimal()


df_FranceItaly <- df %>%
  filter(Country.Name %in% c("France", "Italy"))

# Health Expenditure France vs Italy (% of GDP)
ggplot(df_FranceItaly, aes(x = Year, y = Expenditure, color = Country.Name)) +
  geom_line(linewidth = 1) +                         
  theme_minimal() +                            
  labs(title = "Health Expenditure France vs Italy (% of GDP)",
       x = "Year", y = "Expenditure (% of GDP)",
       color = "Country") +                      
  scale_color_manual(values = c("blue", "red"))

#Statistics
ggplot(df_2015, aes(x = Expenditure)) +
  geom_histogram(bins = 20, fill = "steelblue") +
  labs(title = "Distribution of health expenditure %")

mean(df_2015$Expenditure, na.rm = TRUE)    # Mean
median(df_2015$Expenditure, na.rm = TRUE)  # Median
var(df_2015$Expenditure, na.rm = TRUE)     # Variance
sd(df_2015$Expenditure, na.rm = TRUE)      # Standard Deviation