require './test/test_helper'
class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :ok
    assert_select 'p', 'Hello Bhargav!'
  end

  test 'should get new' do
    get new_image_path
    assert_response :ok
    assert_select 'form', count: 1
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif' } }
    end
    assert_equal('Image Saved!', flash[:notice])
    get image_path(Image.last.id)
    assert_response :ok
    assert_select "img[src='https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif']", count: 1
  end

  test 'should not create image' do
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'hello' } }
    end
    assert_response :ok
    assert_select '.invalid-feedback', 'Url is invalid!'
    assert_select 'form', count: 1
  end

  test 'should show image' do
    image = Image.create!(url: 'https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif')
    get image_path(image)
    assert_response :ok
    assert_select "img[src='https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif']", count: 1
  end

  test 'should display all images with newest image first' do
    Image.create!(url: 'http://luisjimenez.com/wp-content/uploads/2017/05/dog-1.jpg')
    Image.create!(url: 'https://cdn.britannica.com/300x500/55/31555-131-240223FB.jpg')
    get images_path
    assert_response :ok
    assert_select 'img' do |images|
      assert_equal(
        'https://cdn.britannica.com/300x500/55/31555-131-240223FB.jpg',
        images[0].attributes['src'].value
      )
      assert_equal(
        'http://luisjimenez.com/wp-content/uploads/2017/05/dog-1.jpg',
        images[1].attributes['src'].value
      )
    end
  end
end
