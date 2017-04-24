class Channel < ApplicationRecord
  has_many :messages, as: :messageable
  has_many :memberships, as: :joinable
  has_many :users, through: :memberships
end

# == Schema Information
#
# Table name: channels
#
#  created_at  :datetime         not null
#  description :text
#  id          :integer          not null, primary key
#  name        :string
#  updated_at  :datetime         not null
#
