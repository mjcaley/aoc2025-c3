module day5;

import std::io;
import std::collections::list;
import std::collections::pair;

alias Range = pair::Pair{long, long};

struct Database {
	list::List{Range} fresh;
	list::List{long} available;
}

enum ParseMode {
	FRESH,
	AVAILBLE,
}

fn Database parse(String data) => @pool() {
	list::List{Range} fresh;
	fresh.init(mem);

	list::List{long} available;
	available.init(mem);

	ParseMode mode = FRESH;

	foreach (String line : data.tsplit("\n")) {
		if (line.len == 0) {
			mode = AVAILBLE;
			continue;
		}

		if (mode == FRESH) {
			String[] parts = line.tsplit("-");
			long start = parts[0].to_integer(long)!!;
			long end = parts[1].to_integer(long)!!;

			fresh.push({start, end});
		}
		
		if (mode == AVAILBLE) {
			long num = line.to_integer(long)!!;
			available.push(num);
		}
	}

	return {fresh, available};
}

fn long part1(String data = DATA) {
	Database db = parse(data);
	defer {
		db.fresh.free();
		db.available.free();
	}

	long sum = 0;

	foreach (long num : db.available) {
		foreach (Range r : db.fresh) {
			if (num >= r.first && num <= r.second) {
				sum++;
				break;
			}
		}
	}

	return sum;
}
