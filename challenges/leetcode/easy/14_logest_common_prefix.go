/*
14. Longest Common Prefix
Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:
Input: strs = ["flower","flow","flight"]
Output: "fl"

Example 2:
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.

Constraints:
1 <= strs.length <= 200
0 <= strs[i].length <= 200

strs[i] consists of only lowercase English letters.
*/
package main

func longestCommonPrefix(strs []string) string {
	if len(strs) == 1 {
		return strs[0]
	}

	prefix := strs[0]
	for _, str := range strs {
		i := 0
		for i < len(str) && i < len(prefix) && str[i] == prefix[i] {
			i++
		}
		prefix = str[:i]
	}
	return prefix
}
