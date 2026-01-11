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

fn long part2(String data) {
	long total_joltage = 0;

	foreach (String bank : data.tsplit("\n")) {
		char[12] joltage_str;

		usz lower_window = 0;
		usz upper_window = bank.len - 12;

		for (usz i = 0; i < 12; i++) {
			pair::Pair{usz, char} best_integer = max_integer(bank[lower_window..upper_window]);
			joltage_str[i] = best_integer.second;
			lower_window += max(1 + best_integer.first, 1);
			upper_window += 1;
		}

		long joltage = ((String)joltage_str[..]).to_integer(long)!!;
		total_joltage += joltage;
	}

	return total_joltage;
}
