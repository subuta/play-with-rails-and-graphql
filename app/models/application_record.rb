class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def row_id
    self.id
  end
end
