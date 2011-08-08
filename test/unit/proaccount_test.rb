require 'test_helper'

class ProaccountTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Proaccount.new.valid?
  end
end
