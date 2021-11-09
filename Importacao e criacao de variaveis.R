#%% Distribuição de renda por percentil

library(readxl)
library(tidyverse)
options(scipen=999)

#%% Importar

Centil <- read_csv("centis_2006_2020.csv",
                    skip=0,
                    col_names = TRUE)

#%% Criando variaveis

Centil2 <- Centil %>% mutate(Rendimentos_Isentos = Lucros_e_dividendos +
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

#%% coluna de centil

Centil2 <- Centil2 %>% 
  mutate(Centil_2 = Centil_2*0.1 + 99,
         Centil_3 = Centil_3*0.01 + 99.9,
         
         Nível = if_else(!is.na(Centil_1), "Centil", 
                         if_else(!is.na(Centil_2), "Centesimo superior",
                                 "Milésimo Superior"))
  ) %>% 
  mutate(Centil = rowSums(.[5:7], na.rm = TRUE))

Centil2 <- Centil2 %>% 
  dplyr::select( -(Centil_1:Centil_3)) %>% 
  dplyr::select(Ano, Local, Tipo_de_renda, Nível, Centil, everything()) %>% 
  dplyr::select(-`X1`)

#%% Variaveis acumuladas

Centil2 <- Centil2 %>% 
  group_by(Local, Ano, Tipo_de_renda) %>% 
  mutate(Quantidade_de_Contribuintes_ACM = cumsum(Quantidade_de_Contribuintes),
         Soma_da_Renda_do_Centil_ACM = cumsum(Soma_da_Renda_do_Centil),
         Rendim_Suj_a_Tribut_Exclusiva_ACM = cumsum(Rendim_Suj_a_Tribut_Exclusiva),
         Lucros_e_dividendos_ACM = cumsum(Lucros_e_dividendos),
         Rendim_Socio_Titular_ME_EPP_Opt_SIMPLES_ACM = cumsum(Rendim_Socio_Titular_ME_EPP_Opt_SIMPLES),
         Outros_Rendimentos_Isentos_ACM = cumsum(Outros_Rendimentos_Isentos)
         )

#%% Dividir para exportar

Centil_RTB <- Centil %>% filter(Tipo_de_renda == "RTB")
Centil_RB1 <- Centil %>% filter(Tipo_de_renda == "RB1")
Centil_RB2 <- Centil %>% filter(Tipo_de_renda == "RB2")

#%% salvando em CSV

write.csv(Centil_RTB, "C:/Users/izabe/Desktop/Github/Distribuicao_de_renda/Centil_RTB.csv")
write.csv(Centil_RB1, "C:/Users/izabe/Desktop/Github/Distribuicao_de_renda/Centil_RB1.csv")
write.csv(Centil_RB2, "C:/Users/izabe/Desktop/Github/Distribuicao_de_renda/Centil_RB2.csv")


