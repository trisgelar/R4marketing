topten <- c("Brussel","Antwerpen","Gent","Charleroi","Liege","Brugge","Namur","Leuven","Mons","Aalst")
airbnb <- read_csv("data/tomslee_airbnb_belgium_1454_2017-07-14.csv") %>% 
  mutate(room_id_F = factor(room_id), host_id_F = factor(host_id),
         overall_satisfaction_100 = overall_satisfaction * 20) %>% 
  select(-country, -survey_id) %>% 
  rename(country = city, city = borough) 
  # %>% filter(city %in% topten)

airbnb_summary_by_nr <- airbnb %>% 
  group_by(city) %>% 
  summarise(nr_per_city = n(), average_price = mean(price)) %>% 
  arrange(desc(nr_per_city))

airbnb.summary <- airbnb %>% 
  group_by(city) %>% 
  summarise(nr_per_city = n(), average_price = mean(price)) %>% 
  arrange(desc(average_price))

print(airbnb.summary, n = Inf)

write_excel_csv(airbnb, "export/airbnb.csv")
write_excel_csv(airbnb.summary, "export/airbnb_summary.csv")

airbnb.topten <- airbnb %>% 
  filter(city %in% c("Brussel","Antwerpen","Gent","Charleroi","Liege","Brugge","Namur","Leuven","Mons","Aalst"))

ggplot(data = airbnb.topten, mapping = aes(x = city, y = price)) + 
  geom_point()

ggplot(data = airbnb.topten, mapping = aes(x = city, y = price)) + 
  geom_jitter()

ggplot(data = airbnb.topten, mapping = aes(x = price)) + 
  geom_histogram()

ggplot(data = airbnb.topten, mapping = aes(x = city, y = log(price, base=exp(1)))) + 
  geom_jitter()

ggplot(data = airbnb.topten, mapping = aes(x = city, y = price)) + 
  geom_jitter() +
  stat_summary(fun.y=median, colour="tomato3", size = 4, geom="point")


ggplot(data = airbnb.topten, mapping = aes(x = city, y = log(price, base = exp(1)))) + 
  geom_jitter() +
  stat_summary(fun.y=median, colour="tomato3", size = 4, geom="point")

ggplot(data = airbnb.topten, mapping = aes(x = city, y = log(price, base = exp(1)))) + 
  geom_jitter() +
  stat_summary(fun.y=median, colour="tomato3", size = 4, geom="point") +
  stat_summary(fun.y=mean,   colour="green",   size = 4, geom="point", shape = 23, fill = "green")

png("dp/price_per_city.png", width=800, height=600)

ggplot(data = airbnb.topten, mapping = aes(x = city, log(price, base = exp(1)))) + 
  geom_jitter() +
  stat_summary(fun.y=mean, colour="green", size = 4, geom="point", shape = 23, fill = "green")

dev.off()
# airbnb <- read_csv("data/tomslee_airbnb_belgium_1454_2017-07-14.csv")
# 
# print(airbnb, n = 25, width = 100)
# 
# airbnb$room_id_F <- factor(airbnb$room_id)
# airbnb$host_id_F <- factor(airbnb$host_id)
# 
# head(airbnb$overall_satisfaction)
# airbnb$overall_satisfaction_100 <- airbnb$overall_satisfaction * 20
# 
# airbnb <- mutate(airbnb,
#                  room_id_F = factor(room_id),
#                  host_id_F = factor(host_id),
#                  overall_statisfaction_100 = overall_satisfaction * 20
#                  )
# 
# print(airbnb, n = 25, width = 100)
# 
# airbnb <- select(airbnb, -country, -survey_id) 
# airbnb <- rename(airbnb, country = city, city = borough) 
# 
# topten <- c("Brussel","Antwerpen","Gent","Charleroi","Liege","Brugge","Namur","Leuven","Mons","Aalst")
# topten
# 
# airbnb.topten <- filter(airbnb, city %in% topten)


# airbnb <- read_csv("tomslee_airbnb_belgium_1454_2017-07-14.csv")
# airbnb <- mutate(airbnb, room_id_F = factor(room_id), host_id_F = factor(host_id), overall_satisfaction_100 = overall_satisfaction * 20)
# airbnb <- select(airbnb, -country, -survey_id)
# airbnb <- rename(airbnb, country = city, city = borough)
# airbnb <- filter(airbnb, city %in% c("Brussel","Antwerpen","Gent","Charleroi","Liege","Brugge","Namur","Leuven","Mons","Aalst"))