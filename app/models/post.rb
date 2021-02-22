class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tags_attributes)
    tags_attributes.each do |i, tag_attribute|
      if tag_attribute && tag_attribute[:name].present?
        tag = Tag.find_or_create_by(tag_attribute)
          if !self.tags.include?(tag) #don't add tag to post if already present in post.tags collection
            self.post_tags.build(tag: tag) # why post_tags here?
          end
      end
    end
  end

end
