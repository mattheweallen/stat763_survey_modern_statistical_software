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


#Exercises page 12
#Ex1 
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy), color = "blue"
  )

#Ex2
?mpg
mpg

#Ex3
#continuous variable
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = cty))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = cty))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = cty))

#categorical variable
#continuous variable
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = trans))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = trans))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = trans))

#ex4 map same variable to different aesthetics
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty, size = cty))

#ex5 stroke
?geom_point

#ex6
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

##facets
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2 )

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

#ex1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cty)

#ex2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl))
  
#ex3
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

#ex4
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2 )

?facet_wrap
