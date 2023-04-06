# == Schema Information
#
# Table name: support_chats
#
#  id         :integer          not null, primary key
#  user_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :string
#
class SupportChat < ApplicationRecord
  has_many :messages

  validates :user_id, presence: true

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
