```c
#include <stdio.h>
#include <stack>

int is_balanced(const char *s) {
    stack<char> st;
    for (const char *p = s; *p != '\0'; ++p) {
        if (*p == '(' || *p == '*') {
            st.push(*p);
        } else if (*p == ')') {
            if (st.empty()) return 0;
            if (st.top() == '*' || st.top() == '(') {
                st.pop();
            } else if (st.top() == '*') {
                while (!st.empty() && st.top() != '(') {
                    st.pop();
                }
                if (st.empty() || st.top() != '(') return 0;
                st.pop();
            }
        }
    }
    return st.empty();
}
```