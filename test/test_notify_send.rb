require 'minitest/autorun'
require 'notify-send'

class HolaTest < Minitest::Test
	def test_argument
		assert_raises ArgumentError do 
			NotifySend.send "test", "test", "test", "test", "test"
		end
		assert_raises ArgumentError do 
			NotifySend.send
		end
	end
end
