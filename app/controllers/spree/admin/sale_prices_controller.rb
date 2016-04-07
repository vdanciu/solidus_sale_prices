module Spree
  module Admin
    class SalePricesController < ResourceController

      before_filter :load_product

      def create
        @sale_price = @product.put_on_sale(sale_price_amount, sale_price_params)
        redirect_to admin_product_sale_prices_path(@product)
      end

      private

      def location_after_save
        admin_product_sale_prices_path(@product)
      end

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
