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

  def institutional_life
    repo = PicasaWebAlbums.get_repository(ENV["GOOGLE_USER"], ENV["GOOGLE_PASS"])
    locals = {}

    locals[:albums] = repo.get_all_albums.select { |album|
      album.title != "Profile Photos" &&
      album.title != "Eventos" &&
      album.title != "Auto Backup"
    }.map do |album|
      photos = repo.get_photos_by_album_id(album.id)
      new_album = Album.new(album.id, album.title, photos)
    end

    render "institutional_life", locals: locals
  end
end
