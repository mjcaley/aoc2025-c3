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

fn long invalid_id_multipart(long id) {
    String id_str = string::format(mem, "%d", id);
    defer id_str.free(mem);
    usz len = id_str.len;
    
    for (usz chunk = 1; chunk <= len / 2; chunk++) {
        if (len % chunk != 0) {
            continue;
        }

        bool match = true;
        String part = id_str[:chunk];

        for (usz sub_chunk = 0; sub_chunk < len / chunk; sub_chunk++) {
            String next_part = id_str[sub_chunk * chunk:chunk];
            if (part != next_part) {
                match = false;
                break;
            }
        }

        if (match) {
            return id;
        }
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

fn long part2(String data) {
    long invalid_count = 0;

    foreach (String range_data : data.tsplit(",")) {
        String[] parts = range_data.tsplit("-");
        long start = parts[0].to_integer(long)!!;
        long end = parts[1].to_integer(long)!!;

        for (long i = start; i <= end; i++) {
            invalid_count += invalid_id_multipart(i);
        }
    }

    return invalid_count;
}
