abstract class QuantityState{}

class Increase extends QuantityState{
  var num;
  Increase(this.num);
}
class Decrease extends QuantityState{
  var num;
  Decrease(this.num);
}
class Loading extends QuantityState{}