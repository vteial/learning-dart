void main() {
  print('started...');

  Tran tran = new Tran();
  tran.buyUnit = 125;
  tran.buyRate = 81.2;
  tran.computeBuyAmount();

  tran.sellUnit = 125;
  tran.sellRate = 82.0;
  tran.computeSellAmount();

  tran.computeBrokerageAmount();
  tran.computeSTTAmount();
  tran.computeETTAmount();
  tran.computeGSTAmount();
  tran.computeSEBI();
  tran.computeStampDuty();
  tran.computeBrokerage();
  tran.computeProfit();
  print(tran);

  print('---------------------------------------------------------');

  print('Buy Unit        : ' + tran.buyUnit.toString());
  print('Buy Rate        : ' + tran.buyRate.toString());
  print('Buy Amount      : ' + tran.buyAmount.toString());
  print('Sell Unit       : ' + tran.sellUnit.toString());
  print('sell Rate       : ' + tran.sellRate.toString());
  print('Sell Amount     : ' + tran.sellAmount.toString());
  print('Sales Amount    : ' + tran.salesAmount.toString());

  print('Brokerage       : ' + tran.brokerageAmount.toStringAsFixed(2));
  print('STT             : ' + tran.sttAmount.toStringAsFixed(2));
  print('ETT             : ' + tran.ettAmount.toStringAsFixed(2));
  print('GST             : ' + tran.gstAmount.toStringAsFixed(2));
  print('SEBI            : ' + tran.sebi.toStringAsFixed(2));
  print('Stamp Duty      : ' + tran.stampDuty.toStringAsFixed(2));
  print('Total Brokerage : ' + tran.brokerage.toStringAsFixed(2));
  print('Profit          : ' +
      (tran.sellAmount - tran.buyAmount).toStringAsFixed(2));
  print('Net Profit      : ' + tran.profit.toStringAsFixed(2));

  print('---------------------------------------------------------');

  print('finished...');
}

class Tran {
  int buyUnit;

  double buyRate;

  double buyAmount;

  int sellUnit;

  double sellRate;

  double sellAmount;

  double salesAmount;

  double brokerageAmount;

  double brokeragePerUnit;

  double sttAmount;

  double sttPerUnit;

  double ettAmount;

  double ettPerUnit;

  double gstAmount;

  double gstPerUnit;

  double sebi;

  double stampDuty;

  double brokerage;

  double profit;

  void computeBrokerageAmount() {
    brokerageAmount = (buyAmount + sellAmount) * 0.03;
    //print(brokerageAmount);
    brokerageAmount = brokerageAmount / 100;
    //print(brokerageAmount);
    brokeragePerUnit = brokerageAmount / (buyUnit + sellUnit);
    //print(brokeragePerUnit);
    //String val = brokeragePerUnit.toStringAsFixed(2);
    //brokeragePerUnit = double.parse(val);
    //print(brokeragePerUnit);
    if (brokerageAmount < 20.0) {
      brokerageAmount = 20.0;
    }
  }

  void computeSTTAmount() {
    sttAmount = (sellAmount * 0.025) / 100;
    //print(sttAmount);
    //String val = sttAmount.toStringAsFixed(2);
    //sttAmount = double.parse(val);
    //print(sttAmount);
    sttPerUnit = sttAmount / sellUnit;
    //print(sttPerUnit);
    //val = sttPerUnit.toStringAsFixed(2);
    //sttPerUnit = double.parse(val);
    //print(sttPerUnit);
  }

  void computeETTAmount() {
    ettAmount = (salesAmount * 0.00325) / 100;
    //print(ettAmount);
    //String val = ettAmount.toStringAsFixed(2);
    //ettAmount = double.parse(val);
    //print(ettAmount);
    ettPerUnit = ettAmount / sellUnit;
    //print(ettPerUnit);
    //val = ettPerUnit.toStringAsFixed(2);
    //ettPerUnit = double.parse(val);
    //print(ettPerUnit);
  }

  void computeGSTAmount() {
    gstAmount = brokerageAmount + ettAmount;
    //print(gstAmount);
    gstAmount = (gstAmount * 18) / 100;
    //print(gstAmount);
    //String val = gstAmount.toStringAsFixed(2);
    //gstAmount = double.parse(val);
    //print(gstAmount);
    gstPerUnit = gstAmount / sellUnit;
    //print(gstPerUnit);
    //val = gstPerUnit.toStringAsFixed(2);
    //gstPerUnit = double.parse(val);
    //print(gstPerUnit);
  }

  void computeSEBI() {
    sebi = ((sellAmount * 0.00015) / 100) + ((buyAmount * 0.00015) / 100);
    //String val = sebi.toStringAsFixed(2);
    //sebi = double.parse(val);
  }

  void computeStampDuty() {
    stampDuty = (salesAmount / 5000.0).ceil() * 5000.0;
    stampDuty = (stampDuty * 0.002) / 100;
    //print(stampDuty);
  }

  void computeBrokerage() {
    brokerage =
        brokerageAmount + sttAmount + ettAmount + gstAmount + sebi + stampDuty;
  }

  void computeProfit() {
    profit = sellAmount - buyAmount;
    //print(profit);
    profit -= brokerage;
    //print(profit);
  }

  void computeProfitX() {
    profit = sellAmount - buyAmount - brokerageAmount;
    //print(profit);
  }

  void computeProfitY() {
    profit = sellRate - buyRate;
    //print(profit);
    profit = profit - (2 * brokeragePerUnit);
    //print(profit);
    profit = profit * buyUnit;
    //print(profit);
  }

  void computeBuyAmount() {
    buyAmount = buyUnit * buyRate;
    this.computeSalesAmount();
  }

  void computeSellAmount() {
    sellAmount = sellUnit * sellRate;
    this.computeSalesAmount();
  }

  void computeSalesAmount() {
    if (buyAmount != null && sellAmount != null) {
      salesAmount = buyAmount + sellAmount;
    }
  }

  String toString() {
    StringBuffer sb = new StringBuffer();
    sb.write('Tran(');
    sb.write('buyUnit: $buyUnit');
    sb.write(', ');
    sb.write('buyRate: $buyRate');
    sb.write(', ');
    sb.write('buyAmount: $buyAmount');
    sb.write(', ');
    sb.write('sellUnit: $sellUnit');
    sb.write(', ');
    sb.write('sellRate: $sellRate');
    sb.write(', ');
    sb.write('sellAmount: $sellAmount');
    sb.write(', ');
    sb.write('salesAmount: $salesAmount');
    sb.write(', ');
    sb.write('brokerageAmount: $brokerageAmount');
    sb.write(', ');
    sb.write('brokeragePerUnit: $brokeragePerUnit');
    sb.write(', ');
    sb.write('sttAmount: $sttAmount');
    sb.write(', ');
    sb.write('sttPerUnit: $sttPerUnit');
    sb.write(', ');
    sb.write('ettAmount: $ettAmount');
    sb.write(', ');
    sb.write('ettPerUnit: $ettPerUnit');
    sb.write(', ');
    sb.write('gstAmount: $gstAmount');
    sb.write(', ');
    sb.write('gstPerUnit: $gstPerUnit');
    sb.write(', ');
    sb.write('sebi: $sebi');
    sb.write(', ');
    sb.write('stampDuty: $stampDuty');
    sb.write(', ');
    sb.write('brokerage: $brokerage');
    sb.write(', ');
    sb.write('profit: $profit');
    sb.write(')');
    return sb.toString();
  }
}
