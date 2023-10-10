/*347. Top K Frequent Elements - Medium

Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

Example 1:
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
 
Example 2:
Input: nums = [1], k = 1
Output: [1]
 

Constraints:
1 <= nums.length <= 105
-104 <= nums[i] <= 104
k is in the range [1, the number of unique elements in the array].
It is guaranteed that the answer is unique.
 

Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
*/

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencyMap: [Int: Int] = [:]
        
        // Count the frequency of each element
        for num in nums {
            frequencyMap[num, default: 0] += 1
        }
        
        // Create a min-heap to store the k most frequent elements
        var minHeap: [(Int, Int)] = []
        
        for (num, freq) in frequencyMap {
            if minHeap.count < k {
                minHeap.append((num, freq))
                if minHeap.count == k {
                    buildMinHeap(&minHeap)
                }
            } else if freq > minHeap[0].1 {
                minHeap[0] = (num, freq)
                heapifyDown(&minHeap, 0)
            }
        }
        
        // Extract the k most frequent elements from the min-heap
        let result = minHeap.map { $0.0 }
        
        return result
    }
    
    // Helper function to build a min-heap
    func buildMinHeap(_ arr: inout [(Int, Int)]) {
        for i in (0..<arr.count / 2).reversed() {
            heapifyDown(&arr, i)
        }
    }
    
    // Helper function to perform heapify down operation
    func heapifyDown(_ arr: inout [(Int, Int)], _ index: Int) {
        let leftChildIndex = 2 * index + 1
        let rightChildIndex = 2 * index + 2
        var smallestIndex = index
        
        if leftChildIndex < arr.count && arr[leftChildIndex].1 < arr[smallestIndex].1 {
            smallestIndex = leftChildIndex
        }
        
        if rightChildIndex < arr.count && arr[rightChildIndex].1 < arr[smallestIndex].1 {
            smallestIndex = rightChildIndex
        }
        
        if smallestIndex != index {
            arr.swapAt(index, smallestIndex)
            heapifyDown(&arr, smallestIndex)
        }
    }
}

// Example usage:
let solution = Solution()
let nums = [1, 1, 1, 2, 2, 3]
let k = 2
let result = solution.topKFrequent(nums, k)
print(result) // Output: [1, 2]
