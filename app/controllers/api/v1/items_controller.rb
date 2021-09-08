module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_book, only: %i[update show destroy]

      # GET /items
      def index
        @items = Item.all
        render json: ItemsRepresenter.new(@items).as_json
      end

      # POST /item
      def create
        @item = Item.create(item_params)

        if @item.save
          render json: ItemRepresenter.new(@item).as_json, status: :created
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      # GET /items/:id
      def show
        render json: ItemRepresenter.new(@item).as_json
      end


      # PUT /items/:id
      def update
        @item.update(item_params)
        head :no_content
      end

      # DELETE /items/:id
      def destroy
        @item.destroy
        head :no_content
      end

      private

      def item_params
        params.permit(:title, :author, :category_id, :user_id)
      end

      def set_item
        @book = Item.find(params[:id])
      end
    end
  end
end
