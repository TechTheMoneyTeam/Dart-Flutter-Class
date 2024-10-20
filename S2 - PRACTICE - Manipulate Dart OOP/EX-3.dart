class MyDuration {

  final int _minute;

  get fromHours{
    return _minute / 60;
  }
  get fromMiniutes{
    return _minute;
  }
  get fromSeconds{
    return _minute * 60;
  }
  get fromMilliseconds{
    return _minute * 60000;
  }
  
  MyDuration.fromHours(int hours) : this.fromMiniutes(hours * 60);
  MyDuration.fromMiniutes(this._minute);
  MyDuration.fromSeconds(int seconds):this.fromMiniutes((seconds / 60) as int);

   


  // Display the duration in a readable format
  @override
  String toString() {
    int seconds1 = _minute *60;
    int seconds = seconds1 % 60;
    int minutes1 = (seconds1 / 60).floor();
    int minutes = minutes1 %60;
    int hours = (minutes1 / 60).floor();
  
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
  

MyDuration operator + (MyDuration other){
  return MyDuration.fromMiniutes(this._minute + other._minute);
}MyDuration operator - (MyDuration other){
  throw Exception('Error');
}
bool operator > (MyDuration other){
  return this._minute > other._minute;
 
 
}

}


void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMiniutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
