CREATE TABLE defender_stats_having_played_over_1140_minutes
SELECT * FROM defender_analysis_project.combined_player_stats
WHERE (primary_position = 'DF' OR secondary_position = 'DF' )
AND minutes_played > 1140;
