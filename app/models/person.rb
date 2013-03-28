class Person < ActiveRecord::Base

  attr_accessible :name
  
  # Making the `name` persistent.
  # (1) only in the neo4j database.
  #
  # This won't work:
  #
  #    attr_accessor :name
  #    delegate :name, to: :neo_node # which is provided by Neoid::Node
  #
  # This works:
  #
  def name
    @name ||= self.neo_node.name
  end
  def name=(name)
    @name = name
  end

  def relates(args)
    if args[:to].kind_of?(Person) && args[:as].kind_of?(Symbol)
      related_object = args[:to]
      relationship_type = "is_#{args[:as]}_of"
      Neography::Relationship.create relationship_type, self.neo_node, related_object.neo_node
    end
  end
  
  include Neoid::Node
  neoidable do |c|
    c.field :name
  end

end
