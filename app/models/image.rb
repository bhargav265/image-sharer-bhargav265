class Image < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :url, format: { with: URI.regexp(%w[http https]), message: 'is invalid!' }
  validates :tag_list, presence: { message: 'cannot be empty' }
  validates :name, presence: { message: 'cannot be empty' }
  validates :location, presence: { message: 'cannot be empty' }
  belongs_to :user
end
