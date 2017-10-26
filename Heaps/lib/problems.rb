# Check if parenthesis are matched, in python
# def is_matched(expression):
#     if expression == "":
#         return False
#     opening = set(list("{(["))
#     stack = []
#     for ch in expression:
#         if ch in opening:
#             stack.append(ch)
#         elif not stack:
#             return False
#         elif (ch == "}" and stack[-1] == "{") or (ch == "]" and stack[-1] == "[") or (ch == ")" and stack[-1] == "("):
#             stack.pop()
#         else:
#             return False
#     if not stack:
#         return True
#     else:
#         return False

# Construct a MaxStack, in JS
# class MaxStack {
#   constructor(){
#     this.store = [];
#     this.maxes = [];
#   }
#
# 	push(n) {
#     this.store.unshift(n);
#     if (this.maxes.length === 0 || this.maxes[0] <= n) {
#       this.maxes.unshift(n);
#     }
# 	}
#
# 	pop() {
#     const value = this.store.shift();
#     if (value === this.maxes[0]) {
#       this.maxes.shift();
#     }
#     return value;
# 	}
#
# 	max() {
# 		return this.maxes[0];
# 	}
# }
#
# let stack = new MaxStack();
