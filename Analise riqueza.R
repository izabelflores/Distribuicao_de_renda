
#---- Analise centil (riqueza) ----#

library(readr)
library(tidyverse)

#---- Importar RB2

#---- bens e direitos 2020/2006

#distribuição por centil em 2020

g20 <- ggplot(Centil_RB2 %>% 
                filter(Local == "Brasil", Ano == 2020))+
  geom_col(aes(Centil, Bens_e_Direitos))

g06 <- ggplot(Centil_RB2 %>% 
                filter(Local == "Brasil", Ano == 2006))+
  geom_col(aes(Centil, Bens_e_Direitos))

# forte concentração no topo

#--- zoom

g20 + coord_cartesian(ylim = c(0,200000), xlim = c(1, 95))

g06 + coord_cartesian(ylim = c(0,50000), xlim = c(1, 95))

# aumento da riqueza entre os 25 mais pobres durante o período

# formato da riqueza:

c <- Centil_RB2_BR %>% 
  filter(Local == "Brasil", Ano == 2020) %>% 
  select(Centil, Imoveis:Outros_Bens_e_Direitos) %>% 
  pivot_longer(Imoveis:Outros_Bens_e_Direitos,
               "Forma  de Riqueza")

ggplot(Centil_RB2_BR %>% 
                filter(Local == "Brasil", Ano == 2020) %>% 
                select(Centil, Imoveis:Outros_Bens_e_Direitos) %>% 
                pivot_longer(Imoveis:Outros_Bens_e_Direitos,
                             "Forma_de_Riqueza"))+
  geom_col(aes(Centil, value, fill = Forma_de_Riqueza))+
  coord_cartesian(ylim = c(0,100000), xlim = c(1, 50))
  
ggplot(Centil_RB2_BR %>% 
         filter(Local == "Brasil", Ano == 2006) %>% 
         select(Centil, Imoveis:Outros_Bens_e_Direitos) %>% 
         pivot_longer(Imoveis:Outros_Bens_e_Direitos,
                      "Forma_de_Riqueza"))+
  geom_col(aes(Centil, value, fill = Forma_de_Riqueza))+
  coord_cartesian(ylim = c(0,15000), xlim = c(1, 50))

# em termos percentuais

ggplot() + geom_col(data = Centil_RB2_BR %>% 
                      filter(Local == "Brasil", Ano == 2006) %>% 
                      select(Centil, Imoveis:Outros_Bens_e_Direitos) %>% 
                      pivot_longer(Imoveis:Outros_Bens_e_Direitos,
                                   "Forma_de_Riqueza"), 
                    aes(x = Centil, y = value, fill = Forma_de_Riqueza), 
                    position = "fill")+
  coord_cartesian(xlim = c(1, 100))

ggplot() + geom_col(data = Centil_RB2_BR %>% 
                      filter(Local == "Brasil", Ano == 2020) %>% 
                      select(Centil, Imoveis:Outros_Bens_e_Direitos) %>% 
                      pivot_longer(Imoveis:Outros_Bens_e_Direitos,
                                   "Forma_de_Riqueza"), 
                    aes(x = Centil, y = value, fill = Forma_de_Riqueza), 
                    position = "fill")+
  coord_cartesian(xlim = c(1, 100))


#---- mais ricos


ggplot() + geom_col(data = Centil_RB2_BR %>% 
                      filter(Local == "Brasil", Ano == 2006) %>% 
                      select(Centil, Imoveis:Outros_Bens_e_Direitos) %>% 
                      pivot_longer(Imoveis:Outros_Bens_e_Direitos,
                                   "Forma_de_Riqueza"), 
                    aes(x = Centil, y = value, fill = Forma_de_Riqueza), 
                    position = "fill")+
  coord_cartesian(xlim = c(80, 100))


ggplot() + geom_col(data = Centil_RB2_BR %>% 
                      filter(Local == "Brasil", Ano == 2020) %>% 
                      select(Centil, Imoveis:Outros_Bens_e_Direitos) %>% 
                      pivot_longer(Imoveis:Outros_Bens_e_Direitos,
                                   "Forma_de_Riqueza"), 
                    aes(x = Centil, y = value, fill = Forma_de_Riqueza), 
                    position = "fill")+
  coord_cartesian(xlim = c(80, 100))
