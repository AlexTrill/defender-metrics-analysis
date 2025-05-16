# python/scraper_scripts/misc.py

"""
misc.py

Scrapes Serie A miscellaneous stats from FBref and saves them to CSV.
"""

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import csv
import sys

def scrape_misc_stats(output_path: str = "data/raw/serie_a_misc_stats.csv"):
    """Load the FBref misc page, extract the main table, and write to CSV."""
    url = "https://fbref.com/en/comps/11/2023-2024/misc/2023-2024-Serie-A-Stats"
    driver = webdriver.Chrome()
    driver.set_page_load_timeout(120)

    try:
        driver.get(url)
    except Exception as e:
        print(f"[ERROR] Could not load page: {e}", file=sys.stderr)
        driver.quit()
        return

    # Wait for the misc stats table to appear
    try:
        WebDriverWait(driver, 20).until(
            EC.presence_of_element_located((By.ID, "stats_misc"))
        )
    except Exception as e:
        print(f"[ERROR] Misc stats table not found: {e}", file=sys.stderr)
        driver.quit()
        return

    try:
        table = driver.find_element(By.ID, "stats_misc")
        print("Misc stats table loaded, extracting data...")

        # Extract headers
        header_cells = table.find_element(By.TAG_NAME, "thead") \
                            .find_elements(By.TAG_NAME, "th")
        headers = [cell.text.strip() for cell in header_cells]

        # Extract all row data
        body_rows = table.find_element(By.TAG_NAME, "tbody") \
                         .find_elements(By.TAG_NAME, "tr")
        data = []
        for row in body_rows:
            cells = row.find_elements(By.TAG_NAME, "td")
            row_text = [cell.text.strip() for cell in cells]
            data.append(row_text)

        # Write to CSV
        with open(output_path, "w", newline="", encoding="utf-8") as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(headers)
            writer.writerows(data)
        print(f"[OK] Data saved to {output_path}")

    except Exception as e:
        print(f"[ERROR] Extraction or write failed: {e}", file=sys.stderr)

    finally:
        driver.quit()

if __name__ == "__main__":
    scrape_misc_stats()
