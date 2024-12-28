```go
func swapBits(n uint8) uint8 {
    b := []byte{(n >> 7) & 1, (n >> 6) & 1, (n >> 5) & 1, (n >> 4) & 1, 
                 (n >> 3) & 1, (n >> 2) & 1, (n >> 1) & 1, n & 1}
    return uint8(0b11001100 | uint8(b[7>>&0x01)<<6|uint8(b[6]&0x01)<<5|uint8(b[5]&0x01)<<4|
        uint8(b[4]&0x01)<<3|uint8(b[3]&0x01)<<2|uint8(b[2]&0x01)<<1|uint8(b[1]&0x01)<<0)
}
```