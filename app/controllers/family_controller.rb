class FamilyController < ApplicationController
  skip_before_action :verify_authenticity_token

  def unbalanced_families
    family_ids = FamilyUniversePower.select('max(power) as maximum, min(power) as minimum, family_id')
       .group(:family_id)
       .having('minimum != maximum')
       .map(&:family_id)
    render json: Family.find(family_ids), status: :ok
  end

  def balance_family
    family_id = params[:id]
    is_balanced = balanced?(family_id)
    if is_balanced
      render json: {status: :failure, detail: 'already balanced'}, status: :bad_request
      return
    end
    balance(family_id)

    render json: {status: :success, details: 'Balanced Successfully'}, status: :ok
  end

  private

  def balance(family_id)
    family_universe = FamilyUniversePower.where(family_id: family_id)
    powers = family_universe.pluck(:power)
    total_power = powers.sum
    universes = family_universe.pluck(:universe_id)
    power_distribution = [total_power/universes.count]*universes.count
    ActiveRecord::Base.transaction do
      power_distribution.each_with_index do |power,ind |
        diff = power - family_universe[ind].power
        person = Person.where(family_id: family_id, universe_id: universes[ind]).first
        person.power = person.power + diff
        person.save!
      end
    end
  end

  def balanced?(family_id)
    FamilyUniversePower.where(family_id: family_id).select('max(power) as maximum, min(power) as minimum, family_id')
        .group(:family_id)
        .having('minimum == maximum').to_a.present?
  end
end
