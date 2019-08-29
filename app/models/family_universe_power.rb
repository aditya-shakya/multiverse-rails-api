class FamilyUniversePower < ActiveRecord::Base
  belongs_to :family
  belongs_to :universe

  self.table_name = 'family_universe_powers'

  protected
  def readonly?
    true
  end
end
