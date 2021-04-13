package main

import (
	"encoding/hex"
	"os"
	// "math"
	"fmt"
	"io/ioutil"
	"log"
	"regexp"
	// "io"
	// "bufio"
)

func AppendFile(filename string, stringToAppend string) {
	file, err := os.OpenFile(filename, os.O_WRONLY|os.O_APPEND, 0644)
	if err != nil {
		log.Fatalf("failed opening file: %s", err)
	}
	defer file.Close()

	len, err := file.WriteString(stringToAppend)
	if err != nil {
		log.Fatalf("failed writing to file: %s", err)
	}
	//   fmt.Printf("\nLength: %d bytes", len)
	//   fmt.Printf("\nFile Name: %s", file.Name())
}

func main() {

	// buffer, err := os.Open("/home/jack/.cache/wal/colors.sh")
	buffer, err := ioutil.ReadFile("/home/jack/.cache/wal/colors.sh")

	if err != nil {
		panic(err)
	}
	// defer file.Close()

	// var lines []string

	// scanner := bufio.NewScanner(buffer)
	r, err := regexp.Compile("color[0-9]+='#([a-fA-F0-9]+)'")
	if err != nil {
		panic(err)
	}
	all_colors := r.FindAllSubmatch(buffer, -1)
	// new_colors := make([]string, len(all_colors))
	for colorNum, color := range all_colors {
		old_number := make([]byte, hex.DecodedLen(len(color[1])))

		n, err := hex.Decode(old_number, color[1])
		if err != nil {
			panic(err)
		}

		// fmt.Println(colorNum, string(color[1]))
		// fmt.Println("old_number",old_number,"n",n)
		// // fmt.Printf("%T : %v\n", n,n)
		new_number := make([]int, n)
		for i := 0; i < n; i++ {
			old_int := int(old_number[i])
			new_int := (255 - old_int) % 256
			new_number[i] = new_int
		}
		// fmt.Println("new number", new_number)
		new_hex := fmt.Sprintf("colorIn%d='#%X%X%X'\n", colorNum, new_number[0], new_number[1], new_number[2])
		AppendFile("/home/jack/.cache/wal/colors.sh", new_hex)

		// // fmt.Println("new hex", new_hex)
		// new_colors[colorNum] = new_hex
	}

	// for scanner.Scan() {
	//    	old_text := scanner.Text()
	// 	lines = append(lines, old_text)
	// 	if r.MatchString(old_text){
	// 		old_number := r.f
	// 	}
	// }

}
