# Stroke Factors Analysis

# Classification Modelling
  
This readme will describe the machine learning models used in the project.

Since the dataset is highly imbalanced 5%, the best models are tree based. However, during our research, we found that Logistic Regression could be a good model with setting parameter weight to balanced. So, we decided to use 3 models. XGBoost, Random Forest from the tree family, and Logistic Regression from linear family.

Random Forest works by creating many decision trees and combining their predictions. Instead of relying on a single Decision Tree, the model builds a forest of trees, each trained slightly differently. The final prediction is made by majority voting among the trees. Reduces overfitting compared to a single decision tree. Handles missing values and noisy data effectively.

An XGBoost Classifier is a supervised machine learning algorithm based on gradient boosting, designed for classification problems. It builds multiple decision trees sequentially. XGBoost improves model performance, and efficient handling of missing values. We found it is good model sine our data has missing values.

So we used Random forest since it is simple, easy to interpret, robust to overfitting, and easier to tune. XGBoost generally offers higher accuracy and speed optimizations, and is efficient handling of missing values. Logistic Regression also is good model for binary problems and easy to interpret. XGBoost is an option too since it is efficient handling of missing values.

In medical prediction tasks such as stroke detection, the consequences of misclassification are not symmetric. In particular, failing to identify a true stroke case (false negative) can have serious clinical consequences, including delayed treatment, increased risk of complications, or death. Therefore, in this study, greater emphasis was placed on `recall` (sensitivity) for the stroke class rather than solely maximizing overall accuracy. To reduce the likelihood of missing true stroke cases, the prediction threshold was adjusted to achieve a `recall` of approximately 0.80, meaning that about 80% of actual stroke cases are correctly identified by the model. This approach prioritizes patient safety by minimizing missed stroke cases while maintaining acceptable overall model performance using Random Forest and XGBoost classifiers.

# Prioritizing Recall in Stroke Prediction

In medical prediction tasks such as stroke detection, the consequences of misclassification are not symmetric. In particular, failing to identify a true stroke case (false negative) can have serious clinical consequences, including delayed treatment, increased risk of complications, or death. Therefore, in this study greater emphasis was placed on `recall` (sensitivity) for the stroke class rather than solely maximizing overall accuracy. The prediction threshold was adjusted to achieve a recall of approximately 0.80, ensuring that most potential `stroke` cases are identified by the model. While this approach increases the number of false positives and may lead to more cases requiring clinical review by physicians, this trade-off is acceptable in a healthcare setting where missing a true stroke case would pose a significantly greater risk to patient safety.

Threshold:

The optimal decision threshold differed between models due to differences in probability distribution and class separation. Random Forest required a lower threshold (0.24) to achieve the desired recall, indicating more conservative probability estimates. In contrast, XGBoost achieved the same recall near the default threshold (0.51), suggesting stronger class separation and more polarized probability outputs.
The Random Forest  predicted distributions for Class0 and Class1 are not well separated, while for XGBoost, the distributions have a strong class separation as shown in images: 

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForest_predicted_probability_distribution.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_predicted_probability_distribution.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_predicted_probability_distribution.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

Confusion Matrix:

For a medical dataset like stroke prediction, the recommended metric Recall (Sensitivity) should generally be high. For a recall value of 0.8, we obtained the following confusion matrices for the 3 models.

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForest_confusion_matrix.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_confusion_matrix.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_confusion_matrix.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

To evaluate model performance in this imbalanced setting, the Precision-Recall Area Under the Curve (PR-AUC) was used in addition to other metrics, as it provides a more informative measure of the model’s ability to correctly identify positive stroke cases while accounting for false positives.
The following table shows the metrics for class 1:

  | Model | Best Threshold | PR-AUC | Precision | F1-Score |
  | --- | --- | --- | --- | --- |
  | Logistic Classifier | 0.5 | 0.22 | 0.13 | 0.22 |
  | Random Forest Classifier | 0.24 | 0.22 | 0.16 | 0.26 |
  | XGBoost Classifier | 0.51 | 0.26 | 0.16 | 0.26 |

Model Feature Importance:

Feature importance varies across models because each algorithm defines and calculates importance according to its internal learning mechanism. Linear models rely on coefficient magnitude, tree-based models use split-based metrics such as impurity reduction or gain, and SHAP values measure the actual contribution of features to predictions. Consequently, differences in importance rankings are expected.
The following images shows the a bar plot of the top ten features predicted by each model.

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForest_top_10_most_important_features.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_top_10_most_important_features.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_top_10_most_important_features.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

SHAP plots:

When differences occur between traditional feature importance metrics and SHAP values, SHAP explanations are preferred because they provide a more realistic and interpretable representation of each feature’s contribution to the model’s predictions. SHAP measures the actual contribution of a feature to the prediction for each individual sample. SHAP global importance equal to  mean absolute SHAP value across all samples.

Bar Plots:

The SHAP bar plot shows which factors have the greatest influence on the model's predictions. Each bar represents a feature used by the model, and the length of the bar indicates how important that feature is in determining the prediction results.
The bar plots shows age, average glucose level, and bmi as top 3 factors in patients stroke prediction.

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForestClassifier_Bar.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_Bar.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_Bar.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

Beeswarm plot:
The beeswarm plot shows how different variables influence the model's predictions across all individuals in the dataset. Each dot represents one observation. The position of the dot shows whether that factor increased or decreased the prediction, while the color indicates whether the feature value was high or low. Features appearing at the top of the chart have the strongest overall influence on the model's predictions.

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForestClassifier_Beeswarm.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_Beeswarm.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_Beeswarm.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

Many insights can be drawn from XGBoost and Random Forest Beeswarm SHAP plots. 
The SHAP values for XGBoost ranges from -0.3 to 0.5
The SHAP values for Random Forest ranges from -0.25 to 0.3

XGBoost can produce more extreme probability shifts because of its boosted tree structure, which may create stronger nonlinear effects.
Random Forest averages predictions over many trees, which smooths out probability shifts, resulting in slightly smaller SHAP magnitudes.

This is clearly seen in the bar and Beeswarm plots. The range of the SHAP values for xgboost is larger than random forest

True Positive - TP:

The top features age, average glucose level, and bmi are the most important. Patients of all ages, old (red dots) or young (blue dots) are displayed correctly above the average line. Patients’ glucose level is moderate, i.e. clustered around the average line. Hypertension in fourth place shows strong sign towards class1 as well. These 4 features together have a stronger effect on the prediction towards Class1.

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForestClassifier_Beeswarm_TP.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_Beeswarm_TP.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_Beeswarm_TP.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

False Negative - FN:

The same 3 features are on top, age, average glucose level, and bmi. Patients in this group are mostly young left of the average line as per age feature. The age color for these patients is red i.e. identified Class1 correclty. However, all other features identify these patients as Class 0 (blue dots). Looking at the graph since age feature assign Class1, and the other feature assign Class0, the probabilty for these patients is very close to the thresold. It is very likely that more calibration to threshold would assign these patients to Class1.

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForestClassifier_Beeswarm_FN.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_Beeswarm_FN.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_Beeswarm_FN.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

True Negative - TN:

The same 3 features are on top, but bmi is second, and average glucose level is third. Patients in this group are mostly young. The plot shows a very young group (blue color) to the left of the average line and displayed correctly below the average line. Patients’ glucose level is moderate, i.e. clustered around the average line with a good number showing strong pull to Class0. Hypertension in fourth place shows strong sign towards class1 as well. These 3 features together have a stronger effect on the prediction towards Class0.

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForestClassifier_Beeswarm_TN.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_Beeswarm_TN.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_Beeswarm_TN.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

False Positive - FP:

The same 3 features are on top, average glucose level, and bmi. Patients in this group are mostly old. There are 2 big clusters, one cluster for old patients (mix red, and blue), and the second cluster for much older patients ( red color). It is clear the cluster for older patients pulling towards Class 1. The second feature average glucose level showed a good number to the right (red color) of the average line. The third feature is clustered closer to the average line. The first 2 features together have a stronger effect on the prediction towards Class1. The age cluster for much older patients all red is a good indication that the model is predicting a stroke whether this is the case or not.

<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForestClassifier_Beeswarm_FP.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_Beeswarm_FP.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_Beeswarm_FP.png" alt="Image 3" style="flex:1; max-width:32%"/>
</div>

Another SHAP plot is waterfall plot, it shows the feature for a single observation, this plot is helpful if we are interested in the feature importance for a single patient. This would be helpful to if a doctor is interested to know how the model coome to prediction is for a specific patient.
The following shows a patient predicion from False Negatives, these prediction should be true but the model prediction was false.
<div style="display:flex; justify-content: space-between; flex-wrap: wrap;">
  <img src="images/RandomForestClassifier_Waterfall_FN.png" alt="Image 1" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/XGBClassifier_Waterfall_FN.png" alt="Image 2" style="flex:1; max-width:32%; margin-right:2%"/>
  <img src="images/LogisticRegression_Waterfall_FN.png" alt="Image 3" style="flex:1; max-width:32%"/>

Different machine learning models, Random Forest, XGBoost, and Logistic Regression, produced varying feature importance rankings because each model captures relationships in the data differently. Therefore, clinical domain knowledge from medical experts should be considered when interpreting these results to ensure that the identified important features are consistent with medical understanding, clinically meaningful, and aligned with  knowledge about stroke risk factors.

Conclusion:

Tthe prediction of stroke risk in our project is primarily influenced by age, glucose level, and BMI, which appear as the most important predictors. While categorical features such as work type and hypertension also contribute to model predictions, their impact is comparatively smaller. These findings highlight the importance of both continuous clinical measurements and patient background factors in stroke risk assessment, and emphasize that model outputs should be interpreted in conjunction with clinical expertise to ensure medical relevance.