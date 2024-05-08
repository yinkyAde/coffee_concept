import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nescafe_concept/coffee.dart';

class CoffeeConceptList extends StatefulWidget {
  const CoffeeConceptList({super.key});

  @override
  State<CoffeeConceptList> createState() => _CoffeeConceptListState();
}

class _CoffeeConceptListState extends State<CoffeeConceptList> {
  final _pageCoffeeController = PageController(
    viewportFraction: 0.3,
  );

  final _pageTextController = PageController(
  );

  double _currentPage = 0.0;
  double _currentTextPage = 0.0;

  void _coffeeScrollListener(){
    setState(() {
      _currentPage = _pageCoffeeController.page!;
    });
  }

  void _textScrollListener(){
    setState(() {
      _currentTextPage = _pageTextController.page!;
    });
  }

  @override
  void initState() {
    _pageCoffeeController.addListener(_coffeeScrollListener);
    _pageTextController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageCoffeeController.removeListener(_coffeeScrollListener);
    _pageTextController.removeListener(_textScrollListener);
    _pageCoffeeController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: _duration,
            decoration: BoxDecoration(
              gradient: coffeeGradients[_currentPage.toInt()],
            ),
          ),
          Positioned(
              left: 20.0,
              right: 20.0,
              bottom: -size.height*0.23,
              height: size.height*0.3,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown,
                      blurRadius: 90,
                      offset: Offset.zero,
                      spreadRadius: 45,
                    )
                  ]
                ),
              )),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
                onPageChanged: (value) {
                  if (value < coffees.length) {
                    _pageTextController.animateToPage(value,
                        duration: _duration, curve: Curves.easeOut);
                  }
                },
                controller: _pageCoffeeController,
              scrollDirection: Axis.vertical,
              itemCount: coffees.length,
                itemBuilder: (context, index) {
                if(index == 0){
                  return const SizedBox.shrink();
                }
              final coffee = coffees[index];
              final result = _currentPage - index + 1;
              final value  = -0.4* result + 1;
              final opacity = value.clamp(0.0, 1.0);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..translate(
                              0.0,
                              size.height /
                                  2.6 *
                                  (1 - value).abs())
                          ..scale(value),
                        child: Opacity(
                            opacity: opacity, child: Image.asset(coffee.image,fit: BoxFit.fitHeight,))),
                  );
                }),
          ),
          Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              height: 220.0,
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                        controller: _pageTextController,
                          itemCount: coffees.length,
                          physics: const NeverScrollableScrollPhysics( ),
                          itemBuilder: (context, index) {
                          final opacity = (1 - (index - _currentTextPage).abs()).clamp(0.0, 1.0);
                            return Opacity(
                              opacity: opacity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.2, vertical: 64.0),
                                child: Text(coffees[index].name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w800
                                ),),
                              ),
                            );
                          })),
                  // const SizedBox(height: 4.0,),
                  AnimatedSwitcher(
                    duration: _duration,
                    key: Key(coffees[_currentPage.toInt()].name),
                    child: Text(
                      "N ${coffees[_currentPage.toInt()].price.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 22.0),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

const _duration = Duration(milliseconds: 300);