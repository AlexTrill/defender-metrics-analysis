CREATE TABLE defender_analysis_project.updated_defender_stats AS
SELECT
    CDS.player,
    CDS.nation,
    DP.Position AS specific_position,  -- Placed after player and nation
    CDS.primary_position,
    CDS.secondary_position,
    CDS.squad,
    CDS.age,
    CDS.born,
    CDS.90s_played,
    CDS.minutes_played,
    CDS.tackles,
    CDS.tackles_won,
    CDS.dribblers_tackled,
    CDS.dribblers_challenged,
    CDS.percent_of_dribblers_successfully_tackled,
    CDS.unsuccessful_dribble_challenges,
    CDS.blocks,
    CDS.shots_blocked,
    CDS.passes_blocked,
    CDS.interceptions,
    CDS.tkl_plus_int,
    CDS.clearances,
    CDS.errors,
    CDS.aerials_won,
    CDS.aerials_lost,
    CDS.won_percent,
    CDS.passes_att,
    CDS.passes_cmp,
    CDS.pass_cmp_percent,
    CDS.gross_weekly_wages_usd,
    CDS.gross_yearly_wages_usd,
    CDS.team_possession_percentage
FROM
    defender_analysis_project.combined_defender_stats AS CDS
LEFT JOIN
    defender_analysis_project.defender_positions AS DP
    ON DP.player = CDS.player;
