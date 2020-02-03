# Meeting Notes January 31st 2020

* This is a CO_2 mitigation project

* We want to compare the enzyme activity between the enzyme of interest and the control
  + Are we able to account for:
    - Uncontrollable variables, such as daily air pressure
    - Measurement Error – Pipettes, Operator, Machine
    - Are the results from one side of the plate different from the other side?
  + Want to be able to use this assay for other enzymes
  
* The machine can analyze on 96-well plate in about 30 minutes
  + Lots of Datasets
    - "We don't know how much data you need"
    - How many significant digits in activity do we need? 
    - Are we allowed to reject any data points (outliers)?
    - Is the error spatial?
    - How many control columns do we need?
    
* "Data Mining"
  + Exporting information to excel currently
    - Timestamp is currently being calculated as the first time below .2 minus the first timestamp minus the injection time.
    - Is .2 the best choice, or is there a better cutoff to use?
    - There is currently no way to tell the machine what samples it's analyzing, you have to do this manually.
    
* Other questions/notes
  + Variance between control samples larger than variance between enzymes samples; is this okay?
  + Open to how to arrange the specimens
  + Open to any techniques that could help
  
  
# Thoughts
|------------------------|---------------:|
| **Experimental Units** |                |
| **Response**           |                |
| **Trt Factors**        | **Trt Levels** |
|                        |                |
|                        |                |
|                        |                |
|                        |                |
|                        |                |


* If we want to account for uncontrollable factors that happen each day then we could treat each day as a random block perhaps?
  + Multiple experiments can be run on each day so should we could give each experiment it's own random effect.
  + Measurement error may be trickier.
    - We could also include an operator effect
    - SIMEX? Not sure if this would actually be useful
  + Is it really necessary to compare results from one side of the plate to the other side? What would this look like?
  + I think that they could use this model for other enzymes as well as long as they don't have to change the process or change the factors/levels.
  
* They should give us all the data, assuming it was all collected the same way? But if they worked with consulting before they should have been given a hard number of times to run the experiment to achieve a certain power; this worries me.

* Why not use all the digits in are analysis and for the report we can just truncate them to a certain number? (Unless the digits are causing their files to take up to much space on their machine)

* Not sure about rejecting any data points, why do they think they need to; did they see something?

* The control column for each sample column still confuses me. 

* Data mining  
  + We can help them with the automation of getting the data in the right form; it already seems like they've done a good job.
  + They should set the cutoff for the timestamp since they are the domain experts. If we were to search the data for the "best" cutoff I think this would lead to a self fulfilling prophecy? What is best, do they just mean most significant?
  + Someone will always have to tell the machine what sample is in there.
    - We could make a drop down that would populate a prespecified template if they have a few combinations they usually test.
    
* Other questions  
  + If the variance for the enzyme is lower than the control than maybe the enzyme already shows it has more consistent results. I don't think this is a big problem in the grand scheme of things.
  + "Don't tell them to redesign their experiment"
    - I'm torn because if we just tell them to try something else and they can't finish it by the end of the semester then the next consulting class may get this project again and it will be an endless cycle. Maybe there are some things we can do, but maybe we should just analyze what they have.