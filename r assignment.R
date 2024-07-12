library(ggplot2)
library(dplyr)
library(lubridate)
library(reshape2)

# Set seed for reproducibility
set.seed(123)

# Create sample dataset
n <- 1000
data <- data.frame(
  user_id = 1:n,
  subscription_type = sample(c("Basic", "Standard", "Premium"), n, replace = TRUE),
  start_date = sample(seq(as.Date('2020/01/01'), as.Date('2022/12/31'), by="day"), n, replace = TRUE),
  end_date = sample(seq(as.Date('2023/01/01'), as.Date('2025/12/31'), by="day"), n, replace = TRUE),
  age = sample(18:70, n, replace = TRUE),
  gender = sample(c("Male", "Female", "Other"), n, replace = TRUE),
  monthly_fee = sample(c(10, 20, 30), n, replace = TRUE),
  country = sample(c("USA", "Canada", "UK", "Australia", "India"), n, replace = TRUE)
)

# Convert dates to Date type
data$start_date <- as.Date(data$start_date)
data$end_date <- as.Date(data$end_date)

# Display the first few rows of the dataset
head(data)

# 1. Bar Chart - Subscription Type distribution
ggplot(data, aes(x = subscription_type)) +
  geom_bar(fill = "skyblue") +
  theme_minimal() +
  labs(title = "Subscription Type Distribution", x = "Subscription Type", y = "Count")

# 2. Histogram - Age distribution
ggplot(data, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "orange", color = "black") +
  theme_minimal() +
  labs(title = "Age Distribution", x = "Age", y = "Count")

# 3. Box Plot - Monthly Fee by Subscription Type
ggplot(data, aes(x = subscription_type, y = monthly_fee, fill = subscription_type)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Monthly Fee by Subscription Type", x = "Subscription Type", y = "Monthly Fee")

# 4. Scatter Plot - Age vs Monthly Fee by Gender
ggplot(data, aes(x = age, y = monthly_fee, color = gender)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Age vs Monthly Fee by Gender", x = "Age", y = "Monthly Fee")

# 5. Line Chart - Number of Subscriptions Over Time
subscriptions_over_time <- data %>%
  group_by(start_date) %>%
  summarize(count = n())

ggplot(subscriptions_over_time, aes(x = start_date, y = count)) +
  geom_line(color = "blue") +
  theme_minimal() +
  labs(title = "Number of Subscriptions Over Time", x = "Start Date", y = "Number of Subscriptions")

# 6. Density Plot - Monthly Fee
ggplot(data, aes(x = monthly_fee)) +
  geom_density(fill = "purple", alpha = 0.5) +
  theme_minimal() +
  labs(title = "Density Plot of Monthly Fee", x = "Monthly Fee", y = "Density")

