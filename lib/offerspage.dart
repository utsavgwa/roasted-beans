import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
        Offer(
          title: "Best Offer",
          description: "Buy 1, get 1",
        ),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  //properties
  final String title;
  final String description;

  const Offer({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          color: Colors.amber.shade50,
          elevation: 8,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "images/background.png",
                ),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: Container(
                      color: Colors.amber.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: Container(
                      color: Colors.amber.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
