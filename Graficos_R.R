
####################################################################################################
#######                     GRAFICOS ADICIONALES CON ggplot2

####################################################################################################

install.packages("ggcorrplot")
library(ggcorrplot)

# Gráficos de Barras (Barplot)
head(mtcars)
ggplot(data = mtcars, aes(x = gear)) + geom_bar()


#el total de autos en el dataset agrupados por la cantidad de "cambios o velocidades" (columna 'gear')

ggplot(data = mtcars, aes(x = gear)) +
  geom_bar() +
  xlab("Número de Velocidades") +
  ylab("Cantidades") +
  ggtitle("Gráfico de Barras")

ggplot(data = mtcars, aes(x = gear)) +
  geom_bar(color = 'darkslategray', fill = 'steelblue') +
  xlab("Número de Velocidades") +
  ylab("Cantidades") +
  ggtitle("Gráfico de Barras")

ggplot(data = mtcars, aes(x = gear)) +
  geom_bar(color = 'darkslategray', fill = 'steelblue') +
  xlab("Número de Velocidades") +
  ylab("Cantidades") +
  ggtitle("Gráfico de Barras") +
  coord_flip()


ggplot(data = mtcars, aes(x = gear, fill = as.factor(gear))) +
  geom_bar() +
  xlab("Número de Velocidades") +
  ylab("Cantidades") +
  ggtitle("Gráfico de Barras") +
  labs(fill = "Velocidades")


ggplot(data = mtcars, aes(x = gear, fill = as.factor(gear))) +
  geom_bar() +
  xlab("Número de Velocidades") +
  ylab("Cantidades") +
  ggtitle("Gráfico de Barras") +
  labs(fill = "Velocidades") +
  theme_minimal()

#Histograma (Histogram) y Gráfico de Densidad (Density Plot)

head(diamonds)
ggplot(diamonds) +
  geom_histogram(binwidth = 0.1, aes(x = carat), fill = 'steelblue') +
  xlab("Carat") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable Carat") +
  theme_minimal()

ggplot(diamonds) +
  geom_histogram(bins = 50, aes(x = carat, fill = cut)) +
  xlab("Carat") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable Carat") +
  theme_minimal()


ggplot(diamonds) +
  geom_histogram(bins = 50, aes(x = carat, fill = cut), color = 'black') +
  facet_grid(cut~., scales = 'free') +
  xlab("Carat") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable Carat para los distintos Cut") +
  theme_minimal()


# DENSIDAD KERNEL

ggplot(diamonds) +
  geom_density(aes(x = carat), fill = 'steelblue') +
  xlab("Carat") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable Carat (Densidad KERNEL)") +
  theme_minimal()

ggplot(diamonds) +
  geom_density(aes(x = carat, fill = clarity), position = 'stack') +
  facet_grid(clarity~., scales = 'free') +
  xlab("Carat") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable Carat (Densidad) según variable Clarity") +
  theme_minimal()

library(ggplot2)

## circular 

df<-data.frame(categorias=c("cat1","cat2","cat3","cat4"),
               porcentaje=c(25,20,15,40))


ggplot(df,aes(x="",y=porcentaje, fill=categorias))+
  geom_bar(stat = "identity",color="white")+
  coord_polar(theta="y")

ggplot(df,aes(x="",y=porcentaje, fill=categorias))+
  geom_bar(stat = "identity",
           color="white")+
  geom_text(aes(label=porcentaje/100),
            position=position_stack(vjust=0.5),color="white",size=6)+
  coord_polar(theta = "y")+
  scale_fill_manual(values=c("salmon","steelblue","orange","gray"))+
  theme_void()+
  labs(title="Gráfico de Pie")


ggplot(df,aes(x=2,y=porcentaje, fill=categorias))+
  geom_bar(stat = "identity",
           color="white")+
  geom_text(aes(label=porcentaje/100),
            position=position_stack(vjust=0.5),color="white",size=6)+
  coord_polar(theta = "y")+
  scale_fill_manual(values=c("salmon","steelblue","orange","gray"))+
  theme_void()+
  labs(title="Gráfico de Dona")+
  xlim(0.5,2.5)



###Gráfico de Dispersión (Scatterplot)

## el codigo es correcto, no se cuenta con el dataframe para ejecutar los graficos


ggplot(data = movies, aes(x = Audience.Ratings.., y = Rotten.Tomatoes.Ratings..)) + 
  geom_point() +
  xlab('Puntuación Audiencia') + 
  ylab('Puntuación de la Crítica') +
  ggtitle('Relación entre gusto de la Audiencia y la Crítica') + 
  theme_minimal()





ggplot(data = movies, aes(x = Audience.Ratings.., y = Rotten.Tomatoes.Ratings..)) + 
  geom_point(color = 'red', fill = 'red', size = 4, shape = 18, alpha = 0.5) +
  xlab('Puntuación de la Audiencia') + 
  ylab('Puntuación de la Crítica') +
  ggtitle('Relación entre gusto de la Audiencia y la Crítica') + 
  theme_minimal()





ggplot(data = movies, aes(x = Audience.Ratings.., y = Rotten.Tomatoes.Ratings..)) + 
  geom_point(color = 'slateblue', size = 2, alpha = 0.6) +
  geom_smooth(color = 'red') + 
  xlab('Puntuación Audiencia') + 
  ylab('Puntuación de la Crítica') +
  ggtitle('Relación entre gusto de la Audiencia y la Crítica') + 
  theme_minimal()


ggplot(data = movies, aes(x = Audience.Ratings.., y = Rotten.Tomatoes.Ratings..)) + 
  geom_point(aes(color = Genre), size = 2, alpha = 0.7) +
  xlab('Puntuación de la Audiencia') + 
  ylab('Puntuación de la Crítica') +
  ggtitle('Relación entre gusto de la Audiencia y la Crítica') + 
  theme_minimal()


plot <- ggplot(data = movies, aes(x = Audience.Ratings.., y = Rotten.Tomatoes.Ratings..)) + 
  geom_point(aes(color = Genre, size = Budget..million...), alpha = 0.7) +
  xlab('Puntuación de la Audiencia') + 
  ylab('Puntuación de la Crítica') +
  ggtitle('Relación entre gusto de la Audiencia y la Crítica') + 
  theme_minimal()
plot$labels$colour = "Genre"
plot$labels$size = "Budget"
plot




ggplot(data = movies, aes(x = Audience.Ratings.., y = Rotten.Tomatoes.Ratings..)) + 
  geom_point(aes(color = Genre), size = 2, alpha = 0.7) +
  geom_smooth(aes(color = Genre), fill = NA) +
  xlab('Puntuación de la Audiencia') + 
  ylab('Puntuación de la Crítica') +
  ggtitle('Relación entre gusto de la Audiencia y la Crítica') + 
  theme_minimal()


ggplot(data = movies, aes(x = Audience.Ratings.., y = Rotten.Tomatoes.Ratings..)) + 
  geom_point(aes(color = Genre), size = 1, alpha = 0.7) +
  geom_smooth(aes(color = Genre)) +
  facet_grid(Genre~., scales = 'free') +
  xlab('Puntuación de la Audiencia') + 
  ylab('Puntuación de la Crítica') +
  ggtitle('Relación entre gusto de la Audiencia y la Crítica') + 
  theme_minimal()


ggplot(data = movies, aes(x = Audience.Ratings.., y = Rotten.Tomatoes.Ratings..)) + 
  geom_point(aes(color = Genre), size = 1, alpha = 0.7) +
  geom_smooth(aes(color = Genre)) +
  facet_grid(Genre~Year.of.release, scales = 'free') +
  xlab('Puntuación de la Audiencia') + 
  ylab('Puntuación de la Crítica') +
  ggtitle('Relación entre gusto de la Audiencia y la Crítica') + 
  theme_minimal()



#### Gráfico de Cajas (Boxplot) y Gráfico de Violín (Violin plot)


## el codigo es correcto, no se cuenta con el dataframe para ejecutar los graficos


ggplot(data = movies, aes(x = Genre, y = Audience.Ratings..)) + 
  geom_point(aes(color = Genre), size = 1, alpha = 0.7) +
  xlab('Género') + 
  ylab('Puntuación de la Audiencia') +
  ggtitle('Puntuación de la Audiencia según el Género') + 
  theme_minimal()



ggplot(data = movies, aes(x = Genre, y = Audience.Ratings..)) + 
  geom_jitter(aes(color = Genre), size = 1, alpha = 0.7) +
  xlab('Género') + 
  ylab('Puntuación de la Audiencia') +
  ggtitle('Puntuación de la Audiencia según el Género') + 
  theme_minimal()

ggplot(data = movies, aes(x = Genre, y = Audience.Ratings..)) + 
  geom_jitter(aes(color = Genre), size = 1, alpha = 0.7) +
  geom_boxplot(aes(color = Genre), alpha = 0.7) + 
  xlab('Género') + 
  ylab('Puntuación de la Audiencia') +
  ggtitle('Puntuación de la Audiencia según el Género') + 
  theme_minimal()


ggplot(data = movies, aes(x = Genre, y = Audience.Ratings..)) + 
  geom_jitter(size = 1, color = 'gray', alpha = 0.5) +
  geom_violin(aes(fill = Genre), color = 'black', alpha = 0.8) +
  xlab('Género') + 
  ylab('Puntuación de la Audiencia') +
  ggtitle('Puntuación de la Audiencia según el Género') + 
  theme_minimal()



ggplot(data = movies, aes(x = Genre, y = Audience.Ratings..)) + 
  geom_jitter(size = 1, color = 'gray', alpha = 0.5) +
  geom_violin(aes(fill = Genre), color = 'black', alpha = 0.8) +
  geom_boxplot(color = 'black', alpha = 0.7) + 
  xlab('Género') + 
  ylab('Puntuación de la Audiencia') +
  ggtitle('Puntuación de la Audiencia según el Género') + 
  theme_minimal()


### Correlogramas (Correlogram)

##Para el conjunto de datos, que a efectos del ejemplo será el mtcars ya trabajado, antes de dibujar el correlograma hay que calcular la matriz de correlación, de modo que:

corr <- round(cor(mtcars), 1)
corr



ggcorrplot(corr) +
  ggtitle("Correlograma del conjunto mtcars") +
  theme_minimal()



ggcorrplot(corr, method = 'circle') +
  ggtitle("Correlograma del conjunto mtcars") +
  theme_minimal()

ggcorrplot(corr, method = 'circle', type = 'lower') +
  ggtitle("Correlograma del conjunto mtcars") +
  theme_minimal()

ggcorrplot(corr, method = 'circle', type = 'lower', lab = TRUE) +
  ggtitle("Correlograma del conjunto mtcars") +
  theme_minimal() +
  theme(legend.position="none")






