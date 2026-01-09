module day2;

import std::io;

fn long invalid_id(long id) {
    String id_str = string::format(mem, "%d", id);
    defer id_str.free(mem);
    usz len = id_str.len;
    if (len % 2 != 0) {
        return 0;
    }

    String first = id_str[:^len/2];
    String second = id_str[^len/2..];
    
    if (first == second) {
        return id;
    }

    return 0;
}

fn long part1(String data) {
    long invalid_count = 0;

    foreach (String range_data : data.tsplit(",")) {
        String[] parts = range_data.tsplit("-");
        long start = parts[0].to_integer(long)!!;
        long end = parts[1].to_integer(long)!!;

        for (long i = start; i <= end; i++) {
            invalid_count += invalid_id(i);
        }
    }

    return invalid_count;
}
