# frozen_string_literal: true

class CategoryController < ApplicationController
  def index
    render json: Category.all
  end

  def create
    category = Category.new(category_params)

    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Category.find(params[:id]).destroy!

    head :ok
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: category, status: :ok
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
