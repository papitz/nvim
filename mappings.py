import re
commentRegex = "^-- (.*)"
mapRegex = "\wmap\(\"(.*?)\", \"(.*?)\"\)"
file = open("./lua/maps.lua", "r")
output = open("./map_table.md", "w")

for line in file:
    if re.search(commentRegex, line):
        match = re.search(commentRegex, line)
        output.write("\n")
        output.write("#### " + match.group(1) + "\n")
        output.write("| Key | Function |\n")
        output.write("|-----|----------|\n")
    elif re.search(mapRegex, line):
        match = re.search(mapRegex, line)
        output.write("| " + match.group(1).replace("<", "\\<").replace(">", "\\>") +
                     " | " + match.group(2).replace("<", "\\<").replace(">", "\\>") + " | \n")
