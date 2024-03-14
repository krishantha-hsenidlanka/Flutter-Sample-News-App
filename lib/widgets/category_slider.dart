import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategorySlider extends StatefulWidget {
  final List<Category> categories;
  final Function(String) onCategorySelected;

  CategorySlider({required this.categories, required this.onCategorySelected});

  @override
  _CategorySliderState createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  int _selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                  widget.onCategorySelected(widget.categories[index].name);
                },
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 150,
                  child: InkWell(
                    // Wrap the image container with another InkWell
                    onTap: () {
                      // Handle image container click here if needed
                    },
                    splashColor: const Color.fromARGB(255, 21, 23, 24),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(141, 0, 0, 0),
                            const Color.fromARGB(41, 4, 21, 77)
                                .withOpacity(0.9),
                          ],
                        ),
                        image: DecorationImage(
                          image: AssetImage(widget.categories[index].imagePath),
                          fit: BoxFit.cover,
                          opacity: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.categories[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            shadows: const [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
