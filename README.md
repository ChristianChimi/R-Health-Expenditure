## **R-Health-Expenditure**
## **Overview**
This project aims to analyze trends and patterns in healthcare spending using the R programming language. The analysis includes data exploration, visualization, and statistical modeling to uncover regional disparities and long-term trends in healthcare expenditure across various countries.
[Real OECD Dataset Available here!]( https://data-explorer.oecd.org/vis?pg=0&fc=Topic&fs[0]=Topic%2C1%7CHealth%23HEA%23%7CHealth%20expenditure%20and%20financing%23HEA_EXP%23&bp=true&snb=5&df[ds]=dsDisseminateFinalDMZ&df[id]=DSD_SHA%40DF_SHA&df[ag]=OECD.ELS.HD&df[vs]=1.0&dq=.A.EXP_HEALTH.PT_B1GQ._T.._T.._T...&pd=2015%2C&to[TIME_PERIOD]=false&vw=tb)

## **Pre-Processing in Python**
    - The initial data cleaning and preparation was carried out in Python, which involved:
    - Filtering Data: Loaded the dataset and filtered for years after 1999, as these years represent the most consistent part of the dataset.
    - Handling Missing Data: Dropped rows with null values, including 2023 and 2024 data, which were missing due to their recent nature.
    - Reshaping Data: Used melting to transform the dataframe from a wide format to a long format, making it easier to analyze trends over time.

## **R analysis** [R page avalable here!]([https://www.esempio.com](https://christianchimi.github.io/R-Health-Expenditure/R-Expenditure-Analysis.html))
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

## **Key Insights**
    - 2015 Healthcare Expenditure: The analysis revealed significant disparities in healthcare spending across countries, with the top 20 countries displaying the highest healthcare expenditure in 2015. This insight can guide policy discussions on resource allocation.
    - Healthcare Trends: Trends in healthcare spending for Italy and France were analyzed, showing how expenditures have evolved over time, which can be valuable for long-term budget planning and healthcare policy decisions.
    - Expenditure Distribution: Descriptive statistics revealed a skewed distribution in healthcare expenditure, with a few countries spending disproportionately more than others, while the majority spent relatively little.
    - Forecasting 2023: The ARIMA model forecasted healthcare expenditure for 2023, showing expected trends and highlighting potential future challenges or areas where healthcare funding might need to be adjusted.

## **Conclusions**
This project provided a comprehensive analysis of global healthcare expenditure trends using both R and Python for data processing, exploration, and forecasting. By examining expenditure patterns in 2015, long-term trends, and forecasting future spending, the project identified regional disparities and provided insights that can inform policy makers about the evolving landscape of healthcare spending. The ARIMA model's forecast for 2023 offers a data-driven perspective on future healthcare expenditure, helping anticipate future challenges and opportunities in the healthcare sector. This analysis can serve as a valuable tool for governments and organizations to make informed decisions regarding healthcare budgets and planning.

## **Technologies Used**
- **Python**, **Pandas**, **R**
- **Machine Learning for forecasting** and **statistical analysis**
