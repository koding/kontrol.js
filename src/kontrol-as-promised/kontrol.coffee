BasicKontrol = require '../kontrol/kontrol.coffee'

module.exports = class Kontrol extends BasicKontrol

  constructor: (options) ->
    return new Kontrol options  unless this instanceof Kontrol
    super options

  initKite: ->
    Kite = require 'kite.js/promises'
    new Kite @options.url
