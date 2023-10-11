/*3. Longest Substring Without Repeating Characters - Medium
 Topics - HashTable, String, Sliding window

 Given a string s, find the length of the longest
 substring without repeating characters.

 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.=

 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.*/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if(s.count == 1){
            return 1
        }
        var input = Array(s)
        var left = 0
        var right = 0
        var maxLen = 0
        var uniqueSet = Set<Character>()
        while right < input.count {
            if uniqueSet.contains(input[right]) {
                uniqueSet.remove(input[left])
                left += 1
            } else {
                uniqueSet.insert(input[right])
                right += 1
                maxLen = max(maxLen, right - left)
            }
        }
        return maxLen
    }
}
