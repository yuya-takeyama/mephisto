class Stat
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :chart_id, Integer, :unique_index => :chart_key_time, :required => true
  property :value, Float, :unique_index => :chart_key_time, :required => true

  timestamps :at
  property :deleted_at, ParanoidDateTime, :unique_index => :chart_key_time
end
