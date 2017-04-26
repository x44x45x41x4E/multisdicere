class Room < ApplicationRecord
  has_many :messages, as: :messageable
  has_many :memberships, as: :joinable
  has_many :users, through: :memberships

  def is_member? current_user_id
    return false if current_user_id.blank?
    return true if self.memberships.where(user_id: current_user_id).limit(1).present?
  end
end

# == Schema Information
#
# Table name: rooms
#
#  created_at  :datetime         not null
#  description :text
#  id          :integer          not null, primary key
#  name        :string
#  updated_at  :datetime         not null
#
