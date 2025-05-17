SELECT
    DS.*,
    MS.aerials_won,
    MS.aerials_lost,
    MS.won_percent,
    PS.passes_att,
    PS.passes_cmp,
    PS.pass_cmp_percent,
    PW.gross_weekly_wages_usd,
    PW.gross_yearly_wages_usd
FROM defender_analysis_project.cleaned_defensive_stats AS DS
LEFT JOIN defender_analysis_project.cleaned_misc_stats AS MS
    ON MS.player = DS.player
LEFT JOIN defender_analysis_project.cleaned_passing_stats AS PS
    ON PS.player = DS.player
LEFT JOIN defender_analysis_project.cleaned_player_wages AS PW
    ON PW.player = DS.player;
