# frozen_string_literal: true

FactoryBot.define do
    factory :state do
        name { 'Fake' }
        symbol { 'F' }
        fips_code { 100 }
        is_territory { 1 }
        lat_min { 0.9 }
        lat_max { 0.99 }
        long_min { 0.8 }
        long_max { 0.85 }
    end
    factory :county do
        name { 'Lane County, OR' }
        state_id { 1 }
        fips_code { 100 }
        fips_class { 'p' }
    end
end
FactoryBot.define do
    factory :event do
        name { 'Lane County, OR' }
        description { 'Me' }
        county_id { 1 }
        start_time { DateTime.new(2030, 1, 1, 1, 1, 1) }
        end_time { DateTime.new(2031, 1, 1, 1, 1, 1) }
    end
    factory :representative do
        name { 'Me' }
        ocdid { '1' }
        title { 'Me' }
        address { 'a' }
        party { 'Mine' }
        photo { 'N' }
        state { 'Me' }
        city { 'Cool' }
        zip { '111' }
    end
    factory :news_item do
        title { 'F' }
        link { 'ff' }
        description { 'Cool' }
        representative_id { 1 }
    end
end
