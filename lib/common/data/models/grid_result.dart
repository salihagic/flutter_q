// ignore_for_file: public_member_api_docs, sort_constructors_first
class GridResult<TListItem> {
  List<TListItem> items;
  bool hasMoreItems;
  int numberOfCachedItems = 0;
  int currentPage;
  int startPage;
  int endPage;
  int pageCount;
  int pageSize;
  int rowCount;
  int hasPreviousPage;
  int hasNextPage;
  int hasMultiplePages;
  int firstRowOnPage;
  int lastRowOnPage;
  int hasItems;
  dynamic additionalData;

  GridResult({
    this.items = const [],
    this.hasMoreItems = true,
    this.numberOfCachedItems = 0,
    this.currentPage = 0,
    this.startPage = 0,
    this.endPage = 0,
    this.pageCount = 0,
    this.pageSize = 0,
    this.rowCount = 0,
    this.hasPreviousPage = 0,
    this.hasNextPage = 0,
    this.hasMultiplePages = 0,
    this.firstRowOnPage = 0,
    this.lastRowOnPage = 0,
    this.hasItems = 0,
    this.additionalData,
  });

  GridResult<TListItem> copyWith({
    List<TListItem>? items,
    bool? hasMoreItems,
    int? numberOfCachedItems,
    int? currentPage,
    int? startPage,
    int? endPage,
    int? pageCount,
    int? pageSize,
    int? rowCount,
    int? hasPreviousPage,
    int? hasNextPage,
    int? hasMultiplePages,
    int? firstRowOnPage,
    int? lastRowOnPage,
    int? hasItems,
    dynamic additionalData,
  }) {
    return GridResult<TListItem>(
      items: items ?? this.items,
      hasMoreItems: hasMoreItems ?? this.hasMoreItems,
      numberOfCachedItems: numberOfCachedItems ?? this.numberOfCachedItems,
      currentPage: currentPage ?? this.currentPage,
      startPage: startPage ?? this.startPage,
      endPage: endPage ?? this.endPage,
      pageCount: pageCount ?? this.pageCount,
      pageSize: pageSize ?? this.pageSize,
      rowCount: rowCount ?? this.rowCount,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasMultiplePages: hasMultiplePages ?? this.hasMultiplePages,
      firstRowOnPage: firstRowOnPage ?? this.firstRowOnPage,
      lastRowOnPage: lastRowOnPage ?? this.lastRowOnPage,
      hasItems: hasItems ?? this.hasItems,
      additionalData: additionalData ?? this.additionalData,
    );
  }
}
