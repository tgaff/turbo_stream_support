# == Schema Information
#
# Table name: support_chats
#
#  id           :integer          not null, primary key
#  chatter_uuid :string           not null
#  user_name    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_support_chats_on_user_id  (user_id)
#
class SupportChat < ApplicationRecord
  has_many :messages

  validates :user_name, :chatter_uuid, presence: true

  before_validation :set_chatter_uuid

  def set_chatter_uuid
    return if self.chatter_uuid.present?

    self.chatter_uuid = self.class.new_chatter_uuid
  end

  def self.new_chatter_uuid
    loops = 0
    # cycle for 5 iteratinos to find a UUID for chatter_id
    loop do
      raise StandardError, "Couldn't gen chatter ID" if loops == 4
      chatter_uuid = SecureRandom.uuid
      return chatter_uuid unless self.where(chatter_uuid: chatter_uuid).exists?

      loops+=1
    end
  end

  def default_messages
    [
      { me: false, message: "Can be verified on any platform using docker"},
      { me: true,  message: "Command was run with root privileges. I'm sure about that."},
      { me: false,  message: "I've update the description so it's more obviously now"},
      { me: false,  message: "FYI https://askubuntu.com/a/700266/510172"},
      { me: false,  message: "Check the line above (it ends with a # so, I'm running it as root )
                      <pre># npm install -g @vue/devtools</pre>".html_safe},
      { me: true, message: "Any updates on this issue? I'm getting the same error when trying to install devtools. Thanks"},
      { me: false, message: "Thanks for your message David. I thought I'm alone with this issue. Please, ? the issue to support it :)"},
      { me: true, message: "Run this command sudo chown -R `whoami` /Users/{{your_user_profile}}/.npm-global/ then install the package globally without using sudo"}
    ]
  end
end
