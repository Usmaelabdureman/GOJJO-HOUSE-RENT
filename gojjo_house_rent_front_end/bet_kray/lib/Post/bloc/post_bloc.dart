import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Repository/post_repository.dart';
import '../models/post.dart';
part 'post_event.dart';
part 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostLoading()) {
    on<PostLoad>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await postRepository.fetchAllPost();
        emit(SuccessOperation(posts));
      } catch (error) {
        emit(FailedOperation(error));
      }
    });

    on<PostCreate>((event, emit) async {
      try {
        await postRepository.create(event.post);
        final posts = await postRepository.fetchAllPost();
        emit(SuccessOperation(posts));
      } catch (error) {
        emit(FailedOperation(error));
      }
    });

    on<PostUpdate>((event, emit) async {
      try {
        await postRepository.update(event.id, event.post);
        final posts = await postRepository.fetchAllPost();
        emit(SuccessOperation(posts));
      } catch (error) {
        emit(FailedOperation(error));
      }
    });

    on<PostDelete>((event, emit) async {
      try {
        await postRepository.delete(event.id);
        final courses = await postRepository.fetchAllPost();
        emit(SuccessOperation(courses));
      } catch (error) {
        emit(FailedOperation(error));
      }
    });
  }
}
