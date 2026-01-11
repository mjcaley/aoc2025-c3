module aoc2025;
import std::io;
import day1;
import day2;
import day3;
import day4;

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
                default:
                    io::printfn("Unknown part: %s", part);
            }
        case "2":
            switch (part) {
                case "1":
                    io::printfn("Day 2, Part 1: %d", day2::part1(day2::DATA));
                case "2":
                    io::printfn("Day 2, Part 2: %d", day2::part2(day2::DATA));
                default:
                    io::printfn("Unknown part: %s", part);
            }
		case "3":
			switch (part) {
				case "1":
					io::printfn("Day 3, Part 1: %d", day3::part1(day3::DATA));
				case "2":
				    io::printfn("Day 3, Part 2: %d", day3::part2(day3::DATA));
				default:
					io::printfn("Unknown part: %s", part);
			}
		case "4":
			switch (part) {
				case "1":
					io::printfn("Day 4, Part 1: %d", day4::part1(day4::DATA));
				// case "2":
				//     io::printfn("Day 4, Part 2: %d", day4::part2(day4::DATA));
				default:
					io::printfn("Unknown part: %s", part);
			}
        default:
            io::printfn("Unknown day: %s", day);
    }

    return 0;
}
