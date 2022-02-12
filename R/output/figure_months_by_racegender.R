# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(total_months_inc = mean(total_months_inc)) %>%
  ggplot(aes(race, total_months_inc, fill = gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(
      x = "Race", 
      y = "Mean Months", 
      fill = "Gender",
      title = "Mean Number of Months Incarcerated in 2002 by Race and Gender") +
    theme_minimal() +
    scale_fill_economist()

ggsave(here("figures/arrests_by_racegender.png"), width=8, height=4.5)
