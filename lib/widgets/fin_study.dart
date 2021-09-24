import 'package:flutter/material.dart';

class FinanceStudy extends StatefulWidget {
  const FinanceStudy({Key? key}) : super(key: key);

  @override
  _FinanceStudyState createState() => _FinanceStudyState();


}

class _FinanceStudyState extends State<FinanceStudy> {
  static const sizedBoxSpace = SizedBox(height: 24);
  final TextEditingController _loanValueTextController =TextEditingController();
  final TextEditingController _monthlySoldValueTextController =TextEditingController();
  final TextEditingController _soldTakaklifaValueTextController =TextEditingController();
  final TextEditingController _monthlyPaidValueTextController =TextEditingController();
  final TextEditingController _durationValueTextController =TextEditingController();
  final TextEditingController _totalSailedMonthly =TextEditingController();
  final TextEditingController _taklofahValue =TextEditingController();
  final TextEditingController _persopnalMasareef =TextEditingController();
  final TextEditingController _familyMasareef =TextEditingController();
  final TextEditingController _monthyMothbata =TextEditingController();
  String kafalatValue = 'لم يتم الحساب بعد';
  String monthlyValue = 'لم يتم الحساب بعد';
  String totalFaeda = 'أدخل قيمة القرض والمدة';
  String monthlyFaeda = 'أدخل قيمة القرض والمدة';
  String totalLoanWithFaeda = '--';
  String carRahn = 'أدخل قيمة القرض والمدة';
  String aakarRahn = 'أدخل قيمة القرض والمدة';

  String monthlyKistString = 'أدخل قيمة القرض والمدة';
  String requiredKafalat = 'أدخل قيمة القرض والمدة';
  String monthlyfaedaPlus = '--';
  String totalfaedaPlus = '--';
  String loanWithFaedaPlus = '--';
  String monthlyKistPlus = '--';

  String winVal='--';
  String winPercent='--';
  String totalNonthlyIn='--';
  String sumMasareef='--';
  String totalMonthlyIn='--';
  String safiIncomeMonthly='--';
  String maxKistMonthly='--';


  var temp = 0.0;




  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final height=deviceSize.height;
    final width=deviceSize.width;
/////////////////////////////////////////////////////////////////
    void totalSailedChanged(String totalSailed){

      if (_taklofahValue.value.text != ''){
        setState(() {
          var totSailed = double.parse('$totalSailed');
          var taklfah = double.parse(_taklofahValue.value.text);
          var tempWin=totSailed-taklfah;
          winVal=tempWin.toStringAsFixed(0);
          var tempPercent=(tempWin/totSailed)*100;
          winPercent=tempPercent.toStringAsFixed(0);
        });

      }
    }
    ////////////////////////////////////////////////////////////////////

    void taklofahChanged(String taklofahVal){
      if (_totalSailedMonthly.value.text != ''){
        setState(() {
          var taklfah = double.parse('$taklofahVal');
          var totSailed = double.parse(_totalSailedMonthly.value.text);
          print('$totSailed');

          var tempWin=totSailed-taklfah;
          print('$tempWin');

          winVal=tempWin.toStringAsFixed(0);
          print('$winVal');

          var tempPercent=(tempWin/totSailed)*100;

          winPercent=tempPercent.toStringAsFixed(0);
          print('$winPercent');
        });

  
}
    }
////////////////////////+
    void masareefMonthlyChanged(String masareef){
      if (_totalSailedMonthly.value.text != ''){
        setState(() {
          var msareef = double.parse('$masareef');
          var win = double.parse('$winVal');


          var tempIn=win-msareef;
          // print('$tempIn');
          totalNonthlyIn=tempIn.toStringAsFixed(0);
        });



      }
    }
    //
    void mothbataChanged(){
      var totalMonthlyIncome=double.parse('$totalNonthlyIn')+
          double.parse(_monthyMothbata.value.text);

      totalMonthlyIn=totalMonthlyIncome.toStringAsFixed(0);

      var safiMonIncome=totalMonthlyIncome-double.parse(sumMasareef);
      safiIncomeMonthly=safiMonIncome.toStringAsFixed(0);

      var maxKist=safiMonIncome*(75/100);
      maxKistMonthly=maxKist.toStringAsFixed(0);
    }
   //
    void familyMasareefChanged(){
      if(_persopnalMasareef.value.text!=''){
        var temp=double.parse(_familyMasareef.value.text)
            +double.parse(_persopnalMasareef.value.text);
        sumMasareef=temp.toStringAsFixed(0);
      }
    }

//
   void personalMasareefChanged(){
     if(_familyMasareef.value.text!=''){
       var temp=double.parse(_familyMasareef.value.text)
           +double.parse(_persopnalMasareef.value.text);
       sumMasareef=temp.toStringAsFixed(0);
     }
    }

    ////////////////////////////////////////////////////////////////////
    void loanChanged(String laonVal) {
      //setvalue in input text
      var temp2 = double.parse('$laonVal');
      temp = temp2 * 0.75 / 100;
      var monthlyFaedaPlusVal = temp2 * 0.25 / 100;
      setState(() {
        _loanValueTextController.text = laonVal;
        monthlyFaeda = temp.toStringAsFixed(0);
        monthlyfaedaPlus = monthlyFaedaPlusVal.toStringAsFixed(0);
      });
      if (_durationValueTextController.value.text != '') {
        //do math
        // var temp3 = double.parse('$d');
        var duration = _durationValueTextController.value.text;
        var temp4 = double.parse('$duration');

        var total = temp * temp4;
        var tempmonthlyFaedaPlus = double.parse('$monthlyfaedaPlus');
        setState(() {
          // _durationValueTextController.text = d;
          totalFaeda = total.toStringAsFixed(0);
          totalfaedaPlus = (tempmonthlyFaedaPlus * temp4).toStringAsFixed(0);
        });
        // var loanValtext=_loanValueTextController.value.text;

        // var totalFaedaVal=double.parse('$totalFaeda');
        // print(loanVal);
        var loanWithFaeda = total + temp2;
        totalLoanWithFaeda = loanWithFaeda.toStringAsFixed(0);

        loanWithFaedaPlus =
            ((tempmonthlyFaedaPlus * temp4) + temp2).toStringAsFixed(0);

        /////////////////////////add monthly kist
        var monthlyKist = loanWithFaeda / temp4;
        monthlyKistString = monthlyKist.toStringAsFixed(0);
        monthlyKistPlus = (((tempmonthlyFaedaPlus * temp4) + temp2) / temp4)
            .toStringAsFixed(0);
        ///////////////////////////add required kafalat
        requiredKafalat = (monthlyKist * 3).toStringAsFixed(0);

        //////////////////////////carRahn
        carRahn = (loanWithFaeda * 200 / 100).toStringAsFixed(0);
        /////////////////////////AAkarRahn
        aakarRahn = (loanWithFaeda * 150 / 100).toStringAsFixed(0);

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
        var tempmonthlyFaedaPlus = double.parse('$monthlyfaedaPlus');
        setState(() {
          // _durationValueTextController.text = d;
          totalFaeda = total.toStringAsFixed(0);
          totalfaedaPlus = (tempmonthlyFaedaPlus * temp3).toStringAsFixed(0);
        });
        var loanValtext = _loanValueTextController.value.text;
        // print('here');
        var loanVal = double.parse('$loanValtext');
        // print(loanVal);
        var loanWithFaeda = loanVal + total;
        totalLoanWithFaeda = loanWithFaeda.toStringAsFixed(0);
        loanWithFaedaPlus =
            ((tempmonthlyFaedaPlus * temp3) + loanVal).toStringAsFixed(0);
        /////////////////////////add monthly kist
        var monthlyKist = loanWithFaeda / temp3;
        monthlyKistString = monthlyKist.toStringAsFixed(0);
        monthlyKistPlus = (((tempmonthlyFaedaPlus * temp3) + loanVal) / temp3)
            .toStringAsFixed(0);
        ///////////////////////////add required kafalat
        requiredKafalat = (monthlyKist * 3).toStringAsFixed(0);
        //////////////////////////carRahn
        carRahn = (loanWithFaeda * 200 / 100).toStringAsFixed(0);
        /////////////////////////AAkarRahn
        aakarRahn = (loanWithFaeda * 150 / 100).toStringAsFixed(0);

        //set reult
      }
    }

    return
      height>=830&&width>=850?
      Column(
      children: [

        Expanded(
          flex: 1,
          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        border: Border.all(
                          color: Colors.lightBlue,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 350,
                      // width: 250,
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('معلومات أساسية',
                            style: TextStyle(
                                fontSize: 18, color: Colors.blueAccent),
                          ),

                          Expanded(
                            child:
                            Row(children: [
                              Expanded(child:
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child:
                                  TextFormField(
                                    onEditingComplete: () {
                                      taklofahChanged(_taklofahValue.value.text);
                                        FocusScope.of(context).unfocus();
                                    },
                                    onChanged: (text) {
                                      taklofahChanged(text);
                                      print('First text field: $text');
                                    },
                                    controller: _taklofahValue,
                                    textAlign: TextAlign.center,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'قيمة البضاعة المباعة (التكلفة)',
                                      labelStyle: TextStyle(fontSize: 15),
                                      // alignLabelWithHint: true,
                                      suffixText: 'ل.س',
                                    ),
                                    maxLines: 1,
                                  ),),
                              ),),
                              Expanded(
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      onEditingComplete: () {
                                        totalSailedChanged(_totalSailedMonthly.value.text);
                                        FocusScope.of(context).unfocus();
                                      },
                                      onChanged: (text) {
                                        totalSailedChanged(text);
                                        print('First text field: $text');
                                      },
                                      controller: _totalSailedMonthly,
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.center,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'إجمالي المبيعات الشهرية  ',
                                        labelStyle: TextStyle(fontSize: 15),
                                        // alignLabelWithHint: true,
                                        suffixText: 'ل.س',
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),


                            ],),

                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Text(' نسبة الربح : $winPercent  %',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,),
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
                                    height: 25,
                                    width: 25,
                                    // color: Colors.blue,
                                    child: null,
                                  ),
                                  Expanded(
                                    child: Text(' قيمة الربح: $winVal  ل.س ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,),
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
                                    height: 25,
                                    width: 25,
                                    // color: Colors.blue,
                                    child: null,
                                  ),



                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          //   child: Text('صافي دخل المشروع الشهري',
                          Expanded(
                            child:
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Expanded(
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child:
                                      TextFormField(
                                        onEditingComplete: () {
                                          masareefMonthlyChanged(_monthlyPaidValueTextController.value.text);
                                          FocusScope.of(context).unfocus();
                                        },
                                        onChanged: (text) {if(text!='')
                                          masareefMonthlyChanged(text);
                                        else{
                                          masareefMonthlyChanged('0');
                                        }
                                          print('First text field: $text');
                                        },
                                        controller: _monthlyPaidValueTextController,
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'مجموع المصاريف الشهرية',
                                          labelStyle: TextStyle(fontSize: 15),
                                          // alignLabelWithHint: true,
                                          suffixText: 'ل.س',
                                        ),
                                        maxLines: 1,
                                      ),),
                                  ),


                                ],),
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('صافي دخل المشروع الشهري:  $totalNonthlyIn',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.orangeAccent),
                                  textAlign: TextAlign.center,

                                  textDirection: TextDirection.rtl,),
                              ],

                            ),
                          ),//




                        ],
                      ),
                    ),
                  ),





                ]),
          ),
        ),
        Expanded(
          flex:1,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      border: Border.all(
                        color: Colors.lightBlue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: 350,
                    width: 250,
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('المصاريف الشهرية للمقترض',
                          style: TextStyle(
                              fontSize: 18, color: Colors.blueAccent),
                        ),

                        Expanded(
                          child: Padding(
                            padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                onEditingComplete: () {
                                  personalMasareefChanged();


                                  FocusScope.of(context).unfocus();
                                },
                                controller: _persopnalMasareef,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'مصاريف شخصية',
                                  labelStyle: TextStyle(fontSize: 15),
                                  // alignLabelWithHint: true,
                                  suffixText: 'ل.س',
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),

                        /////////////////////////////////////////////////////////////////////
                        Expanded(
                          child:  Padding(
                            padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child:
                              TextFormField(
                                onEditingComplete: () {

                                  familyMasareefChanged();

                                  FocusScope.of(context).unfocus();
                                },
                                controller: _familyMasareef,
                                textAlign: TextAlign.center,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'مصاريف عائلية',
                                  labelStyle: TextStyle(fontSize: 15),
                                  // alignLabelWithHint: true,
                                  suffixText: 'ل.س',
                                ),
                                maxLines: 1,
                              ),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('المجموع:  $sumMasareef',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.orangeAccent),
                                textAlign: TextAlign.center,

                                textDirection: TextDirection.rtl,),
                            ],

                          ),
                        ),/////




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

            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
              Expanded(
                    flex:2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                border: Border.all(
                                  color: Colors.lightBlue,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              height: 350,
                              width: 250,
                              // color: Colors.blue,
                              child:
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [



                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child:
                                      TextFormField(
                                        onEditingComplete: () {

                                          mothbataChanged();


                                          FocusScope.of(context).unfocus();
                                        },
                                        controller: _monthyMothbata,
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'دخول شهرية أخرى مثبتة',
                                          labelStyle: TextStyle(fontSize: 15),
                                          // alignLabelWithHint: true,
                                          suffixText: 'ل.س',
                                        ),
                                        maxLines: 1,
                                      ),),

                                  Expanded(

                                    // flex: 1,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 15, vertical:10 ),
                                      child:
                                      // height>=858?
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                        children: [

                                             Expanded(
                                               child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children:[
                                                Text('اجمالي الدخل الشهري الكلي:  $totalMonthlyIn',
                                                  style: TextStyle(
                                                      fontSize: 18, color: Colors.blue),
                                                  textAlign: TextAlign.right,
                                                  textDirection: TextDirection.rtl,),
                                          ],
                                            ),
                                             ),
                                          Expanded(
                                            child:  Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children:[
                                                Text('اجمالي صافي الدخل الشهري:  $safiIncomeMonthly',
                                                  style: TextStyle(
                                                      fontSize: 18, color: Colors.blue),
                                                  textAlign: TextAlign.right,
                                                  textDirection: TextDirection.rtl,),
                                              ],
                                            ),

                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children:[
                                                Text('الحد الأعظمي للقسط بناء على صافي الدخل الشهري:  $maxKistMonthly',
                                                  style: TextStyle(
                                                      fontSize: 18, color: Colors.blue),
                                                  textAlign: TextAlign.right,
                                                  textDirection: TextDirection.rtl,),
                                              ],
                                            ),
                                          )



                                        ],
                                      )
                                      // :
                                      //   Column(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      //     children: [
                                      //       Expanded(
                                      //         child: Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             Row(
                                      //               mainAxisAlignment: MainAxisAlignment.start,
                                      //               children:[
                                      //                 Text('اجمالي الدخل الشهري الكلي:  $totalLoanWithFaeda',
                                      //                   style: TextStyle(
                                      //                       fontSize: 16, color: Colors.blue),
                                      //                   textAlign: TextAlign.right,
                                      //                   textDirection: TextDirection.rtl,),
                                      //               ],
                                      //             ),
                                      //             Container(
                                      //               decoration: BoxDecoration(
                                      //                 color: Colors.blue,
                                      //                 border: Border.all(
                                      //                   color: Colors.white,
                                      //                   width: 6,
                                      //                 ),
                                      //                 borderRadius: BorderRadius.circular(25),
                                      //               ),
                                      //               height: 25,
                                      //               width: 25,
                                      //               // color: Colors.blue,
                                      //               child: null,
                                      //             ),
                                      //             Row(
                                      //               mainAxisAlignment: MainAxisAlignment.start,
                                      //               children:[
                                      //                 Text('اجمالي صافي الدخل الشهري:  $totalLoanWithFaeda',
                                      //                   style: TextStyle(
                                      //                       fontSize: 16, color: Colors.blue),
                                      //                   textAlign: TextAlign.right,
                                      //                   textDirection: TextDirection.rtl,),
                                      //               ],
                                      //             ),
                                      //
                                      //           ],),
                                      //       ),
                                      //        Expanded(
                                      //          child: Row(
                                      //            mainAxisAlignment: MainAxisAlignment.center,
                                      //            children: [
                                      //              Row(
                                      //                mainAxisAlignment: MainAxisAlignment.end,
                                      //                children:[
                                      //                  Text('الحد الأعظمي للقسط بناء على صافي الدخل الشهري:  $totalLoanWithFaeda',
                                      //                    style: TextStyle(
                                      //                        fontSize: 16, color: Colors.blue),
                                      //                    textAlign: TextAlign.right,
                                      //                    textDirection: TextDirection.rtl,),
                                      //                ],
                                      //              ),
                                      //            ],
                                      //
                                      //          ),
                                      //        )
                                      //     ],
                                      //   )
                                    ),
                                  ),

                                  /////////////////////////////////////////////////////////////////////


                                ],
                              ),
    ),
                            ),
                          ),

                        ],
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
            child: Row(
              children: [
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
                              color: Colors.white38,
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 350,
                            width: 250,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('المصاريف الشهرية للمقترض',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blueAccent),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        onEditingComplete: () {
                                          loanChanged(_loanValueTextController.value.text);
                                          FocusScope.of(context).unfocus();
                                        },
                                        controller: _monthlySoldValueTextController,
                                        textDirection: TextDirection.ltr,
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'مصاريف شخصية',
                                          labelStyle: TextStyle(fontSize: 15),
                                          // alignLabelWithHint: true,
                                          suffixText: 'ل.س',
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ),

                                /////////////////////////////////////////////////////////////////////
                                Expanded(
                                  child:  Padding(
                                    padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child:
                                      TextFormField(
                                        onEditingComplete: () {
                                          durationChanged(_durationValueTextController.value.text);
                                          FocusScope.of(context).unfocus();
                                        },
                                        controller: _soldTakaklifaValueTextController,
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'مصاريف عائلية',
                                          labelStyle: TextStyle(fontSize: 15),
                                          // alignLabelWithHint: true,
                                          suffixText: 'ل.س',
                                        ),
                                        maxLines: 1,
                                      ),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('المجموع:  $totalLoanWithFaeda',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.orangeAccent),
                                        textAlign: TextAlign.center,

                                        textDirection: TextDirection.rtl,),
                                    ],

                                  ),
                                ),/////////////////////////////////




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

                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [

                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                border: Border.all(
                                  color: Colors.lightBlue,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              height: 350,
                              // width: 250,
                              // color: Colors.blue,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('معلومات أساسية',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blueAccent),
                                  ),

                                  Expanded(
                                    child:
                                    Row(children: [
                                      Expanded(
                                        child: Padding(
                                          padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: TextFormField(
                                              onEditingComplete: () {
                                                loanChanged(_loanValueTextController.value.text);
                                                FocusScope.of(context).unfocus();
                                              },
                                              controller: _monthlySoldValueTextController,
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.center,
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'إجمالي المبيعات الشهرية  ',
                                                labelStyle: TextStyle(fontSize: 15),
                                                // alignLabelWithHint: true,
                                                suffixText: 'ل.س',
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(child:
                                      Padding(
                                        padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child:
                                          TextFormField(
                                            onEditingComplete: () {
                                              durationChanged(_durationValueTextController.value.text);
                                              FocusScope.of(context).unfocus();
                                            },
                                            controller: _soldTakaklifaValueTextController,
                                            textAlign: TextAlign.center,
                                            textInputAction: TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'قيمة البضاعة المباعة (التكلفة)',
                                              labelStyle: TextStyle(fontSize: 15),
                                              // alignLabelWithHint: true,
                                              suffixText: 'ل.س',
                                            ),
                                            maxLines: 1,
                                          ),),
                                      ),),

                                    ],),

                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Text(' نسبة الربح %: $totalLoanWithFaeda',
                                              style: TextStyle(
                                                  fontSize: 18, color: Colors.blue),
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,),
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
                                            height: 25,
                                            width: 25,
                                            // color: Colors.blue,
                                            child: null,
                                          ),
                                          Expanded(
                                            child: Text(' قيمة الربح: $totalLoanWithFaeda',
                                              style: TextStyle(
                                                  fontSize: 18, color: Colors.blue),
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,),
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
                                            height: 25,
                                            width: 25,
                                            // color: Colors.blue,
                                            child: null,
                                          ),



                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  //   child: Text('صافي دخل المشروع الشهري',
                                  Expanded(
                                    child:
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          Expanded(
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child:
                                              TextFormField(
                                                onEditingComplete: () {
                                                  durationChanged(_durationValueTextController.value.text);
                                                  FocusScope.of(context).unfocus();
                                                },
                                                controller: _monthlyPaidValueTextController,
                                                textAlign: TextAlign.center,
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.number,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'مجموع المصاريف الشهرية',
                                                  labelStyle: TextStyle(fontSize: 15),
                                                  // alignLabelWithHint: true,
                                                  suffixText: 'ل.س',
                                                ),
                                                maxLines: 1,
                                              ),),
                                          ),


                                        ],),
                                    ),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('صافي دخل المشروع الشهري:  $totalLoanWithFaeda',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.orangeAccent),
                                          textAlign: TextAlign.center,

                                          textDirection: TextDirection.rtl,),
                                      ],

                                    ),
                                  ),//////////////////////////////////////////////////////////////





                                ],
                              ),
                            ),
                          ),





                        ]),
                  ),
                ),

              ],
            ),
          ),
          
          Expanded(
            flex: 1,
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [


                    Expanded(
                      flex:2,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  border: Border.all(
                                    color: Colors.lightBlue,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                height: 350,
                                width: 250,
                                // color: Colors.blue,
                                child:
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                                  child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [



                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child:
                                        TextFormField(
                                          onEditingComplete: () {
                                            durationChanged(_durationValueTextController.value.text);
                                            FocusScope.of(context).unfocus();
                                          },
                                          controller: _monthlyPaidValueTextController,
                                          textAlign: TextAlign.center,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'دخول شهرية أخرى مثبتة',
                                            labelStyle: TextStyle(fontSize: 15),
                                            // alignLabelWithHint: true,
                                            suffixText: 'ل.س',
                                          ),
                                          maxLines: 1,
                                        ),),

                                      Expanded(

                                        // flex: 1,
                                        child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(horizontal: 15, vertical:10 ),
                                            child:
                                            // height>=858?
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                                              children: [

                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children:[
                                                      Text('اجمالي الدخل الشهري الكلي:  $totalLoanWithFaeda',
                                                        style: TextStyle(
                                                            fontSize: 18, color: Colors.blue),
                                                        textAlign: TextAlign.right,
                                                        textDirection: TextDirection.rtl,),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child:  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children:[
                                                      Text('اجمالي صافي الدخل الشهري:  $totalLoanWithFaeda',
                                                        style: TextStyle(
                                                            fontSize: 18, color: Colors.blue),
                                                        textAlign: TextAlign.right,
                                                        textDirection: TextDirection.rtl,),
                                                    ],
                                                  ),

                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children:[
                                                      Text('الحد الأعظمي للقسط بناء على صافي الدخل الشهري:  $totalLoanWithFaeda',
                                                        style: TextStyle(
                                                            fontSize: 18, color: Colors.blue),
                                                        textAlign: TextAlign.right,
                                                        textDirection: TextDirection.rtl,),
                                                    ],
                                                  ),
                                                )



                                              ],
                                            )
                                          // :
                                          //   Column(
                                          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          //     children: [
                                          //       Expanded(
                                          //         child: Row(
                                          //           mainAxisAlignment: MainAxisAlignment.center,
                                          //           children: [
                                          //             Row(
                                          //               mainAxisAlignment: MainAxisAlignment.start,
                                          //               children:[
                                          //                 Text('اجمالي الدخل الشهري الكلي:  $totalLoanWithFaeda',
                                          //                   style: TextStyle(
                                          //                       fontSize: 16, color: Colors.blue),
                                          //                   textAlign: TextAlign.right,
                                          //                   textDirection: TextDirection.rtl,),
                                          //               ],
                                          //             ),
                                          //             Container(
                                          //               decoration: BoxDecoration(
                                          //                 color: Colors.blue,
                                          //                 border: Border.all(
                                          //                   color: Colors.white,
                                          //                   width: 6,
                                          //                 ),
                                          //                 borderRadius: BorderRadius.circular(25),
                                          //               ),
                                          //               height: 25,
                                          //               width: 25,
                                          //               // color: Colors.blue,
                                          //               child: null,
                                          //             ),
                                          //             Row(
                                          //               mainAxisAlignment: MainAxisAlignment.start,
                                          //               children:[
                                          //                 Text('اجمالي صافي الدخل الشهري:  $totalLoanWithFaeda',
                                          //                   style: TextStyle(
                                          //                       fontSize: 16, color: Colors.blue),
                                          //                   textAlign: TextAlign.right,
                                          //                   textDirection: TextDirection.rtl,),
                                          //               ],
                                          //             ),
                                          //
                                          //           ],),
                                          //       ),
                                          //        Expanded(
                                          //          child: Row(
                                          //            mainAxisAlignment: MainAxisAlignment.center,
                                          //            children: [
                                          //              Row(
                                          //                mainAxisAlignment: MainAxisAlignment.end,
                                          //                children:[
                                          //                  Text('الحد الأعظمي للقسط بناء على صافي الدخل الشهري:  $totalLoanWithFaeda',
                                          //                    style: TextStyle(
                                          //                        fontSize: 16, color: Colors.blue),
                                          //                    textAlign: TextAlign.right,
                                          //                    textDirection: TextDirection.rtl,),
                                          //                ],
                                          //              ),
                                          //            ],
                                          //
                                          //          ),
                                          //        )
                                          //     ],
                                          //   )
                                        ),
                                      ),

                                      /////////////////////////////////////////////////////////////////////


                                    ],
                                  ),
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
          )
    ;
  }
}
