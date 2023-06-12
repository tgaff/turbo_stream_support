# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => authors.id)
#
class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
end
