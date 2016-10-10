class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
	require 'postgres_ext'
  
end
