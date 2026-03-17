abstract final class CryptoPersona {
  static const List<({String key, String label})> all = [
    (key: 'bitcoin_maxi', label: 'Bitcoin Maxi'),
    (key: 'defi_degen', label: 'DeFi Degen'),
    (key: 'nft_collector', label: 'NFT Collector'),
    (key: 'ethereum_believer', label: 'Ethereum Believer'),
    (key: 'altcoin_hunter', label: 'Altcoin Hunter'),
    (key: 'web3_builder', label: 'Web3 Builder'),
    (key: 'hodl_investor', label: 'HODL Investor'),
    (key: 'day_trader', label: 'Day Trader'),
  ];

  static const int maxSelectable = 3;

  static String labelFor(String key) => all
      .firstWhere((p) => p.key == key, orElse: () => (key: key, label: key))
      .label;
}
