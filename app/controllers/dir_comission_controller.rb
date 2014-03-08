# -*- coding: utf-8 -*-
class DirComissionController < ApplicationController
  before_filter :authenticate_admin!, only: [:edit, :update]

  def index
    comission = DirComission.order(:order)
    render "index", locals: { comission: comission}
  end

  def edit
    comission = DirComission.order(:order)

    render "edit", locals: { comission: comission}
  end

  def update
    new_comission = params["comission"].map { |i, h| h }
    DirComission.destroy_all
    DirComission.create(new_comission)

    redirect_to edit_dir_comission_path, notice: "Comisión actualizada correctamente"
  end
end
