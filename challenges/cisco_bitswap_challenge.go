package main

import (
	"fmt"
)

/*
This problem was asked by Cisco.
Given an unsigned 8-bit integer, swap its even and odd bits. The 1st and 2nd bit should be swapped, the 3rd and 4th bit should be swapped, and so on.
For example, 10101010 should be 01010101. 11100010 should be 11010001.
Bonus: Can you do this in one line?
*/
func main() {
	samples := [2]byte{0xAA, 0xE2} // Hexdecimal representation of (10101010, 11100010)

	for _, sample := range samples {
		swapped := swap_even_and_odd_bits(sample)
		resultMessage := fmt.Sprintf("The %08b with even and odd bits swapped is: %08b", sample, swapped)
		fmt.Println(resultMessage)
	}
}

func swap_even_and_odd_bits(input byte) byte {
	even_bits := input & 0xAA
	odd_bits := input & 0x55
	even_bits_swapped := even_bits >> 1           // right shift even bits
	odd_bits_swapped := odd_bits << 1             // left shift odd bits
	return (even_bits_swapped | odd_bits_swapped) // bitwise or
}
