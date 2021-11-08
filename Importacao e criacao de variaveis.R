#%% Distribuição de renda por percentil

library(readxl)
library(tidyverse)
options(scipen=999)

# Importar

Centil <- read_xlsx("C:/Users/izabe/Desktop/centis_2013_2020.xlsx",
                    sheet = "centil",
                    skip=0,
                    col_names = TRUE)

#%% Criando variaveis

Centil <- Centil %>% mutate(Rendimentos_Isentos = Lucros_e_dividendos +
                              Rendim_Socio_Titular_ME_EPP_Opt_SIMPLES +
                              Outros_Rendimentos_Isentos,
                            
                            Despesas_Dedutiveis = Previdencia +
                              Dependentes +
                              Instrucao + 
                              Medicas + 
                              Pensao_Alimenticia +
                              Livro_Caixa,
                            
                            Bens_e_Direitos = Imoveis +
                              Moveis + 
                              Financeiros +
                              Outros_Bens_e_Direitos) 
