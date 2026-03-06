FORMAT:

1. Introduction and Business Case

2. Exploration: What did we find in the data?

Preliminary data exploration was conducted through Python, specifically the pandas and MICE imputation libraries for datset cleaning, and the Random Forest and XGBoost classifier algorithms (alongside other tree-based prediction algorithms) to gauge stroke prediction accuracy based on given features.

The first observation made was that the dataset itself was highly unbalanced; roughly 5% of the dataset consisted of confirmed stroke victims (250 entries out of 5110). This carries with it the consideration that any feature shared amongst these individuals run the risk of being overweighted in any prediction process. For example, if half of all available stroke victims fell under a BMI categorized as 'obese', then an algorithm, unless aggressively corrected for, would weight obesity as a risk factor for strokes much higher than other factors, even if obesity is common in the non-stroke population as well. This can be corrected for by using multiple classification models and comparing results, in order to not accidentally miss any model maladaptations or genuine new findings.

The next thing we noticed during data exploration was that a number of BMI values were missing. This could be easily accounted for by more basic imputation methods (mean or mode imputation), but we also noticed that 40 of the 250 stroke victim entries also had missing BMI values. With nearly a sixth of the BMI values of our most important demographic being missing, we'd need a more robust and careful imputation method to fill in the values, for fear of accidentally skewing the results of our target population. We therefore used MICE imputation to fill in the missing values, because it better takes into account relationships between variables, instead of just mathematical single-point observations.

Subsequently, the main concern was converting categorical variables (such as marriage status, a yes/no question) into numerical values for better processing in classification models, which typically require only numerical inputs. For this, we implemented a one-hot encoder to create separate 1/0 binary value columns for each possible categorical choice. This, effectively, let us treat every feature present as a numerical feature. Examples include entries like "yes_married", "no_married", "yes_hypertension", "no_hypertension", among others.

Some features, when examined further, offered insights into the nature of the dataset itself. One such example is the "work_type" column, which allows an entry to specify if the person recorded has a private or government job, is a child, or has never worked. Given that this is an international dataset, this makes correlation of age and work unreliable in some edge cases, as the dataset itself does not differentiate the country of origin of any one person. It is, therefore, possible to get children in the 13-15 year old range that can be classified as either "a child", "never worked" or has a work designation of some kind, due to differing labor laws in different countries. What this meant for us, and further data analysis, is that the correlation between work status and stroke incidence should be examined more closely for any misattributions of value. We later found out that work status had very little bearing on stroke incidence by itself, after Random Forest and XGBoost Classification.

3. Data-derived Findings

4. Connecting with the Real World
4.1. What does the data fail to cover? What are its limitations?

A key limitation of this data is that it is a snapshot in time of each person recorded, and not a longitudinal look at health and lifestyle changes. A person could be recorded as having a BMI of 36, or having a government job, but it offers no insight into how long they have held this status. The dataset itself gives us no avenue to explore if the effects of high BMI manifest during the buildup to such a value, or if only sustained existence at that level for a given number of years correlates with increased stroke incidence. Health, as we experience it in day-to-day life, is a continuous variable, and there are certain insights that cannot be fully captured by just looking at a snapshot. That is not to say that all such observations are useless, however -  a high BMI or blood glucose level, even if only a single incidence of such, speaks to further lifestyle decisions (if intentional) and health circumstances (if not) that can be addressed even without the full picture of an individual's health progression.

In addition, another limitation arises from the three strongest predictors of stroke in our dataset—age, BMI, and blood glucose. These features include both modifiable and non‑modifiable factors. Because age cannot be changed, while BMI and glucose can fluctuate over time, it becomes difficult to interpret the correlations between these variables in a cross‑sectional dataset. Age will always increase, but BMI and glucose reflect lifestyle, environment, and access to care, all of which can change. As a result, any association we observe between these predictors and stroke risk may be disproportionately influenced by age simply because it is fixed and increases continuously, while the modifiable factors may only reflect a temporary state. So the dataset limits our ability to determine whether stroke risk is driven primarily by long-term exposure to modifiable factors, by the natural progression of age, or by the interaction between the two. This complicates the development of targeted interventions because the non‑modifiable factor (age) cannot be separated cleanly from the modifiable ones in the available data.

Another limitation, mentioned before, is that we used a World Health Organization sourced data file, with people around the world as part of the dataset. This means that things like socioeconomic status, specific food availabilities, genetic markers and disease susceptibilities are deliberately not part of the dataset, and cannot be used to make insights in the interest of neutrality. The main issue here is that advice made from extrapolation of this data must be similarly general, and thus modified further to meet the specific needs of someone from a country or life situation that does not fall within the generalizations made by this dataset. For example, if our data were to suggest that hypertension incidence increases the likelihood of a stroke, and a certain population has a genetic susceptibility to hypertension, then any stroke-reduction advice must put increased weight on hypertension prevention for that population. Similarly, if our analysis were to suggest that people in government job positions had a slightly lower risk of strokes, and a person lives somewhere such opportunities are sparse, then that minor insight becomes largely useless to them.

4.2. How does this affect the implementation of our business case?

 Our business case should not be taken as a one-size-fits-all approach, and must be re-examined against the health realities of its target population before implementation. Similarly, any solution we make cannot realistically be a 'one-and-done' approach. We are already aware that people's health realities do not exist solely as a one-time snapshot, thus, any solution must keep track of a person's progress and how it changes based on their personal choices each week.

 Instead, implementation must focus on long‑term habit formation, continuous monitoring, and adaptive goal‑setting that responds to each participant’s changing health trajectory.

5. Holistic Conclusion to Provide to Stakeholders

We have concluded that advanced age, high BMI and high blood glucose levels are the 3 primary stroke risk factors. We also know that these metrics do not exist in a vaccuum, and thus influence each other and are influenced by other lifestyle choices, and negative outcomes here are not something developed instantly, but rather over a long period of time. 

The business case implementation we'd like to offer as a solution is NOT an instant solution, but rather a HABIT-FORMING PROGRAM:

(TENTATIVE. ANY GROUP MEMBERS WHO WANT TO REVISE/ADD TO THIS, PLEASE DO SO)

- Focus primarily on people approaching an agreed-upon risk threshold for a stroke. The age groups should not just include age 60+ people already at high risk, but people at pre-risk stages who are younger, think age 30+.
- Set up a two-week-long reporting of all daily meals. Make sure to note dietary restrictions, or availability of food under specific circumstances (ex. people who buy fast food during lunch hours at work due to convenience).
- Make a slow push towards better eating, with the intent of making incremental changes towards good eating and exercise habits. We want the routine change to feel gradual and easy to accept.
- Keep regular track of an individual's progress, with incentive structures built in to motivate continuation of the program. (One example is monetary compensation for continuing to participate in scientific research participation) (GROUP: If there's anything else you can think of here for incentives, please add them.)
- Make changes to an individual's program plan based on rolling performance metrics (weight, age, BMI, blood glucose, reported sleep and stress levels, etc)

The easiest way to implement this is to use existing infrastructure: things like Apple Watch fitness apps, Fitbits, or other easy-to-access apps make it easy for the participant to record their results without inconveniencing them, and easy for program delivering personnel and researchers to tune an app to better present the progress made by a participant. A program we theoretically make would have to hook into that infrastructure, and provide an easy-to-use and habit-forming experience, to motivate people to stick with it.

For the population that does not interact with the healthcare system for early detection, such as younger age groups with stroke risk factors, people without a primary care physician, or people with many Social Determinants of Health (SDOH) barriers, digital health tools and community-based programs can help fill the gap.

Digital health tools and campaigns allow self‑monitoring and provide education of risk factors without needing a doctor’s visit. The Stroke Riskometer is a digital health app that can assess an individual's risk of a stroke in the next five or ten years and provide information about how to reduce the risk.

Community programs such as nutrition classes, subsidized fitness programs, walking groups, culturally tailored cooking workshops can provide accessible, low‑cost ways to build and retain habits that lower risk factors of stroke. Community programs also helps outreach to people impacted by SDOH so people facing food insecurity, unstable housing, or low income are not excluded from prevention.

Through incremental lifestyle changes, continuous monitoring, and incentive-based engagement, the program builds sustainable habits that reduce stroke risk over time while offering a scalable, equitable model for population health improvement.

6. Ideas for Future Analyses
