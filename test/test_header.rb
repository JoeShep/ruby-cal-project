require 'test/unit'
require 'linked_list'

class LinkedListItemTest < Test::Unit::TestCase

  def test_06_add_item_get_item
    ll = LinkedList.new
    ll.add_item("foo")
    assert_equal("foo", ll.get(0))
  end

