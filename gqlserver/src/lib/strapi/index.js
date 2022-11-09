const set = require('./set')
const get = require('./get')
const getById = require('./getById')
const getByIds = require('./getByIds')
const patch = require('./patch')
const del = require('./del')
const count= require('./count')

module.exports = function (COLLECTION) {
  this.COLLECTION = COLLECTION;

  this.get = async (params, options) => await get(COLLECTION, params, options);

  this.getById = async (id, params) =>
    await getById(COLLECTION, id, params, (options = {}));

  this.set = async (data) =>  {
    return await set(COLLECTION, data, (options = {}));
  }

  this.getByIds = async (ids,params) => await getByIds(COLLECTION,ids,params,options={})

  this.patch = async (id, data) =>
    await patch(COLLECTION, id, data, (options = {}));

  this.del = async (id, params) =>
    await del(COLLECTION, id, params, (options = {}));

  this.count = async (params) => await count(COLLECTION, params);
};
