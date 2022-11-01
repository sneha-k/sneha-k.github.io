---
title: "Variable Selection - The What, Why and How?"
author: "Sneha Karanjai"
date: '2022-10-31'
output: md_document
bibliography: references.bib
nocite: '@*'
---

```{r, echo=FALSE, out.width='100%', fig.align="center"}
knitr::include_graphics("/sneha-k.github.io/docs/assets/confounding_variables.png")
```

# What is Variable Selection?
“Variable selection” is exactly what it sounds like! It is the process of selecting which variables to include in your model. Variables here indicate the "features" or the "explanatory" variables that are fed into the model. Explanatory variables are used in a model as a means to infer or predict the "response/target variable". The phrase “variable selection” can also be used when the competing models differ on which variables should be included but decisive on the mathematical form of the variable to be used. In other words, variable selection means choosing among the available complete set of variables to fit into the particular model, by removing those that are irrelevant or redundant. But why not send everything to the model and let it deal with it?

# Why is Variable Selection Important?
Without variable selection you would be setting yourself up for failure in model building. It will be the perfect exampke of "Garbage-In and Garbage-Out". Adding irrelevant variables to the model results in large overstatements of effects of variables with little to no-effects and huge understatement of standard errors of the model. The problem to tackle with variable selection is becoming even more important with each passing year. In nearly every discipline of science and engineering, advances in technology have made it easier to collect huge amounts of data. The goal is to model and predict the response variable as a function of the explanatory variable, but with so many of these explanatory variables to choose from, how do you select an appropriate subset? Other eminent issues include overfitting and the curse of dimensionality. Overfitting is a concept in data science, which occurs when a statistical model fits exactly against its training data. When this happens, the algorithm unfortunately cannot perform accurately against unseen data, defeating its purpose. Curse of Dimensionality refers to a set of problems that arise when working with high-dimensional data. The dimension of a dataset corresponds to the number of attributes/features that exist in a dataset i.e when the number of predictors are greater than the number of observations. Another known problem of adding unnecessary variables is that it reduces interpretability of the model. Finally, by reducing the number of predictors fed into the model we reduce the time and other resources that is utilized by the model.

```{r, echo=FALSE, out.width='100%', fig.align="center"}
knitr::include_graphics("/sneha-k.github.io/docs/assets/images.jpeg")
```

# Types of Variable Selection

There are many different types of variable or feature selection methods developed overtime. The first and foremost form of variable selection is based on domain knowledge and expertise. One can directly choose to ignore certain variables based on their understanding of the target variable, the exploratory data analysis done on the data set, and the conversations with the client and business stakeholders on the aim of the modelling process. Most feature selection methods beyond this can be divided into three major buckets :

- **Filter based:** Features are filtered based on a specific metric. An example of such a metric could be correlation/chi-square.  In Pearson correlation method, we check the absolute value of the Pearson’s correlation between the target and the numerical features in our dataset. We keep the top 'n' features based on this criterion. Similarly, in chi-square method, we compute the chi-square metric between the target and the numerical variable and only select the variable with the maximum chi-squared values. These are limited to the numerical explanatory variables.

- **Wrapper-based:** Wrapper methods consider the selection of a set of features as a search problem. Classical wrapper based variable selection methods include forward selection, backward elimination, and stepwise selection. The names are associated with the direction of the significant variable search. In forward selection approach one starts fitting the model with one feature and keeps adding features until there is no impact on the ML model metrics(AIC, BIC, $C_p$, Adj. $R^2$). 
Backward elimination is the opposite approach of forward selection. With this approach, one starts from the full set of features and then iteratively reduce feature by feature as long as the ML model metrics(AIC, BIC, $C_p$, Adj. $R^2$) stay the same. Another classical method is the stepwise selection which is the combination of forward selection and backward elimination. 

- **Embedded:** Embedded methods use algorithms that have built-in feature selection methods. Embedded methods combine the qualities’ of filter and wrapper methods. One well-known example of an embedded feature selection method is Lasso Regression. Lasso regression performs L1 regularization which adds penalty equivalent to absolute value of the magnitude of coefficients. What LASSO does well is to provide a principled way to reduce the number of features in a model. In contrast, automated feature selection based on standard linear regression by stepwise selection or choosing features with the lowest p-values has many drawbacks. LASSO involves a penalty factor that determines how many features are retained; using cross-validation to choose the penalty factor helps assure that the model will generalize well to future data samples.

Here is a glimpse of comparison between the three categories of Variable Selection : 

```{r, echo=FALSE, out.width='100%', fig.align="center"}
knitr::include_graphics("/sneha-k.github.io/docs/assets/comparison.png")
```

# What Is the Best Method?

There is no universallt accepted best variable selection method. Instead, you must discover what works best for your specific problem using careful systematic experimentation.  The more sophisticated methods like Lasso are flexible and work in different situations like when p>>n and so are definitely a good starting point if you understand and can justify the algorithms. The primary advantage of stepwise regression is that it's computationally efficient. Although it is simple, easy to use, and easy to code, its performance is generally worse than alternative methods. The problem is that it is too greedy. By making a hard selection on the the next regressor, it makes rigid choices that might be suboptimal in general. And, it can't go back to revise its past choices. A widely popular opinion is that stepwise regression has fallen out of favor compared to $l_1$ regularized regression (LASSO), which tends to produce better solutions. LASSO penalizes the $l_1$ norm of the weights, which induces sparsity in the solution (many weights are forced to zero). This performs variable selection (the 'relevant' variables are allowed to have nonzero weights). The degree of sparsity is controlled by the penality term, and some procedure must be used to select it (cross-validation is a common choice).

# Summary 
Variable selection is one of the important steps in Machine Learning. It does not guarantee a beautifully execited machine learning algorithm but it definitely takes you one step closer to it. Like George E.P Box said, "All models are wrong, but some are useful." Variable Selection is our attempt to making a wrong model useful. The aim is to construct a model that predicts well or explains the relationships in the data. Use these methods as a guide only. It is extremely important to include appropriate variables in prediction modelling, as model’s performance largely depends on which variables are ultimately included in the model. Failure to include the proper variables in the model provides inaccurate results, and the model will fail to capture the true relation that exists in the data between the outcome and the selected variables. There are numerous occasions when prediction models are developed without following the proper steps or adopting the proper method of variable selection. Researchers need to be more aware of and cautious about these very important aspects of prediction modelling.

# References