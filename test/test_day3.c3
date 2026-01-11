module day3 @test;

import std::io;

const String TEST_INPUT =
`987654321111111
811111111111119
234234234234278
818181911112111`;

fn void test_part1() @test {
    long result = part1(TEST_INPUT);
    io::printfn("Test Part 1 Result: %d", result);
    assert(result == 357);
}

fn void test_part2() @test {
	long result = part2(TEST_INPUT);
	io::printfn("Test Part 2 Result: %d", result);
	assert(result == 3121910778619);
}
