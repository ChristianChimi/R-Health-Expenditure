## **R-Health-Expenditure**
## **Overview**
This project aims to analyze trends and patterns in healthcare spending using the R programming language. The analysis includes data exploration, visualization, and statistical modeling to uncover regional disparities and long-term trends in healthcare expenditure across various countries.

## **Pre-Processing in Python**
    - The initial data cleaning and preparation was carried out in Python, which involved:
    - Filtering Data: Loaded the dataset and filtered for years after 1999, as these years represent the most consistent part of the dataset.
    - Handling Missing Data: Dropped rows with null values, including 2023 and 2024 data, which were missing due to their recent nature.
    - Reshaping Data: Used melting to transform the dataframe from a wide format to a long format, making it easier to analyze trends over time.

## **R analysis** available at:  https://christianchimi.github.io/R-Health-Expenditure/R-Expenditure-Analysis.html
    - The main analysis was performed in R, where several key tasks were completed:
        - Expenditure in 2015:
           - Plotted healthcare expenditure for each country in 2015.
          - Identified and plotted the top 20 countries with the highest healthcare expenditure in 2015.
        - Healthcare Trends Over Time:
          - Plotted healthcare expenditure trends over time for Italy and France, showing the evolution of healthcare spending in these countries.
        - Descriptive Statistics:
            - Calculated the distribution, mean, median, variance, and standard deviation for healthcare expenditure in 2015 to understand the overall expenditure distribution.

## **ARIMA in R**
    - I applied the ARIMA (AutoRegressive Integrated Moving Average) model in R to analyze and forecast healthcare expenditure for 2023:
        - Both the original time series and the differenced series were analyzed to better understand the trend and seasonal components in healthcare expenditure.
        - The ARIMA model was then used to forecast future expenditure trends for 2023.

## **Technologies Used**
- **Python**, **Pandas**, **R**
- **Machine Learning for forecasting** and **statistical analysis**
