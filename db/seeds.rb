# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sc = SupportChat.first

messages = [
  { text: "Hello, I'm having trouble with my blaster.", side: :right },
  { text: "I'm sorry to hear that. What seems to be the problem?", side: :left },
  { text: "It keeps missing.", side: :right },
  { text: "We actually hear that a lot. But I'll do my best to try and help you out.", side: :left },
  { text: "First, have you tried cleaning the barrel?", side: :left },
  { text: "Yes, I've tried that.", side: :right },
  { text: "Have you tried replacing the power cell?", side: :left },
  { text: "Yes, I've tried that too.", side: :right },
  { text: "Didn't help.", side: :right },
  { text: "I see. Well, I'm not sure what else to do. Maybe you should try contacting your local Imperial armory.  You might be able to have it replaced.", side: :left },
  { text: "But I'm on a mission!", side: :right },
  { text: "I understand, but I'm not a stormtrooper. I'm just a technical support droid.", side: :left },
  { text: "Fine.", side: :right },
  { text: "I'll contact the armory.", side: :right },
  { text: "Okay. Is there anything else I can help you with today?", side: :left },
  { text: "No, that's all.", side: :right },
  { text: "Okay. Thank you for contacting technical support. Have a nice day.", side: :left },
  { text: "You too.", side: :right }
]

messages.each do |msg|
  Message.create(text: msg[:text], support_chat: sc)
end