class PricingCalculator{

  // calculator price 

  static double CalculateTotalPrice(double ProductPrice, double ShippingFee){
    double ShippingFee = 250;
    double TotalPrice = ProductPrice + ShippingFee;
    return TotalPrice;
  }
}