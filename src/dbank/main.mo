import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  // currentValue := 300;

  let id = 234782825835034;

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue))
    } else {
      Debug.print("Not enough amount to withdraw")
    };

  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }

}