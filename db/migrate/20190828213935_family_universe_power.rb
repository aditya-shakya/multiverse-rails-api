class FamilyUniversePower < ActiveRecord::Migration
  def up
    self.connection.execute %Q(
      CREATE VIEW family_universe_powers AS
        SELECT
          universe_id,
          family_id,
          SUM(power) as power
        FROM people
        GROUP BY universe_id, family_id;
      )
  end

  def down
    self.connection.execute %Q(DROP VIEW IF EXISTS public.family_universe_powers;)
  end
end
