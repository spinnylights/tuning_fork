require 'test_helper'

class TaskGroupTest < ActiveSupport::TestCase
  def test_methods_fitting_group_pattern_dont_raise
    task_group = TaskGroup.new
    assert task_group.make_meow_meow_group
  end

  def test_methods_not_fitting_make_group_pattern_still_raise
    task_group = TaskGroup.new
    methods = [:make_meow, :meow_group, :meow_meow, :meow]
    methods.each {|m| assert_raises(NoMethodError, "#{m} did not raise") {task_group.send(m)}}
  end

  def test_make_group_pattern_methods_generate_name
    task_group = TaskGroup.new.make_meow_meow_group
    assert_equal "Meow meow", task_group.name
  end

  def test_task_group_empty_at_initialization
    assert TaskGroup.new.empty?
  end

  def test_group_not_empty_if_has_task
    task_group = TaskGroup.new
    task_group.tasks.new
    refute task_group.empty?
  end

  def test_group_not_empty_if_has_scratch
    task_group = TaskGroup.new
    task_group.scratch = Scratch.new
    refute task_group.empty?
  end

  def setup_methods
    TaskGroup.instance_methods.keep_if {|m| m =~ /_setup$/}
  end

  def test_setup_methods_leave_task_group_not_empty
    setup_methods.each do |m|
      task_group = TaskGroup.new
      task_group.public_send(m)
      refute task_group.empty?
    end
  end

  def test_make_group_methods_call_setup_methods_if_they_exist
    setup_methods.each do |m|
      name = m.to_s.chomp('_setup')
      make_method = 'make_' + name + '_group'
      task_group = TaskGroup.new
      task_group.public_send(make_method)
      refute task_group.empty?
    end
  end
end
