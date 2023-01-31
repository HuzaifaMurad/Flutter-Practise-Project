class ProductModel {
  final String? productName;
  final String? productImage;
  final int? productPrice;
  final String? productId;
  final int? quantity;
  final List<dynamic>? productUnit;
  ProductModel(
      {this.productImage,
      this.productName,
      this.productPrice,
      this.productId,
      this.quantity,
      this.productUnit});
}
