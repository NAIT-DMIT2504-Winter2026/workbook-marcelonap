import 'package:async_tutorial/async_tutorial.dart' as async_tutorial;


String createOrderMessage()  {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(const Duration(seconds: 2), () => 'Large Latte');

void main() async {
  print( await createOrderMessage());
}
