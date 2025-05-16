# Defender Metrics Analysis

**This project creates a composite performance metric for Serie A defenders,  
summing multiple z-scores across key categories—defensive actions (tackles, interceptions, blocks, clearances),  
passing effectiveness, and aerial duels—while penalizing errors. All stats are per-90 and adjusted for team possession,  
then standardized via z-scores to allow fair comparisons. A companion Value Score divides this defensive output by publicly available wages,  
highlighting players who deliver outsized performance relative to their cost.**

---

## Key Steps

- **Data Processing**: Clean raw CSVs, compute per-90 metrics, adjust for team possession.  
- **Metric Selection**: Choose relevant z-score columns for defense, passing, aerials, invert errors.  
- **Composite Score**: Sum selected z-scores into a single Defender Score.  
- **Value Score**: Divide Defender Score by wages to quantify cost-effectiveness.  
- **Visualization**: Explore results in R and publish an interactive Tableau dashboard.
