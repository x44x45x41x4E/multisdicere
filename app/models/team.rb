class Team < ApplicationRecord
  after_create :create_tenant
  
  private

    def create_tenant
      Apartment::Tenant.create(subdomain)
    end
end

# == Schema Information
#
# Table name: public.teams
#
#  created_at  :datetime         not null
#  description :text
#  id          :integer          not null, primary key
#  name        :string
#  subdomain   :string
#  updated_at  :datetime         not null
#
