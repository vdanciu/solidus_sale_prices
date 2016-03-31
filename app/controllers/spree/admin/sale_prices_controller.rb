module Spree
  module Admin
    class SalePricesController < ResourceController

      before_filter :load_product

      respond_to :js, :html

      def create
        @sale_price = @product.put_on_sale(sale_price_amount, sale_price_params)
        redirect_to admin_product_sale_prices_path(@product)
      end

      def destroy
        @sale_price = Spree::SalePrice.find(params[:id])
        @sale_price.destroy
        respond_with(@sale_price)
      end

      private

      def load_product
        @product = Spree::Product.find_by(slug: params[:product_id])
        redirect_to request.referer unless @product.present?
      end

      def sale_price_amount
        params[:sale_price][:value].present? ? params[:sale_price][:value] : 0
      end

      def sale_price_params
        params.require(:sale_price).permit(
            :id,
            :value,
            :currency,
            :start_at,
            :end_at,
            :enabled
        )
      end
    end
  end
end
