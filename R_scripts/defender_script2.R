# Load required libraries
library(dplyr)
library(ggplot2)
library(plotly)

# This script calculates per-90 stats, adjusts them for team possession,
# normalizes values using z-scores, creates composite and value-based scores,
# and visualizes the relationship between unweighted and weighted defensive contributions.

# Step 1: Per-90 normalization for selected raw count stats
cols_to_convert <- c("tackles", "tackles_won", "dribblers_tackled", "dribblers_challenged",
                     "unsuccessful_dribble_challenges", "blocks", "shots_blocked", "passes_blocked",
                     "interceptions", "tkl_plus_int", "clearances", "errors", "aerials_won",
                     "aerials_lost", "passes_att", "passes_cmp", "won_percent")

filtered_cb_specific_stats <- filtered_cb_specific_stats %>%
  mutate(across(all_of(cols_to_convert), ~ . / `90s_played`, .names = "{.col}_per90"))

# Step 2: Adjust those per-90 stats for team possession
defensive_cols <- c("tackles_per90",
                    "tackles_won_per90", 
                    "dribblers_tackled_per90",
                    "dribblers_challenged_per90",
                    "unsuccessful_dribble_challenges_per90",
                    "blocks_per90", 
                    "shots_blocked_per90",
                    "passes_blocked_per90",
                    "interceptions_per90",
                    "tkl_plus_int_per90",
                    "clearances_per90",
                    "errors_per90",
                    "aerials_won_per90",
                    "aerials_lost_per90",
                    "passes_att_per90",
                    "passes_cmp_per90",
                    "won_percent_per90")

filtered_cb_specific_stats <- filtered_cb_specific_stats %>%
  mutate(across(all_of(defensive_cols),
                ~ (. * 50) / (100 - team_possession_percentage),
                .names = "{.col}_adj"))

# Step 3: Standardize adjusted stats and some percentage metrics using z-scores
adjusted_columns <- c("tackles_per90_adj",
                      "tackles_won_per90_adj",
                      "dribblers_tackled_per90_adj",
                      "dribblers_challenged_per90_adj",
                      "unsuccessful_dribble_challenges_per90_adj",
                      "blocks_per90_adj", 
                      "shots_blocked_per90_adj",
                      "passes_blocked_per90_adj",
                      "interceptions_per90_adj",
                      "tkl_plus_int_per90_adj",
                      "clearances_per90_adj",
                      "errors_per90_adj",
                      "aerials_won_per90_adj",
                      "aerials_lost_per90_adj",
                      "passes_att_per90_adj", 
                      "passes_cmp_per90_adj",
                      "won_percent_per90_adj")

percent_columns <- c("percent_of_dribblers_successfully_tackled", "pass_cmp_percent", "won_percent")
all_columns <- c(adjusted_columns, percent_columns)

filtered_cb_specific_stats_zscore <- filtered_cb_specific_stats %>%
  mutate(across(all_of(all_columns),
                ~ (. - mean(., na.rm = TRUE)) / sd(., na.rm = TRUE),
                .names = "{.col}_zscore"))

# Step 4: Flip z-scores for metrics where a lower value is better (e.g. errors)
negative_metrics <- c("unsuccessful_dribble_challenges_per90_adj_zscore",
                      "aerials_lost_per90_adj_zscore",
                      "errors_per90_adj_zscore")

for (metric in negative_metrics) {
  inverted_name <- paste("inverted", metric, sep = "_")
  filtered_cb_specific_stats_zscore[[inverted_name]] <- -filtered_cb_specific_stats_zscore[[metric]]
}

# Step 5: Build a simple composite score by summing select z-scores
zscore_columns_updated <- c(
  "tackles_per90_adj_zscore",
  "shots_blocked_per90_adj_zscore",
  "passes_blocked_per90_adj_zscore",
  "interceptions_per90_adj_zscore",
  "clearances_per90_adj_zscore",
  "percent_of_dribblers_successfully_tackled_zscore",
  "pass_cmp_percent_zscore",
  "aerials_won_per90_adj_zscore",
  "won_percent_zscore",
  "inverted_errors_per90_adj_zscore"
)

filtered_cb_specific_stats_zscore$composite_zscore <- rowSums(
  filtered_cb_specific_stats_zscore[zscore_columns_updated],
  na.rm = TRUE
)

# Step 6: Weighted scoring using custom-defined importance for each stat
weights <- c(
  "tackles_per90_adj_zscore" = 0.07,
  "shots_blocked_per90_adj_zscore" = 0.08,
  "passes_blocked_per90_adj_zscore" = 0.07,
  "interceptions_per90_adj_zscore" = 0.12,
  "clearances_per90_adj_zscore" = 0.08,
  "percent_of_dribblers_successfully_tackled_zscore" = 0.12,
  "pass_cmp_percent_zscore" = 0.05,
  "aerials_won_per90_adj_zscore" = 0.06,
  "won_percent_zscore" = 0.05,
  "inverted_errors_per90_adj_zscore" = -0.05
)

valid_columns <- names(weights)[names(weights) %in% colnames(filtered_cb_specific_stats_zscore)]

filtered_cb_specific_stats_weighted <- filtered_cb_specific_stats_zscore %>%
  mutate(
    weighted_sum = rowSums(across(
      all_of(valid_columns), 
      ~ . * weights[cur_column()]
    ), na.rm = TRUE)
  )

# Step 7: Normalize by cost to estimate value (per $1M in salary)
filtered_cb_specific_stats_weighted <- filtered_cb_specific_stats_weighted %>%
  mutate(value_score = composite_zscore / (gross_yearly_wages_usd / 1e6),
         weighted_value_score = weighted_sum / (gross_yearly_wages_usd / 1e6))

# Step 8: Add percentile rankings for comparison (numeric values 0–1)
percentile_columns <- c("tackles_per90_adj",
                        "tackles_won_per90_adj",
                        "dribblers_tackled_per90_adj",
                        "blocks_per90_adj", 
                        "shots_blocked_per90_adj",
                        "passes_blocked_per90_adj",
                        "interceptions_per90_adj",
                        "clearances_per90_adj",
                        "percent_of_dribblers_successfully_tackled",
                        "aerials_won_per90_adj",
                        "pass_cmp_percent",
                        "won_percent")

filtered_cb_specific_stats_weighted <- filtered_cb_specific_stats_weighted %>%
  mutate(across(all_of(percentile_columns),
                ~ percent_rank(.),
                .names = "{.col}_percentile"))

# Step 9: Correlation between unweighted and weighted composite scores
pearson_corr <- cor(filtered_cb_specific_stats_weighted$composite_zscore, 
                    filtered_cb_specific_stats_weighted$weighted_sum, 
                    use = "complete.obs")
print(paste("Pearson correlation:", round(pearson_corr, 3)))

spearman_corr <- cor(filtered_cb_specific_stats_weighted$composite_zscore, 
                     filtered_cb_specific_stats_weighted$weighted_sum, 
                     use = "complete.obs", method = "spearman")
print(paste("Spearman rank correlation:", round(spearman_corr, 3)))

# Step 10: Quick interactive scatter plot to inspect relationship
p <- ggplot(filtered_cb_specific_stats_weighted, aes(x = composite_zscore, y = weighted_sum, text = player)) +
  geom_point() +
  labs(x = "Sum of Raw Z-Scores", y = "Weighted Composite Score",
       title = "Correlation between Composite Scores")

p_plotly <- ggplotly(p, tooltip = "text") %>%
  add_trace(
    data = filtered_cb_specific_stats_weighted,
    x = ~composite_zscore,
    y = fitted(lm(weighted_sum ~ composite_zscore, data = filtered_cb_specific_stats_weighted)),
    mode = "lines",
    line = list(color = "blue"),
    name = "Linear Regression Line"
  )

p_plotly

# Step 11: Export final data for use elsewhere
write.csv(filtered_cb_specific_stats_weighted, 
          "/Users/alextrill/Desktop/tableau_join_updated_defensive_stats.csv", 
          row.names = FALSE)
