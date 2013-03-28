# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# wipe database
# this is commented out, since it would cause an error:
#    javax.script.ScriptException: java.lang.NullPointerException
#
# Neography::Rest.new.execute_script("g.clear()") 
# Person.delete_all

# create some nodes
john = Person.create(name: "John Doe") 
jane = Person.create(name: "Jane Doe")
christine = Person.create(name: "Christine Doe")

# create some relationships
john.relates to: jane, as: :husband 
christine.relates to: john, as: :child 
christine.relates to: jane, as: :child

# print john's node in order to find out the neo_id
p "John's ActiveRecord record: ", john
p "John's neo_id: ", john.neo_node.neo_id
