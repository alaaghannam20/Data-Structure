class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;
  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void add(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}

Node<E>? removeduplicateitems<E>(Node<E>? head, E target) {
  while (head != null && head.value == target) {
    head = head.next;
  }

  if (head == null) {
    return head;
  }

  Node<E>? current = head;

  while (current != null && current.next != null) {
    if (current.next!.value == target) {
      current.next = current.next!.next;
    } else {
      current = current.next;
    }
  }
  return head;
}

void main(List<String> args) {
  LinkedList<dynamic> list = new LinkedList();
  list.add(1);
  list.add(4);
  list.add(14);
  list.add(12);
  list.add(1);
  list.add(11);
  list.add(1);
  list.add(1);
  list.add(9);
  print(list);
  list.head = removeduplicateitems(list.head, 1);
  print(list);
}
