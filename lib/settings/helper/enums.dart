/// Enum representing different failure statuses.
/// Enum representing different failure statuses.
enum FailureStatus {
  /// Indicates no internet connection.
  noInternet,

  /// Indicates failure on the server side.
  serverFailure,

  /// Indicates failure on the client side.
  clientFailure,

  /// Indicates an empty list.
  emptyList,

  /// Indicates no data available.
  noData,

  /// Indicates an error occurred during parsing.
  parsingError,

  /// Indicates unauthorized access.
  unauthorized,

  /// Indicates an unknown error occurred.
  unknownError,

  /// Indicates an error occurred during caching.
  cacheError,
}

enum FlightValidationError {
  noFromDate,
  noToDate,
  otherError,
  noError,
}

/// Enum representing different place types.
enum PlaceType {
  /// Unspecified place type.
  unspecified,

  /// Airport place type.
  airport,

  /// City place type.
  city,

  /// Country place type.
  country,

  /// Continent place type.
  continent,
}

/// Represents the state of an API response.
enum ResponseState {
  /// The initial state before any API request is made.
  initial,

  /// The state when an API request is in progress.
  loading,

  /// The state when an API request is being refreshed.
  refreshing,

  /// The state when an API request is completed successfully.
  completed,

  /// The state when an API request encounters an error.
  error,
}

/// Enum representing the type of flight.
enum FlightType {
  /// Represents a connected flight.
  connected,

  /// Represents a single flight.
  single,
}

/// Enum representing the type of trip.
enum TripType {
  /// Represents a round-trip trip.
  returnKey,

  /// Represents a multi-city trip.
  multicity,

  /// Represents a one-way trip.
  oneWay,
}

enum FlightClass {
  // ignore: constant_identifier_names
  Economy,
  // ignore: constant_identifier_names
  Business,
  // ignore: constant_identifier_names
  PremiumEconomy,

  // ignore: constant_identifier_names
  FirstClass,
}

/// Enum representing the unit of price.
enum PriceUnit {
  /// Unspecified price unit.
  unspecified,

  /// Whole price unit.
  whole, // 1

  /// Centi price unit.
  centi, // 100

  /// Milli price unit.
  milli, // 1000

  /// Micro price unit.
  micro, // 1000000
}

/// Enum representing the status of search results.
enum ResultStatus {
  /// Unspecified result status.
  unspecified,

  /// Results are now complete.
  complete,

  /// Results are not complete yet.
  incomplete,

  /// Search has failed.
  failed,
}

/// Enum representing the action for search results.
enum ResultAction {
  /// Unspecified result action.
  unspecified,

  /// Results have been replaced.
  replaced,

  /// Results have not been modified.
  notModified,

  /// Results for this vertical have been omitted.
  omitted,
}

/// Enum representing the type of flight search.
///
/// The [FlightSearchType] enum is used to indicate the type of flight search.
/// It has two possible values:
///   - [create]: Represents the creation of a new flight search.
///   - [poll]: Represents polling an existing flight search.
enum FlightSearchType {
  /// Represents the creation of a new flight search.
  create,

  /// Represents polling an existing flight search.
  poll,
}

enum BottomSheetType { selectLocation, selectDate, selectPassenger }
