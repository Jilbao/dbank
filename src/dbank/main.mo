import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;
  // Debug.print(debug_show(currentValue));
  
  stable var startTime: Int = Time.now();
  // startTime := Time.now();
  // Debug.print(debug_show(startTime));

  let id = 123213444234234;

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func topDown(amount: Float){
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else {
      Debug.print("currentValue can not be negative!");
    }
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public query func checkTime(): async Int {
    return startTime;
  };

  




}


