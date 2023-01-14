/*
Problem:
- Given a list of intervals, return a list of intervals where
  overlapping intervals have been merged.

Questions:
- Interval [1,2] and [2,4] are overlapping.
- Assume [a, b] a <= b
- Assume 0 <= a, b <= 10^4
- Assume interval format [a,b]
- Assume at least one interval in list

Input/Output:
- Input: [[Int]]
- Output: [[Int]]

Examples:
- [[1,2], [1,1]] => [[1,2]]
- [[1,1]] => [[1,1]]
- [[1,10],[2,5]] => [1,10]

Algorithm:
- Sort intervals by start times
- Merge first interval to result list
- Enumerate over list of intervals starting from second interval if exisits
    - Compare last interval in result list with next interval
    - Merge required if interval1.last >= interval2.first
        - Merge [interval1.first, max(interval2.last, interval1.last)]
    - Else, append to result
*/

func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 0 else { return intervals }

    var intervals = intervals.sorted {
        $0.start < $1.start
    }

    var result: [[Int]] = []
    result.append(intervals.first!)

    for i in intervals.indices where i > 0 {
        let interval1 = result.last!
        let interval2 = intervals[i]
        if interval1.end >= interval2.start {
            result[result.count - 1] = [interval1.start, max(interval1.end, interval2.end)]
        } else {
            result.append(interval2)
        }
    }

    return result
}

extension Array where Element == Int {
var start: Int {
    self[0]
}
var end: Int {
    self[1]
}
}