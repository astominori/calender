
require  'Date'

#今月の最終日を確認するメソッド
def last_day(year,month)
  if month == 2 && Date.valid_date?(year,month,29)
    return 29
  elsif month == 2
    return 28
  elsif Date.valid_date?(year,month,31)
    return 31
  else
    return 30
  end
end

#今月が何週かを確認する
def how_many_weeks(day_array)
  days_count = day_array.length
  if days_count / 7 == 5 && days_count % 7 != 0
    return 6
  elsif days_count / 7 == 5
    return 5
  elsif days_count / 7 == 4 && days_count % 7 != 0
    return 5
  else
    return 4
  end
end

#今日の日付を生成する
today = Date.today

#今日の日付から西暦/月/月の英字名を出力する
year = today.year
month = today.month
name_of_month = today.strftime("%B")

#今月の開始曜日を調べる
day_of_the_week = Date.new(year,month,1).wday


#最終日を基準に日付の配列を作成する
last_day = last_day(year,month)
day_array = [*1..last_day]

#開始曜日毎に配列に空欄を追加する
day_of_the_week.times do
  day_array.unshift(" ")
end

#今月が何週かを確認する
weeks_count = how_many_weeks(day_array)
#カレンダータイトルの作成
calender_title = name_of_month + " " + year.to_s


#カレンダーの出力
puts calender_title.center(21," ")
printf("%3s%3s%3s%3s%3s%3s%3s\n","Su","Mo","Tu","We","Th","Fr","Sa","Su")
weeks_count.times do
  #1週分の内容weekにセットする
  week = day_array.shift(7)

  #nilの場合の対処として、空欄を入れる
  if week.length < 7
    e  = week[6]
    week.map {|e| e ? e : " " }
  end

  #1週分を出力する
  printf("%3s%3s%3s%3s%3s%3s%3s\n",week[0],week[1],week[2],week[3],week[4],week[5],week[6])
end
