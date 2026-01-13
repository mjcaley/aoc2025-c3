module day5 @test;

import std::io;
 
const String TEST_DATA =
`3-5
10-14
16-20
12-18

1
5
8
11
17
32`;

// fn void test_parse() @test {
// 	Database db = parse(TEST_DATA);
// 	defer {
// 		db.fresh.free();
// 		db.available.free();
// 	}

// 	assert(db.fresh.len() == 14);
// 	assert(db.available.len() == 6);
// }

fn void test_part1() @test {
	long result = part1(TEST_DATA);
	io::printfn("Test Part 1 Result: %d", result);
	assert(result == 3);
}

// fn void test_part2() @test {
// 	int result = part2(TEST_DATA);
// 	io::printfn("Test Part 2 Result: %d", result);
// 	assert(result == 43);
// }
