class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :joinable, polymorphic: true

  scope :channels, -> { where(joinable_type: 'Channel') }
  # For adding multitenancy later on and classifying one on one chats
  scope :teams, -> { where(joinable_type: 'Team') }
  scope :conversations, -> { where(joinable_type: 'Conversation') }
end

# == Schema Information
#
# Table name: memberships
#
#  created_at    :datetime         not null
#  id            :integer          not null, primary key
#  joinable_id   :integer
#  joinable_type :string
#  updated_at    :datetime         not null
#  user_id       :integer
#
