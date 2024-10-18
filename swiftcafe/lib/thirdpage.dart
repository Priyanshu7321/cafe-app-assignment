import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CoffeeOrderPage extends StatefulWidget {
  const CoffeeOrderPage({Key? key}) : super(key: key);

  @override
  State<CoffeeOrderPage> createState() => _CoffeeOrderPageState();

}

class _CoffeeOrderPageState extends State<CoffeeOrderPage> {
  int selectedCups = 1; // Default selected cup value
  String selectedCupFilling = 'Full';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/coffee.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(bottom: 0),
          child: Stack(
            children: [
              _buildImageSection(),
              Align(alignment: Alignment.bottomCenter,child: _buildContentSection(),),
            ],
          ),
        ),
    );
  }

  Widget _buildImageSection() {
    return Image.asset(
      'assets/images/coffeebeans.png',
      height: 240,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }

  Widget _buildContentSection() {
    return Container(
      margin: const EdgeInsets.only(top: 230),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        image: const DecorationImage(
          image: AssetImage("assets/images/coffeebeans.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 240),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7),
                  _buildTitleSection(),
                  const SizedBox(height: 7),
                  _buildChoiceSection('Choice of Cup Filling', _buildCupFillingOptions()),
                  const SizedBox(height: 7),
                  _buildChoiceSection('Choice of Milk', _buildMilkOptions()),
                  const SizedBox(height: 7),
                  _buildChoiceSection('Choice of Sugar', _buildSugarOptions()),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                           Radius.circular(7),
                        ),
                        color: Colors.black54,
                      ),
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildHighPriorityCheckbox(),
                          _buildSubmitButton(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                ],
              ),
              // Aligning the Checkbox and Submit button at the bottom

            ],
          ),
        ),
      ),
    );
  }


  Widget _buildTitleSection() {
    return Container(child: Row(children:[Expanded(flex: 4,child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 2,),
        const Text(
          'Lattè',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children:  [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              SizedBox(width: 5),
              Text(
                '4.9 (458)',
                style: TextStyle(color: Colors.white,fontSize: 10),
              ),
              SizedBox(width: 5),
              Icon(Icons.verified, color: Colors.green, size: 16),
               Spacer(),
               _buildCupsDropdown()
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Caffè latte is a milk coffee that is made up of one or two shots of '
              'espresso, steamed milk, and a thin, final layer of frothed milk on top.',
          style: TextStyle(color: Colors.white60, fontSize: 10),
        ),
      ],
    ),
    ),

    ],
    )
    );
  }
  Widget _buildCupsDropdown() {
    return Container(
      width: 40, // Reduced width of the container
      height: 25, // Reduced height of the container
      padding: EdgeInsets.all(2), // Adjusted padding
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: DropdownButton<int>(
          value: selectedCups,
          items: List.generate(10, (index) => index + 1)
              .map(
                (e) => DropdownMenuItem(
              value: e,
              child: Container(
                height: 20, // Height for dropdown items
                alignment: Alignment.center, // Center align the text
                child: Text(
                  e.toString(),
                  style: TextStyle(fontSize: 12), // Adjusted font size
                  overflow: TextOverflow.ellipsis, // Prevent overflow of text
                ),
              ),
            ),
          )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCups = value!;
            });
          },
          dropdownColor: Colors.white,
          underline: SizedBox(), // Removes the default underline
          icon: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 1, // Width of the vertical line
                height: 15, // Height of the vertical line
                color: Colors.grey, // Color of the vertical line
              ),
              const SizedBox(width: 5), // Space between line and dropdown arrow
              Icon(Icons.arrow_drop_down, size: 16), // Default dropdown icon size
            ],
          ),
          isExpanded: true, // Expands the dropdown to fill available width
        ),
      ),
    );
  }




  Widget _buildChoiceSection(String title, Widget options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 7),
        options,
      ],
    );
  }

  Widget _buildCupFillingOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _CupOption(
            text: 'Full',
            isSelected: selectedCupFilling == 'Full',
            onPressed: () {
              setState(() {
                selectedCupFilling = 'Full';
              });
            },
          ),
          _CupOption(
            text: '1/2 Full',
            isSelected: selectedCupFilling == '1/2 Full',
            onPressed: () {
              setState(() {
                selectedCupFilling = '1/2 Full';
              });
            },
          ),
          _CupOption(
            text: '3/4 Full',
            isSelected: selectedCupFilling == '3/4 Full',
            onPressed: () {
              setState(() {
                selectedCupFilling = '3/4 Full';
              });
            },
          ),
          _CupOption(
            text: '1/4 Full',
            isSelected: selectedCupFilling == '1/4 Full',
            onPressed: () {
              setState(() {
                selectedCupFilling = '1/4 Full';
              });
            },
          ),
        ],
      ),
    );
  }


  Widget _buildMilkOptions() {
    return Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        _ToggleOption(text: 'Skim Milk'),
        _ToggleOption(text: 'Almond Milk'),
        _ToggleOption(text: 'Soy Milk'),
        _ToggleOption(text: 'Lactose Free Milk'),
      ],
    ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          _ToggleOption(text: 'Full Cream Milk'),
          _ToggleOption(text: 'Oat Milk', initialValue: true),
        ],
      ),
    ],
    );
  }

  Widget _buildSugarOptions() {
    return Row(children: [Expanded(child: Column(
      children: const [
        _ToggleOption(text: 'Sugar X1'),
        _ToggleOption(text: 'Sugar X2'),
      ],
    ),
    ),
      Container(width: 5,),
      Expanded(child: Column(
        children: const [
          _ToggleOption(text: '¼ Sugar'),
          _ToggleOption(text: 'No Sugar', initialValue: true),
        ],
      )
      ),
    ],
    );
  }

  Widget _buildHighPriorityCheckbox() {
    return Expanded(child: Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.red,
        ),
        const Text(
          'High Priority',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        Container(width: 3,),
        Image.asset("assets/images/errorinfo.png",width: 10,height: 10,)
      ],
    )
    );
  }

  Widget _buildSubmitButton() {
    return Expanded(child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Submit',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    )
    );
  }
}

class _ToggleOption extends StatefulWidget {
  final String text;
  final bool initialValue;

  const _ToggleOption({
    required this.text,
    this.initialValue = false,
  });

  @override
  State<_ToggleOption> createState() => _ToggleOptionState();
}

class _ToggleOptionState extends State<_ToggleOption> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          FlutterSwitch(
            value: isSelected,
            onToggle: (value) {
              setState(() {
                isSelected = value;
              });
            },
            height: 12,
            width: 25,
            toggleSize: 12,
            padding: 0,
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
          ),
          Container(width: 5,),
          Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),

        ],
      ),
    );
  }
}

class _CupOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const _CupOption({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white, // Change background color based on selection
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white70),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 10,color: isSelected ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}

