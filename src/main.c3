module aoc2025;
import std::io;
import day1;
import day2;

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
		case "2":
			switch (part) {
				case "1":
					io::printfn("Day 2, Part 1: %d", day2::part1(day2::DATA));
				// case "2":
				// 	io::printfn("Day 2, Part 2: %d", day2::part2(day2::DATA));
			}
	}

    return 0;
}
