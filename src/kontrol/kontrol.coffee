{ EventEmitter } = require 'events'

module.exports = class Kontrol extends EventEmitter

  constructor: (options) ->
    return new Kontrol options  unless this instanceof Kontrol

    @options =
      if 'string' is typeof options
      then url: options
      else options

    @options.autoReconnect ?= yes

    @kite = @initKite()

  initKite: ->
    Kite = require 'kite.js'
    new Kite @options.url
