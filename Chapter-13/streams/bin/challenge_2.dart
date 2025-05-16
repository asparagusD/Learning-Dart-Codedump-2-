import 'dart:async';
import 'dart:math';

enum Coin { heads, tails }

class CoinFlippingService {
  final _controller = StreamController<Coin>();

  Stream<Coin> get onFlip => _controller.stream;

  Future<void> start() async {
    for (int i = 0; i < 10; i++) {
      Future.delayed(
        Duration(milliseconds: 500 * i),
        () => _controller.add(
          Random().nextBool() ? Coin.heads : Coin.tails,
        ),
      );
    }
  }

  void dispose() => _controller.close();
}

Future<void> main() async {
  final coinFlipper = CoinFlippingService();

  coinFlipper.onFlip.listen((coin) {
    print(coin);
  });
  coinFlipper.start();
}
