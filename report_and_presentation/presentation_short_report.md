1. Introduction and Business Case

2. Exploration: What did we find in the data?

https://www.canada.ca/en/public-health/services/publications/diseases-conditions/stroke-canada-fact-sheet.html

Given that the incidence of a stroke hovers around the 2.5% mark in Canada, we have to brace for the fact that our data is going to be unbalanced. Out of 5000 people in our dataset, only 250 have had an actual stroke. It fell to us to be careful in interpreting data, not overfocusing on any one factor, and creating a model that gave proper weight to a person's cardiac health reality and their lifestyle. 


3. Data-derived Findings

exploration\top_3_predictors_rf.png

Our findings suggest that high glucose levels in the blood, age, and high BMI were the strongest drivers of stroke risk. If that were the only conclusion, however, our data analysis would be quite limited. How do these factors interact with one another? How does that capture the realities of the people we seek to help?

notebooks\images\RandomForest_top_10_most_important_features.png
notebooks\images\RandomForestClassifier_Bar_TP.png
exploration\stroke_percent_by_age_and_bmi.png

Note here how age is quite heavily weighted, as compared to BMI and glucose levels. Of course, as seen in this confusion matrix, age clearly plays a large role in how severe BMI related risks can get. What we can infer from this is that these three factors do not exist independent of one another - age makes any change in BMI or glucose level more difficult to achieve. An 80 year old would have difficulty radically changing their diet or exercising strenuously, after all.

As such, any solution we offer has to be both curative and preventative. We have to address people who are at risk of having a stroke, but we also need a stronger push for people straddling that line to take more preventative measures, as they are effectively on a time limit. That will only make their efforts to fix their risk factors get more and more difficult with every passing year.

4. Connecting with the Real World
4.1. What does the data fail to cover? 
4.2. How does this affect the implementation of our business case?

5. Holistic Solution to give to Stakeholders