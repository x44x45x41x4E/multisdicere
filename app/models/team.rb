class Team < ApplicationRecord
  after_create :create_tenant
  
  private

    def create_tenant
      Apartment::Tenant.create(subdomain)
    end
end
