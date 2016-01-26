# encoding: utf-8

class Function
  attr_reader :database_name, :database_schema, :name, :argument_data_types

  def initialize(database_name:, database_schema:, name:, argument_data_types:)
    @database_name = database_name
    @database_schema = database_schema
    @name = name
    @argument_data_types = argument_data_types
  end

  def ==(other)
    @database_name == other.database_name &&
      @database_schema == other.database_schema &&
      @name == other.name &&
      @argument_data_types == argument_data_types
  end
end
