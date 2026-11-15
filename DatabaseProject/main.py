import csv
import glob
import os

folder = r"c:\Users\Babats\Documents\Code\IS640\DatabaseProject"

for filepath in sorted(glob.glob(os.path.join(folder, "*.csv"))):
    with open(filepath, mode="r", encoding="utf-8") as f:
        reader = csv.reader(f)
        header = next(reader, None)  # Skip header row
        row_count = sum(1 for row in reader if any(row))
    print(f"{os.path.basename(filepath)}: {row_count} data rows ({row_count + 1} total lines)")