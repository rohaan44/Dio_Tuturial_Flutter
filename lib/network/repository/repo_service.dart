import 'package:fake_store/models/get_all_users.dart';
import 'package:fake_store/models/map_model.dart';
import 'package:fake_store/models/products_model.dart';
import 'package:fake_store/models/response_model.dart';
import 'package:fake_store/network/network_properties/network_properties.dart';
import 'package:fake_store/network/network_services/dio_helper.dart';

class Repository {
  static final DioHelper _dioHelper = DioHelper();

//For Data which is coming as a List
  Future<List<Products>> getAPI() async {
    List response =
        await _dioHelper.get(url: "${NetworkProperties.baseUrl}/products");
    return List<Products>.from(response.map((e) => Products.fromJson(e)));
  }

//For Data which is coming as a Map
  Future<MapModel> getMapData() async {
    var response =
        await _dioHelper.get(url: "${NetworkProperties.baseMapUrl}page=2");
    return MapModel.fromJson(response);
  }
//********************************************* */
/*For Data which is coming in Map in Post API*/
  
  Future postApi(Object reqBody) async {
    var response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}/users", requestBody: reqBody);
    return response;
  }

/*For Data which is coming from the response of Post api*/
  
  Future<ResponseModel> getResponse(int id) async {
    var response =
        await _dioHelper.get(url: "${NetworkProperties.baseUrl}/users/$id");
    return ResponseModel.fromJson(response);
  }

//*******************Put Api Update flow*******************************//
//Get All Users here
Future<List<GetAllUsers>> getAllUsers() async {
    List response =
        await _dioHelper.get(url: "${NetworkProperties.baseUrl}/users");
    return List<GetAllUsers>.from(response.map((e) => GetAllUsers.fromJson(e)));
  }

  Future putApi(Object obj,int id) async {
    var response = await _dioHelper.put(
      url: "${NetworkProperties.baseUrl}/users/$id",
      requestBody: obj
    );
    return response;
  }

  //******************Delete Api***************/

Future deleteApi(int id) async {
    var response = await _dioHelper.put(
      url: "${NetworkProperties.baseUrl}/users/$id",
    );
    return response;
  }



}
