# Reproducible research: version control and R

\# INSERT ANSWERS HERE #


<b>Questions 1-3</b> are in my [logistic_growth repo](https://github.com/S1ZG/logistic_growth).

<b>Question 4</b>

<b>a)</b> 
The random_walk script produces paths of two random walks. We observe that each walk starts from the coordinates (0,0) and takes place over a time frame from 0 to 500. Both plots of the walks use the same function and inputs but as they are random, they generate diffeent results and there is no link between the two walks. There is no determined coordinate for where the walk ends at time 500, this is random too. The displacement from the start point (0,0) can be in any direction. Many of the walks have overlaps in the route taken. 


<b>b)</b> 
<b>Random seeds</b>: Used to generate random numbers but in a reproducible way. Instead of new random numbers being generated each time in a random number generator, the random seed makes it so the same random numbers are generated again. The output of this is a pseudorandom number. This way the same random numbers can be used multiple times which is important for sharing work.


<b>c)</b>
File is [random_walk.R](https://github.com/S1ZG/reproducible-research_homework/blob/main/question-4-code/random_walk.R) in the question-4-code folder in the repo.

<b>d)</b>
![](https://github.com/S1ZG/reproducible-research_homework/blob/main/Q4D.png)



<b>Question 5</b>

<b>a)</b>
There are 33 rows and 13 columns

<b>b)</b>
It is best to log transform this equation as it allows us to fit a linear equation:
**$` log(V) = βlog(L) + log(α)`$**
To do this I log transformed Viron Volume and Genome Length.


<b>c)</b>

![](https://github.com/S1ZG/reproducible-research_homework/blob/main/Q5C.png)

This tells us that:

- $`α`$ = 1.5152.
- $`ln⁡(β)`$ = 7.0748 . As it was log transformed,  $`β = e^{7.0748} = 1181.8`$

We know they are statistically significant as both have P values < 0.001. They also match the values from Table 2 in the paper which had $`α = 1.52`$ and $`β = 1182`$.

<b>d)</b>
``` {r}
   #Replicating the graph
   ggplot(data = log_ds_data, aes(x = log_GenomeLength, y = log_VironVol)) +
     geom_point() +
     geom_smooth(method = "lm") + 
     labs(x = "Log [Genome Length (kb)]", y = "Log [Viron Volume(nm³)]")
```

(Also shown in my [Q5 code](https://github.com/S1ZG/reproducible-research_homework/blob/main/question5.R))

</p>

<b>e)</b>
To estimate the volume, $`V`$, of a 300 kb dsDNA virus we substitute these values into our linear equation from before, $`ln(V)=ln(β)+αln⁡(L)`$. 

This would be $`ln(V) = 7.0748 + (1.5152)(ln(300))`$

And so $`V`$ = 6697007nm³ when genome length is 300kb




## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points. First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers (also make sure that your username has been anonymised). All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   a) A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points) \
   b) Investigate the term **random seeds**. What is a random seed and how does it work? (5 points) \
   c) Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points) \
   d) Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points) 

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \alpha L^{\beta}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   a) Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)\
   b) What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points) \
   c) Find the exponent ($\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points) \
   d) Write the code to reproduce the figure shown below. (10 points) 

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  e) What is the estimated volume of a 300 kb dsDNA virus? (4 points) 
