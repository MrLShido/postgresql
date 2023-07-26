def filter(log_file, desire_levels):
 with open(log_file, 'r') as file:
  found_levels = set()
  for line in file:
   for level in desire_levels:
    if level in line:
     found_levels.add(level)
     print(line.strip())
     break

  for level in desire_levels:
   if level not in found_levels:
    print(f"No {level} records found in file")

if __name__ == "__main__":
    log_file = "postgresql.log"
    desire_levels = ["ERROR", "FATAL", "PANIC"]
    filter(log_file, desire_levels)
