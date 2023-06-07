# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer          not null
#  post_id    :integer          not null
#
# Indexes
#
#  index_comments_on_parent_id  (parent_id)
#  index_comments_on_post_id    (post_id)
#
# Foreign Keys
#
#  parent_id  (parent_id => comments.id)
#  post_id    (post_id => posts.id)
#
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :parent
end
