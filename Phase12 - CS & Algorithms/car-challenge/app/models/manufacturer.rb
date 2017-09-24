class Manufacturer < ApplicationRecord
  has_many :cars

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true

  # Assuming country_select is used with User attribute `country_code`
  # This will attempt to translate the country name and use the default
  # (usually English) name if no translation is available
  def country_name
    iso_country = ISO3166::Country[country] # `country` should be code like 'AU'
    iso_country.translations[I18n.locale.to_s] || iso_country.name
  end
end
