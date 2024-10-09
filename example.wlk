class Universidad {
  const property provincia
  var property honorarios
  var donaciones = 0
  method recibirDonaciones(unImporte) {
    donaciones += unImporte
  }
}

class AsociadoAUniversidad{
  const property universidad
  method honorarios () {
    return universidad.honorarios()
  }
  method puedeTrabajar() {
    return [universidad.provincia()]
  }

  method cobrar(unImporte){
    universidad.recibirDonaciones(unImporte*0.5)
  }
}

class AsociadoAlLitoral {
  const property
  method honorarios() = 3000
  method puedeTrabajar() = ["Entre Rios", "Santa Fe", "Corrientes"]
  method cobrar (unImporte){
    asociacionProfesionalesDelLitoral(unImporte)
  }
}

class Libres {
  const property universidad
  var property puedeTrabajar = []
  var property honorarios = 0
}

class Empresa {
  const property profesionales = []
  var property honorariosReferencia
  method agregarProfesional(unProfesional){
    profesionales.add(unProfesional)
  }

  method cuantos (unaUniversidad){
    return profesionales.count({p => p.universidad()==unaUniversidad})
  }

  method caros() {
    return profesionales.filter({p => p.honorarios() > honorariosReferencia})
  }

  method formadoras() {
    return profesionales.map({p => p.universidad()}).asSet() // saca elementos repetidos, lo presenta como un conjunto
  }

  method masBarato() {
    return profesionales.min({p => p.honorarios()})
  }

  method esDeGenteAcotada() {
    return profesionales.any({p => p.puedeTrabajar().size() > 3})
  }

  method puedeSatisfacer(unSolicitante){
    return profesionales.any({ p => unSolicitante.puedeSerAtendidoPor(p) })
  }
}

class SolicitantePersona {
  vas property provincia
  method puedeSerAtendidoPor(unProfesional){
    return unProfesional.puedeTrabajar().contains(provincia)
  }
}

class SolicitanteInstitucion {
  var property universidades
  method puedeSerAtendidoPor(unProfesional){
    universidades.contains(unProfesional.universidad())
  }
}

class SolicitanteClub {
  var property provincias
  method puedeSerAtendidoPor(unProfesional){
    return not provincias.asSet().intersection(
      unProfesional.puedeTrabajar().asSet()
    ).isEmpty()
  } // return provincias.any({p => unProfesional.puedeTrabajar().contains(p)})
}

object asociacionProfesionalesDelLitoral {
  var recaudacion = 0
  method recibirDonaciones (unImporte) {
    recaudacion += unImporte
  }
}