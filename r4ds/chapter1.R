library(tidyverse)
mpg
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ,y=hwy))
ggplot(data = mpg)
mtcars
nrow(mtcars)
ncol(mtcars)
?mpg
ggplot(data = mpg) +
  geom_point(mapping = aes(x=cyl,y=hwy))
ggplot(data = mpg) +
  geom_point(mapping = aes(x=drv,y=class))
