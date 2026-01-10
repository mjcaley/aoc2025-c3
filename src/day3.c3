module day3;

import std::collections::pair;
import std::io;

fn pair::Pair{usz, char} max_integer(char[] bank) {
	usz max_index = 0;
	char max_value = bank[0];
	foreach (usz index, char c : bank) {
		if (c > max_value) {
			max_value = c;
			max_index = index;
		}
	}

	return {max_index, max_value};
}

fn int part1(String data) {
    int total_joltage = 0;

    foreach (String bank : data.tsplit("\n")) {
		pair::Pair{usz, char} first = max_integer(bank[0..^2]);
		pair::Pair{usz, char} second = max_integer(bank[first.first + 1..]);

		int joltage = ((String){first.second, second.second}).to_integer(int)!!;
		total_joltage += joltage;
    }

    return total_joltage;
}
