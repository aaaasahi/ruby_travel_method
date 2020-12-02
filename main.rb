plans = [
    { place: "沖縄", price: 10000 },
    { place: "北海道", price: 20000 },
    { place: "九州", price: 15000 }
]


def disp_plans(plans)
    puts "旅行プランを選択して下さい。"
    plans.each.with_index(1) do |plan,i|
        puts "#{i}. #{plan[:place]}旅行(#{plan[:price]}円)"
    end
end

def select_plan(plans)
    while true
        print "プランの番号を選択 > "
        select_num = gets.to_i
        break if (1..3).include?(select_num)
            puts "1〜３から選んで下さい"
    end
    plans[select_num - 1]
end


def decide_people(selected_plan)
    puts "#{selected_plan[:place]}旅行ですね"
    puts "何名で予約されますか？"
    while true
        print "人数を入力 > "
        number_of_people = gets.to_i
        break if number_of_people >= 1
            puts "1人以上を入力して下さい"
    end
    number_of_people
end




def calculate_charges(number_of_people, selected_plan)
    puts "#{number_of_people}名ですね。"
    total_price = selected_plan[:price] * number_of_people
    if number_of_people >= 5
        puts "5名以上ですので10%割引となります"
        total_price *= 0.9
        puts "合計金額は#{total_price.floor}円になります。"
        else
        puts "合計金額は#{total_price}円になります。"
    end
end

disp_plans(plans)
selected_plan = select_plan(plans)
number_of_people = decide_people(selected_plan)
calculate_charges(number_of_people, selected_plan)
