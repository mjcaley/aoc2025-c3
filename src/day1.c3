module day1;

import std::collections;
import std::core::string;
import std::core::dstring;
import std::io;
import std::math;

enum Direction : int {
    LEFT,
    RIGHT,
}

struct Turn {
    Direction dir;
    int steps;
}

fn Turn make_turn(Direction dir, int steps) @private {
    Turn turn;
    turn.dir = dir;
    turn.steps = steps;
    return turn;
}

fn List{Turn} parse(String data) {
    List{Turn} turns;
    turns.init(mem);

    Direction dir;
    DString dnumber = dstring::temp();

    foreach (index, char c : data) {
        switch (c) {
            case 'L':
                dir = Direction.LEFT;
            case 'R':
                dir = Direction.RIGHT;
            case '\n':
                turns.push(make_turn(dir, dnumber.str_view().to_integer(int)))!!;
                dnumber.clear();
            case '0'..'9':
                dnumber.append(c);
        }
    }

    turns.push(make_turn(dir, dnumber.str_view().to_integer(int)))!!;

    return turns;
}

fn int part1(String data = DATA) {
    List{Turn} turns = parse(data);
    defer turns.free();

    int dial = 50;
    int zeros = 0;

    foreach (Turn turn : turns) {
        switch (turn.dir) {
            case Direction.LEFT:
                dial = dial - turn.steps;
            case Direction.RIGHT:
                dial = dial + turn.steps;
        }

        dial = ((dial % 100) + 100) % 100;

        if (dial == 0) {
            zeros++;
        }
    }

    return zeros;
}
