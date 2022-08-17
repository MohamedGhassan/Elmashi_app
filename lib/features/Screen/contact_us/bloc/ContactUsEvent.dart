import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ContactUsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactUsEvent extends ContactUsEvents {
      String name;
      String mobile;
      String subject;
      String message;
      ContactUsEvent({
    required this.name,required this.mobile, required this.subject,required this.message
});
}
