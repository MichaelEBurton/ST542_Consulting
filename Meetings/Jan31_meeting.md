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
  