# python/scraper_scripts/wages.py

"""
wages.py

Scrapes Serie A full-back wages data from FootballCritic, paging through 
all results and saving unique rows to CSV.
"""

import time
import csv
import sys
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException, NoSuchElementException

def scrape_wages(output_path: str = "data/raw/serie_a_wages.csv"):
    """Scrape paginated wages table and write unique rows to CSV."""
    url = "https://www.footballcritic.com/serie-a/season-2023-2024/player-stats/full-backs/8/68734"
    driver = webdriver.Chrome()
    driver.set_page_load_timeout(120)
    driver.get(url)
    print("Page opened for wages scraping")

    def scrape_current_page():
        """Return (headers, rows) from current page table."""
        try:
            table = WebDriverWait(driver, 20).until(
                EC.presence_of_element_located((By.XPATH, "//table[contains(@class,'players-table')]"))
            )
            # Extract headers once
            header_elems = table.find_elements(By.XPATH, ".//thead/tr/th")
            headers = [h.text.strip() for h in header_elems if h.text.strip()]
            # Extract rows
            data_rows = table.find_elements(By.XPATH, ".//tbody/tr")
            rows = [tuple(td.text.strip() for td in row.find_elements(By.TAG_NAME, "td"))
                    for row in data_rows]
            return headers, rows

        except TimeoutException:
            print("[ERROR] Timeout waiting for wages table", file=sys.stderr)
        except Exception as e:
            print(f"[ERROR] Unexpected error scraping wages page: {e}", file=sys.stderr)
        return [], []

    def go_to_next_page():
        """Click ‘Next’ if available; return True if navigated, False otherwise."""
        try:
            btn = WebDriverWait(driver, 10).until(
                EC.element_to_be_clickable((By.ID, "DataTables_Table_0_next"))
            )
            if "disabled" in btn.get_attribute("class"):
                return False
            driver.execute_script("arguments[0].click();", btn)
            time.sleep(2)
            return True
        except (TimeoutException, NoSuchElementException):
            return False

    def save_rows(headers, rows):
        """Append rows to CSV, writing headers only once."""
        with open(output_path, "a", newline="", encoding="utf-8") as f:
            writer = csv.writer(f)
            if f.tell() == 0 and headers:
                writer.writerow(headers)
            writer.writerows(rows)

    all_seen = set()
    page = 1

    try:
        while True:
            headers, rows = scrape_current_page()
            if not headers or not rows:
                break

            # Filter only new rows
            new = [r for r in rows if r not in all_seen]
            if not new:
                print(f"No new rows on page {page}, stopping.")
                break

            save_rows(headers, new)
            all_seen.update(new)
            print(f"[OK] Page {page}: {len(new)} new rows saved")

            if not go_to_next_page():
                break
            page += 1

    except Exception as e:
        print(f"[ERROR] Scraper crashed on page {page}: {e}", file=sys.stderr)
    finally:
        driver.quit()
        print("Wages scraping completed and browser closed")

if __name__ == "__main__":
    scrape_wages()
