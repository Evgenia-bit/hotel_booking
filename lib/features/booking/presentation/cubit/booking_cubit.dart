import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/booking/domain/entity/booking.dart';
import 'package:hotel_booking/features/booking/domain/entity/buyer.dart';
import 'package:hotel_booking/features/booking/domain/entity/tourist.dart';
import 'package:hotel_booking/features/booking/domain/repository/booking_repository.dart';
import 'package:email_validator/email_validator.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this._repository) : super(BookingState()) {
    load();
  }

  final BookingRepository _repository;

  Future<void> load() async {
    if (state.loading == false) emit(state.copyWith(loading: true));
    try {
      final booking = await _repository.getBookingData();
      emit(state.copyWith(booking: booking));
    } catch (e) {
      emit(state.copyWith(failed: true));
    }
  }

  void changeBuyerPhone(String phone) {
    emit(
      state.copyWith(
        buyer: state.buyer.copyWith(phone: phone),
      ),
    );
  }

  void changeBuyerEmail(String email) {
    emit(
      state.copyWith(
        buyer: state.buyer.copyWith(email: email),
      ),
    );
  }

  void addTourist() {
    final list = state.touristList;

    emit(
      state.copyWith(touristList: [...list, Tourist(index: list.length)]),
    );
  }

  void changeTourist(Tourist tourist) {
    List<Tourist> touristList = [...state.touristList];
    touristList[tourist.index] = tourist;

    emit(
      state.copyWith(touristList: touristList),
    );
  }

  bool validateForms() {
    final buyerValid = validateBuyerForm();
    final touristsValid = _validateTouristForms();
    return buyerValid && touristsValid;
  }

  bool validateBuyerForm() {
    final isValid = isValidPhone() && isValidEmail();
    emit(
      state.copyWith(buyer: state.buyer.copyWith(isValid: isValid)),
    );
    return isValid;
  }

  bool _validateTouristForms() {
    bool isValidTouristForms = true;

    final touristList = state.touristList.map(
      (t) {

        final isValidTourist = t.firstName.isNotEmpty &&
            t.lastName.isNotEmpty &&
            t.citizenship.isNotEmpty &&
            t.dateOfBirth != null &&
            t.passportNumber != null &&
            t.passportValidityPeriod != null;

        if (!isValidTourist) isValidTouristForms = false;

        return t.copyWith(
          isValid: isValidTourist,
        );
      },
    ).toList();

    emit(
      state.copyWith(
        touristList: touristList,
      ),
    );
    
    return isValidTouristForms;
  }

  bool isValidPhone() {
    return state.buyer.phone.length == 18;
  }

  bool isValidEmail() {
    return EmailValidator.validate(state.buyer.email);
  }
}
