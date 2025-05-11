void main() {
  List<Object> snacks = ['chips', 'nuts', 42];
  List<int> integerList = [3, 1, 4];
  List<double> doubleList = [3.14, 8.0, 0.001];
  List<bool> booleanList = [true, false, false];
  Set<int> integerSet = {3, 1, 4};
  Map<int, String> intToStringMap = {
    1: 'one',
    2: 'two',
    3: 'three',
  };

  final intTree = createIntTree();
  final stringTree = createStringTree();

  final tree = createTree([
    'seven',
    'one',
    'nine',
    'zero',
    'five',
    'eight',
  ]);

  print(tree?.value);
  print(tree?.leftChild?.value);
  print(tree?.rightChild?.value);
  print(tree?.leftChild?.leftChild?.value);
  print(tree?.leftChild?.rightChild?.value);
  print(tree?.rightChild?.leftChild?.value);
  print(tree?.rightChild?.rightChild?.value);

  var treeBST = BinarySearchTree<num>();
  treeBST.insert(7);
  treeBST.insert(1);
  treeBST.insert(9);
  treeBST.insert(0);
  treeBST.insert(5);
  treeBST.insert(8);

  print(treeBST);
}

class IntNode {
  IntNode(this.value);
  int value;

  IntNode? leftChild;
  IntNode? rightChild;
}

Node<int> createIntTree() {
  final zero = Node(0);
  final one = Node(1);
  final five = Node(5);
  final seven = Node(7);
  final eight = Node(8);
  final nine = Node(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

class StringNode {
  StringNode(this.value);
  String value;

  StringNode? leftChild;
  StringNode? rightChild;
}

Node<String> createStringTree() {
  final zero = Node('zero');
  final one = Node('one');
  final five = Node('five');
  final seven = Node('seven');
  final eight = Node('eight');
  final nine = Node('nine');

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

class Node<T> {
  Node(this.value);
  T value;

  Node<T>? leftChild;
  Node<T>? rightChild;

  @override
  String toString() {
    final left = leftChild?.toString() ?? '';
    final parent = value.toString();
    final right = rightChild?.toString() ?? '';

    return '$left $parent $right';
  }
}

Node<E>? createTree<E>(List<E> nodes, [int index = 0]) {
  if (index >= nodes.length) return null;

  final node = Node(nodes[index]);
  final leftChildIndex = 2 * index + 1;
  final rightChildIndex = 2 * index + 2;

  node.leftChild = createTree(nodes, leftChildIndex);
  node.rightChild = createTree(nodes, rightChildIndex);

  return node;
}

class BinarySearchTree<E extends Comparable<E>> {
  Node<E>? root;

  @override 
  String toString() => root.toString();

  void insert(E value) {
    root = _insertAt(root, value);
  }

  Node<E> _insertAt(Node<E>? node, E value) {
    if (node == null) {
      return Node(value);
    }

    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    return node;
  }
}