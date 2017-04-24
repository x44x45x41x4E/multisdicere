class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :messageable, polymorphic: true
end

# == Schema Information
#
# Table name: messages
#
#  body             :text
#  created_at       :datetime         not null
#  id               :integer          not null, primary key
#  messageable_id   :integer
#  messageable_type :string
#  sender_id        :integer
#  updated_at       :datetime         not null
#
