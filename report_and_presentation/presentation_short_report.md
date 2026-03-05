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



4. Connecting with the Real World
4.1. What does the data fail to cover? 

Each data point we have is a snapshot of a person's life, but it's not the full story. We have no way of knowing how long someone has held a particular job, or has had heart disease, or how long they've been overweight for. That doesn't make our data useless, thankfully. A set of health complications, or lack thereof, speaks to a set of personal decisions that individual made. Knowing more about a person's decisions, would help focus any of the findings we made into a coherent action plan.

4.2. How does this affect the implementation of our business case?

Any solution we offer has to be both curative and preventative. We have to address people who are at risk of having a stroke, but we also need a stronger push for people straddling that line to take more preventative measures, as they are effectively on a time limit. That will only make their efforts to fix their risk factors get more and more difficult with every passing year.

5. Holistic Solution to give to Stakeholders

We have concluded that advanced age, high BMI and high blood glucose levels are the 3 primary stroke risk factors. We also know that these metrics do not exist in a vaccuum, and thus influence each other and are influenced by other lifestyle choices, and negative outcomes here are not something developed instantly, but rather over a long period of time. 

The business case implementation we'd like to offer as a solution is NOT an instant solution, but rather a HABIT-FORMING PROGRAM:

(TENTATIVE. ANY GROUP MEMBERS WHO WANT TO REVISE/ADD TO THIS, PLEASE DO SO)

- Focus primarily on people approaching an agreed-upon risk threshold for a stroke. The age groups should not just include age 60+ people already at high risk, but people at pre-risk stages who are younger, think age 30+.
- Set up a two-week-long reporting of all daily meals. Make sure to note dietary restrictions, or availability of food under specific circumstances (ex. people who buy fast food during lunch hours at work due to convenience).
- Make a slow push towards better eating, with the intent of making incremental changes towards good eating and exercise habits. We want the routine change to feel gradual and easy to accept.
- Keep regular track of an individual's progress, with incentive structures built in to motivate continuation of the program. (One example is monetary compensation for continuing to participate in scientific research participation) (GROUP: If there's anything else you can think of here for incentives, please add them.)
- Make changes to an individual's program plan based on rolling performance metrics (weight, age, BMI, blood glucose, reported sleep and stress levels, etc)

The easiest way to implement this is to use existing infrastructure: things like Apple Watch fitness apps, Fitbits, or other easy-to-access apps make it easy for the participant to record their results without inconveniencing them, and easy for program delivering personnel and researchers to tune an app to better present the progress made by a participant. A program we theoretically make would have to hook into that infrastructure, and provide an easy-to-use and habit-forming experience, to motivate people to stick with it.