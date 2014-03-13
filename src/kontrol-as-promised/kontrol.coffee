BasicKontrol = require '../kontrol/kontrol.coffee'

module.exports = class Kontrol extends BasicKontrol

  Promise = require 'bluebird'

  constructor: (options) ->
    return new Kontrol options  unless this instanceof Kontrol
    super options

  initKite: (options) ->
    Kite = require 'kite.js/promises'
    new Kite options

  fetchKites: (selector = {}, callback) ->
    new Promise (resolve, reject) =>
      super selector, (err, kites) ->
        return reject err  if err?
        return resolve kites
      return
    .nodeify callback

  fetchKite: (selector = {}, callback) ->
    @fetchKites selector
    .then ([kite]) -> kite
    .nodeify callback

  cancelWatcher: (id, callback) ->
    new Promise (resolve, reject) =>
      super id, (err) ->
        return reject err  if err
        return resolve null
      return
    .nodeify callback
