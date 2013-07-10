class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    @subscriptions = Subscription.all
  end

  def show
  end

  def new
    @subscription = Subscription.new
  end

  def edit
  end

  def create
    @subscription = Subscription.new
    @subscription.customer_id = params["subscription"]["customer_id"]
    @subscription.plan_id = params["subscription"]["plan_id"]
    @subscription.stripe_card_token = params["subscription"]["stripe_card_token"]

    if @subscription.save_with_payment
      redirect_to current_customer
    else
      render action: 'new'
    end
  end

  def update
    if @subscription.update(subscription_params)
      redirect_to @subscription, notice: 'Subscription was updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @subscription.destroy
      redirect_to subscriptions_url
  end

  private
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:plan_id, :customer_id, :stripe_card_token)
    end
end
