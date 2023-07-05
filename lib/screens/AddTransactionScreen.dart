
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletwizard/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:walletwizard/model/add_datamodel.dart';

import '../db/functions/db_functions.dart';


class AddTransactionScreen extends StatefulWidget {
  String username;
   AddTransactionScreen({super.key,
  required this.username});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {


  DateTime date=DateTime.now();
  String?Selectedmoneytype;
   String?SelectedCategoryItem;
   final _AmountController =TextEditingController();
   final _explainController =TextEditingController();

    final _formkey = GlobalKey<FormState>();


 final List<String> _categoryList=[
  'Salary',
  'Food',
  'Travel',
  'Education',
  'Gift',
  'Maintenance',
  'Other'
 ];


final List<String> _moneytypelist=[
  'Income',
  'Expense'
 ];


  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          
          child: Container(
            
            height: size.height,
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 165, 143, 210),Color(0xffddc3fc), ],),),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key:_formkey,
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Center(child: Text("Add Transaction",style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 30,fontWeight:FontWeight.bold),)),
                   const SizedBox(height: 30,),
                    
                    
                   Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 144, 106, 220),
                      borderRadius: BorderRadiusDirectional.circular(30)),
                     height:size.height*0.6,
                     width: size.width*0.8,
                    
                     child: Center(
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
            
                          
                          Container(
                           padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                           
                            width:size.width*0.6,
                            height: size.height*0.07,
                           
                           decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(30) ,
                             color: Colors.white,
                           ),
                          child: DropdownButton<String>(
                  value: Selectedmoneytype,
                  items: _moneytypelist.map((e) => DropdownMenuItem(
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image.asset('imagesMoneyType/$e.png'),
                        ),
                        const SizedBox(width: 10,),
                        Text(e, style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                    value: e,
                  )).toList(),
                  selectedItemBuilder: (BuildContext context) =>
                  _moneytypelist.map((e) => Row(
                    children: [
              SizedBox(
                width: 42,
                child: Image.asset('imagesMoneyType/$e.png'),
              ),
              const SizedBox(width: 10,),
              Text(e, style: TextStyle(fontSize: 18)),
                    ],
                  )).toList(),
                  hint: Text(
                    'Select',
                    style: GoogleFonts.ubuntu(
              fontSize: 15,
              fontWeight: FontWeight.bold,
                    ),
                  ),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (value) {
                    setState(() {
              Selectedmoneytype = value;
                    });
                  },
                ),
                          ),
                    
              
                    
                    
                          Container(
                           padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                           
                            width:size.width*0.6,
                            height: size.height*0.07,
                           
                           decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(30) ,
                             color: Colors.white,
                           ),
                             child:DropdownButton<String>(
                            value:SelectedCategoryItem,
                            items:_categoryList.map((e) => DropdownMenuItem(
                              child: Row(
                                 children: [
                                   SizedBox(
                                     width: 40,
                                     child: Image.asset('imagesCategory/${e}.png'),
                                   ),
                                   const SizedBox(width: 10,),
                                   Text(e,style: const TextStyle(fontSize: 18),)
                                 ],
                               ),
                              value: e,)).toList(),
                              selectedItemBuilder: (BuildContext context)=>
                              _categoryList.map((e) => Row(
                                  children: [
                                    SizedBox(
                                      width: 42,
                                      child:Image.asset('imagesCategory/${e}.png'),
                                    ),
                                    const SizedBox(width: 10,),
            
                                    Text(e,style: const TextStyle(fontSize: 18),)
                                  ],
                                )).toList(),
                              
                              hint: Text('select category',style: GoogleFonts.ubuntu(fontSize: 15,fontWeight:FontWeight.bold,),),
                              dropdownColor: Colors.white,
                               borderRadius: BorderRadius.circular(30),
                              isExpanded: true,
                              underline: Container(),
                             onChanged:((value){
                              setState(() {
                                SelectedCategoryItem=value!;
                              });
                             })
                          ),
                          ),
                    
                    
                    
                    
                          SizedBox(
                            width:size.width*0.6,
                            child: TextFormField(
                              controller: _AmountController,
                               validator: (value) {
                                  if(value==null || value.isEmpty){
                                     return 'please enter Amount';
                                      }else if(value.contains(',')){
                                         return 'Please remove special character';
                                      }else if(value.contains('.')){
                                         return 'Please remove special character';
                                      }else if(value.contains(' ')){
                                        return 'Please Enter a valid number';
                                      }else{
                                        return null;
                                      }
                                        },
                            //       inputFormatters: [
                            // FilteringTextInputFormatter.allow(RegExp(r'/d+')), // Only allow digits
                            //      ],
                                keyboardType: TextInputType.number,    
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText:"Amount",
                                hintStyle: GoogleFonts.ubuntu(fontSize: 15,fontWeight:FontWeight.bold), 
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none
                                  )
                              ),
                            ),
                          ),
                    
                    
                    
                    
                          SizedBox(
                            width:size.width*0.6,
                            child: TextFormField(
                              controller: _explainController,
                               validator: (value) {
                                  if(value==null || value.isEmpty){
                                     return 'value is empty';
                                      }else{
                                       return null;
                                        }
                                        },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                  hintText:"explain",
                                hintStyle: GoogleFonts.ubuntu(fontSize: 15,fontWeight:FontWeight.bold), 
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none
                                  )
                              ),
                            ),
                          ),
                    
                    
                               Container(
                                alignment: Alignment.bottomLeft,
                            width:size.width*0.6,
                             height: size.height*0.07,
                           
                           decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(30) ,
                             color: Colors.white,
                           ),
            
                          child: Center(
                            child: Row(
                              children: [
                                const SizedBox(width: 5,),
                                TextButton(onPressed: ()async{
                                  DateTime? newDate =await showDatePicker(context: context, initialDate:date, firstDate:DateTime(2023), lastDate:DateTime(2100));
                                  if(newDate==Null)return;
                                  setState(() {
                                    date=newDate!;
                                  });
                                },
                                 child:Text('Date:${date.day}/${date.month}/ ${date.year}',style: TextStyle(color:Colors.black),),),
                              ],
                            ),
                          ),
                    
                         )
                    
                        ],
                       ),
                     ),
                    ),
            
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(onPressed: (){
                          onSaveButtonClicked();
                             if(_formkey.currentState!.validate()){
                          }else{
                            print('empty value');
                          }
                      
                        },
                        
                          style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 144, 106, 220)),
                           minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                               RoundedRectangleBorder( borderRadius: BorderRadius.circular(30),
                               side: BorderSide.none),
                               
                ),
                           
                 ),
                         child:Text('save',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white) ,)
                         )
                      ],
                    )
            
                    
                    
                   ],
                   ),
            ),
          ),
        
        
          
            
            
            
            
            
            
            
          ),
        ),
      ),
    );
  }


  Future<void>onSaveButtonClicked()async{
   final _Amount= _AmountController.text.trim();
   final _explain=_explainController.text.trim();
    final _categoryItem =SelectedCategoryItem;
    final _moneytype = Selectedmoneytype;
    final _date=date;
     final _id= DateTime.now().microsecondsSinceEpoch.toString();
  
    if(_categoryItem!.isEmpty ||
    _moneytype!.isEmpty || _Amount.isEmpty||_explain.isEmpty){
      return;
    }
  
    final _tarnsactionAdd=add_dataModel(_moneytype, _categoryItem, _Amount, _explain,_date,_id);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>bottumNavigationpage(username:widget.username ,)));
    onTapTransactionAdd(_tarnsactionAdd);
   
  }
}