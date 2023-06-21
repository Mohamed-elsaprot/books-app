
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/errors/failure.dart';
import 'auth_repo.dart';


class AutheRepoImpl implements AutheRepo{
  @override
  Future<Either<Failure, Map>> Authentication({required String email, required String password,required bool login}) async {
    UserCredential? user;
    try{
      if(!login){
         user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      }else if(login){
         user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      }

      }on FirebaseAuthException catch(e){
      return left(AuthFailure.fromFirebase(e));
    }catch(e){
      print('Auth error: $e');
      return left(ServerFailure(e.toString()));
    }
    return right(
        {
          'account':user!.user!.providerData[0].email,
          'userId':user!.user!.uid
        }
    );
  }
}