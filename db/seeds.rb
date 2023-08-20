# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者情報
# Admin.create!(
#   email: ENV['ADMIN_MAIL'],
#   password: ENV['ADMIN_PASS']
# )

# ユーザーデータ
users = User.create!(
  [
    {email: ENV['USER_MAIL1'], name: 'Olivia', password: ENV['USER_PASS'], introduction: '日本の温泉が大好きです。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: ENV['USER_MAIL2'], name: 'ジェームズ', password: ENV['USER_PASS'], profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: ENV['USER_MAIL3'], name: '太郎', password: ENV['USER_PASS'], introduction: '南国暮らしに憧れている会社員です', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

# 投稿データ1
Plan.create!(
  [
    {
      title: '猿と温泉',
      prefecture: '大分県',
      stay_days: '一泊二日', budget: '2万～3万',
      main_vehicle: '自動車',
      impression: '初めての大分県でとてもいい思い出ができました！！',
      plan_images: [ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-plan1.jpg"), filename:"sample-plan1.jpg"), ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-plan5.jpg"), filename:"sample-plan5.jpg")],
      user_id: users[0].id
    }
  ]
)

date1=Date.new(2023, 1, 9)
date2=Date.new(2023, 1, 10)
Day.create!(
  [
    {plan_id: 1, day: date1}, {plan_id: 1, day: date2}
  ]
)

start_at1=Time.zone.local(2023,1,9,12,50,00)
start_at2=Time.zone.local(2023,1,9,15,00,00)
start_at3=Time.zone.local(2023,1,9,18,30,00)
start_at4=Time.zone.local(2023,1,10,10,20,00)
start_at5=Time.zone.local(2023,1,10,11,15,00)
start_at6=Time.zone.local(2023,1,10,13,30,00)
finished_at1=Time.zone.local(2023,1,9,14,00,00)
finished_at2=Time.zone.local(2023,1,9,17,00,00)
finished_at3=Time.zone.local(2023,1,9,19,00,00)
finished_at4=Time.zone.local(2023,1,10,11,10,00)
finished_at5=Time.zone.local(2023,1,10,12,00,00)
finished_at6=Time.zone.local(2023,1,10,14,10,00)
Schedule.create!(
  [
    {day_id: 1, start_at: start_at1, finished_at: finished_at1, place: 'お昼ご飯', schedule_comment: '到着したのがお昼過ぎだったので、駅でご飯を食べました。', cost: '980', transportation: '徒歩', transfer_time: '10', expense: '0'},
    {day_id: 1, start_at: start_at2, finished_at: finished_at2, place: '血の池地獄', schedule_comment: '雑誌で見ていてずっと行ってみたかった場所にようやくいけました！', cost: '450', transportation: '車', transfer_time: '60', expense: '0'},
    {day_id: 1, start_at: start_at3, finished_at: finished_at3, place: '猿との温泉', schedule_comment: '今回の旅の目玉！！猿との温泉が実現しました！', cost: '3000', transportation: '車', transfer_time: '50', expense: '0'},
    {day_id: 2, start_at: start_at4, finished_at: finished_at4, place: '海地獄', schedule_comment: '昨日に引き続き地獄めぐりです！コバルトグルーの地獄が魅力的な場所です。', cost: '450', transportation: '車', transfer_time: '50', expense: '0'},
    {day_id: 2, start_at: start_at5, finished_at: finished_at5, place: 'かまど地獄', schedule_comment: '海地獄から数分の場所にあります。池の色が変わる面白いじごくですよ～', cost: '450', transportation: '徒歩', transfer_time: '5', expense: '0'},
    {day_id: 2, start_at: start_at6, finished_at: finished_at6, place: '駅でお昼ご飯', schedule_comment: '駅構内にある蕎麦屋さんがとてもおいしかったです！！', cost: '1200', transportation: '車', transfer_time: '80', expense: '0'},
  ]
)

# 投稿データ2
Plan.create!(
  [
    {
      title: '熊本旅行',
      prefecture: '熊本県',
      stay_days: '二泊三日', budget: '3万～4万',
      main_vehicle: '公共交通機関',
      impression: '僕の第2の故郷、熊本に行ってきました！やっぱり熊本が一番だな',
      plan_images: [ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-plan2.jpg"), filename:"sample-plan2.jpg"), ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-plan3.jpg"), filename:"sample-plan3.jpg")],
      user_id: users[1].id
    }
  ]
)

date3=Date.new(2023, 5, 11)
date4=Date.new(2023, 5, 12)
date5=Date.new(2023, 5, 13)
Day.create!(
  [
    {plan_id: 2, day: date3}, {plan_id: 2, day: date4}, {plan_id: 2, day: date5}
  ]
)

start_at7=Time.zone.local(2023,5,11,12,50,00)
start_at8=Time.zone.local(2023,5,11,13,05,00)
start_at9=Time.zone.local(2023,5,11,19,00,00)
start_at10=Time.zone.local(2023,5,12,13,30,00)
start_at11=Time.zone.local(2023,5,12,15,15,00)
start_at12=Time.zone.local(2023,5,13,11,10,00)
finished_at7=Time.zone.local(2023,5,11,13,50,00)
finished_at8=Time.zone.local(2023,5,11,18,00,00)
finished_at9=Time.zone.local(2023,5,11,20,00,00)
finished_at10=Time.zone.local(2023,5,12,15,00,00)
finished_at11=Time.zone.local(2023,5,12,17,00,00)
finished_at12=Time.zone.local(2023,5,13,13,05,00)
Schedule.create!(
  [
    {day_id: 3, start_at: start_at7, finished_at: finished_at7, place: '阿蘇駅', schedule_comment: '懐かしい阿蘇駅でバスの時間までゆっくり過ごしました。', cost: '2000', transportation: '電車', transfer_time: '80', expense: '1130'},
    {day_id: 3, start_at: start_at8, finished_at: finished_at8, place: '阿蘇山', schedule_comment: '子供の時以来の阿蘇山に久しぶりに行ってきました！移動がめちゃくちゃ長いです（笑）でも阿蘇山の火口は一回は見とくべきですね！', cost: '0', transportation: 'バス', transfer_time: '50', expense: '1250'},
    {day_id: 3, start_at: start_at9, finished_at: finished_at9, place: '待ちに待った夜ご飯！', schedule_comment: '阿蘇山でだいぶ疲れていたので、夜ご飯がいつもよりおいしく感じました！運動の後のご飯は最高！！', cost: '1500', transportation: 'バス', transfer_time: '30', expense: '500'},
    {day_id: 4, start_at: start_at10, finished_at: finished_at10, place: '熊本城', schedule_comment: '熊本といったらここ！熊本城！！壮大な景色が広がっていて心が落ち着きます', cost: '800', transportation: 'バス', transfer_time: '90', expense: '1500'},
    {day_id: 4, start_at: start_at11, finished_at: finished_at11, place: '街散歩', schedule_comment: '熊本城を楽しんだ後は街のカフェでのんびりお茶をすると楽しさが倍増しますよ！', cost: '2000', transportation: '徒歩', transfer_time: '15', expense: '0'},
    {day_id: 5, start_at: start_at12, finished_at: finished_at12, place: '熊本駅でお買い物', schedule_comment: '新幹線の時間まで結構あったので駅で友達のお土産を買いました！', cost: '3000', transportation: 'バス', transfer_time: '50', expense: '1000'}
  ]
)

# 投稿データ3
Plan.create!(
  [
    {
      title: '憧れの富士山を見に忍野八海へ！',
      prefecture: '山梨県',
      stay_days: '日帰り', budget: '1万～2万',
      main_vehicle: '公共交通機関',
      impression: '一度は生で富士山を見てみたかったので、夢が叶いました！',
      plan_images: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-plan4.jpg"), filename:"sample-plan4.jpg"),
      user_id: users[2].id
    }
  ]
)

date6=Date.new(2023, 3, 30)
Day.create!(
  plan_id: 3, day: date6
)

start_at13=Time.zone.local(2023,3,30,9,00,00)
start_at14=Time.zone.local(2023,3,30,11,00,00)
start_at15=Time.zone.local(2023,3,30,12,40,00)
start_at16=Time.zone.local(2023,3,30,14,00,00)
finished_at13=Time.zone.local(2023,3,30,10,00,00)
finished_at14=Time.zone.local(2023,3,30,12,30,00)
finished_at15=Time.zone.local(2023,3,30,13,40,00)
finished_at16=Time.zone.local(2023,3,30,15,20,00)
Schedule.create!(
  [
    {day_id: 6, start_at: start_at13, finished_at: finished_at13, place: '富士山駅' , schedule_comment: '忍野八海へのバスチケットを買うまで駅でのんびり', cost: '2000', transportation: '電車', transfer_time: '60', expense: '1110'},
    {day_id: 6, start_at: start_at14, finished_at: finished_at14, place: '忍野八海', schedule_comment: '食べ歩きや富士山の写真撮影、池を眺めたりすごく楽しかったです！', cost: '5000', transportation: 'バス', transfer_time: '50', expense: '1250'},
    {day_id: 6, start_at: start_at15, finished_at: finished_at15, place: '茶屋', schedule_comment: '忍野八海の湧水を使用したそばを食べました！！', cost: '1500', transportation: '徒歩', transfer_time: '10', expense: '0'},
    {day_id: 6, start_at: start_at16, finished_at: finished_at16, place: '忍野忍びの村', schedule_comment: '忍者体験ができるとのことで急遽行ってみました！！手裏剣も投げれて大人でも楽しめるところでした！', cost: '1800', transportation: '徒歩', transfer_time: '15', expense: '0'}
  ]
)