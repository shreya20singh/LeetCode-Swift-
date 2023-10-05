/*875. Koko Eating Bananas - Medium
 Topics - Binary Search

 Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.

 Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.

 Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

 Return the minimum integer k such that she can eat all the bananas within h hours.

  

 Example 1:
 Input: piles = [3,6,7,11], h = 8
 Output: 4
 
 Example 2:
 Input: piles = [30,11,23,4,20], h = 5
 Output: 30
 
 Example 3:
 Input: piles = [30,11,23,4,20], h = 6
 Output: 23
  

 Constraints:

 1 <= piles.length <= 104
 piles.length <= h <= 109
 1 <= piles[i] <= 109
 
 Hint: https://www.youtube.com/watch?v=U2SozAs9RzA I used this video to understand the approach and the problem.
 */

class Solution {
    func findMinSpeed(piles:[Int], h:Int, left:Int, right:Int) -> Int{
        var left = left
        var right = right
        var res = right
        while left <= right {
            var hourCount = 0
            var mid = (left + right) / 2
            for i in piles {
                hourCount += (i + mid - 1) / mid
            }
            if hourCount <= h {
                res = min(res, mid)
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return res
    }
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var k = 0
        var maxPile = 0
        for i in piles {
            if i > maxPile {maxPile = i} else {continue}
        }

        var left = 1
        var right = maxPile
        return findMinSpeed(piles: piles, h: h, left:left, right: right)
    }
}
