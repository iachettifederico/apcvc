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

Training.destroy_all
Training.create!( order: 1,
                  key: "fundamentacion",
                  title: "FUNDAMENTACIÓN:",
                  content: [
                            "<p>En un mundo de transformaciones, afectado por la globalización y en medio de graves crisis identitarias, se hace necesaria una reflexión crítica sobre las prácticas clínicas. Es necesario pensar en diferentes modos de abordajes a la diversidad de problemáticas que se  presentan hoy.</p>",
                            "<p>Los distintos dispositivos plurisubjetivos (en las parejas, familias, grupos e instituciones) permitieron la concepción de un inconsciente “desterritorializado”, que se despliega con sus efectos y producciones en esos ámbitos, y que obligaron a reformulaciones teóricas y clínicas basadas en nuevos paradigmas.</p>",
                            "<p>La perspectiva vincular plantea un modo de complejización del Psicoanálisis, no implica prácticas  clínicas desplegadas sólo en dispositivos vinculares; reformula la situación clínica aún del análisis denominado individual. Complejiza los modos de comprensión del fenómeno humano, al situarlo en los anudamientos de las tres dimensiones de la red sujeto – vínculo – cultura. Estas tres dimensiones se entretejen a manera de una red, indisociables, donde no hay una sobre las otras, emergiendo a veces con simultaneidad.</p>",
                            "<p>Esta visión teórica – clínica circula por distintas perspectivas que consideran al sujeto, sus vinculaciones y pertenencias inmediatas y la trama socio cultural. Así, el Psicoanálisis de las Configuraciones Vinculares, se basa fundamentalmente en el encuentro con la presencia del otro, de ahí que las estrategias y abordajes que se despliegan en la tarea clínica, posibilitaran crear intervenciones que anuden y desanuden los hilos de la trama sujeto – vínculo – cultura.</p>",
                           ].join("\n"))
Training.create!( order: 2,
                  key: "objetivos",
                  title: "OBJETIVOS DE LA FORMACIÓN:",
                  content: [
                            "<ul>",
                            "  <li> Generar un espacio de trasmisión del Psicoanálisis de los Vínculos en sus desarrollos teórico-clínicos.</li>",
                            "  <li> Propiciar un modelo de formación abierto a los nuevos paradigmas de la Complejidad.</li>",
                            "  <li> Estimular la participación grupal a través de las distintas instancias y metodologías que se incluyen en la formación.</li>",
                            "  <li> Fomentar el compromiso ético/social frente al sufrimiento y la clínica de los vínculos.</li>",
                            "</ul>",
                           ].join("\n"))
Training.create!( order: 3,
                  key: "modalidad_academica",
                  title: "MODALIDAD ACADÉMICA:",
                  content: [
                            "<p> Seis Módulos de cinco meses cada uno (de mayo a septiembre y de octubre a abril); frecuencia quincenal: cuatro horas por fecha. Modalidad presencial. </p>",
                            "<p> Clases teórico- clínicas. Talleres de integración. Grupos de reflexión. Espacios de supervisión grupal. Evaluaciones individuales y grupales al cierre de módulos y  Trabajo Final en grupo. </p>",
                           ].join("\n"))

Training.create!( order: 4,
                  key: "plan",
                  title: "PLAN DE ESTUDIOS: (síntesis de los contenidos programáticos):",
                  content: [
                            "<div> <b> Pensamiento Contemporáneo y Subjetividad: </b> </div>",
                            "<ul>",
                            " <li> Nuevos paradigmas. Complejidad. Construcción de subjetividad y lógicas colectivas. Estructura y acontecimiento. </li>",
                            "</ul>",
                            "<div> <b> Psicoanálisis de las Configuraciones Vinculares: </b> </div>",
                            "<ul>",
                            " <li> Vínculo e intersubjetividad. Espacios Psíquicos. Presencia- ausencia; ajenidad; pertenencia.  Alianzas inconscientes. Contrato Narcisista. Pacto denegativo y renuncia pulsional. Trasmisión intergeneracional. </li>",
                            "</ul>",
                            "<div> <b> Psicoanálisis de Pareja: </b> </div>",
                            "<ul>",
                            " <li> Definición y encuadre de la pareja. Sus atravesamientos intra, inter y transubjetivos. Modalidades de pareja hoy. </li>",
                            " <li> Constitución y devenires del vínculo de pareja: La emocionalidad en el vínculo de pareja. Zócalo inconsciente. Objeto único. Estipulaciones inconscientes. Pactos y acuerdos. Pacto denegativo. La imposición como mecanismo constitutivo del vínculo. </li>",
                            " <li> Nociones de conflicto, crisis y sufrimiento vincular. El encuentro con el otro: el malentendido y el reproche. Lo obvio. Vincularse – Desvincularse. Las relaciones de poder. </li>",
                            " <li> Aproximación a una psicopatología vincular de pareja: Relaciones de simetría y asimetría. Amor, pasión, alienación. Parejas violentas. Funcionamientos con productividad neurótica, perversa, psicótica y de borde. </li>",
                            " <li> Conyugalidad. Parentalidad. Separación conyugal. Parejas homosexuales. La sexualidad en la pareja. Modos de intervención. </li>",
                            " <li> Intervenciones en la clínica de pareja: Lugar y función del analista vincular. Encuadre. Indicaciones. Transferencia e intertransferencia. Intervenciones. </li>",
                            "</ul>",
                            "<div> <b> Psicoanálisis de Familia: </b> </div>",
                            "<ul>",
                            " <li> Caracterización de la familia desde el modelo vincular.  Las producciones familiares de la estructura familiar inconsciente. Nuevas modelizaciones familiares. </li>",
                            " <li> Filiación y cadena generacional. Las alianzas inconscientes intersubjetivas en las organizaciones familiares.  Los mitos familiares. </li>",
                            " <li> Construcción intersubjetiva de la familia: puntos de conflicto.El discurso familiar. Espejo familiar y narcisismo. Lo negativo. Transmisión intergeneracional. Sexualidad y poder en la familia. </li>",
                            " <li> Exigencias de trabajo psíquico y sufrimiento vincular. </li>",
                            " <li> Familias e intervenciones en la diversidad. Judicialización del vínculo familiar. Abordaje interdisciplinario y trabajo en red. </li>",
                            " <li> Los dispositivos analíticos en familia Articulación de la demanda; su decodificación y función de indicación. Estructuras abiertas y advenimiento de lo acontecimental. La metabolización del conflicto. </li>",
                            " <li> Abstinencia, neutralidad e implicación del analista. </li>",
                            " <li> Proceso del psicoanálisis vincular en una familia: encuentro espacio-tiempo; repetición y nuevos aconteceres psíquicos. </li>",
                            " <li> Pilares de la clínica: transferencia, interpretación. Final de análisis. </li>",
                            "</ul>",
                            "<div> <b> Psicoanálisis de Grupo: </b> </div>",
                            "<ul>",
                            " <li> Historia del psicoanálisis de grupo. El grupo: objeto teórico. Sus especificidades. Lo imaginario. </li>",
                            " <li> Fantasía y grupo. Los grupos internos. Apuntalamiento. Envolturas psíquicas. Ilusión grupal. </li>",
                            " <li> Identidad y pertenencia grupal. Relación entre lo psíquico y lo social. Realización de la tarea – despliegue de lo imaginario. </li>",
                            " <li> Organización del grupo. Estructura de roles. Concepto de “organizador”. Organizadores psíquicos – la circulación fantasmática. Los organizadores socioculturales. </li>",
                            " <li> Procesos y principios del funcionamiento psíquico en la vida de los grupos. El aparato psíquico grupal. El sujeto del grupo y sujeto del inconsciente. La negatividad y el pacto denegativo en los grupos. </li>",
                            " <li> El dispositivo analítico grupal como construcción vincular. El encuadre psicoanalítico vincular en los grupos. Grupos terapéuticos psicoanalíticos. Grupos psicoanalíticos de reflexión. </li>",
                            " <li> Prácticas de intervención en dispositivos grupales. Grupo en situaciones  de crisis sociales. Grupo en situaciones de crisis vitales. Grupos de formación. Los Grupos en las Instituciones. </li>",
                            "</ul>",
                           ].join("\n"))
