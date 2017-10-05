class TaskGroup < ApplicationRecord
  belongs_to :day
  has_many   :tasks
  has_one    :scratch

  def empty?
    tasks.empty? && scratch.nil?
  end

  def method_missing(method, *args)
    super unless method =~ /^make_[a-z_]+_group$/
    group_name = method.to_s.gsub(/^make_/, '').chomp('_group')
    pretty_group_name = group_name.gsub('_', ' ').capitalize
    self.name = pretty_group_name
    setup_method = group_name + '_setup'
    self.public_send(setup_method) if self.respond_to?(setup_method)
    self
  end

  def personal_hygeine_setup
    self.tasks.new(name: 'Shower')
  end

  def work_setup
    self.tasks.new(name: '4 hours (1)')
    self.scratch = Scratch.new
  end

  def laundry_setup
    self.tasks.new(name: 'Wash clothes')
  end

  def housecleaning_setup
    self.tasks.new(name: 'Dust')
  end
end
