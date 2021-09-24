import 'package:flutter/material.dart';


class WataniWidget extends StatefulWidget {
  const WataniWidget({Key? key}) : super(key: key);

  @override
  _WataniWidgetState createState() => _WataniWidgetState();
}

class _WataniWidgetState extends State<WataniWidget> {


  static const sizedBoxSpace = SizedBox(height: 24);
  final TextEditingController _loanValueTextController =
  TextEditingController();
  final TextEditingController _durationValueTextController =
  TextEditingController();
  String kafalatValue = 'لم يتم الحساب بعد';
  String monthlyValue = 'لم يتم الحساب بعد';
  String totalFaeda = 'أدخل قيمة القرض والمدة';
  String monthlyFaeda = 'أدخل قيمة القرض والمدة';
  String totalLoanWithFaeda = 'أدخل قيمة القرض والمدة';
  String carRahn = 'أدخل قيمة القرض والمدة';
  String aakarRahn = 'أدخل قيمة القرض والمدة';

  String monthlyKistString='أدخل قيمة القرض والمدة';
  String requiredKafalat='أدخل قيمة القرض والمدة';
  String monthlyfaedaPlus='--';
  String totalfaedaPlus='--';
  String loanWithFaedaPlus='--';
  String monthlyKistPlus='--';

  var temp = 0.0;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final height=deviceSize.height;
    final width=deviceSize.width;
    // final deviceSize = MediaQuery.of(context).size;

    void loanChanged(String laonVal) {
      //setvalue in input text
      var temp2 = double.parse('$laonVal');
      temp = temp2 * 0.75 / 100;
     var monthlyFaedaPlusVal=temp2*0.25/100;
      setState(() {
        _loanValueTextController.text = laonVal;
        monthlyFaeda = temp.toStringAsFixed(0);
        monthlyfaedaPlus=monthlyFaedaPlusVal.toStringAsFixed(0);
      });
      if (_durationValueTextController.value.text != '') {
        //do math
        // var temp3 = double.parse('$d');
        var duration = _durationValueTextController.value.text;
        var temp4 = double.parse('$duration');

        var total = temp * temp4;
        var tempmonthlyFaedaPlus=double.parse('$monthlyfaedaPlus');
        setState(() {
          // _durationValueTextController.text = d;
          totalFaeda = total.toStringAsFixed(0);
          totalfaedaPlus=(tempmonthlyFaedaPlus*temp4).toStringAsFixed(0);
        });
        // var loanValtext=_loanValueTextController.value.text;


        // var totalFaedaVal=double.parse('$totalFaeda');
        // print(loanVal);
        var loanWithFaeda = total + temp2;
        totalLoanWithFaeda = loanWithFaeda.toStringAsFixed(0);

        loanWithFaedaPlus=((tempmonthlyFaedaPlus*temp4)+temp2).toStringAsFixed(0);

        /////////////////////////add monthly kist
        var monthlyKist=loanWithFaeda/temp4;
        monthlyKistString=monthlyKist.toStringAsFixed(0);
        monthlyKistPlus=(((tempmonthlyFaedaPlus*temp4)+temp2)/temp4).toStringAsFixed(0);
        ///////////////////////////add required kafalat
        requiredKafalat=(monthlyKist*3).toStringAsFixed(0);

        //////////////////////////carRahn
        carRahn=(loanWithFaeda*200/100).toStringAsFixed(0);
        /////////////////////////AAkarRahn
        aakarRahn=(loanWithFaeda*150/100).toStringAsFixed(0);


        //set reult
      }
    }
///////////////////////////////////////////////////////////////////////DurationChanged
    void durationChanged(String d) {
      //setvalue in input text
      setState(() {
        _durationValueTextController.text = d;
      });

      // print(_loanValueTextController.value.text);
      if (_loanValueTextController.value.text != '') {
        //do math
        var temp3 = double.parse('$d');
        var temp4 = double.parse('$monthlyFaeda');
        var total = temp3 * temp4;
        var tempmonthlyFaedaPlus=double.parse('$monthlyfaedaPlus');
        setState(() {
          // _durationValueTextController.text = d;
          totalFaeda = total.toStringAsFixed(0);
          totalfaedaPlus=(tempmonthlyFaedaPlus*temp3).toStringAsFixed(0);
        });
        var loanValtext = _loanValueTextController.value.text;
        // print('here');
        var loanVal = double.parse('$loanValtext');
        // print(loanVal);
        var loanWithFaeda = loanVal + total;
        totalLoanWithFaeda = loanWithFaeda.toStringAsFixed(0);
        loanWithFaedaPlus=((tempmonthlyFaedaPlus*temp3)+loanVal).toStringAsFixed(0);
        /////////////////////////add monthly kist
        var monthlyKist=loanWithFaeda/temp3;
        monthlyKistString=monthlyKist.toStringAsFixed(0);
        monthlyKistPlus=(((tempmonthlyFaedaPlus*temp3)+loanVal)/temp3).toStringAsFixed(0);
        ///////////////////////////add required kafalat
        requiredKafalat=(monthlyKist*3).toStringAsFixed(0);
        //////////////////////////carRahn
        carRahn=(loanWithFaeda*200/100).toStringAsFixed(0);
        /////////////////////////AAkarRahn
        aakarRahn=(loanWithFaeda*150/100).toStringAsFixed(0);


        //set reult
      }
    }

    return
      height>=830&&width>=850?
      Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(children: [
            Column(
                  children: [
    Directionality(
    textDirection: TextDirection.rtl,
    child:
                    TextFormField(
                      onEditingComplete: (){
                        loanChanged(_loanValueTextController.value.text);
                        FocusScope.of(context).unfocus();
                      },
                      controller: _loanValueTextController,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      restorationId: 'قيمة القرض',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'أدخل قيمة القرض',
                        labelStyle: TextStyle(fontSize: 15),
                        // alignLabelWithHint: true,
                        suffixText: 'ل.س',
                      ),
                      maxLines: 1,
                    ),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(

                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  loanChanged('1000000');
                                },
                                child: const Text(
                                  '1,000,000',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  loanChanged('1500000');
                                },
                                child: const Text(
                                  '1,500,000',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  loanChanged('2000000');
                                },
                                child: const Text(
                                  '2,000,000',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: const BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  loanChanged('2500000');
                                },
                                child: const Text(
                                  '2,500,000',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: const BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  loanChanged('3000000');
                                },
                                child: const Text(
                                  '3,000,000',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  loanChanged('3500000');
                                },
                                child: const Text(
                                  '3,500,000',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          if(width>=1000)
                            Expanded(
                              child: Container(
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(88.0),
                                              side: const BorderSide(
                                                  color: Colors.blueAccent)))),
                                  onPressed: () {
                                    loanChanged('4000000');
                                  },
                                  child: const Text(
                                    '4,000,000',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          if(width>=1000)
                            Expanded(
                              child: Container(
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(88.0),
                                              side: BorderSide(
                                                  color: Colors.blueAccent)))),
                                  onPressed: () {
                                    loanChanged('4500000');
                                  },
                                  child: const Text(
                                    '4,500,000',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          if(width>=1000)
                            Expanded(
                              child: Container(
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(88.0),
                                              side: const BorderSide(
                                                  color: Colors.blueAccent)))),
                                  onPressed: () {
                                    loanChanged('5000000');
                                  },
                                  child: const Text(
                                    '5,000,000',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    /////////////////////////////////////////////////////////////////////
    Directionality(
    textDirection: TextDirection.rtl,
    child:
    TextFormField(
                      onEditingComplete: (){
                        durationChanged(_durationValueTextController.value.text);
                        FocusScope.of(context).unfocus();
                      },
                      controller: _durationValueTextController,
                      textAlign: TextAlign.center,
                      restorationId: 'المدة المطلوبة (شهر)',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'أدخل عدد الشهور',
                        labelStyle: TextStyle(fontSize: 15),
                        // alignLabelWithHint: true,
                        suffixText: 'شهر',
                      ),
                      maxLines: 1,
                    ),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  durationChanged('12');
                                },
                                child: const Text(
                                  'سنة واحدة',
                                  style: TextStyle(fontSize: 15),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  durationChanged('24');
                                },
                                child: const Text(
                                  'سنتين',
                                  style: TextStyle(fontSize: 15),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  durationChanged('36');
                                },
                                child: const Text(
                                  '3 سنوات',
                                  style: TextStyle(fontSize: 15),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: const BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  durationChanged('48');
                                },
                                child: const Text(
                                  '4 سنوات',
                                  style: TextStyle(fontSize: 15),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: const BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  durationChanged('60');
                                },
                                child: const Text(
                                  '5 سنوات',
                                  style: TextStyle(fontSize: 15),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(88.0),
                                            side: BorderSide(
                                                color: Colors.blueAccent)))),
                                onPressed: () {
                                  durationChanged('72');
                                },
                                child: const Text(
                                  '6 سنوات',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),




              Expanded(
                flex:1,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 250,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('قيمة القرض مع الفوائد',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$totalLoanWithFaeda',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                            width: 6,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 50,
                        width: 30,
                        // color: Colors.blue,
                        child: null,
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 250,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('الفائدة الكلية',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$totalFaeda',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                            width: 6,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 50,
                        width: 30,
                        // color: Colors.blue,
                        child: null,
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 250,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('الفائة الشهرية',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$monthlyFaeda',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 250,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('الكفالات المطلوبة',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$requiredKafalat',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                            width: 6,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 50,
                        width: 30,
                        // color: Colors.blue,
                        child: null,
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 250,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('القسط الشهري',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$monthlyKistString',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 250,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('رهن العقار',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$aakarRahn',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                            width: 6,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 50,
                        width: 30,
                        // color: Colors.blue,
                        child: null,
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 250,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('رهن السيارة',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$carRahn',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 150,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('الفائة الشهرية plus',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$monthlyfaedaPlus',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 150,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('الفائة الكلية plus',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(

                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$totalfaedaPlus',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 150,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('القرض مع الفوائد plus',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(

                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$loanWithFaedaPlus',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 100,
                          width: 150,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('القسط الشهري plus',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(

                                        fontSize: 18, color: Colors.blue),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                child: Text(
                                  '$monthlyKistPlus',
                                  // kafalatValue,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    )
          : height>=580&&width>=850?
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(children: [
                Expanded(
                  child: Row(
                    // mainAxisAlignment:  MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(

                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(child:
    Directionality(
    textDirection: TextDirection.rtl,
    child:
                              TextFormField(
                                onEditingComplete: (){
                                  durationChanged(_durationValueTextController.value.text);
                                  FocusScope.of(context).unfocus();
                                },
                                controller: _durationValueTextController,
                                textAlign: TextAlign.center,
                                restorationId: 'المدة المطلوبة (شهر)',
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'أدخل عدد الشهور',
                                  labelStyle: TextStyle(fontSize: 15),
                                  // alignLabelWithHint: true,
                                  suffixText: 'شهر',
                                ),
                                maxLines: 1,
                              ),),
                              ),
                              Expanded(
                                child:  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(88.0),
                                                        side: BorderSide(
                                                            color: Colors.blueAccent)))),
                                            onPressed: () {
                                              durationChanged('12');
                                            },
                                            child: const Text(
                                              'سنة',
                                              style: TextStyle(fontSize: 15),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(88.0),
                                                        side: BorderSide(
                                                            color: Colors.blueAccent)))),
                                            onPressed: () {
                                              durationChanged('24');
                                            },
                                            child: const Text(
                                              'سنتين',
                                              style: TextStyle(fontSize: 15),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(88.0),
                                                        side: BorderSide(
                                                            color: Colors.blueAccent)))),
                                            onPressed: () {
                                              durationChanged('36');
                                            },
                                            child: const Text(
                                              '3',
                                              style: TextStyle(fontSize: 15),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(88.0),
                                                        side: const BorderSide(
                                                            color: Colors.blueAccent)))),
                                            onPressed: () {
                                              durationChanged('48');
                                            },
                                            child: const Text(
                                              '4',
                                              style: TextStyle(fontSize: 15),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(88.0),
                                                        side: const BorderSide(
                                                            color: Colors.blueAccent)))),
                                            onPressed: () {
                                              durationChanged('60');
                                            },
                                            child: const Text(
                                              '5',
                                              style: TextStyle(fontSize: 15),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ),
                                  
                                    ],
                                  ),
                                ),
                              )





                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex:1,
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(child:
    Directionality(
    textDirection: TextDirection.rtl,
    child:
                                  TextFormField(
                                onEditingComplete: (){
                                  loanChanged(_loanValueTextController.value.text);
                                  FocusScope.of(context).unfocus();
                                },
                                controller: _loanValueTextController,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                restorationId: 'قيمة القرض',
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'أدخل قيمة القرض',
                                  labelStyle: TextStyle(fontSize: 15),
                                  // alignLabelWithHint: true,
                                  suffixText: 'ل.س',
                                ),
                                maxLines: 1,
                              ),),),
                              Expanded(child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Container(

                                        height: 50,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(88.0),
                                                      side: BorderSide(
                                                          color: Colors.blueAccent)))),
                                          onPressed: () {
                                            loanChanged('1000000');
                                          },
                                          child: const Text(
                                            'مليون',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(88.0),
                                                      side: BorderSide(
                                                          color: Colors.blueAccent)))),
                                          onPressed: () {
                                            loanChanged('1500000');
                                          },
                                          child: const Text(
                                            '1,5',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(88.0),
                                                      side: BorderSide(
                                                          color: Colors.blueAccent)))),
                                          onPressed: () {
                                            loanChanged('2000000');
                                          },
                                          child: const Text(
                                            '2',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(88.0),
                                                      side: const BorderSide(
                                                          color: Colors.blueAccent)))),
                                          onPressed: () {
                                            loanChanged('2500000');
                                          },
                                          child: const Text(
                                            '2,5',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(88.0),
                                                      side: const BorderSide(
                                                          color: Colors.blueAccent)))),
                                          onPressed: () {
                                            loanChanged('3000000');
                                          },
                                          child: const Text(
                                            '3',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(88.0),
                                                      side: BorderSide(
                                                          color: Colors.blueAccent)))),
                                          onPressed: () {
                                            loanChanged('3500000');
                                          },
                                          child: const Text(
                                            '3,5',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if(width>=1000)
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(88.0),
                                                        side: const BorderSide(
                                                            color: Colors.blueAccent)))),
                                            onPressed: () {
                                              loanChanged('4000000');
                                            },
                                            child: const Text(
                                              '4',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if(width>=1250)
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(88.0),
                                                        side: BorderSide(
                                                            color: Colors.blueAccent)))),
                                            onPressed: () {
                                              loanChanged('4500000');
                                            },
                                            child: const Text(
                                              '4,5',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if(width>=1250)
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(88.0),
                                                        side: const BorderSide(
                                                            color: Colors.blueAccent)))),
                                            onPressed: () {
                                              loanChanged('5000000');
                                            },
                                            child: const Text(
                                              '5',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),),

                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                // Column(
                //   children: [
                //     TextFormField(
                //       onEditingComplete: (){
                //         loanChanged(_loanValueTextController.value.text);
                //         FocusScope.of(context).unfocus();
                //       },
                //       controller: _loanValueTextController,
                //       textDirection: TextDirection.ltr,
                //       textAlign: TextAlign.center,
                //       restorationId: 'قيمة القرض',
                //       textInputAction: TextInputAction.next,
                //       keyboardType: TextInputType.number,
                //       decoration: const InputDecoration(
                //         border: OutlineInputBorder(),
                //         labelText: 'أدخل قيمة القرض',
                //         labelStyle: TextStyle(fontSize: 15),
                //         // alignLabelWithHint: true,
                //         prefixText: 'ل.س',
                //       ),
                //       maxLines: 1,
                //     ),
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Expanded(
                //             child: Container(
                //
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   loanChanged('1000000');
                //                 },
                //                 child: const Text(
                //                   '1,000,000',
                //                   style: TextStyle(fontSize: 15),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   loanChanged('1500000');
                //                 },
                //                 child: const Text(
                //                   '1,500,000',
                //                   style: TextStyle(fontSize: 15),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   loanChanged('2000000');
                //                 },
                //                 child: const Text(
                //                   '2,000,000',
                //                   style: TextStyle(fontSize: 15),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: const BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   loanChanged('2500000');
                //                 },
                //                 child: const Text(
                //                   '2,500,000',
                //                   style: TextStyle(fontSize: 15),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: const BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   loanChanged('3000000');
                //                 },
                //                 child: const Text(
                //                   '3,000,000',
                //                   style: TextStyle(fontSize: 15),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   loanChanged('3500000');
                //                 },
                //                 child: const Text(
                //                   '3,500,000',
                //                   style: TextStyle(fontSize: 15),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           if(width>=1000)
                //             Expanded(
                //               child: Container(
                //                 height: 50,
                //                 child: ElevatedButton(
                //                   style: ButtonStyle(
                //                       shape: MaterialStateProperty.all<
                //                           RoundedRectangleBorder>(
                //                           RoundedRectangleBorder(
                //                               borderRadius: BorderRadius.circular(88.0),
                //                               side: const BorderSide(
                //                                   color: Colors.blueAccent)))),
                //                   onPressed: () {
                //                     loanChanged('4000000');
                //                   },
                //                   child: const Text(
                //                     '4,000,000',
                //                     style: TextStyle(fontSize: 15),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           if(width>=1000)
                //             Expanded(
                //               child: Container(
                //                 height: 50,
                //                 child: ElevatedButton(
                //                   style: ButtonStyle(
                //                       shape: MaterialStateProperty.all<
                //                           RoundedRectangleBorder>(
                //                           RoundedRectangleBorder(
                //                               borderRadius: BorderRadius.circular(88.0),
                //                               side: BorderSide(
                //                                   color: Colors.blueAccent)))),
                //                   onPressed: () {
                //                     loanChanged('4500000');
                //                   },
                //                   child: const Text(
                //                     '4,500,000',
                //                     style: TextStyle(fontSize: 15),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           if(width>=1000)
                //             Expanded(
                //               child: Container(
                //                 height: 50,
                //                 child: ElevatedButton(
                //                   style: ButtonStyle(
                //                       shape: MaterialStateProperty.all<
                //                           RoundedRectangleBorder>(
                //                           RoundedRectangleBorder(
                //                               borderRadius: BorderRadius.circular(88.0),
                //                               side: const BorderSide(
                //                                   color: Colors.blueAccent)))),
                //                   onPressed: () {
                //                     loanChanged('5000000');
                //                   },
                //                   child: const Text(
                //                     '5,000,000',
                //                     style: TextStyle(fontSize: 15),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //         ],
                //       ),
                //     ),
                //     /////////////////////////////////////////////////////////////////////
                //     TextFormField(
                //       onEditingComplete: (){
                //         durationChanged(_durationValueTextController.value.text);
                //         FocusScope.of(context).unfocus();
                //       },
                //       controller: _durationValueTextController,
                //       textAlign: TextAlign.center,
                //       restorationId: 'المدة المطلوبة (شهر)',
                //       textInputAction: TextInputAction.next,
                //       keyboardType: TextInputType.number,
                //       decoration: const InputDecoration(
                //         border: OutlineInputBorder(),
                //         labelText: 'أدخل عدد الشهور',
                //         labelStyle: TextStyle(fontSize: 15),
                //         // alignLabelWithHint: true,
                //         prefixText: 'شهر',
                //       ),
                //       maxLines: 1,
                //     ),
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   durationChanged('12');
                //                 },
                //                 child: const Text(
                //                   'سنة واحدة',
                //                   style: TextStyle(fontSize: 15),
                //                   textDirection: TextDirection.rtl,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   durationChanged('24');
                //                 },
                //                 child: const Text(
                //                   'سنتين',
                //                   style: TextStyle(fontSize: 15),
                //                   textDirection: TextDirection.rtl,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   durationChanged('36');
                //                 },
                //                 child: const Text(
                //                   '3 سنوات',
                //                   style: TextStyle(fontSize: 15),
                //                   textDirection: TextDirection.rtl,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: const BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   durationChanged('48');
                //                 },
                //                 child: const Text(
                //                   '4 سنوات',
                //                   style: TextStyle(fontSize: 15),
                //                   textDirection: TextDirection.rtl,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: const BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   durationChanged('60');
                //                 },
                //                 child: const Text(
                //                   '5 سنوات',
                //                   style: TextStyle(fontSize: 15),
                //                   textDirection: TextDirection.rtl,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 50,
                //               child: ElevatedButton(
                //                 style: ButtonStyle(
                //                     shape: MaterialStateProperty.all<
                //                         RoundedRectangleBorder>(
                //                         RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.circular(88.0),
                //                             side: BorderSide(
                //                                 color: Colors.blueAccent)))),
                //                 onPressed: () {
                //                   durationChanged('72');
                //                 },
                //                 child: const Text(
                //                   '6 سنوات',
                //                   style: TextStyle(
                //                     fontSize: 15,
                //                   ),
                //                   textDirection: TextDirection.rtl,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),




                Expanded(
                  flex:1,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 250,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('قيمة القرض مع الفوائد',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$totalLoanWithFaeda',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.white,
                              width: 6,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          width: 30,
                          // color: Colors.blue,
                          child: null,
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 250,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('الفائدة الكلية',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$totalFaeda',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.white,
                              width: 6,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          width: 30,
                          // color: Colors.blue,
                          child: null,
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 250,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('الفائة الشهرية',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$monthlyFaeda',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 250,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('الكفالات المطلوبة',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$requiredKafalat',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.white,
                              width: 6,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          width: 30,
                          // color: Colors.blue,
                          child: null,
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 250,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('القسط الشهري',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$monthlyKistString',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 250,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('رهن العقار',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$aakarRahn',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.white,
                              width: 6,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          width: 30,
                          // color: Colors.blue,
                          child: null,
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 250,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('رهن السيارة',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$carRahn',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 150,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('الفائة الشهرية plus',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$monthlyfaedaPlus',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 150,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('الفائة الكلية plus',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(

                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$totalfaedaPlus',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 150,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('القرض مع الفوائد plus',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(

                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$loanWithFaedaPlus',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 100,
                            width: 150,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('القسط الشهري plus',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(

                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  child: Text(
                                    '$monthlyKistPlus',
                                    // kafalatValue,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      )
          :
      Center(
        child: Text('Please expand app for best performance'),
      );

  }
}
