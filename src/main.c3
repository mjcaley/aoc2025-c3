module aoc2025;
import std::io;
import day1;

fn int main(String[] args)
{
    if (args.len < 3) {
        io::printfn("Usage: aoc2025 <DAY> <PART>");
        return 1;
    }

	String day = args[1];
	String part = args[2];

	switch (day) {
		case "1":
			switch (part) {
				case "1":
					io::printfn("Day 1, Part 1: %d", day1::part1());
				case "2":
					io::printfn("Day 1, Part 2: %d", day1::part2());
			}
	}

    return 0;
}
