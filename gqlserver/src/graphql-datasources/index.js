const { BaseDS } = require("./base");
const { TaskDS } = require("./task");
const Strapi = require("lib/strapi");
const { DepartmentDS } = require("./department");

module.exports = () => {
  return {
    employees: new BaseDS({
      service: new Strapi("employees"),
      cacheKeyBase: "employees",
    }),
    tasks: new TaskDS({
      service: new Strapi("tasks"),
      cacheKeyBase: "tasks",
    }),
    departments: new DepartmentDS({
      service: new Strapi("departments"),
      cacheKeyBase: "departments",
    }),
  };
};
