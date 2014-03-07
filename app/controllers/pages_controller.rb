# -*- coding: utf-8 -*-
class PagesController < ApplicationController
  def about
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

  def tramas
    @feed = Feed.new(Video.all, Essay.all)
  end
end
