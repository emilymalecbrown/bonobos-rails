class InventoryController < ApplicationController

  def show
    @inventory = Inventory.order(:product_id)
  end

end
