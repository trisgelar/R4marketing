# R4marketing
Belajar R untuk Marketing dari buku Practical R for Marketing Students

## Tips & Trick RStudio

### Package Manager Packrat
```bash
  packrat::init(options = list(vcs.ignore.src = TRUE))
  Initializing packrat project in directory:
  - "E:/RProjects/R4CommBook"
  
  Adding these packages to packrat:
              _      
      packrat   0.5.0
  
  Fetching sources for packrat (0.5.0) ... OK (CRAN current)
  Snapshot written to "E:/RProjects/R4CommBook/packrat/packrat.lock"
  Installing packrat (0.5.0) ... 
  	OK (downloaded binary)
  Initialization complete!
  
  Restarting R session...
  
  
  packrat::status()
  packrat::snapshot()
  packrat::restore()
  
  packrat::bundle()
  packrat::unbundle()
  
  # packrat::set_opts(external.packages = c("devtools", "knitr"))
  # packrat::set_opts(local.repos = c("~/projects/R"))
  # packrat::opts$external.packages()
  # packrat::opts$external.packages(c("devtools", "knitr"))

```

### Library R yang digunakan dalam buku ini
```sh
  install.packages("pacman")
  
  # bab 1
  pacman::p_load("tidyverse")
  
  # bab 2
  pacman::p_load("Hmisc")
  
```


### Data yang digunakan dalam buku ini

1. [Airbnb_survey](http://users.telenet.be/samuelfranssens/tutorial_data/tomslee_airbnb_belgium_1454_2017-07-14.csv)


