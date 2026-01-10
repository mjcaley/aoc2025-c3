module day3 @test;

import std::io;

const String TEST_INPUT =
`987654321111111
811111111111119
234234234234278
818181911112111`;

fn void test_part1() @test {
	io::printfn("Running test_part1...");
    long result = part1(TEST_INPUT);
	// int result = 0;
    io::printfn("Test Part 1 Result: %d", result);
    assert(result == 357);
}
