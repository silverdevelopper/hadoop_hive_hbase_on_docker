CREATE TABLE Covid
  (iso_code string, continent string, location string, create_date string, total_cases string, new_cases string, new_cases_smoothed string, total_deaths string, new_deaths string, new_deaths_smoothed string, total_cases_per_million string, new_cases_per_million string, new_cases_smoothed_per_million string, total_deaths_per_million string, new_deaths_per_million string, new_deaths_smoothed_per_million string, reproduction_rate string, icu_patients string, icu_patients_per_million string, hosp_patients string, hosp_patients_per_million string, weekly_icu_admissions string, weekly_icu_admissions_per_million string, weekly_hosp_admissions string, weekly_hosp_admissions_per_million string, new_tests string, total_tests string, total_tests_per_thousand string, new_tests_per_thousand string, new_tests_smoothed string, new_tests_smoothed_per_thousand string, positive_rate string, tests_per_case string, tests_units string, total_vaccinations string, people_vaccinated string, people_fully_vaccinated string, total_boosters string, new_vaccinations string, new_vaccinations_smoothed string, total_vaccinations_per_hundred string, people_vaccinated_per_hundred string, people_fully_vaccinated_per_hundred string, total_boosters_per_hundred string, new_vaccinations_smoothed_per_million string, new_people_vaccinated_smoothed string, new_people_vaccinated_smoothed_per_hundred string, stringency_index string, population string, population_density string, median_age string, aged_65_older string, aged_70_older string, gdp_per_capita string, extreme_poverty string, cardiovasc_death_rate string, diabetes_prevalence string, female_smokers string, male_smokers string, handwashing_facilities string, hospital_beds_per_thousand string, life_expectancy string, human_development_index string, excess_mortality_cumulative_absolute string, excess_mortality_cumulative string, excess_mortality string, excess_mortality_cumulative_per_million string)
  row format delimited fields terminated by ',';