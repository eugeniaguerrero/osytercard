# require 'oystercard'
#
# describe "User Stories" do
#   let (:entry_station) {double(:entry_station)}
#   let (:exit_station) {double(:exit_station)}
#   let (:journey){ {entry_station: entry_station, exit_station: exit_station} }
#
#   # In order to use public transport
#   # As a customer
#   # I want money on my card
#   it "so customer can check balance, return balance on card" do
#     card = Oystercard.new
#     expect{card.balance}.not_to raise_error
#   end
#
#   # In order to keep using public transport
#   # As a customer
#   # I want to add money to my card
#
#   it "so customer can add money to their card, top up the card" do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     expect(card.balance).to eq amount_topped_up
#   end
#
#   # In order to protect my money from theft or loss
#   # As a customer
#   # I want a maximum limit (of £90) on my card
#
#   it "so customer can't load too much money on their card, limit maximum balance" do
#     card = Oystercard.new
#     max_balance = Oystercard::MAX_BALANCE
#     expect { card.top_up(max_balance + 5) }.to raise_error("Cannot top up card. Max deposit (#{max_balance}) exceeded. Try lower amount.")
#
#   end
#
#   # In order to pay for my journey
#   # As a customer
#   # I need my fare deducted from my card
#
#   it "so customer can spend balance, deduct minimum fare from card" do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     card.touch_in(entry_station)
#     card.touch_out(exit_station)
#     expect(card.balance).to eq amount_topped_up - Oystercard::MIN_FARE
#   end
#
#
#   # In order to get through the barriers.
#   # As a customer
#   # I need to touch in and out.
#
#   it "let the card be aware whether it's being used on a journey or not" do
#     card = Oystercard.new
#     expect(card.in_journey?).to eq false
#   end
#
#   it "so that the card can track the beginning of a journey" do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     card.touch_in(entry_station)
#     expect(card.in_journey?).to eq true
#   end
#
#   it "so that the card can track the end of the journey" do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     card.touch_in(entry_station)
#     card.touch_out(exit_station)
#     expect(card.in_journey?).to eq false
#   end
#
#   it "so that the card ensures user has minimum balance for journey" do
#     card = Oystercard.new
#     min_balance = Oystercard::MIN_BALANCE
#     expect{card.touch_in(entry_station)}.to raise_error "Cannot start journey. Minimum balance required is £#{min_balance}. Top up."
#   end
#
#   #  In order to pay for my journey
#   # As a customer
#   # When my journey is complete, I need the correct amount deducted from my card
#   it "should reduce the balance by the minimum amount when touching out" do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     min_fare = Oystercard::MIN_FARE
#     card.touch_in(entry_station)
#     expect { card.touch_out(exit_station) }.to change { card.balance }.by -min_fare
#   end
#
#   # In order to pay for my journey
#   # As a customer
#   # I need to know where I've travelled from
#
#   it "should remember the entry station after touch in" do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     card.touch_in(entry_station)
#     expect(card.entry_station).to eq entry_station
#   end
#
#   # As TLF
#   # I want the oystercard to remove its stored station on touch out
#   # so that its ready for the next journey
#   it "should forget the entry station after touch out" do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     card.touch_in(entry_station)
#     card.touch_out(exit_station)
#     expect(card.entry_station).to be_nil
#   end
#
#     # In order to know where I have been
#     # As a customer
#     # I want to see to all my previous trips
# context "Complete journey is executed" do
#   it 'so journey can be correctly logged, card registers the exit station' do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     card.touch_in(entry_station)
#     card.touch_out(exit_station)
#     expect(card.exit_station).to eq exit_station
#   end
#
#   it "so customer can reference journey history, card stores journeys" do
#     card = Oystercard.new
#     amount_topped_up = 10
#     card.top_up(amount_topped_up)
#     card.touch_in(entry_station)
#     card.touch_out(exit_station)
#     expect(card.journeys).to include card.journey
#   end
# end
#
#
#
#
# end
