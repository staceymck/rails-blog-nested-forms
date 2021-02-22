class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates_uniqueness_of :name
  validates_presence_of :name
  accepts_nested_attributes_for :posts, reject_if: proc { |attributes| attributes['title'].blank? }
end
