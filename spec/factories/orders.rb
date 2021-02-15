FactoryBot.define do
  factory :order do
      zip_cd            {'651-0065'}
      prefecture_id     {2}
      municipality      {'世田谷区'}
      address           {'南烏山2-32-22'}
      building          {'グリーンパレス'}
      tel               {'08097394105'}
      token             {"tok_abcdefghijk00000000000000000"}
  end
end
