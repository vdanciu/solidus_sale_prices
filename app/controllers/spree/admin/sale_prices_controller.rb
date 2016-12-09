module Spree
  module Admin
    class SalePricesController < ResourceController

      before_filter :load_product

      def create
        @sale_price = @product.put_on_sale(
          params[:sale_price][:value], sale_price_params, selected_variant_ids)
        respond_with(@sale_price)
      end

      def destroy
        @sale_price = Spree::SalePrice.find(params[:id])
        @sale_price.destroy
        respond_with(@sale_price)
      end

      private

      def location_after_save
        admin_product_sale_prices_path(@product)
      end

      def load_product
        @product = Spree::Product.find_by(slug: params[:product_id])
        redirect_to request.referer unless @product.present?
      end

      def selected_variant_ids
        params.fetch(:variant_ids, [])
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
