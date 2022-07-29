#Please run the following code and observe how the parameters are used in the resulting figure. Then perform the steps
#in the following bullet points. Notice that we are getting the data frame, Cars93, from MASS module. So, we're not
#reading a dataset for this question.

cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = FALSE, method = "loess", formula = y ~ x, color = "#0072B2") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")



#(a) Use "lm", "glm", "gam" methods in the geom_smooth() function to create three figures.
#(b) Set the se parameter to TRUE to show the standard error (shaded area around the fitted line)
#(c) For every method above change the color of the line with the following color codes: #8fe388, #fe8d6d, #7c6bea
#d) Please search for the method to add a title to your ggplot figure and add titles for each figure to indicate the
#method that you used for smoothing.
#(e) Please search for the theme() function for ggplot and change the font size of the titles to 14 and match their
#colors with the line colors you used above.


setwd('C:/Users/logan/Desktop/Summer2022/DataVisualization/DATA')

cars93_lm <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "lm", formula = y ~ x, color = "#8fe388") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  ggtitle("lm method") + theme(plot.title = element_text(color="#8fe388", size=14)) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")


cars93_glm <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "glm", formula = y ~ x, color = "#fe8d6d") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  ggtitle("glm method") + theme(plot.title = element_text(color="#fe8d6d", size=14)) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")


cars93_gam <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "gam", formula = y ~ x, color = "#7c6bea") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  ggtitle("gam method") + theme(plot.title = element_text(color="#7c6bea", size=14)) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")
 







