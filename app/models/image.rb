class Image < ApplicationRecord
  validates :url, format: { with: URI.regexp(%w[http https]), message: 'is invalid!' }
end
