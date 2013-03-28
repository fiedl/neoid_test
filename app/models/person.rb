class Person < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessor :name
  
  include Neoid::Node
  neoidable do |c|
    c.field :name
  end

end
