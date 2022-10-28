import 'package:flutter/material.dart';
import '../datamanager.dart';
import '../datamodel.dart';

class OrderPage extends StatefulWidget {
  //recieving the same property data manager
  final DataManager dataManager;
  //taking data manager arguement
  const OrderPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.dataManager.cart.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Your Cart is empty",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: widget.dataManager.cart.length,
              itemBuilder: (context, index) {
                var item = widget.dataManager.cart[index];
                return OrderItem(
                    item: item,
                    onRemove: (product) {
                      setState(() {
                        widget.dataManager.cartRemove(product);
                      });
                    });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Total: \$${widget.dataManager.cartTotal().toStringAsFixed(2)}"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const OrderAlert());
                      setState(() {
                        // we update the cart within setState so the current widget will get re-rendered
                        widget.dataManager.cartClear();
                      });
                    },
                    child: const Text("Send Order")),
              ),
            )
          ],
        ),
      );
    }
  }
}

//this will render a item (likely in a row), has its own delete button(onRemove)
class OrderItem extends StatelessWidget {
  final ItemInCart item;
  //the delete
  final Function onRemove;
  const OrderItem({Key? key, required this.item, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1, //10% width
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${item.quantity}x"),
                )),
            Expanded(
                flex: 6, //60% width
                child: Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 2, //20% width
                child: Text(
                    "\$${(item.product.price * item.quantity).toStringAsFixed(2)}")),
            Expanded(
                flex: 1, //10% width
                child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      onRemove(item.product);
                    },
                    icon: const Icon(Icons.delete)))
          ],
        ),
      ),
    );
  }
}

class OrderAlert extends StatelessWidget {
  const OrderAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Your Order"),
      content: const Text("Your order is being prepared. Thanks!"),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'))
      ],
    );
  }
}
