{ EventEmitter } = require 'events'

module.exports = class Kontrol extends EventEmitter

  Kite = require 'kite.js'

  constructor: (options) ->
    return new Kontrol options  unless this instanceof Kontrol

    @options = options

    unless @options.auth
      throw new Error "Missing option: auth"

    @options.autoReconnect ?= yes
    
    @authenticate()

  authenticate: ->
    { url, auth: { type, key }} = @options

    type ?= 'sessionID'

    @kite = @initKite
      name  : 'kontrol'
      url   : url
      auth  : { type, key }

  initKite: (options) ->
    Kite = require 'kite.js'
    return new Kite options

  createKite: ({ name, url, token }) ->
    new Kite
      name    : name
      url     : url
      auth    :
        type  : 'token'
        key   : token

  fetchKites: (selector = {}, callback) ->
    @kite.tell 'getKites', [selector], (err, kiteDescriptors) ->
      if err?
        callback err
        return

      callback null, (@createKite k for k in kiteDescriptors)
      return
    return

  fetchKite: (selector = {}, callback) ->
    @fetchKites selector, (err, kites) ->
      if err?
        callback err
        return

      unless kites?[0]?
        callback new Error "no kite found!"
        return

      callback null, kites[0]
      return
    return

  watchKites: (selector = {}, callback) ->
    changes = new EventEmitter
    onEvent = @createUpdateHandler changes, callback

  cancelWatcher: (id, callback) ->

  createUpdateHandler: (changes, callback) -> (err, change) =>

  @actions      =
    REGISTER    : 'register'
    DEREGISTER  : 'deregister'
