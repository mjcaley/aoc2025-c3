module aoc2025;
import std::io;

fn String readData(String filename) {
    usz size = file::get_size(filename)!!;
    File file = file::open(filename, "r")!!;

    defer (void)file.close();

    char[] buffer = io::read_fully(tmem, file);

    return buffer.to_string();
}

fn int main(String[] args)
{
    if (args.len < 3) {
        io::printfn("Usage: aoc2025 <DAY> <PART> <INPUT>");
        return 1;
    }


    return 0;
}
