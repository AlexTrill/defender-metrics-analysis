# python/cleaning_scripts/normalize.py

"""
normalize.py

Provides functions to normalize text in CSV files by removing diacritics
and replacing special characters with ASCII equivalents.
"""

import unicodedata
import csv
import os
import sys

# Mapping of special Unicode characters to ASCII replacements
CHAR_MAP = {
    'ł': 'l', 'Ł': 'L', 'Đ': 'D', 'ð': 'o',
    'æ': 'a', 'ø': 'o', 'ı': 'i', 'Ø': 'O',
    'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
    'ñ': 'n', 'ç': 'c', 'à': 'a', 'è': 'e', 'ù': 'u',
    'â': 'a', 'ê': 'e', 'î': 'i', 'ô': 'o', 'û': 'u',
    'ä': 'a', 'ë': 'e', 'ï': 'i', 'ö': 'o', 'ü': 'u',
    'ß': 'ss', 'å': 'a', 'œ': 'oe', 'þ': 'th'
}

def normalize_text(text: str) -> str:
    """
    Normalize a string to ASCII:
    1. Decompose Unicode characters (NFD) and drop nonspacing marks.
    2. Replace any remaining special chars via CHAR_MAP.
    """
    # Decompose accents
    decomposed = unicodedata.normalize('NFD', text)
    without_accents = ''.join(
        c for c in decomposed
        if unicodedata.category(c) != 'Mn'
    )
    # Custom replacements
    for orig, repl in CHAR_MAP.items():
        without_accents = without_accents.replace(orig, repl)
    return without_accents

def process_file(input_path: str, output_path: str = None):
    """
    Read input CSV, apply normalize_text to every cell, and write to output CSV.
    If output_path is None, prefix 'cleaned_' to the input filename.
    """
    if output_path is None:
        base = os.path.basename(input_path)
        output_path = os.path.join(
            os.path.dirname(input_path),
            f"cleaned_{base}"
        )

    try:
        with open(input_path, 'r', encoding='utf-8') as infile, \
             open(output_path, 'w', encoding='utf-8', newline='') as outfile:
            reader = csv.reader(infile)
            writer = csv.writer(outfile)

            for row in reader:
                clean_row = [normalize_text(cell) for cell in row]
                writer.writerow(clean_row)

        print(f"[OK] File cleaned: {input_path} -> {output_path}")

    except FileNotFoundError:
        print(f"[ERROR] File not found: {input_path}", file=sys.stderr)
    except Exception as e:
        print(f"[ERROR] Processing failed for {input_path}: {e}", file=sys.stderr)

def main():
    """
    If run as a script, normalizes each CSV path provided as a command-line argument.
    Example:
        python normalize.py path/to/file.csv
    """
    if len(sys.argv) < 2:
        print("Usage: python normalize.py <input_csv1> [<input_csv2> ...]")
        sys.exit(1)

    for path in sys.argv[1:]:
        process_file(path)

if __name__ == "__main__":
    main()
