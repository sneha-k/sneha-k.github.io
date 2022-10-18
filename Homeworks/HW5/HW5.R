library(tidyverse)

#1. 
data <- read_table("crabs.txt", col_names = TRUE) %>% 
  select(c(color, spine, width, satell, weight, y))
  
factor_cols <- c("color", "spine", "y")
data[factor_cols] <- lapply(data[factor_cols], factor)

levels(data$color) <- c("2" = "light",
                        "3" = "medium",
                        "4" = "dark",
                        "5" = "darker")

levels(data$spine) <- c("1" = "Both Good",
                        "2" = "One Worn/Broken",
                        "3" = "Both Worn/Broken")

levels(data$y) <- recode(data$y,
                         "0" = "At least 1 Sattelite",
                         "1" = "No Sattelite")

data

#2. 
table(data$y, data$spine)

#3. 
tb <- table(data$color, data$spine, data$y)
str(tb)
tb[4, ,]

#4. 
ggplot(data = data, aes(x = color, fill = y)) +
  geom_bar(position = position_dodge(), width = 0.85) + 
  labs(x = "Female Crab Color") +
  theme(legend.title = element_blank()) +
  coord_flip()

ggplot(data = data, aes(x = spine, fill = y)) +
  geom_bar(position = position_dodge(), width = 0.85) + 
  labs(x = "Female Crab Spine Condition") +
  theme(legend.title = element_blank()) +
  coord_flip()

ggplot(data = data, aes(x = spine, fill = color)) +
  geom_bar(position = position_dodge(), width = 0.85) + 
  labs(x = "Female Crab Spine Condition") +
  theme(legend.title = element_blank()) +
  coord_flip()

#5. 
labels()
ggplot(data = data, aes(x = color, fill = y)) +
  geom_bar(position = position_dodge(), width = 0.85) + 
  facet_wrap(vars(spine), labeller = label_both) +
  labs(x = "Female Crab Spine Condition") +
  theme(legend.title = element_blank(), 
        axis.text.x = element_text(angle = 45))

#6. 
data %>% 
  group_by(color, y) %>% 
  summarise(Avg = mean(weight), Sd = sd(weight), Median = median(weight), IRQ = IQR(weight))

#7. 
ggplot(data = data, aes(x = y, y = weight)) + 
  geom_boxplot() +
  geom_jitter(aes(colour = y)) + 
  labs(title = "Boxplot for Weight")

ggplot(data = data, aes(x = y, y = width)) + 
  geom_boxplot() +
  geom_jitter(aes(colour = y)) +
  labs(title = "Boxplot for Width")

# 8. 
cor(data$weight, data$width)

ggplot(data = data, aes(x = weight, y = width, colour = color)) + 
  geom_point(aes(shape = y)) +
  geom_smooth(method = lm, col = "Blue") +
  labs(title = "Weight vs Width")
