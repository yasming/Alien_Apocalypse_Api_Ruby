class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  IS_ABDUCTED = 'abducted'
  IS_NOT_ABDUCTED = 'non-abducted'
  
end
