module day4;

import std::io;
import std::collections::list;
import std::collections::pair;

struct Position {
	int x;
	int y;
}

struct Square {
	inline Position position;
	bool has_roll;
}

fn Position Square.top_left(Square* s) => { s.x - 1, s.y - 1 };
fn Position Square.top(Square* s) => { s.x, s.y - 1 };
fn Position Square.top_right(Square* s) => { s.x + 1, s.y - 1 };
fn Position Square.left(Square* s) => { s.x - 1, s.y };
fn Position Square.right(Square* s) => { s.x + 1, s.y };
fn Position Square.bottom_left(Square* s) => { s.x - 1, s.y + 1 };
fn Position Square.bottom(Square* s) => { s.x, s.y + 1 };
fn Position Square.bottom_right(Square* s) => { s.x + 1, s.y + 1 };

struct Floor {
	List{Square} squares;
	Position dimensions;
}

faultdef OUT_OF_BOUNDS;

fn Square*? Floor.get_at(Floor* f, Position pos) {
	if (pos.x < 0 || pos.x >= f.dimensions.x || pos.y < 0 || pos.y >= f.dimensions.y) {
		return OUT_OF_BOUNDS?;
	}

	int index = pos.y * f.dimensions.x + pos.x;
	return &f.squares[index];
}

fn Floor parse(String data) {
	List{Square} floor;
	floor.init(mem);

	int width;
	int height;

	foreach (usz i, String line : data.tsplit("\n")) {
		width = (int)line.len;
		height = (int)i + 1;
		foreach (usz j, char c : line) {
			Square square = {{(int)j, (int)i}, c == '@'};
			floor.push(square);
		}
	}

	return {floor, {width, height}};
}

fn int part1(String data) {
	Floor floor = parse(data);
	defer floor.squares.free();

	int rolls = 0;

	foreach (Square square : floor.squares) {
		if (!square.has_roll) {
			continue;
		}

		int surrounding_rolls = 0;

		Square*? top_left = floor.get_at(square.top_left());
		if (try top_left) {
			surrounding_rolls += top_left.has_roll ? 1 : 0;
		}
		Square*? top = floor.get_at(square.top());
		if (try top) {
			surrounding_rolls += top.has_roll ? 1 : 0;
		}
		Square*? top_right = floor.get_at(square.top_right());
		if (try top_right) {
			surrounding_rolls += top_right.has_roll ? 1 : 0;
		}
		Square*? left = floor.get_at(square.left());
		if (try left) {
			surrounding_rolls += left.has_roll ? 1 : 0;
		}
		Square*? right = floor.get_at(square.right());
		if (try right) {
			surrounding_rolls += right.has_roll ? 1 : 0;
		}
		Square*? bottom_left = floor.get_at(square.bottom_left());
		if (try bottom_left) {
			surrounding_rolls += bottom_left.has_roll ? 1 : 0;
		}
		Square*? bottom = floor.get_at(square.bottom());
		if (try bottom) {
			surrounding_rolls += bottom.has_roll ? 1 : 0;
		}
		Square*? bottom_right = floor.get_at(square.bottom_right());
		if (try bottom_right) {
			surrounding_rolls += bottom_right.has_roll ? 1 : 0;
		}
		
		if (surrounding_rolls < 4) {
			rolls++;
		}
	}

	return rolls;
}

fn int part2(String data) {
	Floor floor = parse(data);
	defer floor.squares.free();

	int rolls = 0;
	int rolls_removed = 0;

	List{Square*} recheck_rolls;
	recheck_rolls.init(mem);
	defer recheck_rolls.free();
	foreach (Square* &square : floor.squares) {
			recheck_rolls.push_front(square);
	}

	List{Square*} adjacent_rolls;
	adjacent_rolls.init(mem);
	defer adjacent_rolls.free();

	while(recheck_rolls.len() > 0) {
		Square*? square = recheck_rolls.pop();
		if (catch square) {
			continue;
		}

		if (!square.has_roll) {
			continue;
		}

		Square*? top_left = floor.get_at(square.top_left());
		if (try top_left && top_left.has_roll) {
			adjacent_rolls.push(top_left);
		}
		Square*? top = floor.get_at(square.top());
		if (try top && top.has_roll) {
			adjacent_rolls.push(top);
		}
		Square*? top_right = floor.get_at(square.top_right());
		if (try top_right && top_right.has_roll) {
			adjacent_rolls.push(top_right);
		}
		Square*? left = floor.get_at(square.left());
		if (try left && left.has_roll) {
			adjacent_rolls.push(left);
		}
		Square*? right = floor.get_at(square.right());
		if (try right && right.has_roll) {
			adjacent_rolls.push(right);
		}
		Square*? bottom_left = floor.get_at(square.bottom_left());
		if (try bottom_left && bottom_left.has_roll) {
			adjacent_rolls.push(bottom_left);
		}
		Square*? bottom = floor.get_at(square.bottom());
		if (try bottom && bottom.has_roll) {
			adjacent_rolls.push(bottom);
		}
		Square*? bottom_right = floor.get_at(square.bottom_right());
		if (try bottom_right && bottom_right.has_roll) {
			adjacent_rolls.push(bottom_right);
		}

		if (adjacent_rolls.len() < 4) {
			square.has_roll = false;
			rolls_removed++;
			foreach (Square* adj_square : adjacent_rolls) {
				recheck_rolls.push(adj_square);
			}
		}
		adjacent_rolls.clear();
	};

	return rolls_removed;
}
