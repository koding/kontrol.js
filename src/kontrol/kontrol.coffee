{ EventEmitter } = require 'events'

module.exports = class Kontrol extends EventEmitter

  constructor: (options) ->
    return new Kontrol options  unless this instanceof Kontrol

    @options = options

    @kite = @initKite()

  initKite: ->
    Kite = require 'kite.js'
    new Kite @options.url
