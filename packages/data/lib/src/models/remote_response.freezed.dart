// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemoteResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String message, bool success, int? statusCode)
        failure,
    required TResult Function(T data) data,
    required TResult Function() noData,
    required TResult Function(String message) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(String message, bool success, int? statusCode)? failure,
    TResult? Function(T data)? data,
    TResult? Function()? noData,
    TResult? Function(String message)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String message, bool success, int? statusCode)? failure,
    TResult Function(T data)? data,
    TResult Function()? noData,
    TResult Function(String message)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_NoData<T> value) noData,
    required TResult Function(_UnexpectedError<T> value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection<T> value)? noConnection,
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_NoData<T> value)? noData,
    TResult? Function(_UnexpectedError<T> value)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Data<T> value)? data,
    TResult Function(_NoData<T> value)? noData,
    TResult Function(_UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteResponseCopyWith<T, $Res> {
  factory $RemoteResponseCopyWith(
          RemoteResponse<T> value, $Res Function(RemoteResponse<T>) then) =
      _$RemoteResponseCopyWithImpl<T, $Res, RemoteResponse<T>>;
}

/// @nodoc
class _$RemoteResponseCopyWithImpl<T, $Res, $Val extends RemoteResponse<T>>
    implements $RemoteResponseCopyWith<T, $Res> {
  _$RemoteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NoConnectionImplCopyWith<T, $Res> {
  factory _$$NoConnectionImplCopyWith(_$NoConnectionImpl<T> value,
          $Res Function(_$NoConnectionImpl<T>) then) =
      __$$NoConnectionImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NoConnectionImplCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$NoConnectionImpl<T>>
    implements _$$NoConnectionImplCopyWith<T, $Res> {
  __$$NoConnectionImplCopyWithImpl(
      _$NoConnectionImpl<T> _value, $Res Function(_$NoConnectionImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoConnectionImpl<T> extends _NoConnection<T> {
  const _$NoConnectionImpl() : super._();

  @override
  String toString() {
    return 'RemoteResponse<$T>.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoConnectionImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String message, bool success, int? statusCode)
        failure,
    required TResult Function(T data) data,
    required TResult Function() noData,
    required TResult Function(String message) unexpectedError,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(String message, bool success, int? statusCode)? failure,
    TResult? Function(T data)? data,
    TResult? Function()? noData,
    TResult? Function(String message)? unexpectedError,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String message, bool success, int? statusCode)? failure,
    TResult Function(T data)? data,
    TResult Function()? noData,
    TResult Function(String message)? unexpectedError,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_NoData<T> value) noData,
    required TResult Function(_UnexpectedError<T> value) unexpectedError,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection<T> value)? noConnection,
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_NoData<T> value)? noData,
    TResult? Function(_UnexpectedError<T> value)? unexpectedError,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Data<T> value)? data,
    TResult Function(_NoData<T> value)? noData,
    TResult Function(_UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection<T> extends RemoteResponse<T> {
  const factory _NoConnection() = _$NoConnectionImpl<T>;
  const _NoConnection._() : super._();
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, bool success, int? statusCode});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? success = null,
    Object? statusCode = freezed,
  }) {
    return _then(_$FailureImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FailureImpl<T> extends _Failure<T> {
  const _$FailureImpl(this.message, this.success, {this.statusCode})
      : super._();

  @override
  final String message;
  @override
  final bool success;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'RemoteResponse<$T>.failure(message: $message, success: $success, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, success, statusCode);

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String message, bool success, int? statusCode)
        failure,
    required TResult Function(T data) data,
    required TResult Function() noData,
    required TResult Function(String message) unexpectedError,
  }) {
    return failure(message, success, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(String message, bool success, int? statusCode)? failure,
    TResult? Function(T data)? data,
    TResult? Function()? noData,
    TResult? Function(String message)? unexpectedError,
  }) {
    return failure?.call(message, success, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String message, bool success, int? statusCode)? failure,
    TResult Function(T data)? data,
    TResult Function()? noData,
    TResult Function(String message)? unexpectedError,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message, success, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_NoData<T> value) noData,
    required TResult Function(_UnexpectedError<T> value) unexpectedError,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection<T> value)? noConnection,
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_NoData<T> value)? noData,
    TResult? Function(_UnexpectedError<T> value)? unexpectedError,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Data<T> value)? data,
    TResult Function(_NoData<T> value)? noData,
    TResult Function(_UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure<T> extends RemoteResponse<T> {
  const factory _Failure(final String message, final bool success,
      {final int? statusCode}) = _$FailureImpl<T>;
  const _Failure._() : super._();

  String get message;
  bool get success;
  int? get statusCode;

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataImplCopyWith<T, $Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl<T> value, $Res Function(_$DataImpl<T>) then) =
      __$$DataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DataImplCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$DataImpl<T>>
    implements _$$DataImplCopyWith<T, $Res> {
  __$$DataImplCopyWithImpl(
      _$DataImpl<T> _value, $Res Function(_$DataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DataImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DataImpl<T> extends _Data<T> {
  const _$DataImpl(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'RemoteResponse<$T>.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<T, _$DataImpl<T>> get copyWith =>
      __$$DataImplCopyWithImpl<T, _$DataImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String message, bool success, int? statusCode)
        failure,
    required TResult Function(T data) data,
    required TResult Function() noData,
    required TResult Function(String message) unexpectedError,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(String message, bool success, int? statusCode)? failure,
    TResult? Function(T data)? data,
    TResult? Function()? noData,
    TResult? Function(String message)? unexpectedError,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String message, bool success, int? statusCode)? failure,
    TResult Function(T data)? data,
    TResult Function()? noData,
    TResult Function(String message)? unexpectedError,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_NoData<T> value) noData,
    required TResult Function(_UnexpectedError<T> value) unexpectedError,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection<T> value)? noConnection,
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_NoData<T> value)? noData,
    TResult? Function(_UnexpectedError<T> value)? unexpectedError,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Data<T> value)? data,
    TResult Function(_NoData<T> value)? noData,
    TResult Function(_UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data<T> extends RemoteResponse<T> {
  const factory _Data(final T data) = _$DataImpl<T>;
  const _Data._() : super._();

  T get data;

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<T, _$DataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoDataImplCopyWith<T, $Res> {
  factory _$$NoDataImplCopyWith(
          _$NoDataImpl<T> value, $Res Function(_$NoDataImpl<T>) then) =
      __$$NoDataImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NoDataImplCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$NoDataImpl<T>>
    implements _$$NoDataImplCopyWith<T, $Res> {
  __$$NoDataImplCopyWithImpl(
      _$NoDataImpl<T> _value, $Res Function(_$NoDataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoDataImpl<T> extends _NoData<T> {
  const _$NoDataImpl() : super._();

  @override
  String toString() {
    return 'RemoteResponse<$T>.noData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoDataImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String message, bool success, int? statusCode)
        failure,
    required TResult Function(T data) data,
    required TResult Function() noData,
    required TResult Function(String message) unexpectedError,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(String message, bool success, int? statusCode)? failure,
    TResult? Function(T data)? data,
    TResult? Function()? noData,
    TResult? Function(String message)? unexpectedError,
  }) {
    return noData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String message, bool success, int? statusCode)? failure,
    TResult Function(T data)? data,
    TResult Function()? noData,
    TResult Function(String message)? unexpectedError,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_NoData<T> value) noData,
    required TResult Function(_UnexpectedError<T> value) unexpectedError,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection<T> value)? noConnection,
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_NoData<T> value)? noData,
    TResult? Function(_UnexpectedError<T> value)? unexpectedError,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Data<T> value)? data,
    TResult Function(_NoData<T> value)? noData,
    TResult Function(_UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class _NoData<T> extends RemoteResponse<T> {
  const factory _NoData() = _$NoDataImpl<T>;
  const _NoData._() : super._();
}

/// @nodoc
abstract class _$$UnexpectedErrorImplCopyWith<T, $Res> {
  factory _$$UnexpectedErrorImplCopyWith(_$UnexpectedErrorImpl<T> value,
          $Res Function(_$UnexpectedErrorImpl<T>) then) =
      __$$UnexpectedErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnexpectedErrorImplCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$UnexpectedErrorImpl<T>>
    implements _$$UnexpectedErrorImplCopyWith<T, $Res> {
  __$$UnexpectedErrorImplCopyWithImpl(_$UnexpectedErrorImpl<T> _value,
      $Res Function(_$UnexpectedErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnexpectedErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnexpectedErrorImpl<T> extends _UnexpectedError<T> {
  const _$UnexpectedErrorImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'RemoteResponse<$T>.unexpectedError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedErrorImplCopyWith<T, _$UnexpectedErrorImpl<T>> get copyWith =>
      __$$UnexpectedErrorImplCopyWithImpl<T, _$UnexpectedErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String message, bool success, int? statusCode)
        failure,
    required TResult Function(T data) data,
    required TResult Function() noData,
    required TResult Function(String message) unexpectedError,
  }) {
    return unexpectedError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(String message, bool success, int? statusCode)? failure,
    TResult? Function(T data)? data,
    TResult? Function()? noData,
    TResult? Function(String message)? unexpectedError,
  }) {
    return unexpectedError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String message, bool success, int? statusCode)? failure,
    TResult Function(T data)? data,
    TResult Function()? noData,
    TResult Function(String message)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_Failure<T> value) failure,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_NoData<T> value) noData,
    required TResult Function(_UnexpectedError<T> value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection<T> value)? noConnection,
    TResult? Function(_Failure<T> value)? failure,
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_NoData<T> value)? noData,
    TResult? Function(_UnexpectedError<T> value)? unexpectedError,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_Failure<T> value)? failure,
    TResult Function(_Data<T> value)? data,
    TResult Function(_NoData<T> value)? noData,
    TResult Function(_UnexpectedError<T> value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class _UnexpectedError<T> extends RemoteResponse<T> {
  const factory _UnexpectedError({required final String message}) =
      _$UnexpectedErrorImpl<T>;
  const _UnexpectedError._() : super._();

  String get message;

  /// Create a copy of RemoteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedErrorImplCopyWith<T, _$UnexpectedErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
