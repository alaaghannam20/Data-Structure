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
void printReversestack(List<dynamic> inputstack) {
  // Create a stack to store the elements
  List<dynamic> stack = [];

  // Push elements onto the stack
  for (var element in inputstack) {
    stack.add(element);
  }

  // Pop and print elements from the stack
  while (stack.isNotEmpty) {
    print(stack.removeLast());
  }
}

void main() {
  // Example usage
  List<dynamic> stack = [1, 2, 3, 4, 5];
  print("Original stack: $stack");

  print("List in Reverse Order:");
  printReversestack(stack);
}
