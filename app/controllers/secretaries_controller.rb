# -*- coding: utf-8 -*-
class SecretariesController < ApplicationController
  def index
    secretaries = Secretarie.order(:order)
    render "index", locals: { secretaries: secretaries}
  end

  def edit
    secretaries = Secretarie.order(:order)

    render "edit", locals: { secretaries: secretaries}
  end

  def update
    new_secretarie = params["secretaries"].map { |i, h| h }
    Secretarie.destroy_all
    Secretarie.create(new_secretarie)

    redirect_to edit_secretaries_path, notice: "Secretarías actualizadas correctamente"
  end

end
