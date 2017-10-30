def is_matched(expression):
    if expression == "":
        return False
    opening = set(list("{(["))
    stack = []
    for ch in expression:
        if ch in opening:
            stack.append(ch)
        elif not stack:
            return False
        elif (ch == "}" and stack[-1] == "{") or (ch == "]" and stack[-1] == "[") or (ch == ")" and stack[-1] == "("):
            stack.pop()
        else:
            return False
    if not stack:
        return True
    else:
        return False
