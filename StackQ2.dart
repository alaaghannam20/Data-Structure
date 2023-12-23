class Stack<E> {
  Stack() : stack = <E>[];
  final List<E> stack;
  void push(E element) => stack.add(element);

  E pop() => stack.removeLast();
  E get peek => stack.last;

  bool get isEmpty => stack.isEmpty;

  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return '--- Top ---\n'
        '${stack.reversed.join('\n')}'
        '\n-----------';
  }
}

bool isBalanced(String s) {
  Stack<String> stack = Stack<String>();

  for (int i = 0; i < s.length; i++) {
    String c = s[i];

    if ('({['.contains(c)) {
      stack.push(c);
    } 
    else if (')}]'.contains(c)) {
      
      if (stack.isEmpty) {
        return false; // Unmatched closing parenthesis, not balanced
      }

      String openParenthesis = stack.pop();
      if (!isMatchpair(openParenthesis, c)) {
        return false; // Mismatched opening and closing parenthesis, not balanced
      }
    }
  }

  return stack.isEmpty;
}

bool isMatchpair(String open, String close) {
  return (open == '(' && close == ')') ||
         (open == '{' && close == '}') ||
         (open == '[' && close == ']');
}

void main() {
  String s1 = "([{}])";
  String s2 = "{([{}])";

  print("Is balanced? ${isBalanced(s1)}"); 
  print("Is balanced? ${isBalanced(s2)}"); 
}
