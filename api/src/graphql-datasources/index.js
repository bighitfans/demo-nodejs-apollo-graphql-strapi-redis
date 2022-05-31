
const {BaseDS} = require('./base');
const {TaskDS} = require('./task');
const Strapi = require('lib/strapi')

module.exports = () => {
  return {
    employees: new BaseDS({
      service: new Strapi('employees'),
      cacheKeyBase: "employees"
    }),
    tasks: new TaskDS({
      service: new Strapi('tasks'),
      cacheKeyBase: "tasks"
    }),
  }
}
