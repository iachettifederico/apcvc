# -*- coding: utf-8 -*-
class TrainingController < ApplicationController
  before_filter :authenticate_admin!, only: [:edit, :update]

  def index
    training = Training.order(:order)
    render "index", locals: { training: training}
  end

  def edit
    training = Training.order(:order)

    render "edit", locals: { training: training}
  end

  def update
    new_training = params["training"].map { |i, h| h }
    Training.destroy_all
    Training.create(new_training)

    redirect_to edit_training_path, notice: "Formación actualizada correctamente"
  end

end
