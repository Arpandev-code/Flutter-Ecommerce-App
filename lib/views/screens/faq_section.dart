import 'package:flutter/material.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Frequently Asked Questions",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(children: [
        Opacity(
            opacity: 0.17,
            child: Image.asset(
              "assets/images/Bg_image.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(height: 10, color: Colors.grey),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "About BuyIt",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "What is BuyIt Customer Care Number?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "I entered the wrong CVV, why did my transaction still go through?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "Can i edit my oreder?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "I want to cancle my order",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "will EatIt be accountable for quality/quantity?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "Is there a mininum ordr value?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "How long do you take to delivery?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const ExpansionTile(
                    tilePadding: EdgeInsets.all(8),
                    childrenPadding: EdgeInsets.all(8),
                    enableFeedback: false,
                    title: Text(
                      "Deactivate my account",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "EastIt is a food selling Platform for faster & secure delivery, we value our customer satisfaction"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
