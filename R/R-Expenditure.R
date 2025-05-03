
library(tseries)
library(forecast)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(glmnet)

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

#Wide transformation
df_aggregated <- df %>%
  group_by(Country.Name, Year) %>%
  summarise(Expenditure = mean(Expenditure, na.rm = TRUE), .groups = 'drop')  # Aggrega i dati per paese e anno
df_wide <- df_aggregated %>%
  pivot_wider(names_from = Year, values_from = Expenditure)

#ARIMA prediction
df_italy <- df_wide %>% filter(Country.Name == "Italy")
spesa_italia <- df_italy[, as.character(2000:2022)]
spesa_italia <- as.numeric(spesa_italia)
spesa_ts <- ts(spesa_italia, start = 2000, frequency = 1)
adf_test <- adf.test(spesa_ts)
print(adf_test)
spesa_diff <- diff(spesa_ts)
arima_model <- auto.arima(spesa_diff)
summary(arima_model)
forecast_2023 <- forecast(arima_model, h = 1)
plot(forecast_2023, main = "Differences series of health expenditure (% GDP)", ylab = "Difference % PIL", xlab = "Anno")

# 2023 predicted
forecast_2023$mean

# Italy Filters
df_italy <- df_wide %>% filter(Country.Name == "Italy")
spesa_italia <- df_italy[, as.character(2000:2022)]
spesa_italia <- as.numeric(spesa_italia)

# Time series creation
spesa_ts <- ts(spesa_italia, start = 2000, frequency = 1)

# Arima model
arima_model <- auto.arima(spesa_ts)
summary(arima_model)

# 2023 Prediction
forecast_2023 <- forecast(arima_model, h = 1)

# Plot 
plot(forecast_2023, main = "2023 % Health expenditure on GDP", 
     ylab = "Expenditure (% GDP)", xlab = "Year")

forecast_2023$mean



df_italia <- df %>%
  filter(Country.Name == "Italy", !is.na(Expenditure)) %>%
  arrange(Year)

# Create time series
serie_ts <- ts(df_italia$Expenditure,
               start = df_italia$Year[1],
               frequency = 2)  # it should be 1, but the minimum is 2

stl_italia <- stl(serie_ts, s.window = "periodic")

# Plot
plot(stl_italia, main = "STL Decomposition - Health Expenditure (Italy)")



