# stroke_factors_analysis
Cohort8 - DS3

#### Goal: Determine top 3 factors - lifestyle or health -  for stroke prediction. 

## Purpose and Overview: Introduce the project with essential details, concise description and a project objective.

Data source: Stroke Prediction Dataset from Kaggle (https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset)

 The goal of this project is to transform the stroke prediction dataset into an actionable priority list. Determining a certain factor significantly more predictive than other factors allows an individual, healthcare provider, or business to develop interventions more effectively, reduce preventable hospitalizations, and improve long-term health outcomes rather than relying on reactive interventions.


## Project Scope 
By identifying the top three predictors of a stroke using the Stroke Prediction Dataset, we aim to shift the focus from reactive treatment to targeted preventative medicine and to support strategic planning for stakeholders. 

### Stakeholders 
Hospital administrators, clinicians, and allied health professionals: Identify high‑risk populations, develop screening protocols to flag high-risk patients, improve triage protocols for patients to improve care pathways, and support quality improvement initiatives to reduce readmissions. 

Public Health Organizations, Epidemiologists, and Biostaticians: This includes organizations such as World Health Organization (WHO), Centers of Disease Control and Prevention (CDC), and regional health units. Provide population-level analysis to identify trends and patterns among different populations. Develop campaigns, patient education materials based on common risk factors, and coordinate community outreach for high-risk populations to implement population-level prevention. 

Legislative bodies: Aid in long-term planning and resource allocation to health care organizations. Can help with policy development around chronic disease management, screening recommendations, and stroke prevention strategies. 

Health equity and community health organizations: Help reduce disparities among high-risk populations, improve access to care, and address social determinants of health that contribute to stroke risk. They can also help with alleviating stress on hospitals by providing community based care to reduce readmissions and improve chronic disease management.

## Methodology
### Steps taken:
- Data Cleaning 
- Data Exploration and Visualization 
- Logistic Regression Analysis
- Classification Modelling 

### Technical Stack:

#### Programming Language:
Python
#### Libraries Used:
- Numpy: matrix operations
- Pandas: data analysis
- Matplotlib: creating graphs and plots
- Seaborn: enhancing matplotlib plots
- SKLearn: regression analysis

## Data Cleaning 
Objective: check for missing values, categorical variables for transformation, and summarize general statistics for the dataset

Method:
- info() was used to see all the features and check for missing values 
- value_counts() was used to count the frequency of unique values for each feature
- describe() was used to produce a general statistics table for numerical variable 

Results: 
- Missing values for BMI and Unknown values for Smoking Status
- Five categorical variables: ["gender", "ever_married", "work_type", "Residence_type", "smoking_status"]
- Summary statistics shown below:
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id</th>
      <th>age</th>
      <th>hypertension</th>
      <th>heart_disease</th>
      <th>avg_glucose_level</th>
      <th>bmi</th>
      <th>stroke</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>5110.000000</td>
      <td>5110.000000</td>
      <td>5110.000000</td>
      <td>5110.000000</td>
      <td>5110.000000</td>
      <td>4909.000000</td>
      <td>5110.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>36517.829354</td>
      <td>43.226614</td>
      <td>0.097456</td>
      <td>0.054012</td>
      <td>106.147677</td>
      <td>28.893237</td>
      <td>0.048728</td>
    </tr>
    <tr>
      <th>std</th>
      <td>21161.721625</td>
      <td>22.612647</td>
      <td>0.296607</td>
      <td>0.226063</td>
      <td>45.283560</td>
      <td>7.854067</td>
      <td>0.215320</td>
    </tr>
    <tr>
      <th>min</th>
      <td>67.000000</td>
      <td>0.080000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>55.120000</td>
      <td>10.300000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>17741.250000</td>
      <td>25.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>77.245000</td>
      <td>23.500000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>36932.000000</td>
      <td>45.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>91.885000</td>
      <td>28.100000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>54682.000000</td>
      <td>61.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>114.090000</td>
      <td>33.100000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>72940.000000</td>
      <td>82.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>271.740000</td>
      <td>97.600000</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>

## Exploratory Analysis
Objective: understand and visualize the data, explore correlations <add>

Method: 
- pairplot
- visualize correlation matrix with heatmap 
- countplot
- histplot
- violinplot
- boxplot 

- Visualizing stroke count 
![count plot](notebooks/images/count_stroke.png)
- Using heat map to understand feature correlation
![heat map](notebooks/images/correlation_heatmap_num_var.png)
- Using pairplot to understand the correlation between age, bmi, avg glucose level and stroke
![pair plot](notebooks/images/pairplot_age_bmi_gluc.png)

Results:

## Regression and Classification Modelling 

## Conclusions and Discussions and Limitations 

## Team Videos 

## References 
1. GBD 2021 Stroke Risk Factor Collaborators. Global, regional, and national burden of stroke and its risk factors, 1990–2021: a systematic analysis for the Global Burden of Disease Study 2021. The Lancet Neurology. 18 September 2024. doi: 10.1016/S1474-4422(24)00369-7.
2. Strilciuc S, et.al. The economic burden of stroke: a systematic review of cost of illness studies. J Med Life. 2021 Sep-Oct;14(5):606–619. doi: 10.25122/jml-2021-0361.
3. Hankey GJ. Stroke: how large a public health problem, and how can the neurologist help? Arch Neurol. 1999 Jun;56(6):748-54. doi: 10.1001/archneur.56.6.748. PMID: 10369318.
4. Rajabpour M, et. al. Perceived need to prevent stroke readmission: A qualitative study from the perspective of stroke patients and healthcare professionals. J Educ Health Promot. 2025 Aug 29;14:335. doi: 10.4103/jehp.jehp_854_24. PMID: 40979314; PMCID: PMC12448509.
5. Elamy, A. H., Shuaib, A., Carriere, K. C., & Jeerakathil, T. (2020). Common Comorbidities of Stroke in the Canadian Population. The Canadian journal of neurological sciences. Le journal canadien des sciences neurologiques, 47(3), 314–319. https://doi.org/10.1017/cjn.2020.17
6. Vyas, M. V., Fang, J., de Oliveira, C., Austin, P. C., Yu, A. Y. X., & Kapral, M. K. (2023). Attributable Costs of Stroke in Ontario, Canada and Their Variation by Stroke Type and Social Determinants of Health. Stroke, 54(11), 2824–2831. https://doi.org/10.1161/STROKEAHA.123.043369
7. “Stroke.” Johns Hopkins Medicine, https://www.hopkinsmedicine.org/health/conditions-and-diseases/stroke. Accessed 26 February 2026.

### Week1 Expectations 

1. The business motivation for your project.

We have chosen our project as “The top 3 predictors of having a stroke – is it lifestyle-based or health-based?"
Our motivation isn't just about "finding numbers"—it’s about proactive healthcare management through appropriate / applicable lifestyle changes. The goal of this analysis is to transform a complex dataset into an actionable priority list. Determining a certain factor significantly more predictive than other factors allows an individual, healthcare provider, or business to develop interventions more effectively, reduce preventable hospitalizations, and improve long-term health outcomes rather than relying on reactive interventions.

The Problem:

Stroke is the 3rd leading cause of disability and mortality worldwide with an estimated 93.8 million cases(1). Strokes represent a "high-cost, high-impact" event for hospitals and insurance companies(2). Stroke can be a comorbidity risk factor to other health conditions resulting in a high demand for support for patients and strain on the health care system(5). The mean of 1-year attributable costs for stroke patients in Canada ranged from $33 231-$33 8136. The cost also varied among different population groups, where immigrants and low-income households had higher costs (6). Although reactive treatment is significantly more expensive and less effective than preventive care(3), healthcare stakeholders are often overwhelmed by data, making it difficult to pinpoint which specific lifestyle or physiological factors require the most immediate intervention(4).

Purpose and Overview: 

By identifying the top three predictors of a stroke using the Stroke Prediction Dataset, we aim to shift the focus from reactive treatment to targeted preventative medicine and to support strategic planning for stakeholders. 

Stakeholders: 

Hospital administrators, clinicians, and allied health professionals: Identify high‑risk populations, develop screening protocols to flag high-risk patients, improve triage protocols for patients to improve care pathways, and support quality improvement initiatives to reduce readmissions. 

Public Health Organizations, Epidemiologists, and Biostaticians: This includes organizations such as World Health Organization (WHO), Centers of Disease Control and Prevention (CDC), and regional health units. Provide population-level analysis to identify trends and patterns among different populations. Develop campaigns, patient education materials based on common risk factors, and coordinate community outreach for high-risk populations to implement population-level prevention. 

Legislative bodies: Aid in long-term planning and resource allocation to health care organizations. Can help with policy development around chronic disease management, screening recommendations, and stroke prevention strategies. 

Health equity and community health organizations: Help reduce disparities among high-risk populations, improve access to care, and address social determinants of health that contribute to stroke risk. They can also help with alleviating stress on hospitals by providing community based care to reduce readmissions and improve chronic disease management.

2. Which dataset you have chosen to use.

Our group chose to use the Stroke Prediction Dataset from Kaggle (https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset)

3. Risks or unknowns that you have identified.

- Initial exploratory data analysis revealed that the dataset is highly unbalanced. Only 249 observations (~5%) are positive for stroke. Limited positive cases for both training and test dataset.  
- Region: we do not know the geographical location of the individuals surveyed. Results may not generalize well to populations living in a different geographical location. 
- Social Determinants of Health: Data about ethnicity, education level, income levels are not available. These demographic and socioeconomic variables are known to influence stroke risk and health outcomes, and their absence represents a key limitation. Results may not generalize well to a different demographic and socioeconomic group. 
- Missing important medical factors such as cholesterol level and diabetes status (7).  
- Missing data for Body Mass Index for some individuals/observations: Requires imputation to determine the statistical significance and to determine if the variable correlates with other variables. 

4. How you will approach the analysis.

- Data exploration with visualizations 
- Data cleaning which includes imputation for missing values 
- Data Modelling
    - Multivariable analysis 
    - Apply logistic regression as baseline model 
    - Apply random forest classification 
    - Compare the classification methods based on accuracy 
    - Determine feature importance
    - Rank each feature
- Identity the top three features that provides the best prediction of stroke outcome 
- Data visualization to show modelling results 
- Recommend lifestyle changes based on top three features to individuals/healthcare provider/health organizations to reduce the prevalence of stroke cases

5. Breakdown of roles/tasks assigned to each team member.

Exploratory data analysis - Aravind Vijayaragavan, Adnan Takash, Naveen Kumar Nair

Data Cleaning - Aravind Vijayaragavan

Data Modeling & Visualization - Adnan Takash, Azadeh Selahvarzi

README documentation, repo structure, code review  - Karen Huang, Yuli Zhang, Naveen Kumar Nair

# References: 

1. GBD 2021 Stroke Risk Factor Collaborators. Global, regional, and national burden of stroke and its risk factors, 1990–2021: a systematic analysis for the Global Burden of Disease Study 2021. The Lancet Neurology. 18 September 2024. doi: 10.1016/S1474-4422(24)00369-7.
2. Strilciuc S, et.al. The economic burden of stroke: a systematic review of cost of illness studies. J Med Life. 2021 Sep-Oct;14(5):606–619. doi: 10.25122/jml-2021-0361.
3. Hankey GJ. Stroke: how large a public health problem, and how can the neurologist help? Arch Neurol. 1999 Jun;56(6):748-54. doi: 10.1001/archneur.56.6.748. PMID: 10369318.
4. Rajabpour M, et. al. Perceived need to prevent stroke readmission: A qualitative study from the perspective of stroke patients and healthcare professionals. J Educ Health Promot. 2025 Aug 29;14:335. doi: 10.4103/jehp.jehp_854_24. PMID: 40979314; PMCID: PMC12448509.
5. Elamy, A. H., Shuaib, A., Carriere, K. C., & Jeerakathil, T. (2020). Common Comorbidities of Stroke in the Canadian Population. The Canadian journal of neurological sciences. Le journal canadien des sciences neurologiques, 47(3), 314–319. https://doi.org/10.1017/cjn.2020.17
6. Vyas, M. V., Fang, J., de Oliveira, C., Austin, P. C., Yu, A. Y. X., & Kapral, M. K. (2023). Attributable Costs of Stroke in Ontario, Canada and Their Variation by Stroke Type and Social Determinants of Health. Stroke, 54(11), 2824–2831. https://doi.org/10.1161/STROKEAHA.123.043369
7. “Stroke.” Johns Hopkins Medicine, https://www.hopkinsmedicine.org/health/conditions-and-diseases/stroke. Accessed 26 February 2026.


### README REQUIREMENT
The README should be clear, well-written,
and explain the dataset, findings, and methodology. The project should be easy to
understand for both technical and non-technical reviewers.

Each project's README should describe the project objective, the final outcome of
the project, the key business takeaways, and describe your team's approach to
working collaboratively.

### Guiding Questions

* Who is the intended audience for your project?
* What is the question you will answer with your analysis?
* What are the key variables and attributes in your dataset?
* Do you need to clean your data, and if so what is the best strategy?
* How can you explore the relationships between different variables?
* What types of patterns or trends are in your data?
* Are there any specific libraries or frameworks that are well-suited to your project requirements?

In addition, you should be considering the following (depending on your stream):

**Data Science Guiding Questions**

* How can you tailor the visualizations to effectively communicate with your audience?
* What type of visualization best suits your data and objectives (e.g., bar chart, scatter plot, heatmap)?
* How can you iterate on your design to address feedback and make improvements?
* What best practices can you follow to promote inclusivity and diversity in our visualization design?
* How can you ensure that your visualization accurately represents the underlying data without misleading or misinterpreting information?
* Are there any privacy concerns or sensitive information that need to be addressed in your visualization?


LINKS FOR PROJECT REFLECTION:
Aravind: https://streamable.com/rjpu9g