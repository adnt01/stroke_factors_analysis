# stroke_factors_analysis
Cohot8 - DS3

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

Initial exploratory data analysis revealed that the dataset is highly unbalanced. Only 249 observations (~5%) are positive for stroke. Limited positive cases for both training and test dataset.  
Region: we do not know the geographical location of the individuals surveyed. Results may not generalize well to populations living in a different geographical location. 
Social Determinants of Health: Data about ethnicity, education level, income levels are not available. These demographic and socioeconomic variables are known to influence stroke risk and health outcomes, and their absence represents a key limitation. Results may not generalize well to a different demographic and socioeconomic group. 
Missing important medical factors such as cholesterol level and diabetes status (7).  
Missing data for Body Mass Index for some individuals/observations: Requires imputation to determine the statistical significance and to determine if the variable correlates with other variables. 

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

References: 

1. GBD 2021 Stroke Risk Factor Collaborators. Global, regional, and national burden of stroke and its risk factors, 1990–2021: a systematic analysis for the Global Burden of Disease Study 2021. The Lancet Neurology. 18 September 2024. doi: 10.1016/S1474-4422(24)00369-7.
2. Strilciuc S, et.al. The economic burden of stroke: a systematic review of cost of illness studies. J Med Life. 2021 Sep-Oct;14(5):606–619. doi: 10.25122/jml-2021-0361.
3. Hankey GJ. Stroke: how large a public health problem, and how can the neurologist help? Arch Neurol. 1999 Jun;56(6):748-54. doi: 10.1001/archneur.56.6.748. PMID: 10369318.
4. Rajabpour M, et. al. Perceived need to prevent stroke readmission: A qualitative study from the perspective of stroke patients and healthcare professionals. J Educ Health Promot. 2025 Aug 29;14:335. doi: 10.4103/jehp.jehp_854_24. PMID: 40979314; PMCID: PMC12448509.
5. Elamy, A. H., Shuaib, A., Carriere, K. C., & Jeerakathil, T. (2020). Common Comorbidities of Stroke in the Canadian Population. The Canadian journal of neurological sciences. Le journal canadien des sciences neurologiques, 47(3), 314–319. https://doi.org/10.1017/cjn.2020.17
6. Vyas, M. V., Fang, J., de Oliveira, C., Austin, P. C., Yu, A. Y. X., & Kapral, M. K. (2023). Attributable Costs of Stroke in Ontario, Canada and Their Variation by Stroke Type and Social Determinants of Health. Stroke, 54(11), 2824–2831. https://doi.org/10.1161/STROKEAHA.123.043369
7. “Stroke.” Johns Hopkins Medicine, https://www.hopkinsmedicine.org/health/conditions-and-diseases/stroke. Accessed 26 February 2026.


### README REQUIREMENT
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