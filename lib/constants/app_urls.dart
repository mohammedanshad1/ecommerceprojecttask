class AppUrls {
  static const String baseUrl = 'https://thaivision.teamthai.in/api';

  static const String login = '$baseUrl/AppUserAccount/AppLogin';

  static const String employeeAttendance = "$baseUrl/EmployeeAttendance";

  static const String ShopinShopoutData = "$baseUrl/ShopinShopout";

  static const String ShopinImage = "$baseUrl/ImageUpload/upload";

  static const String shopinDenial =
      "$baseUrl/v1/DeniedReason/GetDeniedReasonDetails";

  static const String floorDisplay = "$baseUrl/FloorDisplayInsert";

  static const String floorDisplayReasons =
      "$baseUrl/v1/FloorDisplayReason/GetFloorDisplayReason";

  static const String openingStockInsert = "$baseUrl/OpeningStock";

  static const String productGroup =
      "$baseUrl/v1/AppMenuProductListMapping/GetAllAppMenuProductListMap";

  ///category
  static const String productGroupMapping =
      "$baseUrl/v1/ProductGroupMapping/AppGetAllProductGroupMap";

  ///subcategory

  ///marketingIntelligence first Dropdown
  static const String marketingIntelligence =
      "$baseUrl/v1/VISActivationTable/GetActivationTableDetails";

  /// marketingIntelligence Api
  static const String marketingIntelligenceApi =
      "$baseUrl/v1/MarkettingIntelligence";

//categorymanagement
  static const String categorymanagement = "$baseUrl/CategoryManagementInsert";

//asset track insert
  static const String assettrackin = "$baseUrl/v1/AssetTracking";

  //asset type
  static const String assetType =
      "$baseUrl/v1/VISAssetType/GetAssetTypeDetails";

  // GetAssetTypeDetails

  //asset list
  static const String assetList =
      "$baseUrl/v1/BrandAssetList/GetBrandAssetList";

  //Brand list
  static const String brandList = "$baseUrl/v1/SharedList/GetAllBrandList";

  // OOS REPORT
  static const String oosReport = "$baseUrl/v1/OOSReport";

  // SHOPPER ENGAGEMENT
  static const String shopperengagement = "$baseUrl/v1/ShopperEngagement";

  // viscustomer
  static const String viscustomer =
      "$baseUrl/v1/VisibilityCustomer/GetVisibilityCustomerMapping";

//promotercustomer
  static const String promotercustomer =
      "$baseUrl/v1/PromoterCustomer/GetPromoterCustomerMappingData";

  //calls Analysis
  static const String callsanalysis =
      "$baseUrl/v1/PlanningSummayDay/GetVisibilityUserCallsPlanningSummaryDay";

  //calls grapgh
  static const String callsgrapgh =
      "$baseUrl/v1/PlanningSummayDay/GetVisibilityUserCallsPlanningSummaryDayWiseGraph";

  static const String daygrapghdata =
      "$baseUrl/v1/PlanningSummayDay/GetVisibilityUserCallsPlanningSummaryDay";

  static const String dsrdata =
      "$baseUrl/v1/DailySalesReport/GetDailySalesReport";

  static const String assetreason = "$baseUrl/v1/AssetReason/GetAssetReasons";

  static const String categoryspacereason =
      "$baseUrl/v1/CategorySpaceReason/GetCategorySpaceReasons";
}
