package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    counts := make(map[string]int)
    lineCountsInFiles := make(map[string]map[string]int)

    for _, filename := range os.Args[1:] {
        f, err := os.Open(filename)
        if err != nil {
            fmt.Fprintf(os.Stderr, "Problem reading %v: %v\n", filename, err)
            continue
        }
        input := bufio.NewScanner(f)
        for input.Scan() {
            line := input.Text()
            counts[line]++
            if lineCountsInFiles[line] == nil {
                lineCountsInFiles[line] = make(map[string]int)
            }
            lineCountsInFiles[line][filename]++
        }
        f.Close()
    }

    for line, n := range counts {
        if n > 1 {
            fmt.Printf("%v\n", line)
        }

        if n==1 {
            fmt.Printf("%v\n", line)
        }
    }
}
