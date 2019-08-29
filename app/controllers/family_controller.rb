class FamilyController < ApplicationController

  def unbalanced_families
    family_ids = FamilyUniversePower.select('max(power) as maximum, min(power) as minimum, family_id')
       .group(:family_id)
       .having('minimum != maximum')
       .map(&:family_id)
    render json: Family.find(family_ids), status: :ok
  end

end
