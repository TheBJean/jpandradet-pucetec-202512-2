import 'package:http/http.dart' as http;

dynamic getAllProducts() async{
  final url = Uri.parse('https://pucei.edu.ec:9118/api/v1/products');
  final response = await http.get(
    url,
  headers: {
    'Content-Type': 'application/json',},
    //token

  
  
  );

  print(response.body);
  }
