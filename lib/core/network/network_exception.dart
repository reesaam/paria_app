import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart' as dio;

@injectable
class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});

  static NetworkException handleResponse(dio.Response? response) {
    switch (response?.statusCode) {
      case 203:
        throw NonAuthoritativeInformationException();

      case 204:
        throw NoContentException();

      case 304:
        throw NotModifiedException();

      /// to call refresh_token
      case 401:
        throw UnauthorizedException();

      case 402:
        throw PaymentRequiredException();

      case 403:
        throw ForbiddenException();

      case 404:
        throw NotFoundException();

      case 405:
        throw MethodNotAllowedException();

      case 406:
        throw NotAcceptableException();

      case 407:
        throw ProxyAuthRequiredException();

      case 408:
        throw RequestTimeoutException();

      case 409:
        throw ConflictException();

      case 411:
        throw LengthRequiredException();

      case 412:
        throw PreConditionFailedException();

      case 413:
        throw RequestEntityTooLargeException();

      case 414:
        throw RequestUriTooLongException();

      case 415:
        throw UnsupportedMediaTypeException();

      case 416:
        throw RequestedRangeNotSatisfiableException();

      case 417:
        throw ExpectationFailedException();

      case 422:
        throw UnProcessableEntityException();

      case 424:
        throw FailedDependencyException();

      case 425:
        throw UnorderedCollectionException();

      case 426:
        throw UpgradeRequiredException();

      case 429:
        throw TooManyRequestException();

      case 431:
        throw RequestHeaderFieldsTooLargeException();

      case 444:
        throw NoResponseException();

      case 451:
        throw UnavailableForLegalReasonsException();

      case 494:
        throw RequestHeaderTooLargeException();

      case 500:
        throw InternalServerErrorException();

      case 501:
        throw NotImplementedException();

      case 502:
        throw BadGatewayException();

      case 503:
        throw ServiceUnavailableException();

      case 504:
        throw GatewayTimeoutException();

      case 507:
        throw InsufficientStorageException();

      case 508:
        throw LoopDetectedException();

      case 509:
        throw BandwidthLimitException();

      case 510:
        throw NotExtendedException();

      case 511:
        throw NetworkAuthRequiredException();

      default:
        throw UnknownException();
    }
  }

  static ParsingDataException parsingDataException() => ParsingDataException();
}

class ParsingDataException extends NetworkException {
  ParsingDataException() : super(message: 'parsingDataError');
}

// 203
class NonAuthoritativeInformationException extends NetworkException {
  NonAuthoritativeInformationException() : super(message: 'generalError');
}

// 204
class NoContentException extends NetworkException {
  NoContentException() : super(message: 'generalError');
}

// 304
class NotModifiedException extends NetworkException {
  NotModifiedException() : super(message: 'generalError');
}

// 400
class BadRequestException extends NetworkException {
  BadRequestException() : super(message: 'badRequestError');
}

// 401
/// to call refresh_token
class UnauthorizedException extends NetworkException {
  UnauthorizedException() : super(message: 'forbiddenError');
}

// 402
class PaymentRequiredException extends NetworkException {
  PaymentRequiredException() : super(message: 'generalError');
}

// 403
class ForbiddenException extends NetworkException {
  ForbiddenException() : super(message: 'forbiddenError');
}

// 404
class NotFoundException extends NetworkException {
  NotFoundException() : super(message: 'notFoundExceptionError');
}

// 405
class MethodNotAllowedException extends NetworkException {
  MethodNotAllowedException() : super(message: 'generalError');
}

// 406
class NotAcceptableException extends NetworkException {
  NotAcceptableException() : super(message: 'generalError');
}

// 407
class ProxyAuthRequiredException extends NetworkException {
  ProxyAuthRequiredException() : super(message: 'generalError');
}

// 408
class RequestTimeoutException extends NetworkException {
  RequestTimeoutException() : super(message: 'timeoutError');
}

// 409
class ConflictException extends NetworkException {
  ConflictException() : super(message: 'generalError');
}

// 411
class LengthRequiredException extends NetworkException {
  LengthRequiredException() : super(message: 'generalError');
}

// 412
class PreConditionFailedException extends NetworkException {
  PreConditionFailedException() : super(message: 'generalError');
}

// 413
class RequestEntityTooLargeException extends NetworkException {
  RequestEntityTooLargeException() : super(message: 'generalError');
}

// 414
class RequestUriTooLongException extends NetworkException {
  RequestUriTooLongException() : super(message: 'generalError');
}

// 415
class UnsupportedMediaTypeException extends NetworkException {
  UnsupportedMediaTypeException() : super(message: 'generalError');
}

// 416
class RequestedRangeNotSatisfiableException extends NetworkException {
  RequestedRangeNotSatisfiableException() : super(message: 'generalError');
}

// 417
class ExpectationFailedException extends NetworkException {
  ExpectationFailedException() : super(message: 'generalError');
}

// 422
class UnProcessableEntityException extends NetworkException {
  UnProcessableEntityException() : super(message: 'generalError');
}

// 424
class FailedDependencyException extends NetworkException {
  FailedDependencyException() : super(message: 'generalError');
}

// 425
class UnorderedCollectionException extends NetworkException {
  UnorderedCollectionException() : super(message: 'generalError');
}

// 426
class UpgradeRequiredException extends NetworkException {
  UpgradeRequiredException() : super(message: 'generalError');
}

// 429
class TooManyRequestException extends NetworkException {
  TooManyRequestException() : super(message: 'tooManyRequestError');
}

// 431
class RequestHeaderFieldsTooLargeException extends NetworkException {
  RequestHeaderFieldsTooLargeException() : super(message: 'generalError');
}

// 444
class NoResponseException extends NetworkException {
  NoResponseException() : super(message: 'generalError');
}

// 451
class UnavailableForLegalReasonsException extends NetworkException {
  UnavailableForLegalReasonsException() : super(message: 'generalError');
}

// 494
class RequestHeaderTooLargeException extends NetworkException {
  RequestHeaderTooLargeException() : super(message: 'generalError');
}

// 500
class InternalServerErrorException extends NetworkException {
  InternalServerErrorException() : super(message: 'internalServerError');
}

// 501
class NotImplementedException extends NetworkException {
  NotImplementedException() : super(message: 'generalError');
}

// 502
class BadGatewayException extends NetworkException {
  BadGatewayException() : super(message: 'generalError');
}

// 503
class ServiceUnavailableException extends NetworkException {
  ServiceUnavailableException() : super(message: 'serviceUnavailableError');
}

// 504
class GatewayTimeoutException extends NetworkException {
  GatewayTimeoutException() : super(message: 'generalError');
}

// 507
class InsufficientStorageException extends NetworkException {
  InsufficientStorageException() : super(message: 'generalError');
}

// 508
class LoopDetectedException extends NetworkException {
  LoopDetectedException() : super(message: 'generalError');
}

// 509
class BandwidthLimitException extends NetworkException {
  BandwidthLimitException() : super(message: 'generalError');
}

// 510
class NotExtendedException extends NetworkException {
  NotExtendedException() : super(message: 'generalError');
}

// 511
class NetworkAuthRequiredException extends NetworkException {
  NetworkAuthRequiredException() : super(message: 'generalError');
}

class UnknownException extends NetworkException {
  UnknownException() : super(message: 'generalError');
}
