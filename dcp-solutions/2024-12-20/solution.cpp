```cpp
class Solution {
public:
    vector<int> goldbachEven(int n) {
        vector<int> res;
        for (int i = 2; i <= n / 2; ++i) {
            if (isPrime(i)) {
                int j = n - i;
                if (isPrime(j)) {
                    return {min(i, j), max(i, j)};
                }
            }
        }
        throw runtime_error("No valid pair found");
    }

private:
    bool isPrime(int num) {
        for (int i = 2; i <= sqrt(num); ++i) {
            if (num % i == 0)
                return false;
        }
        return true;
    }
};
```