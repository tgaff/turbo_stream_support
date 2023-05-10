# == Schema Information
#
# Table name: support_chats
#
#  id            :integer          not null, primary key
#  customer_name :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class SupportChat < ApplicationRecord
  validates :customer_name, presence: true
end
