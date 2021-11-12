
#%% Analise Brasil

library(tidyverse)
library(readr)

Centil_RB2_mais <- read_csv("Centil_RB2_mais.csv",
                       skip=0,
                       col_names = TRUE)

Centil_RB2_mais_BR <- Centil_RB2_mais %>% 
  filter(Local == "Brasil")

#%% explorando dados

#%% renda ----

#%% grafico linhas, centil 100
#%% renda total (2006-2020)
#%% renda total bruta (2006-2020)

#%% grafico barras empilhadas, centil 100
#%% formas de renda (cor), uma barra pra cada ano

#%% mesmo grafico anterior, em porcentagem

#%% grafico area empilhada, centil 100
#%% Renda total brasil (2006-2020)
#%% Renda tributavel brasil (2006-2020)

#%% grafico area empilhada, centil 100
#%% renda tributavel (2006-2020)
#%% imposto devido (2006-2020)

#%% valores das deducoes

#%% desigualdade ----

#%% renda tributavel/renda total

#%% imposto devido/renda tributavel

#%% imposto 

#%% indice de gini, grafico linhas

#%% riqueza ----


