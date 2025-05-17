# Quantifying Defensive Value in Serie A: A Data-Driven Look

Serie A is famous for tactical battles—and solid defending is absolutely crucial. I’ve built a **Defender Score** by summing z-scores of key per-90 metrics (tackles, interceptions, blocks, clearances, aerials), then adjusted each for team possession so I’m comparing apples to apples. To gauge *value*, I divide Defender Score by yearly wage (in millions USD) to get a **Value Score**, spotlighting center-backs who punch above (or below) their financial weight.

> **Note:** This is a data-analysis exercise, not a scouting report. It’s meant to provide objective insights—alongside intangibles like age, injuries, and leadership—that could spark discussion in a recruitment or coaching setting.

---

## 📊 Project Goals

- Create a fair, per-90 and possession-adjusted measure of defender performance in Serie A  
- Filter for center-backs with ≥1,140 minutes to ensure reliable sampling  
- Spot potentially under- and over-valued defenders by comparing performance vs. wages  
- Visualize insights via R plots and an interactive Tableau dashboard  

---

## 🔧 Workflow Summary

1. **Data Collection & Cleaning**  
   - Raw CSVs from Kaggle, FBref, Capology, FCtables  
   - Standardized names, positions, team names; converted wages to USD; merged loan spells  

2. **Feature Engineering**  
   - Computed per-90 stats, adjusted for possession  
   - Converted to z-scores; selected nine core defensive metrics  

3. **Metric Construction**  
   - **Defender Score:** sum of chosen z-scores  
   - **Value Score:** Defender Score ÷ salary (USD M)  

4. **Visualization**  
   - Exploratory plots in R  
   - Interactive Tableau dashboard  

---

## 📁 Repo Structure

defender-metrics-analysis/
├── data/
│ ├── raw/ # original exports
│ ├── cleaned/ # per-source cleaned CSVs
│ └── final/ # filtered_cb_specific_stats.csv
├── python/ # scraping & cleaning scripts
├── R/ # analysis & plotting scripts
├── sql/ # schema.sql & core queries
├── tableau/ # Tableau workbook or public link
└── README.md # this overview

yaml
Copy
Edit

---

## 📚 Data Sources

- Kaggle: Serie A Player Stats (2023–24)  
- FBref: Defensive, Misc, Passing, Wages  
- Capology: Serie A Salaries  
- FCtables: Team Possession  

---

## 🔍 Future Improvements

- Expand to full-backs & wing-backs  
- Compare defensive value across European leagues  
- Incorporate xGA, progressive actions  
- Experiment with alternate weightings  
- Remember: intangibles (age, injuries, leadership) also matter  
