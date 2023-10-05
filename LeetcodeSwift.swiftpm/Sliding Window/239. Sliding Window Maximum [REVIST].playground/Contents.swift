/*239. Sliding Window Maximum - Hard
 Topics : Array
 Queue
 Sliding Window
 Heap (Priority Queue)
 Monotonic Queue
 

 You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

 Return the max sliding window.

  

 Example 1:

 Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
 Output: [3,3,5,5,6,7]
 Explanation:
 Window position                Max
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
  

 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length*/


import Foundation
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var output = [Int]()
        var queue = [Int]() // Stores indices
        var left = 0
        var right = 0
        
        for r in 0..<nums.count {
            // Pop smaller values from the queue
            while !queue.isEmpty && nums[queue.last!] < nums[r] {
                queue.removeLast()
            }
            queue.append(r)
            
            // Remove left value from the window
            if left > queue.first! {
                queue.removeFirst()
            }
            
            if r - left + 1 >= k {
                output.append(nums[queue.first!])
                left += 1
            }
        }
        
        return output
    }
}
