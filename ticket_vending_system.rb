require "date"

class TicketVendingSystem

  attr_reader :products, :created_at

  def initialize(products)
    @products = products
    @created_at = Date.today
  end
  
  def exec_transaction
    puts "0. チケットを購入する"
    puts "1. 終了する"
    num = gets.chomp.to_i

    if num == 0
      transaction
    elsif num == 1
      exit
    else
      puts "0か1を入力してください"
    end

  end

  def transaction
    display_tickets
    ride = issue_ticket
    run_payment(ride)
  end

  def display_tickets
    puts "購入したいチケットを以下から選んで、金額を入力してください"
    @products.each_with_index do |product, i|
      puts "[#{i}] 商品名：#{ product.name } 価格：#{ product.fee }円"
    end
  end

  def issue_ticket
    ride = @products[gets.to_i]
    puts "「#{ride.name}」が選択されました。"
    ride
  end

  def run_payment(ride)
    puts "お金を入れてください"
    while true
      payment = gets.to_i
      charge = calc_change(payment, ride.fee)

      if charge >= 0
        break
      else
        puts "入力金額が不足しています。金額を再入力してください。"
      end
    end

    puts "お釣りは#{charge}円です。ご利用ありがとうございました。"
  end

  def calc_change(payment, fee)
    payment - fee
  end
end

