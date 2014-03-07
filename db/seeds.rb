# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.first_or_create!( email: ENV["DEFAULT_ADMIN_EMAIL"],
                        password: ENV["DEFAULT_ADMIN_PASSWORD"],
                        password_confirmation: ENV["DEFAULT_ADMIN_PASSWORD"])

Admin.first_or_create!( email: "iachetti.federico@gmail.com",
                        password: "secretsecret",
                        password_confirmation: "secretsecret")

DirComission.destroy_all
DirComission.create!( order: 1,
                      position: "Presidente",
                      name:     "María del Carmen Gigena",
                      title:    "Mgter")
DirComission.create!( order: 2,
                      position: "Secretaria General",
                      name:     "Adriana Leporati",
                      title:    "Lic")
DirComission.create!( order: 3,
                      position: "Tesorera",
                      name:     "Patricia Orortegui",
                      title:    "Lic")
DirComission.create!( order: 4,
                      position: "Secretaria Docente",
                      name:     "Margarita Caminotti",
                      title:    "Lic")
DirComission.create!( order: 5,
                      position: "Secretaria Científica",
                      name:     "Gimena Galarraga",
                      title:    "Lic")
DirComission.create!( order: 6,
                      position: "Secretaria de Apertura y Asistencia a la Comunidad",
                      name:     "Carolina Territoriale",
                      title:    "Lic")
DirComission.create!( order: 7,
                      position: "Secretaria de Prensa y Difusión",
                      name:     "Alicia Irene Barabraham",
                      title:    "Lic")
DirComission.create!( order: 8,
                      position: "Vocal Suplente",
                      name:     "Luisa Kowadlo",
                      title:    "Lic")
# ~> -:10:in `<main>': uninitialized constant Admin (NameError)
