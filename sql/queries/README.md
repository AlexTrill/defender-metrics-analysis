# SQL Queries

This directory contains SQL queries used for data analysis in the defender analysis project.

## Files

* **combine_datasets.sql:** Combines data from `cleaned_defensive_stats`, `cleaned_misc_stats`, `cleaned_passing_stats`, and `cleaned_player_wages` tables.
* **create_defender_stats_filtered.sql:** Creates a new table `defender_stats_having_played_over_1140_minutes` by filtering players who are defenders and have played more than 1140 minutes.
* **create_updated_defender_stats.sql:** Creates a new table `updated_defender_stats` by joining `combined_defender_stats` and `defender_positions` tables.
