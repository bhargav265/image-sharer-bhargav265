# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url_list = [
  ['https://news.marvel.com/wp-content/uploads/2017/12/tt-m.jpg', 'image1, appfolio1', 'vfrvrvr'],
  ['https://i.kinja-img.com/gawker-media/image/upload/s--xWp4idE4--/c_scale,f_auto,fl_progressive,q_80,
w_800/xclhq4ovt3kpb6lzhwu4.png', 'image1, appfolio2', 'ccrv'],
  ['https://www.petmd.com/sites/default/files/salmonella-infection-dogs.jpg', 'image1, appfolio3', 'frwfwrf'],
  ['https://www.mensjournal.com/wp-content/uploads/gettyimages-583596559-e274095b-2e49-481a-b1d1-de6bfee9e588.jpg',
   'image1, appfolio4', 'cdcswcsc'],
  ['https://www.guidedogs.org/wp-content/uploads/2015/05/Dog-Im-Not.jpg', 'image1, appfolio5', 'cdscvsdvcs'],
  ['https://www.catster.com/wp-content/uploads/2017/11/A-Siamese-cat.jpg', 'image1, appfolio6', 'cvdfsvsfvsfv'],
  ['http://www.diamondbackdrugs.com/wp-content/uploads/2017/01/pexels-photo.jpg', 'image1, appfolio7', 'vfsvsfvsfvfs'],
  ['https://imgs.tuts.dragoart.com/how-to-draw-an-anime-cartoon-kitty_1_000000001678_5.jpg',
   'image1, appfolio8', 'vdfsvsfvfsvdsfv'],
  ['https://thumbs.dreamstime.com/b/cartoon-adorable-cat-dressed-like-princess-vector-41633873.jpg',
   'image1, appfolio9', 'vfsvsfvsfvsfv'],
  ['https://i.ytimg.com/vi/NiEABxi8G4U/maxresdefault.jpg', 'image2, appfolio10', 'vdsvsfvfsvfs'],
  ['https://www.destructoid.com//ul/360362-canadianwoman.jpg', 'image2, appfolio11', 'vsdvdfsvsfvdfbv'],
  ['https://static.giantbomb.com/uploads/scale_small/0/6087/2438704-1202149925_t.png', 'image2, appfolio12', 'vfsvdfsvfdsvfdsbv'],
  ['https://cdn.vox-cdn.com/thumbor/0fwPFHyZpyQCE-rsBQF1NmzKRg4=/0x0:1074x604/1200x800/filters:
focal(452x217:622x387)/cdn.vox-cdn.com/uploads/chorus_image/image/58305797/
f8d52c36_a260_463c_8896_66e54310b531.0.jpg',
   'image2, appfolio13', 'vfdvdfvbdfbvfd'],
  ['https://assets.vg247.com/current//2018/05/pokemon_lets_go_pikachu_and_eevee-1.jpg', 'image2, appfolio14', 'vfsvfsvsfvf'],
  ['https://assets.pokemon.com/assets/cms2/img/watch-pokemon-tv/seasons/season20/season20_ep28_ss01.jpg',
   'image2, appfolio15', 'vfsvdfsvdfsbvfd'],
  ['http://img1.looper.com/img/uploads/2018/02/the-truth-about-dragon-ball-z-780x438.jpg',
   'image2, appfolio16', 'vsvsfvdsfvdfs'],
  ['http://jonvilma.com/images/dragon-ball-z-3.jpg', 'image2, appfolio17', 'bjkdscbhsdkjbck'],
  ['http://img3.looper.com/img/gallery/the-untold-truth-of-dragon-ball-z/rock-the-power-1517840155.jpg',
   'image2, appfolio18', 'cndjscfbnsdkjcb'],
  ['https://images-na.ssl-images-amazon.com/images/I/71XrNSXqYSL._SY355_.jpg', 'image2, appfolio19', 'cbjsdhkcbvsjkdh'],
  ['http://paperlief.com/images/dragon-ball-z-goku-logo-wallpaper-2.jpg', 'image2, appfolio20', 'bdhmbvdjhvcbjh']
]

url_list.each do |image_url|
  Image.create!(url: image_url[0], tag_list: image_url[1], name: image_url[2])
end
