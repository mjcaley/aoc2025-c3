module day1 @test;

import std::collections;
import std::io;

const String TEST_INPUT = `L68
L30
R48
L5
R60
L55
L1
L99
R14
L82`;

fn void test_parse() @test {
    List{Turn} turns = parse(TEST_INPUT);
    defer turns.free();

    assert(turns.len() == 10);
    
    assert(turns[0].dir == Direction.LEFT);
    assert(turns[0].steps == 68);
    
    assert(turns[1].dir == Direction.LEFT);
    assert(turns[1].steps == 30);

    assert(turns[2].dir == Direction.RIGHT);
    assert(turns[2].steps == 48);
    
    assert(turns[3].dir == Direction.LEFT);
    assert(turns[3].steps == 5);
    
    assert(turns[4].dir == Direction.RIGHT);
    assert(turns[4].steps == 60);
    
    assert(turns[5].dir == Direction.LEFT);
    assert(turns[5].steps == 55);
    
    assert(turns[6].dir == Direction.LEFT);
    assert(turns[6].steps == 1);
    
    assert(turns[7].dir == Direction.LEFT);
    assert(turns[7].steps == 99);
    
    assert(turns[8].dir == Direction.RIGHT);
    assert(turns[8].steps == 14);
    
    assert(turns[9].dir == Direction.LEFT);
    assert(turns[9].steps == 82);
}

fn void test_part1() @test {
	int result = part1(TEST_INPUT);
	assert(result == 3);
}

fn void test_part2() @test {
	int result = part2(TEST_INPUT);
	io::printfn("Test Part 2 Result: %d", result);
	assert(result == 6);
}
