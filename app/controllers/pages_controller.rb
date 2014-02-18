# -*- coding: utf-8 -*-
class PagesController < ApplicationController
  def about
  end

  def comision
    partners = [
                Partner.new( position: "Presidente",
                             name:     "María del Carmen Gigena",
                             title:    "Mgter"),
                Partner.new( position: "Secretaria General",
                             name:     "Adriana Leporati",
                             title:    "Lic"),
                Partner.new( position: "Tesorera",
                             name:     "Patricia Orortegui",
                             title:    "Lic"),
                Partner.new( position: "Secretaria Docente",
                             name:     "Margarita Caminotti",
                             title:    "Lic"),
                Partner.new( position: "Secretaria Científica",
                             name:     "Gimena Galarraga",
                             title:    "Lic"),
                Partner.new( position: "Secretaria de Apertura y Asistencia a la Comunidad",
                             name:     "Carolina Territoriale",
                             title:    "Lic"),
                Partner.new( position: "Secretaria de Prensa y Difusión",
                             name:     "Alicia Irene Barabraham",
                             title:    "Lic"),
                Partner.new( position: "Vocal Suplente",
                             name:     "Luisa Kowadlo",
                             title:    "Lic"),
               ]
    render "comision", locals: { partners: partners}
  end

  def secretaries
  end

  def formacion
  end

end
