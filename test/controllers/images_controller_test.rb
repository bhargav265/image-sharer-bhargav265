require './test/test_helper'
class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :ok
  end

  test 'should get new' do
    get new_image_path
    assert_response :ok
    assert_select 'form', count: 1
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif',
                                          tag_list: 'bfrwkub, bcuksbc' } }
    end
    assert_equal('Image Saved!', flash[:notice])
    get image_path(Image.last.id)
    assert_response :ok
    assert_select "img[src='https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif']", count: 1
  end

  test 'should save tags for image' do
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif',
                                          tag_list: 'abced, bksubvcksu' } }
    end
    assert_equal(Image.last.tag_list, %w[abced bksubvcksu])
  end

  test 'should not create image' do
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'hello', tag_list: 'buwkrbf, bkshcb' } }
    end
    assert_response :ok
    assert_select '.invalid-feedback', 'Url is invalid!'
    assert_select 'form', count: 1
  end

  test 'should not create image with no tags' do
    assert_no_difference('Image.count') do
      post images_url, params: {
        image: { url: 'https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif',
                 tag_list: '' }
      }
    end
    assert_response :ok
    assert_select '.invalid-feedback', 'Tag list cannot be empty'
    assert_select 'form', count: 1
  end

  test 'should show image' do
    image = Image.create!(url: 'https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif',
                          tag_list: 'hello, bhargav')
    get image_path(image)
    assert_response :ok
    assert_select "img[src='https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif']", count: 1
  end

  test 'should display all images with newest image first' do
    Image.create!(url: 'http://luisjimenez.com/wp-content/uploads/2017/05/dog-1.jpg',
                  tag_list: 'hello, bhargav')
    Image.create!(url: 'https://cdn.britannica.com/300x500/55/31555-131-240223FB.jpg',
                  tag_list: 'hello, bhargav')
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

  test 'should display images with only given tag value' do
    image1 = Image.create!(url: 'http://luisjimenez.com/wp-content/uploads/2017/05/dog-1.jpg',
                           tag_list: 'tag1, tag2')
    image2 = Image.create!(url: 'https://cdn.britannica.com/300x500/55/31555-131-240223FB.jpg',
                           tag_list: 'tag1, tag3')
    get root_path(tag: 'tag2')
    assert_select "img[src='#{image1.url}']", count: 1
    assert_select "img[src='#{image2.url}']", count: 0
  end

  test 'should delete the image' do
    image = Image.create!(
      url: 'https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif',
      tag_list: 'brksjcf, bcjksbc'
    )

    assert_difference('Image.count', -1) do
      delete image_url(image)
    end

    assert_redirected_to images_path
  end

  test 'should not delete the image which is non existent' do
    assert_no_difference('Image.count') do
      delete image_url(-1)
    end

    assert_redirected_to images_path
    assert_equal('Image not found', flash[:error])
  end

  test 'should update image' do
    image1 = Image.create!(url: 'http://luisjimenez.com/wp-content/uploads/2017/05/dog-1.jpg',
                           tag_list: 'tag1, tag2')
    new_tag_list = 'tag3, tag4'
    put image_path(image1), params: { image: { tag_list: new_tag_list } }
    assert_redirected_to image_path(image1)
    new_tag_list = new_tag_list.split(', ')
    assert_equal(new_tag_list, image1.reload.tag_list)
  end

  test 'should edit image' do
    image = Image.create!(url: 'https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif',
                          tag_list: 'hello, bhargav')
    get edit_image_path(image)
    assert_response :ok
    assert_select "img[src='https://media.giphy.com/media/8TziDRNomypOOE58dI/giphy.gif']", count: 1
  end
end
