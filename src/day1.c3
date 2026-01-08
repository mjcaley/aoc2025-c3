module day1;

import std::collections;
import std::core::string;
import std::core::dstring;

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

fn List{Turn} parse(String input) {
    List{Turn} turns;
    turns.init(mem);

    Direction dir;
    DString dnumber = dstring::temp();

    foreach (index, char c : input) {
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


