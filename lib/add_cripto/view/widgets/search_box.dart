import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required TextEditingController controller,
    required Function onChanged,
  })  : _controller = controller,
        _onChanged = onChanged,
        super(key: key);

  final TextEditingController _controller;
  final Function _onChanged;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.white, // Your desired background color
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
              ),
            ],
          ),
          width: _size.width,
          child: TextField(
            controller: _controller,
            onChanged: (value) => _onChanged(),
            cursorColor: const Color(0xFF19152e),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              border: InputBorder.none,
              hintText: 'Buscar',
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(2),
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xFF19152e),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
