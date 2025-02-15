// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'cmnts_res_model.freezed.dart';
// part 'cmnts_res_model.g.dart';

// @freezed
// class CmntsResModel with _$CmntsResModel {
//   const factory CmntsResModel({
//     @JsonKey(name: "cmnts") List<Comment>? cmnts,
//     @JsonKey(name: "meta") Meta? meta,
//   }) = _CmntsResModel;

//   factory CmntsResModel.fromJson(Map<String, dynamic> json) =>
//       _$CmntsResModelFromJson(json);
// }

// @freezed
// class Comment with _$Comment {
//   const factory Comment({
//     @JsonKey(name: "id") int? id,
//     @JsonKey(name: "comment") String? comment,
//     @JsonKey(name: "image_url") dynamic imageUrl,
//     @JsonKey(name: "video_url") dynamic videoUrl,
//     @JsonKey(name: "comment_owner") CommentOwner? commentOwner,
//     @JsonKey(name: "isOwner") bool? isOwner,
//     @JsonKey(name: "created_at") String? createdAt,
//   }) = _Comment;

//   factory Comment.fromJson(Map<String, dynamic> json) =>
//       _$CommentFromJson(json);
// }

// @freezed
// class CommentOwner with _$CommentOwner {
//   const factory CommentOwner({
//     @JsonKey(name: "type") String? type,
//     @JsonKey(name: "name") String? name,
//     @JsonKey(name: "image") String? image,
//   }) = _CommentOwner;

//   factory CommentOwner.fromJson(Map<String, dynamic> json) =>
//       _$CommentOwnerFromJson(json);
// }

// @freezed
// class Meta with _$Meta {
//   const factory Meta({
//     @JsonKey(name: "post_id") int? postId,
//     @JsonKey(name: "current_page") int? currentPage,
//     @JsonKey(name: "total_pages") int? totalPages,
//     @JsonKey(name: "total_comments") int? totalComments,
//     @JsonKey(name: "per_page") int? perPage,
//     @JsonKey(name: "has_next_page") bool? hasNextPage,
//     @JsonKey(name: "has_previous_page") bool? hasPreviousPage,
//   }) = _Meta;

//   factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
// }
