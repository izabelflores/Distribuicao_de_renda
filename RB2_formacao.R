
#%% RB2

library(tidyverse)
library(readr)

Centil_RB2 <- read_csv("Centil_RB2.csv",
                   skip=0,
                   col_names = TRUE)

Centil_RB2_2 <- Centil_RB2 %>% 
  mutate(Renda_Total =
           Soma_da_Renda_do_Centil +
           Outros_Rendimentos_Isentos,
         
         Renda_Tributabel_Bruta = 
           Soma_da_Renda_do_Centil -
           Rendim_Socio_Titular_ME_EPP_Opt_SIMPLES -
           Lucros_e_dividendos -
           Rendim_Suj_a_Tribut_Exclusiva) %>% 
  
  group_by(Ano) %>% # criando variavel de renda acumulada
  group_by(Local) %>% 
  mutate(Renda_Total_ACM = cumsum(Renda_Total), 
         Renda_Tributabel_Bruta_ACM = cumsum(Renda_Tributabel_Bruta),
         Rendimentos_Isentos_ACM = cumsum(Rendimentos_Isentos))                             

#%% ordenando data

Centil_RB2_3 <- Centil_RB2_2 %>% 
  select(-X1)

Centil_RB2_3 <- Centil_RB2_3 %>% 
  select(Ano, Local, Tipo_de_renda, Nivel, Centil, # keys
         
         Quantidade_de_Contribuintes, 
         Quantidade_de_Contribuintes_ACM,
         
         # rendas
         `Limite_superior_de Renda_do_Centil`,
         Soma_da_Renda_do_Centil,
         Soma_da_Renda_do_Centil_ACM,
         Renda_Acumulada_do_Centil, # ver igualdade
         Media_da_Renda_do_Centil, # fazer acumulado
         
         # tributacao exclusiva
         Rendim_Suj_a_Tribut_Exclusiva, 
         Rendim_Suj_a_Tribut_Exclusiva_ACM,
         
         # rendas isentas 
         Rendimentos_Isentos, 
         Rendimentos_Isentos_ACM,
         Lucros_e_dividendos, 
         Lucros_e_dividendos_ACM, 
         Rendim_Socio_Titular_ME_EPP_Opt_SIMPLES,
         Rendim_Socio_Titular_ME_EPP_Opt_SIMPLES_ACM,
         Outros_Rendimentos_Isentos,
         Outros_Rendimentos_Isentos_ACM,
         
         # rendas calculadas
         Renda_Total, 
         Renda_Total_ACM, 
         Renda_Tributabel_Bruta,
         Renda_Tributabel_Bruta_ACM, 
         
         
         # despesas dedutiveis
         Despesas_Dedutiveis,
         Previdencia, 
         Dependentes, 
         Instrucao, 
         Medicas, 
         Pensao_Alimenticia,
         Livro_Caixa, 
         
         # imposto
         Imposto_Devido, 
         
         # bens e direitos
         Bens_e_Direitos, 
         Imoveis, Moveis, Financeiros, 
         Outros_Bens_e_Direitos, Dividas_e_Onus,
         )

# obs: fazer outros acumulados e pesquisar o que sao os impostos devidos