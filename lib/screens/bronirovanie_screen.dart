import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_bloc.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_event.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_state.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';
import 'package:rent_a_car_auto/data/bronirovanie.dart';
import 'package:rent_a_car_auto/screens/homescreen.dart';
import 'package:rent_a_car_auto/screens/katalog_screen.dart';

import 'package:rent_a_car_auto/styles/bronirovanie_style.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';
import 'package:rent_a_car_auto/widgets/appbar_widget.dart';


class BronirovanieScreen extends StatefulWidget{
  BronirovanieScreen({Key? key}) : super(key: key);
  @override
  State<BronirovanieScreen> createState() => _BronirovanieScreenState();
}

class _BronirovanieScreenState extends State<BronirovanieScreen> {

  final _formInfoKey = GlobalKey<FormState>();
  final _formDetailsKey = GlobalKey<FormState>();
  final _dostavkaKey = GlobalKey<FormState>();
  final _dopKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _telefonNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _adresDostavkaController = TextEditingController();
  final _adresVozwratController = TextEditingController();
  final _shooseAutoController = TextEditingController();
  final _dopController = TextEditingController();



  String? header;
  DateTime? _dateTime;
  DateTime? _endDateTime;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  bool shoose1 = false;
  bool shoose2 = false;
  bool shoose3 = false;

  Future<TimeOfDay> _selectEndTime (BuildContext context) async{
    final TimeOfDay? endPicked = await showTimePicker(
      context: context, 
      initialTime: _endTime ?? TimeOfDay.now()
    );
    if (endPicked != null && endPicked != _endTime) {
      setState(() {
        _endTime = endPicked;
      });
    }
    return _endTime!;
  }

  Future<TimeOfDay> _selectStartTime (BuildContext context) async{
    final TimeOfDay? picked = await showTimePicker(
      context: context, 
      initialTime: _startTime ?? TimeOfDay.now()
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
    return _startTime!;
  }

  
  Future<DateTime> _selectDate (BuildContext context) async{
  DateTime? dateTime = await showDatePicker(
    context: context, 
    initialDate: _dateTime ?? DateTime.now(),
    firstDate: DateTime(2025), 
    lastDate: DateTime(2101)
  );
  if(dateTime != null && dateTime != _dateTime) {
    setState(() {
      _dateTime = dateTime;
    });
  }
  return dateTime!;
}

Future<DateTime> _selectEndDate (BuildContext context) async{
  DateTime? endDateTime = await showDatePicker(
    context: context, 
    initialDate: _endDateTime ?? DateTime.now(),
    firstDate: DateTime(2025), 
    lastDate: DateTime(2101)
  );
  if(endDateTime != null && endDateTime != _endDateTime) {
    setState(() {
      _endDateTime = endDateTime;
    });
  }
  return endDateTime!;
}

  @override
  void dispose () {
    _nameController.dispose();
    _lastNameController.dispose();
    _telefonNumberController.dispose();
    _emailController.dispose();
    _adresDostavkaController.dispose();
    _adresVozwratController.dispose();
    _shooseAutoController.dispose();
    _dopController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void submitForm() {
      if(_formInfoKey.currentState!.validate() && 
         _dateTime != null && _endDateTime != null && 
         _startTime != null && _endTime != null) {
        _formInfoKey.currentState!.save();
        
        final newBooking = BronirovanieCustomer(
          firstName: _nameController.text, 
          lastName: _lastNameController.text, 
          phone: _telefonNumberController.text,
          comment: _dopController.text,
          endDate: _endDateTime!,
          endTime: _endTime!,
          startDate: _dateTime!,
          startTime: _startTime!
        );
        
        context.read<BronirovanieBloc>().add(BronirovanieCustAdd(newBooking));
      } else {
        // Показываем ошибку если не все поля заполнены
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Пожалуйста, заполните все обязательные поля'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double buttonWidth =  width < 945 ? width * 0.15 : width * 0.1;
    double buttonHeight = width < 945 ? height * 0.07 : height * 0.055;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppbarWidget(),
      body: BlocListener<BronirovanieBloc, BronirovanieState>(
        listener: (context, state) {
          if (state is BronirovanieLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Бронирование успешно создано!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          } else if (state is BronirovanieError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Ошибка: ${state.message}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: 
          LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth < 600) {
                return ListView(
                  children: [
                    Container(
                      width: width,
                      height: height * 2.4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromRGBO(0, 0, 0, 1),
                          Color.fromRGBO(0, 0, 0, 1),
                          Color.fromRGBO(17, 24, 39, 1),
                        ]
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Text('Бронирование автомобиля',
                              style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Flexible(
                              child: Text('Заполните форму ниже, и наш менеджер свяжется с вами для подтверждения деталей',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  color: Color.fromRGBO(156, 163, 175, 1),
                                  fontWeight: FontWeight.w400
                                ),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: width * 0.03),
                              child: Container(
                                width: width ,
                                height: height * 1.57,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  color: Color.fromRGBO(31, 41, 55, 1)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.02),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: width * 0.47,
                                            height: height * 0.52,
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Личная информация',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                                Form(
                                                  key: _formInfoKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textFields('Пожалуйста введите имя пользователя', 'Ваня Иванов', 'Полное имя *', context, _nameController),
                                                      textFields('Пожалуйста введите номер телефона', '+7(999) 123-45-67', 'Телефон *', context, _telefonNumberController),
                                                      textFields('Пожалуйста введите email', 'ivan@gmail.com', 'Email *', context, _emailController)
                                                    ],
                                                  )
                                                  )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.49,
                                            height: height * 0.52,
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Детали аренды',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                                Form(
                                                  key: _formDetailsKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      textFields('Пожалуйста выберите автомобиль', 'Выберите автомобиль', 'Выберите автомобиль *', context, _shooseAutoController),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                        ),
                                                        child: Container(
                                                            width: width * 0.6,
                                                            height: height * 0.15,  
                                                            color: Colors.transparent,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text('Дата начала *',
                                                                    style: BronirovanieStyle.popravka(context),
                                                                  ),
                                                                  Container(
                                                                    width: width * 0.22,
                                                                    height: height * 0.065,
                                                                    decoration: BoxDecoration(
                                                                      color: Color.fromRGBO(55, 65, 81, 1),
                                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                    ),
                                                                    child: GestureDetector(
                                                                      onTap: () => _selectDate(context),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Center(
                                                                            child: Text(
                                                                              _dateTime == null ? '-/-/-' : DateFormat('yyyy-MM-dd').format(_dateTime!),
                                                                                style: TextStyle(
                                                                                  fontSize: width * 0.01,
                                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                                  fontWeight: FontWeight.w400
                                                                                ),
                                                                            ),
                                                                            ),
                                                                            Center(
                                                                              child: Image.asset('assets/images/Vector.png',
                                                                              fit: BoxFit.cover,
                                                                              width: 13,
                                                                              height: 13,
                                                                              )
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )
                                                                    )  
                                                                  )
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text('Дата окончания *',
                                                                    style: BronirovanieStyle.popravka(context),
                                                                  ),
                                                                  Container(
                                                                    width: width * 0.22,
                                                                    height: height * 0.065,
                                                                    decoration: BoxDecoration(
                                                                      color: Color.fromRGBO(55, 65, 81, 1),
                                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                    ),
                                                                    child: GestureDetector(
                                                                      onTap: () => _selectEndDate(context),
                                                                      child: Padding(
                                                                            padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Center(
                                                                                child: Text(
                                                                                  _endDateTime == null ? '-/-/-' : DateFormat('yyyy-MM-dd').format(_endDateTime!),
                                                                                    style: TextStyle(
                                                                                      fontSize: width * 0.01,
                                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                                      fontWeight: FontWeight.w400
                                                                                    ),
                                                                                ),
                                                                                ),
                                                                                Center(
                                                                                  child: Image.asset('assets/images/Vector.png',
                                                                                  fit: BoxFit.cover,
                                                                                  width: 13,
                                                                                  height: 13,
                                                                                  )
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        )   
                                                                      ),
                                                                ],
                                                              )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: width * 0.001),
                                                        child: Container(
                                                          width: width * 0.49,
                                                          height: height * 0.15,
                                                          color: Colors.transparent,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('Время начала *',
                                                                  style: BronirovanieStyle.popravka(context),
                                                                ),
                                                                Container(
                                                                  width: width * 0.22,
                                                                  height: height * 0.065,
                                                                  decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(55, 65, 81, 1),
                                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                  ),
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      shadowColor: Colors.transparent,
                                                                      backgroundColor: Colors.transparent
                                                                    ),
                                                                    onPressed: () {
                                                                      _selectStartTime(context);
                                                                    }, 
                                                                    child: Text(_startTime == null ? 'Время не выбрано' : '${_startTime!.format(context)}',
                                                                     style: TextStyle(
                                                                        fontSize: width * 0.02,
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontWeight: FontWeight.w400
                                                                      ),
                                                                    )
                                                                  )
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('Время окончания *',
                                                                  style: BronirovanieStyle.popravka(context),
                                                                ),
                                                                Container(
                                                                  width: width * 0.22,
                                                                  height: height * 0.065,
                                                                  decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(55, 65, 81, 1),
                                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                  ),
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      shadowColor: Colors.transparent,
                                                                      backgroundColor: Colors.transparent
                                                                    ),
                                                                    onPressed: () {
                                                                      _selectEndTime(context);
                                                                    }, 
                                                                    child: Text(_endTime == null ? 'Время не выбрано' : '${_endTime!.format(context)}',
                                                                     style: TextStyle(
                                                                                fontSize: width * 0.02,
                                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                                fontWeight: FontWeight.w400
                                                                              ),
                                                                    )
                                                                  )
                                                                )
                                                              ],
                                                            )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: height * 0.05),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width: width * 0.36,
                                            height: height * 0.40,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Дополнительные услуги',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                                Form(
                                                  key: _dostavkaKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textFields('Пожалуйста введите адрес доставки', 'Моска ул.Тверская, 15', 'Адрес доставки', context, _adresDostavkaController),
                                                      textFields('Пожалуйста введите дрес возврата', 'Моска ул.Тверская, 15', 'Адрес возврата', context, _adresVozwratController)
                                                    ],
                                                  )
                                                  )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.49,
                                            height: height * 0.40,
                                            color: Colors.transparent,
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: height * 0.1),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Тип страхования',
                                                  style: BronirovanieStyle.title(context),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose1, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose1 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Стандартное (включено)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.025,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose2, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose2 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Премиум(+2000 ₽/день)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.025,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose3, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose3 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Услуги водителя (+3000 ₽/день)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.025,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              ),
                                          )
                                        ],
                                      ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: height * 0.05),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: height * 0.014),
                                              child: Text('Дополнительные пожелания',
                                                style: BronirovanieStyle.popravka(context),
                                              ),
                                            ),
                                            Container(
                                              width: width ,
                                              height: height * 0.2,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(55, 65, 81, 1),
                                                borderRadius: BorderRadius.all(Radius.circular(8))
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(),
                                                child: Form(
                                                  key: _dopKey,
                                                  child: TextFormField(
                                                    textAlign: TextAlign.start,
                                                    textAlignVertical: TextAlignVertical.top,
                                                    expands: true,
                                                    maxLines: null,
                                                    minLines: null,
                                                    controller: _dopController,
                                                    decoration: InputDecoration(
                                                      hintText: 'Расскажите о вашиъ пожеланиях или требованиях...',
                                                      hintStyle:  TextStyle(
                                                        color: Color.fromRGBO(95, 94, 94, 1)
                                                      ), 
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide.none
                                                      )
                                                    ),
                                                  
                                                  )
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: height * 0.05),
                                              child: Center(
                                                child: Container(
                                                width: width * 0.3,
                                                height: height * 0.07,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                                                  ),
                                                  onPressed: submitForm, 
                                                  child: BlocBuilder<BronirovanieBloc, BronirovanieState>(
                                                    builder: (context, state) {
                                                      if (state is BronirovanieLoading) {
                                                        return Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            SizedBox(
                                                              width: 16,
                                                              height: 16,
                                                              child: CircularProgressIndicator(
                                                                color: Colors.black,
                                                                strokeWidth: 2,
                                                              ),
                                                            ),
                                                            SizedBox(width: 8),
                                                            Text('Отправка...',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: width * 0.025,
                                                                fontWeight: FontWeight.w700
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }
                                                      return Text('Забронировать',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: width * 0.025,
                                                          fontWeight: FontWeight.w700
                                                        ),
                                                      );
                                                    },
                                                  )
                                                  ),
                                              ),
                                              )
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: height * 0.025),
                                              child: Center(
                                                child: Flexible(
                                                  child: Text('Нажимая кнопку, вы соглашаетесь с условиями аренды и политикой конфиденциальности',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(156, 163, 175, 1),
                                                      fontSize: width * 0.02
                                                    ),
                                                  )
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.05),
                              child: Text('Почему выбирают EliteRent',
                                style: BronirovanieStyle.title(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      services('assets/images/I-165.png', 'Быстрое оформление', 'Оформление аренды за 15 минут, доставка в течение часа', context),
                                      services('assets/images/I-143.png', 'Полная страхование ', 'Комплексная страховка и техподдержка 24/7', context),
                                    ],
                                  ),
                                  services('assets/images/zvezda.png', 'Премиум сервис', 'Персональный менеджер и VIP обслуживание', context)
                                ],
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                          color: Colors.black,
                          width: width,
                          height: height * 0.5,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('EliteRent',
                                  style: TextStyle(
                                    fontSize: width < 945 ? width * 0.08 : width * 0.025,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(250, 204, 21, 1)
                                  ),
                                ),
                                Text('Премиальный прокат экслюзивных автомобилей',
                                  style: TextStyle(
                                    fontSize: width < 945 ? width * 0.025 : width * 0.015,
                                    color: Color.fromRGBO(156, 163, 175, 1)
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  appbarButtons('Главная', () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => Homescreen()));
                                  }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('Каталог', () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => KatalogScreen()));
                                  }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('О Нас', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('Контакты', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  ],
                                ),
                                Container(
                                    width: 1280,
                                    height: 57,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                        top:BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(31, 41, 55, 1)
                                        )
                                      )
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(),
                                      child: Center(
                                        child: Text('© 2024 EliteRent. Все права защищены.',
                                          style: HomescreenStyle.lowDescriprion(context),
                                        ),
                                      )
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                  ],
                );
              } else if (constrains.maxWidth < 1200) {
                return ListView(
                  children: [
                    Container(
                      width: width,
                      height: height * 2.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromRGBO(0, 0, 0, 1),
                          Color.fromRGBO(0, 0, 0, 1),
                          Color.fromRGBO(17, 24, 39, 1),
                        ]
                      )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.02),
                        child: Column(
                          children: [
                            Text('Бронирование автомобиля',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Flexible(
                              child: Text('Заполните форму ниже, и наш менеджер свяжется с вами для подтверждения деталей',
                                style: TextStyle(
                                  fontSize: width * 0.017,
                                  color: Color.fromRGBO(156, 163, 175, 1),
                                  fontWeight: FontWeight.w400
                                ),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: width * 0.03),
                              child: Container(
                                width: width * 1.1,
                                height: height * 1.57,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  color: Color.fromRGBO(31, 41, 55, 1)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.02),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: width * 0.36,
                                            height: height * 0.52,
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Личная информация',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                                Form(
                                                  key: _formInfoKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textFields('Пожалуйста введите имя пользователя', 'Ваня Иванов', 'Полное имя *', context, _nameController),
                                                      textFields('Пожалуйста введите номер телефона', '+7(999) 123-45-67', 'Телефон *', context, _telefonNumberController),
                                                      textFields('Пожалуйста введите email', 'ivan@gmail.com', 'Email *', context, _emailController)
                                                    ],
                                                  )
                                                  )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.36,
                                            height: height * 0.52,
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Детали аренды',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                                Form(
                                                  key: _formDetailsKey,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      textFields('Пожалуйста выберите автомобиль', 'Выберите автомобиль', 'Выберите автомобиль *', context, _shooseAutoController),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                          
                                                        ),
                                                        child: Container(
                                                            width: width * 0.36,
                                                            height: height * 0.15,
                                                            color: Colors.transparent,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text('Дата начала *',
                                                                    style: BronirovanieStyle.popravka(context),
                                                                  ),
                                                                  Container(
                                                                    width: width * 0.17,
                                                                    height: width * 0.05,
                                                                    decoration: BoxDecoration(
                                                                      color: Color.fromRGBO(55, 65, 81, 1),
                                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                    ),
                                                                    child: GestureDetector(
                                                                      onTap: () => _selectDate(context),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Center(
                                                                            child: Text(
                                                                              _dateTime == null ? '-/-/-' : DateFormat('yyyy-MM-dd').format(_dateTime!),
                                                                                style: TextStyle(
                                                                                  fontSize: width * 0.01,
                                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                                  fontWeight: FontWeight.w400
                                                                                ),
                                                                            ),
                                                                            ),
                                                                            Center(
                                                                              child: Image.asset('assets/images/Vector.png',
                                                                              fit: BoxFit.cover,
                                                                              width: 13,
                                                                              height: 13,
                                                                              )
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )
                                                                    )  
                                                                  )
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text('Дата окончания *',
                                                                    style: BronirovanieStyle.popravka(context),
                                                                  ),
                                                                  Container(
                                                                    width: width * 0.17,
                                                                    height: width * 0.05,
                                                                    decoration: BoxDecoration(
                                                                      color: Color.fromRGBO(55, 65, 81, 1),
                                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                    ),
                                                                    child: GestureDetector(
                                                                      onTap: () => _selectEndDate(context),
                                                                      child: Padding(
                                                                            padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Center(
                                                                                child: Text(
                                                                                  _endDateTime == null ? '-/-/-' : DateFormat('yyyy-MM-dd').format(_endDateTime!),
                                                                                    style: TextStyle(
                                                                                      fontSize: width * 0.01,
                                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                                      fontWeight: FontWeight.w400
                                                                                    ),
                                                                                ),
                                                                                ),
                                                                                Center(
                                                                                  child: Image.asset('assets/images/Vector.png',
                                                                                  fit: BoxFit.cover,
                                                                                  width: 13,
                                                                                  height: 13,
                                                                                  )
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        )   
                                                                      ),
                                                                ],
                                                              )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: width * 0.001),
                                                        child: Container(
                                                          width: width * 0.36,
                                                          height: height * 0.15,
                                                          color: Colors.transparent,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('Время начала *',
                                                                  style: BronirovanieStyle.popravka(context),
                                                                ),
                                                                Container(
                                                                  width: width * 0.17,
                                                                  height: width * 0.05,
                                                                  decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(55, 65, 81, 1),
                                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                  ),
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      shadowColor: Colors.transparent,
                                                                      backgroundColor: Colors.transparent
                                                                    ),
                                                                    onPressed: () {
                                                                      _selectStartTime(context);
                                                                    }, 
                                                                    child: Text(_startTime == null ? 'Время не выбрано' : '${_startTime!.format(context)}',
                                                                     style: TextStyle(
                                                                        fontSize: width * 0.01,
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontWeight: FontWeight.w400
                                                                      ),
                                                                    )
                                                                  )
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('Время окончания *',
                                                                  style: BronirovanieStyle.popravka(context),
                                                                ),
                                                                Container(
                                                                  width: width * 0.17,
                                                                  height: width * 0.05,
                                                                  decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(55, 65, 81, 1),
                                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                  ),
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      shadowColor: Colors.transparent,
                                                                      backgroundColor: Colors.transparent
                                                                    ),
                                                                    onPressed: () {
                                                                      _selectEndTime(context);
                                                                    }, 
                                                                    child: Text(_endTime == null ? 'Время не выбрано' : '${_endTime!.format(context)}',
                                                                     style: TextStyle(
                                                                                fontSize: width * 0.01,
                                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                                fontWeight: FontWeight.w400
                                                                              ),
                                                                    )
                                                                  )  
                                                                ),
                                                              ],
                                                            )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: height * 0.03),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width: width * 0.36,
                                            height: height * 0.37,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Дополнительные услуги',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                                Form(
                                                  key: _dostavkaKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textFields('Пожалуйста введите адрес доставки', 'Моска ул.Тверская, 15', 'Адрес доставки', context, _adresDostavkaController),
                                                      textFields('Пожалуйста введите дрес возврата', 'Моска ул.Тверская, 15', 'Адрес возврата', context, _adresVozwratController)
                                                    ],
                                                  )
                                                  )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.36,
                                            height: height * 0.37,
                                            color: Colors.transparent,
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: height * 0.1),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Тип страхования',
                                                  style: BronirovanieStyle.title(context),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose1, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose1 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Стандартное (включено)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.02,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose2, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose2 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Премиум(+2000 ₽/день)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.02,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose3, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose3 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Услуги водителя (+3000 ₽/день)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.02,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              ),
                                          )
                                        ],
                                      ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: height * 0.05),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: height * 0.014),
                                              child: Text('Дополнительные пожелания',
                                                style: BronirovanieStyle.popravka(context),
                                              ),
                                            ),
                                            Container(
                                              width: width ,
                                              height: height * 0.2,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(55, 65, 81, 1),
                                                borderRadius: BorderRadius.all(Radius.circular(8))
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(),
                                                child: Form(
                                                  key: _dopKey,
                                                  child: TextFormField(
                                                    textAlign: TextAlign.start,
                                                    textAlignVertical: TextAlignVertical.top,
                                                    expands: true,
                                                    maxLines: null,
                                                    minLines: null,
                                                    controller: _dopController,
                                                    decoration: InputDecoration(
                                                      hintText: 'Расскажите о вашиъ пожеланиях или требованиях...',
                                                      hintStyle:  TextStyle(
                                                        color: Color.fromRGBO(95, 94, 94, 1)
                                                      ), 
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide.none
                                                      )
                                                    ),
                                                  
                                                  )
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: height * 0.05),
                                              child: Center(
                                                child: Container(
                                                width: width * 0.15,
                                                height: height * 0.07,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                                                  ),
                                                  onPressed: submitForm, 
                                                  child: BlocBuilder<BronirovanieBloc, BronirovanieState>(
                                                    builder: (context, state) {
                                                      if (state is BronirovanieLoading) {
                                                        return Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            SizedBox(
                                                              width: 12,
                                                              height: 12,
                                                              child: CircularProgressIndicator(
                                                                color: Colors.black,
                                                                strokeWidth: 2,
                                                              ),
                                                            ),
                                                            SizedBox(width: 6),
                                                            Text('Отправка...',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: width * 0.013,
                                                                fontWeight: FontWeight.w700
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }
                                                      return Text('Забронировать',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: width * 0.013,
                                                          fontWeight: FontWeight.w700
                                                        ),
                                                      );
                                                    },
                                                  )
                                                  ),
                                              ),
                                              )
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: height * 0.025),
                                              child: Center(
                                                child: Flexible(
                                                  child: Text('Нажимая кнопку, вы соглашаетесь с условиями аренды и политикой конфиденциальности',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(156, 163, 175, 1),
                                                      fontSize: width * 0.015
                                                    ),
                                                  )
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.2),
                              child: Text('Почему выбирают EliteRent',
                                style: BronirovanieStyle.title(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  services('assets/images/I-165.png', 'Быстрое оформление', 'Оформление аренды за 15 минут, доставка в течение часа', context),
                                  services('assets/images/I-143.png', 'Полная страхование ', 'Комплексная страховка и техподдержка 24/7', context),
                                  services('assets/images/zvezda.png', 'Премиум сервис', 'Персональный менеджер и VIP обслуживание', context)
                                ],
                              ), 
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                          color: Colors.black,
                          width: width,
                          height: height * 0.5,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('EliteRent',
                                  style: TextStyle(
                                    fontSize: width < 945 ? width * 0.08 : width * 0.025,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(250, 204, 21, 1)
                                  ),
                                ),
                                Text('Премиальный прокат экслюзивных автомобилей',
                                  style: TextStyle(
                                    fontSize: width < 945 ? width * 0.025 : width * 0.015,
                                    color: Color.fromRGBO(156, 163, 175, 1)
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  appbarButtons('Главная', () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => Homescreen()));
                                  }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('Каталог', () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => KatalogScreen()));
                                  }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('О Нас', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('Контакты', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  ],
                                ),
                                Container(
                                    width: 1280,
                                    height: 57,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                        top:BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(31, 41, 55, 1)
                                        )
                                      )
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(),
                                      child: Center(
                                        child: Text('© 2024 EliteRent. Все права защищены.',
                                          style: HomescreenStyle.lowDescriprion(context),
                                        ),
                                      )
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                  ],
                );
              } else {
                return ListView(
                  children: [
                    Container(
                      width: width,
                      height: height * 2.8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromRGBO(0, 0, 0, 1),
                          Color.fromRGBO(0, 0, 0, 1),
                          Color.fromRGBO(17, 24, 39, 1),
                        ]
                      )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.02),
                        child: Column(
                          children: [
                            Text('Бронирование автомобиля',
                              style: TextStyle(
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Flexible(
                              child: Text('Заполните форму ниже, и наш менеджер свяжется с вами для подтверждения деталей',
                                style: TextStyle(
                                  fontSize: width * 0.014,
                                  color: Color.fromRGBO(156, 163, 175, 1),
                                  fontWeight: FontWeight.w400
                                ),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: width * 0.03),
                              child: Container(
                                width: width * 0.8,
                                height: height * 1.65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  color: Color.fromRGBO(31, 41, 55, 1)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.02),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: width * 0.36,
                                            height: height * 0.58,
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                               Padding(
                                                padding: EdgeInsets.only(bottom: height * 0.05),
                                                 child:  Text('Личная информация',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                              ),
                                                Form(
                                                  key: _formInfoKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          smallTextFields(context, 'Имя', 'Пожалуйста введите имя', _nameController, 'Даниил'),
                                                          smallTextFields(context, 'Фамилия', 'Поэалуйста введите фамилию', _lastNameController, 'Биденко')
                                                        ],
                                                      ),
                                                      textFields('Пожалуйста введите номер телефона', '+7(999) 123-45-67', 'Телефон *', context, _telefonNumberController),
                                                      textFields('Пожалуйста введите email', 'ivan@gmail.com', 'Email *', context, _emailController)
                                                    ],
                                                  )
                                                  )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.36,
                                            height: height * 0.58,
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                padding: EdgeInsets.only(bottom: height * 0.05),
                                                 child:  Text('Детали аренды',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                              ),
                                                Form(
                                                  key: _formDetailsKey,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      BlocBuilder<RentACarBloc, RentACarState>(
                                                        builder: (context, state) {
                                                          if (state is RentACarLoading) {
                                                            return Center(
                                                              child: CircularProgressIndicator()
                                                            );
                                                          } else if (state is RentACarLoaded) {
                                                            String dropDownValue = '${state.rentACar.first.brand} ${state.rentACar.first.id}';
                                                            return Center(
                                                              child: DropdownButton<String>(
                                                                value: dropDownValue,
                                                                hint: const Text("Выбери автомобиль"),
                                                                items: state.rentACar.map<DropdownMenuItem<String>>((item) {
                                                                  return DropdownMenuItem<String>(
                                                                    value: item.id, // id будет выбранным значением
                                                                    child: Text("${item.brand} ${item.model}"),
                                                                  );
                                                                }).toList(),
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    dropDownValue = value!;
                                                                  });
                                                                  // выводим id в консоль
                                                                  print("Выбран автомобиль с id: $value");
                                                                },
                                                              ),
                                                            );
                                                          } else if (state is BronirovanieError) {
                                                            return Center(
                                                              child: Text('Ошибка'),
                                                            );
                                                          } else {
                                                            return Center(child: Text('Иди нахуй'),);
                                                          }
                                                        }
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                          
                                                        ),
                                                        child: Container(
                                                            width: width * 0.36,
                                                            height: height * 0.15,
                                                            color: Colors.transparent,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text('Дата начала *',
                                                                    style: BronirovanieStyle.popravka(context),
                                                                  ),
                                                                  Container(
                                                                    width: width * 0.17,
                                                                    height: width * 0.032,
                                                                    decoration: BoxDecoration(
                                                                      color: Color.fromRGBO(55, 65, 81, 1),
                                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                    ),
                                                                    child: GestureDetector(
                                                                      onTap: () => _selectDate(context),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Center(
                                                                            child: Text(
                                                                              _dateTime == null ? '-/-/-' : DateFormat('yyyy-MM-dd').format(_dateTime!),
                                                                                style: TextStyle(
                                                                                  fontSize: width * 0.01,
                                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                                  fontWeight: FontWeight.w400
                                                                                ),
                                                                            ),
                                                                            ),
                                                                            Center(
                                                                              child: Image.asset('assets/images/Vector.png',
                                                                              fit: BoxFit.cover,
                                                                              width: 13,
                                                                              height: 13,
                                                                              )
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )
                                                                    )  
                                                                  )
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text('Дата окончания *',
                                                                    style: BronirovanieStyle.popravka(context),
                                                                  ),
                                                                  Container(
                                                                    width: width * 0.17,
                                                                    height: width * 0.032,
                                                                    decoration: BoxDecoration(
                                                                      color: Color.fromRGBO(55, 65, 81, 1),
                                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                    ),
                                                                    child: GestureDetector(
                                                                      onTap: () => _selectEndDate(context),
                                                                      child: Padding(
                                                                            padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Center(
                                                                                child: Text(
                                                                                  _endDateTime == null ? '-/-/-' : DateFormat('yyyy-MM-dd').format(_endDateTime!),
                                                                                    style: TextStyle(
                                                                                      fontSize: width * 0.01,
                                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                                      fontWeight: FontWeight.w400
                                                                                    ),
                                                                                ),
                                                                                ),
                                                                                Center(
                                                                                  child: Image.asset('assets/images/Vector.png',
                                                                                  fit: BoxFit.cover,
                                                                                  width: 13,
                                                                                  height: 13,
                                                                                  )
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        )   
                                                                      ),
                                                                ],
                                                              )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: width * 0.001),
                                                        child: Container(
                                                          width: width * 0.36,
                                                          height: height * 0.15,
                                                          color: Colors.transparent,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('Время начала *',
                                                                  style: BronirovanieStyle.popravka(context),
                                                                ),
                                                                Container(
                                                                  width: width * 0.17,
                                                                  height: width * 0.032,
                                                                  decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(55, 65, 81, 1),
                                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                  ),
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      shadowColor: Colors.transparent,
                                                                      backgroundColor: Colors.transparent
                                                                    ),
                                                                    onPressed: () {
                                                                      _selectStartTime(context);
                                                                    }, 
                                                                    child: Text(_startTime == null ? 'Время не выбрано' : '${_startTime!.format(context)}',
                                                                     style: TextStyle(
                                                                        fontSize: width * 0.01,
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontWeight: FontWeight.w400
                                                                      ),
                                                                    )
                                                                  ) 
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('Время окончания *',
                                                                  style: BronirovanieStyle.popravka(context),
                                                                ),
                                                                Container(
                                                                  width: width * 0.17,
                                                                  height: width * 0.032,
                                                                  decoration: BoxDecoration(
                                                                    color: Color.fromRGBO(55, 65, 81, 1),
                                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                  ),
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      shadowColor: Colors.transparent,
                                                                      backgroundColor: Colors.transparent
                                                                    ),
                                                                    onPressed: () {
                                                                      _selectEndTime(context);
                                                                    }, 
                                                                    child: Text(_endTime == null ? 'Время не выбрано' : '${_endTime!.format(context)}',
                                                                     style: TextStyle(
                                                                      fontSize: width * 0.01,
                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                      fontWeight: FontWeight.w400
                                                                    ),
                                                                    )
                                                                  ) 
                                                                    ),
                                                              ],
                                                            )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: height * 0.05),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width: width * 0.36,
                                            height: height * 0.40,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Дополнительные услуги',
                                                  style: BronirovanieStyle.title(context),
                                                ),
                                                Form(
                                                  key: _dostavkaKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textFields('Пожалуйста введите адрес доставки', 'Моска ул.Тверская, 15', 'Адрес доставки', context, _adresDostavkaController),
                                                      textFields('Пожалуйста введите дрес возврата', 'Моска ул.Тверская, 15', 'Адрес возврата', context, _adresVozwratController)
                                                    ],
                                                  )
                                                  )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.36,
                                            height: height * 0.40,
                                            color: Colors.transparent,
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: height * 0.1),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Тип страхования',
                                                  style: BronirovanieStyle.title(context),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose1, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose1 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Стандартное (включено)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.01,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose2, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose2 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Премиум(+2000₽/день)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.01,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        shape: CircleBorder(),
                                                        value: shoose3, 
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            shoose3 = newValue!;
                                                          });
                                                        },
                                                        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                        if (states.contains(MaterialState.selected)) {
                                                          return Colors.blue; 
                                                        }
                                                          return Colors.transparent; 
                                                        }),
                                                      ),
                                                      Text('Услуги водителя (+3000₽/день)',
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                          fontSize: width * 0.01,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              ),
                                          )
                                        ],
                                      ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: height * 0.05),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: height * 0.014),
                                              child: Text('Дополнительные пожелания',
                                                style: BronirovanieStyle.popravka(context),
                                              ),
                                            ),
                                            Container(
                                              width: width ,
                                              height: height * 0.2,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(55, 65, 81, 1),
                                                borderRadius: BorderRadius.all(Radius.circular(8))
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(),
                                                child: Form(
                                                  key: _dopKey,
                                                  child: TextFormField(
                                                    textAlign: TextAlign.start,
                                                    textAlignVertical: TextAlignVertical.top,
                                                    expands: true,
                                                    maxLines: null,
                                                    minLines: null,
                                                    controller: _dopController,
                                                    decoration: InputDecoration(
                                                      hintText: 'Расскажите о вашиъ пожеланиях или требованиях...',
                                                      hintStyle:  TextStyle(
                                                        color: Color.fromRGBO(95, 94, 94, 1)
                                                      ), 
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide.none
                                                      )
                                                    ),
                                                  style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                                  )
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: height * 0.05),
                                              child: Center(
                                                child: Container(
                                                width: width * 0.15,
                                                height: height * 0.07,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                                                  ),
                                                  onPressed: submitForm, 
                                                  child: BlocBuilder<BronirovanieBloc, BronirovanieState>(
                                                    builder: (context, state) {
                                                      if (state is BronirovanieLoading) {
                                                        return Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            SizedBox(
                                                              width: 12,
                                                              height: 12,
                                                              child: CircularProgressIndicator(
                                                                color: Colors.black,
                                                                strokeWidth: 2,
                                                              ),
                                                            ),
                                                            SizedBox(width: 6),
                                                            Text('Отправка...',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: width * 0.01,
                                                                fontWeight: FontWeight.w700
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }
                                                      return Text('Забронировать',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: width * 0.01,
                                                          fontWeight: FontWeight.w700
                                                        ),
                                                      );
                                                    },
                                                  )
                                                  ),
                                              ),
                                              )
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: height * 0.025),
                                              child: Center(
                                                child: Flexible(
                                                  child: Text('Нажимая кнопку, вы соглашаетесь с условиями аренды и политикой конфиденциальности',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(156, 163, 175, 1),
                                                      fontSize: width * 0.01
                                                    ),
                                                  )
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.2),
                              child: Text('Почему выбирают EliteRent',
                                style: BronirovanieStyle.title(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  services('assets/images/I-165.png', 'Быстрое оформление', 'Оформление аренды за 15 минут, доставка в течение часа', context),
                                  services('assets/images/I-143.png', 'Полная страхование ', 'Комплексная страховка и техподдержка 24/7', context),
                                  services('assets/images/zvezda.png', 'Премиум сервис', 'Персональный менеджер и VIP обслуживание', context)
                                ],
                              ), 
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                          color: Colors.black,
                          width: width,
                          height: height * 0.5,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('EliteRent',
                                  style: TextStyle(
                                    fontSize: width < 945 ? width * 0.08 : width * 0.025,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(250, 204, 21, 1)
                                  ),
                                ),
                                Text('Премиальный прокат экслюзивных автомобилей',
                                  style: TextStyle(
                                    fontSize: width < 945 ? width * 0.025 : width * 0.015,
                                    color: Color.fromRGBO(156, 163, 175, 1)
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  appbarButtons('Главная', () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => Homescreen()));
                                  }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('Каталог', () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => KatalogScreen()));
                                  }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('О Нас', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  appbarButtons('Контакты', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                                  ],
                                ),
                                Container(
                                    width: 1280,
                                    height: 57,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                        top:BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(31, 41, 55, 1)
                                        )
                                      )
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(),
                                      child: Center(
                                        child: Text('© 2024 EliteRent. Все права защищены.',
                                          style: HomescreenStyle.lowDescriprion(context),
                                        ),
                                      )
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                  ],
                );
              }
            }
          )
        ),
    );
  }
}

Widget textFields (String errorText, String labelText, String popravka, BuildContext context, TextEditingController controller) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  String? header;
  return Container(
        width: width * 0.36,
        height: height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(popravka, style: BronirovanieStyle.popravka(context)),
            TextFormField(
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return errorText;
                }
                return null;
              },
              onSaved: (value) => header = value,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1)
              ),
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(55, 65, 81, 1),
                hintText: labelText,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(95, 94, 94, 1)
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                )
              )
            )
          ],
        ),
      );
}

Widget smallTextFields (BuildContext context, String popravka, String errorText, TextEditingController controller, String labelText) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  String? header;
  return Container(
        width: width * 0.17,
        height: height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(popravka, style: BronirovanieStyle.popravka(context)),
            TextFormField(
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return errorText;
                }
                return null;
              },
              onSaved: (value) => header = value,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1)
              ),
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(55, 65, 81, 1),
                hintText: labelText,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(95, 94, 94, 1)
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                )
              )
            )
          ],
        ),
      );
}

Widget services (String  icon, String label, String lowerText, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width < 600 ? width * 0.4 : width * 0.3,
    height: width < 600 ? height * 0.2 : height * 0.25,
    child: Center(
      child: Column(
        children: [
          Container(
            width: width < 600 ? 60 : 80,
            height: width < 600 ? 60 : 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(99)),
              color: Color.fromRGBO(234, 179, 8, 1)
            ),
            child: Center(
              child: Image.asset(icon,
              width: 31.25,
              height: 30,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 24, bottom: width < 600 ? 0 : 15),
            child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width < 600 ? 15 : 20,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(255, 255, 255, 1)
            ),
          ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Text(lowerText,
              textAlign: TextAlign.center,
               style: TextStyle(
              fontSize: width < 600 ? 11 : 13,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(156, 163, 175, 1)
            ),
              ),
            )
            )
        ],
      ),
    ),
  );
}

Widget appbarButtons(String label, VoidCallback navigation, TextStyle textStyle, double buttonWidth, double buttonHeight) {
  return Opacity(
    opacity: 1,
    child: SizedBox(
      width: buttonWidth, 
      height: buttonHeight, 
      child: ElevatedButton(
        style: HomescreenStyle.appbarButtonsStyle,
        onPressed: navigation,
        child: Text(
          label,
        maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        ),
      ),
    ),
  );
}



