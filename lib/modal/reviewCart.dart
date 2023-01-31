class ReviewCartModal {
  final String? cartId;
  final String? cartImage;
  final String? cartName;
  final int? cartPrice;
  final int? cartQuantity;
  var cartUnit;
  ReviewCartModal(
      {this.cartId,
      this.cartImage,
      this.cartName,
      this.cartUnit,
      this.cartPrice,
      this.cartQuantity});
}
