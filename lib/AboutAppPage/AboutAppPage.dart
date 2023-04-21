import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:work_base/ChooseYourProfile/ChooseYourProfile.dart';
class AboutApppage extends StatefulWidget {
  const AboutApppage({Key? key}) : super(key: key);

  @override
  State<AboutApppage> createState() => _AboutApppageState();
}


class _AboutApppageState extends State<AboutApppage> {
 final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Column(
        children: [
          SizedBox(height: 90,),
          Container(
            //height: 500,
            height: MediaQuery.of(context).size.height/1.42,

            margin: EdgeInsets.all(20),
           child: PageView(
             controller:  _controller,
             children: [
               containerProductManager(),
               EmloyeeatCompany(),
               HRofCompany(),
             ],
           ),
          ),
          Transform.translate(
            offset: Offset(0, -90),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ScrollingDotsEffect(
                dotColor: Colors.black38,
                activeDotColor: Colors.black,
                dotHeight: 8,
                dotWidth:  13,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.center,
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChooseYourProfile()  ));
              }, child: Text('SKIP')))
        ],
      ),
    );

  }
}
Widget containerProductManager(){
  return Builder(
    builder: (context) {
      return Column(
        children: [
          const Text('INSIGHTS OF PRODUCT MANAGER',style: TextStyle(color: Colors.black,
            fontSize: 20  ,
            fontWeight: FontWeight.w500 ,
          ),maxLines: 1,
          ),
          SizedBox(height: 20,),
          Container(
            height: 360,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(fit: BoxFit.fitHeight,image: AssetImage('Images/product-manager.png')),
            ),
          ),
        ],
      );
    }
  );
}

Widget EmloyeeatCompany(){
  return Builder(
      builder: (context) {
        return Column(
          children: [
            const Text('SHARE A COMMON BASE',style: TextStyle(color: Colors.black,
              fontSize: 20  ,
              fontWeight: FontWeight.w500 ,
            ),maxLines: 1,
            ),
            SizedBox(height: 20,),
            Container(
              height: 360,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                image: DecorationImage(fit: BoxFit.cover,image: AssetImage('Images/employees.png')),
              ),
            ),
          ],
        );
      }
  );
}

Widget HRofCompany(){
  return Builder(
      builder: (context) {
        return Column(
          children: [
            const Text('CREATE YOUR NETWORK',style: TextStyle(color: Colors.black,
              fontSize: 20  ,
              fontWeight: FontWeight.w500 ,
            ),maxLines: 1,
            ),
            SizedBox(height: 20,),
            Container(
              height: 360,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                image: DecorationImage(fit: BoxFit.cover,image: AssetImage('Images/HR.jpg')),
              ),
            ),
          ],
        );
      }
  );
}

