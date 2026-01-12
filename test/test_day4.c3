module day4 @test;

import std::io;

const String TEST_DATA =
`..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@.`;

fn void test_parse() @test {
	Floor floor = parse(TEST_DATA);
	defer floor.squares.free();

	assert(floor.dimensions.x == 10);
	assert(floor.dimensions.y == 10);
	assert(floor.squares.len() == 100);
}

fn void test_part1() @test {
	int result = part1(TEST_DATA);
	io::printfn("Test Part 1 Result: %d", result);
	assert(result == 13);
}

fn void test_part2() @test {
	int result = part2(TEST_DATA);
	io::printfn("Test Part 2 Result: %d", result);
	assert(result == 43);
}
