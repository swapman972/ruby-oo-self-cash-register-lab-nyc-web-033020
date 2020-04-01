require "pry"

class CashRegister
    def initialize (discount=0)
        @total = 0
        @discount = discount
        @items = []
        @items_with_price = {}
    end

    attr_reader :discount
    attr_accessor :total
    attr_reader :items

    def add_item (name, price, quantity=1)
        @items_with_price[name] = [price, quantity]
        quantity.times {@items << name}
        @total += (price * quantity)
    end

    def apply_discount
        if @discount == 0
            p "There is no discount to apply."
        else
           @total -= (@total * @discount / 100)
            p "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        void_item = @items_with_price[items.last][0] * @items_with_price[items.last][1]
        @total -= void_item
    end
end