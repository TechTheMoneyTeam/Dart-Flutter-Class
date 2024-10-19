

class BankAccount {
  int accountid;
  String accountowner;
  double balance=0;
  BankAccount(this.accountid,this.accountowner);

  void showbalance(){
    print(balance);
  }
  void withdraw(double amount){
    if(balance > amount){
    balance = balance - amount;
   }
  else {
    throw Exception ('error');
  }}
  void credit(double amount){
    balance = amount + balance;
  }

}
class Bank {
  String name;
  Map<int, BankAccount> account = {};
  Bank(this.name);
  BankAccount createAccount(int? accountid, String? accountowner) {
    if (account.containsKey(accountid)) {
      throw Exception('error all ready');
    }
    BankAccount newacc = BankAccount(accountid!, accountowner!);
    account[accountid] = newacc;
    return newacc;
  }
}
 
void main() {

  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
