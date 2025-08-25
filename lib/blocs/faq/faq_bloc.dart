// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rent_a_car_auto/blocs/faq/faq_event.dart';
// import 'package:rent_a_car_auto/blocs/faq/faq_state.dart';
// import 'package:rent_a_car_auto/repository/faq_repository.dart';

// class FaqBloc extends Bloc<FaqEvent, FaqState>{
//   final FaqRepository repository;

//   FaqBloc({required this.repository}) : super(FaqLoading()) {
//     on<LoadFaq>(_onLoadFaq);
//     on<AddFaq>(_onAddFaq);
//     on<ToggleFaqStatus>(_toggleFaqStatus);
//     on<DeleteFaq>(_onDeleteFaq);
//     on<EditFaq>(_onEditFaq);
//   }

//   Future<void> _onLoadFaq (LoadFaq event, Emitter<FaqState> emit) async{
//     emit(FaqLoading());
//     try {
//       final faq = await repository.getAllFaq();
//       emit(FaqLoaded(faq));
//     } catch (e) {
//       emit(FaqError('Ошибка загрузки $e'));
//     }
//   }

//   Future<void> _onAddFaq (AddFaq event, Emitter<FaqState> emit) async{
//     try {
//       if (state is FaqLoaded) {
//         final currentState = (state as FaqLoaded).faqmodel;
//         await repository.addFaq(event.faq);
//         final updatedFaq = await repository.getAllFaq();
//         emit(FaqLoaded(updatedFaq));
//       }
//     } catch (e) {
//       emit(FaqError('Ошибка добавления $e'));
//     }
//   }

//   Future<void> _onDeleteFaq (DeleteFaq event, Emitter<FaqState> emit) async{
//     try {
//       if(state is FaqLoaded) {
//         await repository.deleteFaq(event.id);
//         final updateFaq = await repository.getAllFaq();
//         emit(FaqLoaded(updateFaq));
//       }
//     } catch (e) {
//       emit(FaqError('Ошибка удаления $e'));
//     }
//   }

//   Future<void> _toggleFaqStatus(ToggleFaqStatus event, Emitter<FaqState> emit) async{
//     try {
//       if (state is FaqLoaded) {
//         await repository.toggleFaqStatus(event.id);
//         final updateFaq = await repository.getAllFaq();
//         emit(FaqLoaded(updateFaq));
//       }
//     } catch (e) {
//       emit(FaqError('Ошибка обновления $e'));
//     }
//   }

//   Future<void> _onEditFaq(EditFaq event, Emitter<FaqState> emit) async{
//     try {
//       if(state is FaqLoaded) {
//         await repository.editFaq(event.faq);
//         final updateFaq = await repository.getAllFaq();
//         emit(FaqLoaded(updateFaq));
//       }
//     } catch (e) {
//       emit(FaqError('Ошибка изменения $e'));
//     }
//   }
// }