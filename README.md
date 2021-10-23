# demo_provider_flutter

There are 2 examples in the project.

The following parts help you to understand better what the project does



## Introduce

The project use package [provider](https://pub.dev/packages/provider). This is a approach for the beginner

The `provider` package is easy to understand and it doesn’t use much code



## Getting Started

Clone project 
`git clone https://github.com/phihung17k/seminar_fluttoter_provider.git`

Open terminal and run `flutter pub get`



## Description detail

You need to understand 3 concept:

- ChangeNotifier

- ChangeNotifierProvider

- Consumer

I have a example:

`You have a phone to call your parents. One day, you can not call they because your phone runs out of money. So what does it mean?`

When you can call your parents, it means you have money on your phone 

> state is money in your phone and money > 0

When you can `not` call, it means the money in your phone is exhausted

> state is money and money = 0

**Event Stream**

`Call button` -> `phone check money` 

* `money > 0` -> `continue connect to others`

* `money = 0` -> `notify to you through your phone` 

To do that, your phone have to subscribe `ChangeNotifier` to `notify` the money changes. And you need a `provider` to create `ChangeNotifier`, that is `ChangeNotifierProvider`. When money = 0, a notify is send to your phone. The screen receives the notify and change/display a line "Số tài khoản của bạn không đủ để thực hiện cuộc gọi này" .  This is process by `Consumer`

**Bonus:** use multiple provider by `MultiProvider`



### Step by Step

1. Subscribe `ChangeNotifier`
   
   ```dart
   class PhoneModel extends ChangeNotifier{
       int money;
       
       PhoneModel(this.money);
   
       void subtractMoney(){
           money -= 10;    //hard code for example
       }
   } 
   ```

2. Initialize `ChangeNotifier` by `ChangeNotifierProvider`
   
   ```dart
   void main() {
     runApp(
       ChangeNotifierProvider(
         create: (context) => PhoneModel(100), //init money = 100
         child: ...,
       ),
     );
   }
   ```

3. Display the money change by `Consumer`
   
   ```dart
   Consumer<PhoneModel>(
     builder: (context, phone, child) {
       if(phone.money == 0) {
           return Text("Total price: ${cart.totalPrice}");
       }
       //else do somthing
     },
   );
   ```

4. Now, you can call someone by set a event to your phone
   
   ```dart
   TextButton(
       onPressed: (){
           PhoneModel phone = 
                       Provider.of<PhoneModel>(context, listen = false);
           phone.subtractMoney();    //send a event
       }
   )
   ```

**Bonus:** You can use `context.watch<T>()` instead of `Provider.of<T>(context)` . And 

`context.read<T>()` instead of `Provider.of<T>(context, listen = false)` 

* `context.watch<T>()` , which makes the widget listen to changes on `T`

* `context.read<T>()`, which returns `T` without listening to it



### GOOD LUCK
