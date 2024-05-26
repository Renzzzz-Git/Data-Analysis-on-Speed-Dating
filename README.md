I. Introduction

Dataset Link: https://www.kaggle.com/datasets/mexwell/speed-dating

We will be using the Speed Dating dataset from kaggle. In the dataset, we can see the fields which are 
gender, age, income, goal, career, dec, attr, sinc, intel, fun, amb, shar, like, prob, met. According to the source of the dataset the meaning of the fields are as follows:

The first five columns are demographic - we may want to use them to look at subgroups later.
The next seven columns are important. dec is the raters decision on whether this individual was a match and then follows scores out of ten on six characteristics: attractiveness, sincerity, intelligence, fun, ambitiousness and shared interests. 
The like column is an overall rating. The prob column is a rating on whether the rater believed that interest would be reciprocated and the final column is a binary on whether the two had met prior to the speed date, with the lower value indicating that they had met before. 
Further Explanation: Listed below are the meaning for the data in each field.
Gender: 0 = Female, 1 = Male
Goal: 
What is your primary goal in participating in this event?
Seemed like a fun night out=1
To meet new people=2
To get a date=3
Looking for a serious relationship=4
To say I did it=5
Other=6 

Dec (decision on whether this individual was a match): 1 = Match, 0 = Not a match

attr, sinc, int, fun, amb, shar: attractiveness, sincerity, intelligence, fun, ambitiousness and shared interests rating scores out of ten

Like: Overall rating
Prob: Rating on whether the rater believed that interest would be reciprocated.
Met: Did the two had met prior to the speed date. 2 = Did not meet, 1 = Met before
