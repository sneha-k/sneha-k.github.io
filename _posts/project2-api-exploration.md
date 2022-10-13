# Exploratory Data Analysis - College Scorecard API by the U.S Department of Education

# Introduction

For the second project of the course, we were teamed up to create a vignette about contacting an API using functions created to query, parse, and return well-structured data. Then, to use the functions to obtain data from the API and do some exploratory data analysis. The API that my teammate Rachel and I picked was the [College Scorecard API by the U.S Department of Education](https://collegescorecard.ed.gov/data/documentation/). College Scorecard provides data at the institution-level and data by field of study. The technical data documents provide in-depth information about these data. The API equips us with the data dictionary includes separate worksheets with institution-level and field of study dictionaries as well as cohort maps describing the timing aspects of each data element which was extensively used to build our API calls. The College Scorecard API is a GET API with only one endpoint to query all data is **/v1/schools**. We chose to build our report in the following parts of school :

- general
- cost
- admissions 
- demographic
- financial 
- earnings 

# Methodology
We first take the user inputs like year, API key, state for analysis, ordering of the numerical values by ascending or descending, number of rows to generate(maximum = 100), and locale. These user inputs are important to build the report. If the user leaves a certain value blank then the code takes a default value. The values are then passed to individual functions which generate the relevant data. Each function processes the data to factorize variables, create new variables and transform from wide format to long format. Once we have all the data  in place, we use this to generate an EDA(Exploratory Data Analysis) report. The report generates the most useful plots using these functions. 


# Findings 
The API was an interesting area to work on. We were able to extract information by each State and compare the different areas in terms of the Ownership(Public, Private, or Proprietary). One of the states that is explored by the report in **North Carolina.** Here are some compelling observations : 

- There are more number of Public schools in NC. 
- Private Universities have a higher Admission Rate with higher In-State Tuition. However, the same is not observed for Public schools. 
- Schools with higher ACT scores imply higher SAT scores for NC schools. 
- NC schools have a higher count of white students in comparison to other ethnicities across Public and Private schools. 
- Private schools in NC have higher count of women students. 
- The poverty distribution of NC is bimodal. 
- Public schools have more mean poverty rate which is to be expected because of the lower tuition costs in comparison to private schools. 
- The tuition fees paid by students have no correlation with the mean earnings of students at the end of 10 years from entry-level. 
- Majority of the Public schools Require a Test Score for admission whereas majority of private schools neither require nor recommend it. 

# Key Takeaways 
The project helped in gaining an understanding of the Github process for collaboration and development. Exploring a new API is always a difficult task given how each API behaves differently. Data manipulation is a critical step of data science where the majority chunk of one's time is spent in understanding, cleaning, and transforming the data. Majority of the time, the API returned tables that were not fit for consumption. It was important to then understand the kind of manipulation and transformation tasks to perform on the data to make the process of visualization easier and sensible. One of the major roadblocks was that my teammate had difficulty in integrating RStudio with Github. This required her to manually push all the changes to Github which was messy and slowed down the process. 

What we would do differently next time would be to choose how we want to organize the report beforehand so that we can structure the report in a more organized manner. 

Links for blog:
## [View my Project 2 github pages repo here](https://rhencher.github.io/ST558-Project2/)
## [View my Project 2 regular repo here](https://github.com/rhencher/ST558-Project2)

