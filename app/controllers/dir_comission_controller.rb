# -*- coding: utf-8 -*-
class DirComissionController < ApplicationController
  before_filter :authenticate_admin!, only: [:edit, :update]

  def index
    comission = DirComission.order(:order)
    render "index", locals: { comission: comission}
  end

  def edit
    comission = DirComission.order(:order) + [DirComission.new]

    render "edit", locals: { comission: comission}
  end

  def update
    new_comission = comission_params #.map { |i, h| h }
    DirComission.destroy_all
    new_comission.each do |_, new_params|
      unless new_params.all?{ |_, v| v.empty?}
        DirComission.create(new_params)
      end
    end

    redirect_to edit_dir_comission_path, notice: "Comisión actualizada correctamente"
  end

  def comission_params
    params.require("comission").permit!
  end
end
