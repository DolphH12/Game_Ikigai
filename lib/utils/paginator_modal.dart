import 'package:flutter/material.dart';

import 'rounded_button.dart';

class PaginatorModal extends StatefulWidget {
  final VoidCallback onComplete;
  final Map<String, dynamic> logroData;
  const PaginatorModal(
      {super.key, required this.onComplete, required this.logroData});

  @override
  State<PaginatorModal> createState() => _PaginatorModalState();
}

class _PaginatorModalState extends State<PaginatorModal> {
  int _currentPage = 0;
  final int totalPages = 3;
  final PageController _pageController = PageController();

  // Cambiar página con botones
  void _goToNextPage() {
    setState(() {
      if (_currentPage < totalPages - 1) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        // Cierra el modal cuando llegue a la última página y se le da siguiente
        Navigator.of(context).pop();
        widget.onComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 132, 146, 255),
                Color.fromARGB(255, 211, 199, 255),
                Color.fromARGB(255, 101, 106, 168),
              ]),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.logroData['title'],
                        style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PixelifySans',
                          color: Color.fromARGB(255, 255, 255, 255),
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (widget.logroData['subtitle_1'] != null)
                        Text(
                          widget.logroData['subtitle_1'] ?? '',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PixelifySans',
                            color: Color.fromARGB(255, 250, 46, 46),
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                offset: Offset(4, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: 20),
                      if (widget.logroData['contenido_1'] != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            widget.logroData['contenido_1'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      if (widget.logroData['num_sub_1'] != null)
                        ...widget.logroData['num_sub_1'].map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ), // Espaciado entre textos
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check),
                                Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ), // Tamaño de texto
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.logroData['subtitle_2'] != null)
                        Text(
                          widget.logroData['subtitle_2'] ?? '',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PixelifySans',
                            color: Color.fromARGB(255, 250, 46, 46),
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                offset: Offset(4, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (widget.logroData['imagen'] != null)
                        Expanded(
                          child: SingleChildScrollView(
                            child: Center(
                              child: Image.asset(
                                widget.logroData['imagen'],
                                width: widget.logroData['isMobile'] ?? false
                                    ? MediaQuery.of(context).size.width * 0.2
                                    : MediaQuery.of(context).size.width * 0.6,
                              ),
                            ),
                          ),
                        ),
                      if (widget.logroData['num_sub_2'] != null)
                        ...widget.logroData['num_sub_2'].map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ), // Espaciado entre textos
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check),
                                Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ), // Tamaño de texto
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      if (widget.logroData['contenido_2'] != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            widget.logroData['contenido_2'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.logroData['subtitle_3'] != null)
                        Text(
                          widget.logroData['subtitle_3'] ?? '',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PixelifySans',
                            color: Color.fromARGB(255, 250, 46, 46),
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                offset: Offset(4, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: 20),
                      if (widget.logroData['contenido_3'] != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            widget.logroData['contenido_3'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      if (widget.logroData['num_sub_3'] != null)
                        ...widget.logroData['num_sub_3'].map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ), // Espaciado entre textos
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check),
                                Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ), // Tamaño de texto
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                    ],
                  ),
                ],
              ),
            ),
            RoundedButton(
              onPressed: () {
                _goToNextPage();
              },
              text: _currentPage == totalPages - 1
                  ? widget.logroData['label_btn']
                  : 'Siguiente',
            ),
          ],
        ),
      ),
    );
  }
}
