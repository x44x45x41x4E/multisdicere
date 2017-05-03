class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :joinable, polymorphic: true

  scope :rooms, -> { where(joinable_type: 'Room') }
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
#  last_read_at  :datetime
#  updated_at    :datetime         not null
#  user_id       :integer
#
