require File.dirname(__FILE__) + '/test_helper.rb'

class TestJdtc < Test::Unit::TestCase
  include Jdtc
  def setup
  end
  
  def test_can_compile_a_hello_class
    
    
    assert_nothing_raised do
        jdtc([File.expand_path File.dirname(__FILE__) + "/java/Hello.java"])
    end
  end
end
