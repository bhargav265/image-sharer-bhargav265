class Image < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  validates :url, format: { with: URI.regexp(%w[http https]), message: 'is invalid!' }
  validates :tag_list, presence: { message: 'cannot be empty' }
end
