require './test/test_helper'
class ImageTest < ActiveSupport::TestCase
  test 'valid image url given' do
    image = Image.new(url: 'https://media.giphy.com/media/3oriO0OEd9QIDdllqo/giphy.gif')
    assert image.valid?
  end

  test 'invalid url given' do
    image = Image.new(url: 'hello')
    refute image.valid?, 'invalid url'
  end
end
